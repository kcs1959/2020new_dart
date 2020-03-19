

import 'dart:math';

import 'package:kcs_2020_shinkan_web/WorksPage/workInfo.dart';
import 'package:kcs_2020_shinkan_web/mainWorksView.dart';

const _works = <WorkInfo>[
  WorkInfo(0, "馬・シマウマ相互変換AI", "相互変換AI", "supercell", "理工学部2年", null, ["image/works/supercell_ai.jpg"], null, [WorkGenre.AI,], null, "Python"),
  WorkInfo(1, "接待オセロ", "接待オセロ", "FF", "理工学部4年", null, ["image/works/ff_othello.jpg"], null, [WorkGenre.AI, WorkGenre.WEB, WorkGenre.GAME], "Web", "Python"),
  WorkInfo(2, "建物", "建物", "K.", "理工学部1年", null, ["image/works/k_building_cg.jpg", "image/works/k_building_dev.jpg"], null, [WorkGenre.BLENDER, WorkGenre.CG], "Blender", null),
  WorkInfo(3, "車", "車", "K.", "理工学部1年", null, ["image/works/k_car_cg.jpg", "image/works/k_car_dev.jpg"], null, [WorkGenre.BLENDER, WorkGenre.CG], "Blender", null),
  WorkInfo(4, "顔", "顔", null, "理工学部1年", null, ["image/works/cooh2_face1.jpg", "image/works/cooh2_face2.jpg"], null, [WorkGenre.BLENDER, WorkGenre.CG], "Blender", null),
  WorkInfo(5, "座っているKCSちゃん", "KCSちゃん", null, "理工学部1年", null, ["image/works/cooh2_kcschann1.jpg", "image/works/cooh2_kcschann2.jpg"], null, [WorkGenre.BLENDER, WorkGenre.CG], "Blender", null),
  WorkInfo(6, "熱盛ゲーム", "熱盛", "Sho/HandleSpinner", "理工学部1年", null, ["image/works/sho_atsumori1.jpg", "image/works/sho_atsumori2.jpg", "image/works/sho_atsumori_dev.png", "image/works/sho_atsumori_title.png"], null, [WorkGenre.UNITY, WorkGenre.GAME], "Unity", "C#"),
  WorkInfo(7, "I wanna avoid the 3D barrage 2 (VR)", "VR", null, "理工学部2年", null, ["image/works/sorariku_iwanna.jpg", "image/works/sorariku_iwanna.jpg"], null, [WorkGenre.UNITY, WorkGenre.GAME], "Unity", "C#"),
  WorkInfo(8, "KCSちゃんず", "KCSちゃんず", "unkonown", "理工学部2年", "Unityでswitchのコントローラーを使った対戦ゲームを作りました。Blender班のnokinoki君にキャラクター製作、DTM班のrinju君にBGM製作を担当してもらいました。命は大切にしよう！", ["image/works/8u4_kcschanns1.jpg", "image/works/8u4_kcschanns2.jpg", "image/works/8u4_kcschanns_dev.jpg"], null, [WorkGenre.UNITY, WorkGenre.GAME], "Unity", "C#"),
  WorkInfo(9, "Beyond the limit", "BEYOND THE LIMIT", "Ultimate", "経済学部B1年", null, ["image/works/orfevre_btl.jpg", "image/works/orfevre_btl_dev.jpg"], null, [WorkGenre.UNITY, WorkGenre.GAME, WorkGenre.BLENDER], "Unity", "C#"),
  WorkInfo(10,"クラタン(Cloud Tango)", "クラタン", "fastriver", "理工学部1年", "単語帳をSpreadSheetで作り、スマホで勉強する。開発時間結構長いのにあまり見向きされない悲しい作品", ["image/works/fastriver_clatan.jpg", "image/works/fastriver_clatan_qr.jpg", "image/works/fastriver_clatan_spread.jpg", "image/works/fastriver_clatan_yagami.jpg",], "https://pizzxa.fastriver.dev/apps/cloud-tango/jp", [WorkGenre.WEB, WorkGenre.TOOL], "Flutter", "Dart"),
  WorkInfo(11,"つらたん", "つらたん", "fastriver", "理工学部1年", "つらいときに開くゲーム。", ["image/works/fastriver_tsuratan.jpg", "image/works/fastriver_tsuratan2.jpg", "image/works/fastriver_tsuratan3.jpg"], "https://tsuratan.fastriver.dev/", [WorkGenre.WEB, WorkGenre.GAME], "Flutter", "Dart"),
  WorkInfo(12,"年賀状from fastriver", "年賀状", "fastriver", "理工学部1年", "ネズミ叩きゲーム！年賀状にしては人生が狂わされがちな作品です。iPhone SEでは遊べません", ["image/works/fastriver_nengajou.jpg"], "http://year-greeting-condition2020.fastriver.dev/", [WorkGenre.WEB, WorkGenre.GAME], "Flutter", "Dart"),
  WorkInfo(13,"新歓ホームページ", "新歓HP", "fastriver/orfevre", "理工学部1年", "前衛的なWebサイト。重いとか言ってはいけない。", ["image/works/fastriver_new.jpg", "image/works/fastriver_new_group.jpg"], "https://kcs1959.github.io/2020new/", [WorkGenre.WEB], "Flutter Web", "Dart"),
  WorkInfo(14,"sf", "sf", "K.", "理工学部1年", null, ["image/works/k_sf.jpg"], null, [WorkGenre.BLENDER, WorkGenre.CG], "Blender", null),
  WorkInfo(15,"部屋", "部屋", "K.", "理工学部1年", null, ["image/works/k_room.jpg"], null, [WorkGenre.BLENDER, WorkGenre.CG], "Blender", null),
  WorkInfo(16,"New Name!", "New Name!", "Rinju", "理工学部2年", null, [], "https://soundcloud.com/rinju-132102135/new-name", [WorkGenre.DTM, WorkGenre.MUSIC], null, null, embed: """<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/694484653&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe>"""),
  WorkInfo(17,"KCSドラゴン(木)", "KCSドラゴン", "fastriver", "理工学部1年", "レーザーに焼かれたKCSドラゴン。工場での加工はとても楽しい", ["image/works/fastriver_kcsdragon1.jpg", "image/works/fastriver_kcsdragon2.jpg"], null, [WorkGenre.OTHERS], "レーザー加工機(矢上)", null),
  WorkInfo(18,"カワウソカステラ", "カワウソカステラ", null, "理工学部1年", null, ["image/works/cooh2_usotera1.jpg", "image/works/cooh2_usotera2.jpg", "image/works/cooh2_usotera3.jpg", ], null, [WorkGenre.BLENDER, WorkGenre.CG], "Blender", null),
];

class WorksData {
  List<WorkInfo> get works => _works;

  static WorkInfo random() {
    return _works[Random().nextInt(_works.length)];
  }

  static List<WorkInfo> pickUp(int length) {
    var shuffled = <WorkInfo>[]..addAll(_works)..shuffle();

    if(length > shuffled.length) return shuffled;

    return shuffled.getRange(0, length).toList();
  }
}