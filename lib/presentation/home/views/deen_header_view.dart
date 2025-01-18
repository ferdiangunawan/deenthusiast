import 'package:adaptive_screen_flutter/adaptive_screen_flutter.dart';
import 'package:deenthusiast/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/themes/themes.dart';

class DeenHeaderView extends StatelessWidget {
  const DeenHeaderView({
    super.key,
    required this.scrollController,
    required this.programKey,
    required this.aboutUsKey,
  });

  final ScrollController scrollController;
  final GlobalKey programKey;
  final GlobalKey aboutUsKey;

  List<Widget> get menus => [
        Container(
          width: 40,
          decoration: BoxDecoration(
            color: DeenColors.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'د',
              style: GoogleFonts.questrial(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Gap(7),
        GestureDetector(
          onTap: () {
            if (programKey.currentContext == null) {
              return;
            }

            Scrollable.ensureVisible(
              programKey.currentContext!,
              duration: const Duration(
                milliseconds: 500,
              ),
            );
          },
          behavior: HitTestBehavior.translucent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: DeenColors.primaryColor,
                width: 2,
              ),
            ),
            child: Text(
              'Program',
              style: GoogleFonts.questrial(
                fontSize: 14.9,
                color: DeenColors.primaryColor,
              ),
            ),
          ),
        ),
        const Gap(7),
        GestureDetector(
          onTap: () {
            if (aboutUsKey.currentContext == null) {
              return;
            }

            Scrollable.ensureVisible(
              aboutUsKey.currentContext!,
              duration: const Duration(
                milliseconds: 500,
              ),
            );
          },
          behavior: HitTestBehavior.translucent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: DeenColors.primaryColor,
                width: 2,
              ),
            ),
            child: Text(
              'About Us',
              style: GoogleFonts.questrial(
                fontSize: 14.9,
                color: DeenColors.primaryColor,
              ),
            ),
          ),
        ),
        const Gap(7),
        GestureDetector(
          onTap: () {
            scrollController.animateTo(0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          },
          behavior: HitTestBehavior.translucent,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: DeenColors.primaryColor,
                width: 2,
              ),
            ),
            child: Image.asset(
              'assets/deen_arrow_right.png',
              width: 30,
              height: 25,
              color: DeenColors.primaryColor,
            ),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = context.isMobile ? 24.0 : 64.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: AdaptiveScreen(
        mobile: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/deenthusiast.png',
              width: 300,
            ),
            Row(children: menus),
            const Gap(12),
          ],
        ),
        tablet: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/deenthusiast.png',
              width: 300,
            ),
            Row(children: menus),
            const Gap(12),
          ],
        ),
        web: Row(
          children: [
            Image.asset(
              'assets/deenthusiast.png',
              width: 300,
            ),
            const Spacer(),
            ...menus,
          ],
        ),
      ),
    );
  }
}
