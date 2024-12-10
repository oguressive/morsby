# README

## Overview

Morsbyは、モールス信号の学習・活用を支援するツールです。
英字（A-Z）、数字（0-9）、記号（?）、Q符号、CW略語、和文モールスまで対応。

学習モードで基礎を固めたり、クイズで理解度を確認したり、文字列を即座にモールス信号へ変換したりできます。
また、英語表示(`--lang en`)やプロモード(`--pro`)による高速再生にも対応します。

※筆者の勉強用でもあり、内容についての正確性は保証致しません。
※雑なコード/機能が多々ありますのでIssueやPR発行いただければ嬉しいです。

Morsby is a tool to learn and utilize Morse code.
It supports alphabets (A-Z), digits (0-9), punctuation (?), Q-codes, CW abbreviations, and Japanese Wabun Morse.
Use the learning mode to practice basics and test your skills with quizzes, or instantly convert input strings to Morse code.
Features an English mode (`--lang en`) and a pro mode (`--pro`) for faster playback.

Note: This content is also for the author’s own study, and its accuracy is not guaranteed.
Note: There may be rough or imperfect code/functions in places, so issues and pull requests are welcome.

## Install

install morsby

```
gem install morsby
```

install sox for playing morse sound

### For Mac

```
brew install sox
```

### For Linux(CentOS)

```
sudo yum install sox
```

### For Linux(Debian/Ubuntu)

```
sudo apt-get install sox
```

This tool does not support Windows yet.

## Usage

### Learning Mode

```
morsby -learn
```

Main menu: basics, Q-codes, CW abbreviations, quizzes.

### Output Mode

```
morsby "HELLO"
```

Converts HELLO into Morse code.

### オプション (Options)

`--lang en`: English
`--pro`: High speed mode

### Example

```
morsby "Rubyist"
morsby --pro "HELLO RUBYIST"
morsby -learn
morsby -learn --lang en
morsby -learn --pro
morsby -learn --pro --lang en
```

## Development & Test

```
bundle install
bundle exec rspec
```
