import 'package:deenthusiast/config/themes/themes.dart';
import 'package:deenthusiast/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DeenFindUsView extends StatelessWidget {
  const DeenFindUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = context.isMobile ? 24.0 : 64.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        children: [
          const Gap(24),
          Container(
            width: 180,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: DeenColors.primaryColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/deen_sosmed.png', width: 30),
                const Gap(12),
                Text(
                  'deenthusiast.id',
                  style: GoogleFonts.openSans(
                    color: DeenColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'FIND US',
            style: GoogleFonts.openSans(
              color: DeenColors.primaryColor,
              fontSize: context.isWeb ? 200 : 70,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  transform: Matrix4.translationValues(0, 30, 0),
                  child: Image.asset(
                    'assets/deen_left_hand.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const Gap(24),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  transform: Matrix4.translationValues(0, 150, 0),
                  child: Image.asset(
                    'assets/deen_right_hand.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
