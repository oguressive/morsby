# CHANGELOG

## 0.1.0
---
**初回リリース (First Release)**

モールス信号の基礎から、アルファベット・数字・記号・Q符号・CW略語・和文モールスまで対応し、
学習モード（対話型）と出力モードを実装しました。

- `morsby -h`でヘルプ表示
- `morsby -learn`で学習モードに入り、基礎知識や略語一覧、クイズを通じて練習可能
- `morsby "HELLO"`で文字列をモールス信号へ変換して出力
- `--lang en`で英語表示、`--pro`で高速なプロモード対応
- 和文、濁音・半濁音、記号(?)にも対応

This initial release introduces a comprehensive Morse code tool supporting alphabets (A-Z), digits (0-9), punctuation (?), Q-codes, CW abbreviations, and Wabun Morse.
It offers both an interactive learning mode and a direct output mode.

- Show help `morsby -h`
- Enter learning mode with `morsby -learn` to study basics, Q-codes, CW abbreviations, and practice quizzes
- Convert a given string to Morse code with `morsby "HELLO"`
- `--lang en` for English interface, `--pro` for faster (professional) mode
- Also supports Japanese Wabun Morse, including voiced and semi-voiced characters, as well as punctuation like `?`
