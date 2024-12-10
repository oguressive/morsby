# frozen_string_literal: true

require_relative 'version'
require_relative 'morse_table'
require_relative 'wabun_table'
require_relative 'abbreviations'
require_relative 'messages'
require 'nkf'

module Morsby
  class CLI
    PUNCTUATION_CODES = {
      '?' => '..--..',
      '.' => '.-.-.-',
      ',' => '--..--',
      '/' => '-..-.',
      '-' => '-....-',
      '(' => '-.--.',
      ')' => '-.--.-'
    }

    # デフォルト(ビギナーモード)とプロモードの音長
    DEFAULT_DOT_UNIT = 0.15
    PRO_DOT_UNIT = 0.08

    # モールス仕様:
    # 短音=1拍、長音=3拍、文字内パーツ間=1拍、文字間=3拍、単語間=7拍
    # だが、文字間は3だと短く感じたので4に修正した
    # 単語間はスペースで分割し、その際7拍分空ける

    def run(argv)
      @language = :ja
      if (lang_index = argv.index("--lang")) || (lang_index = argv.index("-lang"))
        desired_lang = argv[lang_index + 1]
        @language = :en if desired_lang && desired_lang.downcase == "en"
        argv.delete_at(lang_index + 1)
        argv.delete_at(lang_index)
      end

      # プロモード判定
      @dot_unit = DEFAULT_DOT_UNIT
      if (pro_index = argv.index("--pro"))
        @dot_unit = PRO_DOT_UNIT
        argv.delete_at(pro_index)
      end

      @dash_unit = @dot_unit * 3
      @intra_char_gap = @dot_unit
      @letter_gap = @dot_unit * 3
      @word_gap = @dot_unit * 7

      if argv.empty?
        print_help
        return
      end

      input_str = argv.join(" ")
      if input_str.start_with?("-h") || input_str.start_with?("-help")
        print_help
        return
      elsif input_str.start_with?("-learn")
        @mode = :learn
        learn_mode_interactive
      else
        @mode = :output
        unless play_installed? && !on_windows?
          show_audio_error_message
          return
        end
        convert_and_sound(input_str)
      end
    end

    private

    def msg(key)
      val = Morsby::MESSAGES[@language][key]
      val.is_a?(Proc) ? val : val
    end

    def print_help
      puts msg(:help)
    end

    def learn_mode_interactive
      intro
      loop do
        print_main_menu
        choice = STDIN.gets.strip
        break if choice.downcase == 'q'

        case choice
        when "1"
          show_basic_course
        when "2"
          show_q_cw_detail_course
        when "3"
          show_alphabets
        when "4"
          learn_all_digits
        when "5"
          show_punctuation
        when "6"
          show_wabun_course
        when "7"
          learn_abbrev(:essential, :abbrev_essential_title)
        when "8"
          learn_abbrev(:q_signs, :abbrev_q_signs_title)
        when "9"
          learn_abbrev(:cw_signs, :abbrev_cw_signs_title)
        when "10"
          quiz_characters
        when "11"
          quiz_sound
        else
          puts (@language == :ja ? "無効な選択です。もう一度お試しください。" : "Invalid choice. Please try again.")
        end
      end
      puts msg(:learning_mode_end)
    end

    def intro
      puts "=== Morse Code Learning Mode ==="
      puts msg(:learning_intro)
      puts
      puts msg(:press_enter_main)
      STDIN.gets
    end

    def print_main_menu
      puts msg(:main_menu)
    end

    def show_basic_course
      puts msg(:about_morse)
      STDIN.gets
    end

    def show_q_cw_detail_course
      puts msg(:q_cw_detail_course)
      STDIN.gets
    end

    def show_alphabets
      puts msg(:all_alphabets_title)
      ('A'..'Z').each do |char|
        code = Morsby::MORSE_TABLE[char]
        puts "#{char}: #{code}"
      end
      puts msg(:press_enter_return)
      STDIN.gets
    end

    def learn_all_digits
      puts msg(:all_digits)
      ('0'..'9').each do |d|
        puts "#{d}: #{Morsby::MORSE_TABLE[d]}"
      end
      puts msg(:press_enter_return)
      STDIN.gets
    end

    def show_punctuation
      puts msg(:symbol_title)
      PUNCTUATION_CODES.each do |sym, code|
        puts "#{sym}: #{code}"
      end
      puts msg(:press_enter_return)
      STDIN.gets
    end

    def show_wabun_course
      puts msg(:wabun_title)
      Morsby::WABUN_TABLE.each do |kana, code|
        puts "#{kana}: #{code}"
      end
      puts
      if @language == :ja
        puts "濁音・半濁音もテーブルに直接定義済み。例: ガ、パなど"
      else
        puts "Dakuon and Handakuon are directly defined in the WABUN_TABLE."
      end
      puts msg(:press_enter_return)
      STDIN.gets
    end

    def learn_abbrev(type, title_key)
      puts msg(title_key)
      Morsby::ABBREVIATIONS[type].each do |abbrev|
        code = abbrev[:name].chars.map { |c| Morsby::MORSE_TABLE[c] }.compact.join(" ")
        meaning_ja = abbrev[:ja]
        meaning_en = abbrev[:en]
        puts format(msg(:abbrev_format), name: abbrev[:name], morse_code: code, meaning_ja: meaning_ja, meaning_en: meaning_en)
        puts
      end
      puts msg(:press_enter_return)
      STDIN.gets
    end

    def quiz_characters
      puts msg(:quiz_char_start)
      all_chars = Morsby::MORSE_TABLE.keys
      correct_count = 0
      10.times do |i|
        question = all_chars.sample
        code = Morsby::MORSE_TABLE[question]
        puts msg(:quiz_char_question).call(i)
        puts "Morse: #{code}"
        print (@language == :ja ? "文字は?: " : "Character?: ")
        answer = STDIN.gets.strip.upcase
        if answer == question
          puts msg(:quiz_correct)
          correct_count += 1
        else
          puts msg(:quiz_incorrect).call(question)
        end
        puts
      end
      puts msg(:quiz_result).call(correct_count)
      STDIN.gets
    end

    def quiz_sound
      unless play_installed? && !on_windows?
        show_audio_error_message
        return
      end

      puts msg(:quiz_sound_start)
      all_chars = Morsby::MORSE_TABLE.keys
      correct_count = 0
      10.times do |i|
        question = all_chars.sample
        code = Morsby::MORSE_TABLE[question]
        puts msg(:quiz_sound_question).call(i)
        code.chars.each_with_index do |c, idx|
          play_signal(sig:c)
          # 同一文字内パーツ間=短音1単位
          sleep(@dot_unit) if idx < code.size-1
        end
        # 文字間=3単位
        sleep(@dot_unit*3)
        print "> "
        answer = STDIN.gets.strip.upcase
        if answer == question
          puts msg(:quiz_correct)
          correct_count += 1
        else
          puts msg(:quiz_incorrect).call(question)
        end
        puts
      end
      puts msg(:quiz_result).call(correct_count)
      STDIN.gets
    end

    def play_installed?
      system("which play > /dev/null 2>&1")
    end

    def on_windows?
      RUBY_PLATFORM.downcase.include?('mswin') || RUBY_PLATFORM.downcase.include?('mingw')
    end

    def short_beep
      # 短音=1単位
      system("play -n synth #{@dot_unit} sine 700 > /dev/null 2>&1")
    end

    def long_beep
      # 長音=3単位
      system("play -n synth #{@dot_unit*3} sine 700 > /dev/null 2>&1")
    end

    def play_signal(sig:, show: false)
      if sig == '.'
        short_beep
        print "." if show
      else
        long_beep
        print "-" if show
      end
    end

    def convert_and_sound(str)
      normalized = NKF.nkf('-w -h0 -Z4 --katakana', str)

      words = normalized.split(' ')

      words.each_with_index do |word, w_idx|
        chars = word.chars
        chars.each_with_index do |ch, c_idx|
          code = morse_for_char(ch)
          next unless code
          code.chars.each_with_index do |c, i|
            play_signal(sig: c, show: true)
            # 同一文字内パーツ間=1拍
            sleep(@dot_unit)
          end
          # 文字間=4拍 (3ではなく4にしている)
          sleep(@dot_unit*4)
          print " "
        end
        # 単語間=7拍
        sleep(@dot_unit*7)
        print "   "
      end
    end

    def morse_for_char(ch)
      upch = ch.upcase
      if PUNCTUATION_CODES[upch]
        return PUNCTUATION_CODES[upch]
      end

      if Morsby::MORSE_TABLE[upch]
        return Morsby::MORSE_TABLE[upch]
      end

      code = Morsby::WABUN_TABLE[ch]
      return code if code

      nil
    end

    def show_audio_error_message
      if @language == :ja
        puts "\n音声を再生するには`sox`をインストールしてください。\n"
        puts "また、現在Windowsにはまだ対応しておりません。\n"
        puts "ラーニングモードは起動できます！" if @mode == :output
      else
        puts "\nPlease install 'sox' for sound. Currently not supported on Windows.\n"
        puts "Learning mode is still available!!"
      end
    end
  end
end
