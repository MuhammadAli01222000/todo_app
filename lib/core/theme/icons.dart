import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

sealed class AppIcons {
  static SvgPicture calendar = SvgPicture.asset("assets/icons/calendar.svg", semanticsLabel: "calendar");
  static SvgPicture checkCircle = SvgPicture.asset("assets/icons/check_circle.svg", semanticsLabel: "check circle");
  static SvgPicture pencil = SvgPicture.asset("assets/icons/pencil.svg", semanticsLabel: "pencil");
  static SvgPicture playlist = SvgPicture.asset("assets/icons/playlist.svg", semanticsLabel: "playlist");
  static SvgPicture tick = SvgPicture.asset("assets/icons/tick.svg", semanticsLabel: "tick");
  static SvgPicture trash = SvgPicture.asset("assets/icons/trash.svg", semanticsLabel: "trash");
}

extension ExtSvg on SvgPicture {
  SvgPicture copyWith({double? height, double? width, Color? color}) {
    return SvgPicture(
      bytesLoader,
      height: height ?? this.height,
      width: width ?? this.width,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : colorFilter,
    );
  }
}