import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CustomColors {
  static Color mainColor = const Color(0xFFF15025);
  static Color background = const Color(0xFF5129B2);
  static Color bottomDarkBack = const Color(0xFF121212);
  static Color scaffoldDarkBack = const Color(0xFF222222);
  static Color backGrey = const Color(0xFFf6f6f6);
  static Color loginGradientStart = const Color(0xFF59499E);
  static Color loginGradientEnd = const Color(0xFF59499E);
  static Color successGreen = const Color(0xFF32CD32);
  static Color secondaryColor = const Color(0xFFffa302);
  static Color thirdColor = const Color(0xFFFFD684);
  static Color fourthColor = const Color(0xFF8FDCFF);
  static Color elementBack = const Color(0xfff1efef);
  static Color titleColor = const Color(0xFF061857);

  //
  static Color white = const Color(0xFFFFFFFF);
  static Color whiteF1F3F4 = const Color(0xFFF1F3F4);
  static Color blue0CA2FA = const Color(0xFF0CA2FA);
  static Color blueEFF7FC = const Color(0xFFEFF7FC);

  static const Color black000000 = Color(0xFF000000);
  static Color black333333 = const Color(0xFF333333);
  static Color black333333_68 = const Color(0xA6333333);
  static Color black515151 = const Color(0xFF515151);
  static Color blackC7C7C7 = const Color(0xFFC7C7C7);
  static Color black202020 = const Color(0xFF202020);
  static Color black1B0A0A = const Color(0x261B0A0A);
  static Color black1E1E1E = const Color(0xFF1E1E1E);

  static Color grayf6f6f6 = const Color(0xFFf6f6f6);
  static Color gray818181 = const Color(0xFF818181);
  static Color gray8C8C8C = const Color(0xFF8C8C8C);
  static Color gray6E6E6E = const Color(0xFF6E6E6E);
  static Color grayF5F5F5 = const Color(0xFFF5F5F5);
  static Color grayFAFAFA = const Color(0xFFFAFAFA);
  static Color greyCCCCCC = const Color(0xFFCCCCCC);
  static Color greyE0E0E0 = const Color(0xFFE0E0E0);
  static Color grey666666 = const Color(0xFF666666);
  static Color greyEEEEEE = const Color(0xFFEEEEEE);
  static Color greyF2F2F2 = const Color(0xFFF2F2F2);
  static Color greyFCFCFC = const Color(0xFFFCFCFC);
  static Color grey55555 = const Color(0xFF555555);
  static Color greyEFEFEF = const Color(0xFFEFEFEF);
  static Color grey909090 = const Color(0xFF909090);
  static Color grayCBCBCB = const Color(0xFFCBCBCB);

  static Color red97361A = const Color(0xFF97361A);
  static Color redCF13535 = const Color(0xFFF13535);
  static Color redCD44C24 = const Color(0xFFD44C24);
  static Color redC85D62 = const Color(0xFFC85D62);
  static Color redD14248 = const Color(0xFFD14248);
  static Color red861E00 = const Color(0xFF861E00);
  static Color redCD1F26 = const Color(0xFFCD1F26);
  static Color pinkFEEDEE = const Color(0xFFFEEDEE);
  static Color pinkFBEBEC = const Color(0xFFFBEBEC);
  static Color ambeFFA801 = const Color(0xFFFFA801);
  static Color whiteE1C8C1 = const Color(0xFFE1C8C1);
  //arbook
  static Color green3ba56c = const Color(0xFF3ba56c);
  static Color green8a9894 = const Color(0xFF8a9894);
  static Color green006338 = const Color(0xFF006338);

  static LinearGradient linearColorEventDetail = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        1.0
      ],
      colors: <Color>[
        Color(0x002D2A26),
        // Color(0x332D2A26),
        // Color(0x802D2A26),
        // Color(0xBF2D2A26),
        Color(0xff2D2A26),
      ]);
  static LinearGradient linearColorArtifactText = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        1.0
      ],
      colors: <Color>[
        Color(0x00000000),
        // Color(0x332D2A26),
        // Color(0x802D2A26),
        // Color(0xBF2D2A26),
        Color(0x99000000),
      ]);

  static LinearGradient linearColorArtifact = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        0.5,
        1.0,
      ],
      colors: <Color>[
        Color(0xF2888888),
        Color(0xFFCCCCCC),
        Color(0xF2888888),
      ]);
  static LinearGradient linearColorAudioPlayer = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        0.5,
        1.0,
      ],
      colors: <Color>[
        Color(0x00861E00),
        Color(0x33861E00),
        Color(0xFF861E00),
      ]);

  static LinearGradient linearColorArtifactDetail = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        0.5,
        1.0,
      ],
      colors: <Color>[
        Color(0x00861E00),
        Color(0xCC861E00),
        Color(0xFF861E00),
      ]);

  static LinearGradient linearColorMapSlider = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        1.0,
      ],
      colors: <Color>[
        Color(0x00000000),
        Color(0x66000000),
      ]);
  static LinearGradient linearColorMiniPlayer = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        1.0,
      ],
      colors: <Color>[
        Color(0xCCBB2A00),
        Color(0xF2BB2A00),
      ]);

  static LinearGradient linearColorMiniPlayerBottomBar = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        1.0,
      ],
      colors: <Color>[
        Color(0xF2BB2A00),
        Color(0xFFBB2A00),
      ]);
  static LinearGradient linearColorBottomBarTransition = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        1.0,
      ],
      colors: <Color>[
        Color(0x00000000),
        Color(0x00000000),
      ]);
  static LinearGradient linearColorStoryBackGroudTopText = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        1.0,
      ],
      colors: <Color>[
        Color(0x001B0A0A),
        Color(0xFF1B0A0A),
      ]);

  static LinearGradient linearColorStoryBackGroudTopMenu = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        1.0,
      ],
      colors: <Color>[
        Color(0x661B0A0A),
        Color(0x001B0A0A),
      ]);

  static LinearGradient linearColorStory = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        0.5,
        1.0,
      ],
      colors: <Color>[
        Color(0xF2888888),
        Color(0x80CCCCCC),
        Color(0xF2888888),
      ]);

  static LinearGradient linearColorDiagram = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        1.0,
      ],
      colors: <Color>[
        Color(0x00000000),
        Color(0x66000000),
      ]);

  static LinearGradient linearColorItemHomeStory = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        0.5,
        1.0,
      ],
      colors: <Color>[
        Color(0x00000000),
        Color(0x33000000),
        Color(0xCC000000),
      ]);

  static LinearGradient linearColorIntroAppBar = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        1.0,
      ],
      colors: <Color>[
        Color(0x80333333),
        Color(0x00333333),
      ]);
  static LinearGradient linearColorIntro = const LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: <double>[
        0.0,
        1.0,
      ],
      colors: <Color>[
        Color(0x001B0A0A),
        Color(0x991E1E1E),
      ]);

  static LinearGradient linearColorOnboard = LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
      stops: const <double>[
        0.0,
        0.5,
        1.0,
      ],
      colors: <Color>[
        const Color(0x00000000),
        const Color(0xFF000000).withOpacity(0.12),
        const Color(0xFF000000).withOpacity(0.78),
      ]);
}
