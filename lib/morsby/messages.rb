# frozen_string_literal: true

module Morsby
  MESSAGES = {
    ja: {
      help: <<~HELP,

        使用方法:
        -----------------------------------------------------------------
          morsby -h / -help       : ヘルプ表示
          morsby -learn           : 学習モード(対話)
          morsby "char"  : 入力文字列をモールス信号で出力

          オプション:
          --lang en (英語モード。指定しない場合日本語モード。)
          --pro (高速再生モード)
        -----------------------------------------------------------------

      HELP
      learning_mode_end: "\n学習モードを終了します。",
      learning_intro: "モールス信号は、短点と長点を組み合わせて文字・数字・記号を表す国際的な通信手段です。\n" \
                      "かつて、まだ電話やインターネットが普及する前、電報(電気信号による文字送信)が主な長距離通信手段だった時代から利用されてきました。\n" \
                      "この歴史的背景を持つモールス信号は、現在でも非常用や低帯域環境下で有効で、言語の壁を越えた情報伝達を可能にします。",
      about_morse: "[1) モールス信号の基礎]\n" \
                   "モールス信号の基礎とは、短い信号（短点）と長い信号（長点）の組み合わせで文字や数字、記号を表現する仕組みを深く理解することにあります。\n" \
                   "A〜Zのアルファベットや0〜9の数字は、それぞれ固有のパターンを持ち、例えば“A”は「．−」、" \
                   "“B”は「−...」といった具合です。最初は符号表を参照しながら確認しますが、徐々に暗記し、聴いただけで文字が浮かぶようになります。\n\n" \
                   "また、記号（句読点や疑問符、スラッシュなど）もモールス信号で表せるため、単なる文字通信を超え、" \
                   "ある程度複雑なメッセージを送受できるようになります。これにより、長い文を高速に打電する必要はなく、" \
                   "短点と長点の組み合わせで十分な情報量を伝えることが可能です。\n\n" \
                   "モールス信号の特徴は、電力や設備が最小限で済む点にもあります。" \
                   "シンプルなトランシーバーや発信器、受信器があれば運用でき、" \
                   "電波状況が悪くても強弱ある信号を判別しやすく、極限的な環境でも通信が成立しやすいのです。" \
                   "また、音で伝えるだけでなく、光の点滅や振動など、視覚・触覚的な手段で伝達することも可能で、" \
                   "多様な場面で利用できます。\n\n" \
                   "学習の初期段階では、符号表を手元に置き、" \
                   "特定の文字のパターンを声に出したり、リズムで覚えたりする方法が有効です。" \
                   "慣れると、符号を見た瞬間に文字が浮かび、" \
                   "やがては音（ピッ・ピー）を聞くだけで瞬時に理解できるようになります。" \
                   "この過程は、まるで新しい言語を学ぶような感覚を伴い、" \
                   "習得によって得られる達成感も大きいものです。\n\n" \
                   "さらに、モールス信号は歴史的、文化的意義も持ち、" \
                   "かつては世界中で電報を送り合うための共通基盤でした。" \
                   "現代ではデジタル通信が主流ですが、モールスは緊急用のバックアップや、" \
                   "アマチュア無線でのチャレンジ精神、技術的スキルの証明手段として尊ばれています。" \
                   "これらの背景を知ることで、単なる通信手段としてだけでなく、" \
                   "モールス信号習得は世界的なコミュニティへの参加や歴史への接点ともなり得ます。\n\n" \
                   "こうした基礎を固めることで、必要最低限の符号で" \
                   "多様なメッセージを正確・迅速に伝える術を身につけることができ、" \
                   "非常用通信や特殊条件下での通信確保、国際的な趣味仲間との交流など、" \
                   "幅広い場面でその力が発揮できるようになります。",
      press_enter_main: "Enterキーでメインメニューへ進んでください。",
      main_menu: <<~MENU,

        === メインメニュー ===
        1) モールス信号の基礎
        2) Q符号・CW符号とは
        3) アルファベット一覧 (A〜Z)
        4) 数字一覧 (0〜9)
        5) 記号一覧(?など)
        6) 和文一覧(ア〜ン、濁音・半濁音)
        7) これだけは覚えておきたいCW符号(10語)
        8) Q符号 一部紹介(Qコード)
        9) CW符号 一部紹介(一般的略号)
        10) ランダムクイズ(文字)
        11) ランダムクイズ(音声)
        q) 終了
        選択(1-11, q):
      MENU
      q_cw_detail_course: <<~NODTL,

        Q符号は、無線通信を円滑に行うために国際的に標準化された三文字の略号群で、すべて“Q”から始まります。
        例えば、QRMは他局の混信があることを示し、QRNは大気雑音の存在、QRPは送信出力を下げるよう要請する符号です。
        これらQ符号を用いることで、詳細な文脈や長い文章なしに、短く明確な意図を伝達できます。
        言語や文化が異なるオペレーター間でも、Q符号を共有していれば、共通の“通信言語”として機能し、瞬時に状況を理解し合えるのです。

        一方、CW略号はアマチュア無線や国際通信で慣用的に用いられる短縮表現で、定型的な挨拶や状態報告を簡潔に行います。
        たとえば、OMは男性オペレーターを親しみを込めて呼ぶ表現、YLは女性オペレーターを示す略称で、国籍や言語を超えて“仲間”として呼びかけやすくなります。
        FBは“Fine Business”の略で“とても良い”という肯定的評価を素早く伝え、TNXは“Thanks”を短くして感謝を即座に示せます。
        これらの略語を活用すれば、長いフレーズを何度も打つ必要がなくなり、交信時間を短縮して効率的なコミュニケーションを可能にします。

        Q符号とCW略号を併せて使うことで、単なる符号の受け渡しを超え、互いの意図や状況を短時間で的確に伝え合えるようになります。
        電波状況が悪い、使用言語が異なる、緊急性が高いなど、多様な条件下でも、これらの略号は共通の合図として機能します。
        その結果、オペレーター同士は必要最小限の符号で的確な応答が可能になり、国際的なネットワーク形成や相互理解を促進します。

        Q符号はよりシステマティックな質問・指令的要素を担い、CW略号はより人間味や友好度を高める柔らかいコミュニケーション手段と言えます。
        両者を習熟すれば、無線通信における多言語・多文化の壁を薄め、効率性と親密さを両立させた、国際的で実用的な交信が実現します。

        Enterキーでメインメニューへ戻ります。
      NODTL
      all_alphabets_title: "=== アルファベット一覧 (A〜Z) ===",
      all_digits: "=== 数字一覧 (0〜9) ===",
      symbol_title: "=== 記号一覧(?など) ===",
      wabun_title: "=== 和文一覧(ア〜ン、濁音・半濁音) ===",
      abbrev_essential_title: "=== これだけは覚えておきたいCW符号(10語) ===",
      abbrev_q_signs_title: "=== Q符号 一部紹介(Qコード) ===",
      abbrev_cw_signs_title: "=== CW符号 一部紹介(一般的略号) ===",
      abbrev_format: "%<name>s: %<morse_code>s\n  日本語: %<meaning_ja>s\n  English: %<meaning_en>s",
      quiz_char_start: <<~QSTART,

        === ランダムクイズ(文字) ===
        A-Z,0-9から10問出題します。
        モールス符号を表示するので、対応する文字を答えてください。
      QSTART
      quiz_sound_start: <<~QSTART,

        === ランダムクイズ(音声) ===
        A-Z,0-9から10問出題します。
        音で提示する符号から文字を判別してください。
      QSTART
      quiz_char_question: ->(i){ "問題#{i+1}: このモールス符号は何の文字？" },
      quiz_sound_question: ->(i){ "問題#{i+1}: 音声再生。何の文字？" },
      quiz_correct: "正解です！",
      quiz_incorrect: ->(answer){ "惜しい！正解は #{answer} でした。" },
      quiz_result: ->(count){ "クイズ終了！ #{count}/10問正解。\nEnterキーでメインメニューに戻ります。" },
      press_enter_return: "Enterキーでメインメニューに戻ります。"
    },
    en: {
      help: <<~HELP,

        Usage:
        -----------------------------------------------------------------
          morsby -h / -help       : Show help
          morsby -learn           : Enter learning mode
          morsby "char"  : Convert input to Morse

          Option:
          --lang en (English mode. The Default is Japanese mode without this option.)
          --pro (High speed mode)
        -----------------------------------------------------------------

      HELP
      learning_mode_end: "\nExiting learning mode...",
      learning_intro: "Morse code uses short and long signals to represent letters, digits, and symbols. " \
                      "It originated when telegraphs (sending text via electrical signals) were the primary long-distance communication method, long before telephones or the internet. " \
                      "This historical foundation makes Morse still valuable today in emergencies and low-bandwidth conditions, enabling meaningful exchange across language barriers.",
      about_morse: "[1) Morse code basics]\n" \
                   "In Morse code basics, you learn how each letter (A-Z), digit (0-9), and punctuation mark corresponds to unique patterns of short and long signals. " \
                   "Initially, you consult a code chart, but with practice, you’ll recognize characters by sound alone. " \
                   "Morse’s low resource requirements make it reliable under poor conditions, and it can be conveyed via audio, light, or tactile means.\n\n" \
                   "This skill transforms simple tones into meaningful text, allowing seamless communication across language barriers and technical constraints. " \
                   "As you become proficient, the code feels like a new language—one where short/long tones become words in your mind without conscious translation. " \
                   "Historically central to telegraphy, Morse code still endures in amateur radio, emergency communications, and international friendships, " \
                   "offering a time-tested method to exchange information quickly and accurately.\n\n" \
                   "Mastering these basics empowers you to communicate in challenging scenarios, tap into a rich global tradition, and appreciate a technique " \
                   "that remains both practically valuable and culturally significant.",
      press_enter_main: "Press Enter to proceed to the main menu.",
      main_menu: <<~MENU,

        === Main Menu ===
        1) Morse code basics
        2) About Q-codes & CW
        3) Alphabets (A-Z)
        4) Digits (0-9)
        5) Punctuation (?, ., etc.)
        6) Wabun (Japanese)
        7) Important abbreviations (10 words)
        8) Q-codes
        9) CW abbreviations
        10) Random Quiz (Characters)
        11) Random Quiz (Sound)
        q) Quit
        Select (1-11, q):
      MENU
      q_cw_detail_course: <<~NODTL,

        Q-codes are internationally standardized three-letter codes (all starting with 'Q') designed to convey specific questions and instructions concisely.
        For instance, QRM indicates interference from other stations, QRN signifies atmospheric noise, and QRP requests reduced transmitter power.
        By using Q-codes, operators communicate critical information quickly and universally, without lengthy explanations or shared spoken language.
        They serve as a common “lingua franca” in radio communication, allowing instant comprehension of operational conditions.

        CW abbreviations, on the other hand, simplify common greetings and status reports into short forms.
        For example, OM (for a male operator) and YL (for a female operator) enable friendly, direct addresses that transcend nationalities.
        FB (Fine Business) quickly expresses approval or good conditions, and TNX (Thanks) efficiently conveys gratitude without typing full words.
        Employing these abbreviations reduces message length, saves time, and creates a more personable, welcoming atmosphere during communication.

        Together, Q-codes and CW abbreviations transform Morse exchanges into efficient and humanized interactions.
        Regardless of language barriers, poor signal conditions, or urgency, these sets of shorthand ensure that essential meanings and camaraderie are conveyed promptly and accurately.  
        Mastering them empowers operators to forge international understanding, streamline their operations, and maintain a friendly rapport across borders.

        Press Enter to return.
      NODTL
      all_alphabets_title: "=== Alphabets (A-Z) ===",
      all_digits: "=== Digits (0-9) ===",
      symbol_title: "=== Punctuation ===",
      wabun_title: "=== Wabun (Japanese) ===",
      abbrev_essential_title: "=== 10 Important Abbreviations ===",
      abbrev_q_signs_title: "=== Q-codes ===",
      abbrev_cw_signs_title: "=== CW Abbreviations ===",
      abbrev_format: "%<name>s: %<morse_code>s\n  Japanese: %<meaning_ja>s\n  English: %<meaning_en>s",
      quiz_char_start: <<~QSTART,

        === Random Quiz (Characters) ===
        10 questions from A-Z,0-9.
        We'll show Morse code; guess the character.
      QSTART
      quiz_sound_start: <<~QSTART,

        === Random Quiz (Sound) ===
        10 questions from A-Z,0-9.
        Identify the character from the tone.
      QSTART
      quiz_char_question: ->(i){ "Question #{i+1}: Which character is this Morse code?" },
      quiz_sound_question: ->(i){ "Question #{i+1}: Listen to the tone. Which character?" },
      quiz_correct: "Correct!",
      quiz_incorrect: ->(answer){ "Wrong. The correct answer was #{answer}." },
      quiz_result: ->(count){ "Quiz finished! You got #{count}/10 correct.\nPress Enter to return." },
      press_enter_return: "Press Enter to return to the main menu."
    }
  }.freeze
end
