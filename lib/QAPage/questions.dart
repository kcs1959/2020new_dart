const _questionsList = <QAndA>[
  const QAndA(
      "大学からプログラミングを始めるのですが、初心者でも入れますか？",
      "問題ないです。春は初心者向けに複数の講習会を開きますし、大部分は初心者です。"
  ),
  const QAndA(
      "男女比はどのくらいですか？",
      "10:1ほどだと言われています。"
  ),
  const QAndA(
      "部員の学部構成はどうなってますか？",
      "理工学部が一番多いですが、経済・法・SFCなどの学部生も所属しています。"
  ),
  const QAndA(
      "2年から入ることはできますか？　馴染めますか？",
      "大歓迎です。2年生以降になってからアクティブに参加を始める部員は多いです。"
  ),
  const QAndA(
    "活動費はいくらですか？",
    "年会費が5000円、秋からの入会は2500円です。それ以外の集金は基本的にありません。"
  ),
  const QAndA(
    "すべての活動に参加する必要はありますか？",
    "必要はありません。参加も自由ですし、自分で勉強会など開催するのも大歓迎です。"
  ),
  const QAndA(
    "先輩にプログラミングの相談はできますか？",
    "できます！　SlackではOBも含めて情報交換が盛んに行われています。Twitterでも気軽にご相談ください！"
  ),
  const QAndA(
    "競技プログラミングをやっている人はいますか？",
    "やってるひとは多いです。去年は部内で定期的にミニコンテストを開いたりもしていました。ICPCに出場した人も複数います。"
  ),
  const QAndA(
    "慶應以外の学生も参加できますか？",
    "申し訳ありません。KCSは慶應義塾大学公認団体のため、慶應外の方は所属できません。"
  ),
];

class Questions {
  static List<QAndA> get getList => _questionsList;
}

class QAndA {
  final String question;
  final String answer;

  const QAndA(this.question, this.answer);
}