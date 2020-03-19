

import 'dart:math';

import 'package:kcs_2020_shinkan_web/WorksPage/workInfo.dart';
import 'package:kcs_2020_shinkan_web/mainWorksView.dart';

const _works = <WorkInfo>[
  WorkInfo("馬・シマウマ相互変換AI", "相互変換AI", "supercell", "理工学部2年", null, ["image/works/supercell_ai.jpg"], null, [WorkGenre.AI,], null, "Python"),
  WorkInfo("接待オセロ", "接待オセロ", "FF", "理工学部4年", null, ["image/works/ff_othello.jpg"], null, [WorkGenre.AI, WorkGenre.WEB, WorkGenre.GAME], "Web", "Python"),
  WorkInfo("建物", "建物", "K.", "理工学部1年", null, ["image/works/k_building_cg.jpg", "image/works/k_building_dev.jpg"], null, [WorkGenre.BLENDER, WorkGenre.CG], "Blender", null),
  WorkInfo("車", "車", "K.", "理工学部1年", null, ["image/works/k_car_cg.jpg", "image/works/k_car_dev.jpg"], null, [WorkGenre.BLENDER, WorkGenre.CG], "Blender", null),
  WorkInfo("顔", "顔", "cooh2", "理工学部1年", null, ["image/works/cooh2_face.jpg"], null, [WorkGenre.BLENDER, WorkGenre.CG], "Blender", null),
  WorkInfo("KCSちゃん", "KCSちゃん", "cooh2", "理工学部1年", null, ["image/works/cooh2_kcschann1.jpg", "image/works/cooh2_kcschann2.jpg"], null, [WorkGenre.BLENDER, WorkGenre.CG], "Blender", null),
  WorkInfo("熱盛ゲーム", "熱盛", "Sho/HandleSpinner", "理工学部1年", null, ["image/works/sho_atsumori1.jpg", "image/works/sho_atsumori2.jpg", "image/works/sho_atsumori_dev.png", "image/works/sho_atsumori_title.png"], null, [WorkGenre.UNITY, WorkGenre.GAME], "Unity", "C#"),
  WorkInfo("I wanna avoid the 3D barrage 2 (VR)", "VR", null, "理工学部2年", null, ["image/works/sorariku_iwanna.jpg", "image/works/sorariku_iwanna.jpg"], null, [WorkGenre.UNITY, WorkGenre.GAME], "Unity", "C#"),
  WorkInfo("KCSちゃんず", "KCSちゃんず", "unkonown", "理工学部2年", "Unityでswitchのコントローラーを使った対戦ゲームを作りました。Blender班のnokinoki君にキャラクター製作、DTM班のrinju君にBGM製作を担当してもらいました。命は大切にしよう！", ["image/works/8u4_kcschanns1.jpg", "image/works/8u4_kcschanns2.jpg", "image/works/8u4_kcschanns_dev.jpg"], null, [WorkGenre.UNITY, WorkGenre.GAME], "Unity", "C#"),
  WorkInfo("Beyond the limit", "BEYOND THE LIMIT", "Ultimate", "経済学部B1年", null, ["image/works/orfevre_btl.jpg", "image/works/orfevre_btl_dev.jpg"], null, [WorkGenre.UNITY, WorkGenre.GAME, WorkGenre.BLENDER], "Unity", "C#"),
  WorkInfo("クラタン(Cloud Tango)", "クラタン", "fastriver", "理工学部1年", "単語帳をSpreadSheetで作り、スマホで勉強する。", ["image/works/fastriver_clatan.jpg", "image/works/fastriver_clatan_qr.jpg", "image/works/fastriver_clatan_spread.jpg", "image/works/fastriver_clatan_yagami.jpg",], "https://pizzxa.fastriver.dev/apps/cloud-tango/jp", [WorkGenre.WEB, WorkGenre.TOOL], "Flutter", "Dart"),
  WorkInfo("つらたん", "つらたん", "fastriver", "理工学部1年", "つらいときに開くゲーム", ["image/works/fastriver_tsuratan.jpg", "image/works/fastriver_tsuratan2.jpg", "image/works/fastriver_tsuratan3.jpg"], "https://tsuratan.fastriver.dev/", [WorkGenre.WEB, WorkGenre.GAME], "Flutter", "Dart"),
  WorkInfo("年賀状from fastriver", "年賀状", "fastriver", "理工学部1年", "ネズミ叩き", ["image/works/fastriver_nengajou.jpg"], "http://year-greeting-condition2020.fastriver.dev/", [WorkGenre.WEB, WorkGenre.GAME], "Flutter", "Dart"),
  WorkInfo("新歓ホームページ", "新歓HP", "fastriver/orfevre", "理工学部1年", "前衛的なWebサイト", ["image/works/fastriver_new.jpg", "image/works/fastriver_new_group.jpg"], "https://kcs1959.github.io/2020new/", [WorkGenre.WEB], "Flutter Web", "Dart"),
  WorkInfo("sf", "sf", "K.", "理工学部1年", null, ["image/works/k_sf.jpg"], null, [WorkGenre.BLENDER, WorkGenre.CG], "Blender", null),
  WorkInfo("部屋", "部屋", "K.", "理工学部1年", null, ["image/works/k_room.jpg"], null, [WorkGenre.BLENDER, WorkGenre.CG], "Blender", null),
  WorkInfo("New Name!", "New Name!", "Rinju", "理工学部2年", null, [], null, [WorkGenre.DTM, WorkGenre.MUSIC], null, null),
  WorkInfo("undefined", "undefined1", null, null, null, ["image/yuzuka_rough.jpg"], null, [], "MONSTER", null),
  WorkInfo("undefined", "undefined2", null, null, null, ["image/yuzuka_rough.jpg"], null, [], "MONSTER", null),
  WorkInfo("undefined", "undefined3", null, null, null, ["image/yuzuka_rough.jpg"], null, [], "MONSTER", null),
];

class WorksData {
  List<WorkInfo> get works => _works;

  static WorkInfo random() {
    return _works[Random().nextInt(_works.length)];
  }
}