# frozen_string_literal: true

# 和文モールス符号
# 基本清音に加え、濁音・半濁音付きの仮名も定義
# 濁音は".." + 清音符号
# 半濁音は"..-" + 清音符号

module Morsby
  WABUN_TABLE = {
    # 清音
    'ア' => '--.--',
    'イ' => '.-',
    'ウ' => '..-',
    'エ' => '-.-..',
    'オ' => '.---.',

    'カ' => '-.-',
    'キ' => '-.-.-',
    'ク' => '---.-',
    'ケ' => '-.-.',
    'コ' => '----',

    'サ' => '-...',
    'シ' => '--.-.',
    'ス' => '-.-.-.',
    'セ' => '--.-..',
    'ソ' => '-.-.--',

    'タ' => '-',
    'チ' => '.-.-',
    'ツ' => '..-..',
    'テ' => '.-.---',
    'ト' => '..--.',

    'ナ' => '.-.',
    'ニ' => '-.-.--',
    'ヌ' => '....',
    'ネ' => '--.-',
    'ノ' => '..---',

    'ハ' => '-...-',
    'ヒ' => '--..-',
    'フ' => '----.',
    'ヘ' => '-...',
    'ホ' => '-..',

    'マ' => '-..-',
    'ミ' => '..-.-',
    'ム' => '-.',
    'メ' => '-...-.',
    'モ' => '-..--',

    'ヤ' => '.-...',
    'ユ' => '..--..',
    'ヨ' => '.--..',

    'ラ' => '...',
    'リ' => '--.--',
    'ル' => '-....',
    'レ' => '---',
    'ロ' => '.-.-.',

    'ワ' => '.-..',
    'ヰ' => '.--.-',
    'ヱ' => '.-..-',
    'ヲ' => '.---',
    'ン' => '.-.-',

    # 濁音(清音に".."を前置)
    'ガ' => '..' + '-.-', # ガ(カに濁点)
    'ギ' => '..' + '-.-.-',
    'グ' => '..' + '---.-',
    'ゲ' => '..' + '-.-.',
    'ゴ' => '..' + '----',

    'ザ' => '..' + '-...',
    'ジ' => '..' + '--.-.',
    'ズ' => '..' + '-.-.-.',
    'ゼ' => '..' + '--.-..',
    'ゾ' => '..' + '-.-.--',

    'ダ' => '..' + '-',
    'ヂ' => '..' + '.-.-',
    'ヅ' => '..' + '..-..',
    'デ' => '..' + '.-.---',
    'ド' => '..' + '..--.',

    'バ' => '..' + '-...-',
    'ビ' => '..' + '--..-',
    'ブ' => '..' + '----.',
    'ベ' => '..' + '-...',
    'ボ' => '..' + '-..',

    # 半濁音(清音に"..-"を前置)
    'パ' => '..-' + '-...-',
    'ピ' => '..-' + '--..-',
    'プ' => '..-' + '----.',
    'ペ' => '..-' + '-...',
    'ポ' => '..-' + '-..'
  }
end
