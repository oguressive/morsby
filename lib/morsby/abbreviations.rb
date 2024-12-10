# frozen_string_literal: true

module Morsby
  ABBREVIATIONS = {
    essential: [
      { name: "CQ", ja: "一般呼出", en: "General call" },
      { name: "DE", ja: "こちらは", en: "From (this station)" },
      { name: "K",  ja: "どうぞ送れ", en: "Over, go ahead" },
      { name: "R",  ja: "了解", en: "Roger, received" },
      { name: "AR", ja: "メッセージ終了", en: "End of message" },
      { name: "AS", ja: "待て", en: "Wait" },
      { name: "BT", ja: "区切り", en: "Break between sections" },
      { name: "SK", ja: "通信終了", en: "End of contact" },
      { name: "SOS",ja: "遭難信号", en: "Distress signal" },
      { name: "TNX",ja: "感謝", en: "Thanks" }
    ],

    q_signs: [
      { name: "QRM", ja: "他局混信", en: "Interference" },
      { name: "QRN", ja: "雑音有",   en: "Atmospheric noise" },
      { name: "QRP", ja: "出力下げ", en: "Reduce power" },
      { name: "QRT", ja: "送信停止", en: "Stop transmitting" },
      { name: "QRV", ja: "準備OK？", en: "Ready?" },
      { name: "QRX", ja: "後で呼ぶ", en: "Call later" },
      { name: "QSB", ja: "信号変動", en: "Signals fading" },
      { name: "QSL", ja: "受領了解", en: "Acknowledgement" },
      { name: "QSO", ja: "交信中",   en: "A contact" },
      { name: "QSY", ja: "周波数変更", en: "Change frequency" }
    ],

    cw_signs: [
      { name: "OM",  ja: "男性オペレーターに親しみを込めて呼ぶ呼称", en: "Male operator (OM)" },
      { name: "YL",  ja: "女性オペレーターに親しみを込めて呼ぶ呼称", en: "Lady operator (YL)" },
      { name: "XYL", ja: "妻",        en: "Wife (XYL)" },
      { name: "FB",  ja: "良好",      en: "Fine Business" },
      { name: "GM",  ja: "おはよう",  en: "Good Morning" },
      { name: "GN",  ja: "おやすみ",  en: "Good Night" },
      { name: "GA",  ja: "こんにちは(午後)", en: "Good Afternoon" },
      { name: "GE",  ja: "こんばんは", en: "Good Evening" },
      { name: "CU",  ja: "また会おう", en: "See you" },
      { name: "CUL", ja: "また会いましょう", en: "See you later" },
      { name: "PSE", ja: "お願いします",   en: "Please" }
    ]
  }.freeze
end