import 'package:deenthusiast/config/themes/themes.dart';
import 'package:deenthusiast/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DeenRegisterView extends StatelessWidget {
  const DeenRegisterView(
      {super.key,
      required this.nameController,
      required this.addressController,
      required this.emailController});

  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final tabletPadding = context.isTablet ? 120.0 : 240.0;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.isMobile ? 24 : tabletPadding),
      color: DeenColors.primaryColor,
      child: Column(
        children: [
          Gap(context.isMobile ? 24 : 34),
          Text(
            'add-vice',
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Image.asset(
          //         'assets/deen_advice.png',
          //         fit: BoxFit.fitWidth,
          //       ),
          //     ),
          //     const Gap(24),
          //     Expanded(
          //       child: Image.asset(
          //         'assets/deen_hijrah.png',
          //         fit: BoxFit.fitWidth,
          //       ),
          //     ),
          //   ],
          // ),
          DeenTextField(label: 'Name', nameController: nameController),
          Gap(context.isMobile ? 8 : 12),
          DeenTextField(label: 'Asal', nameController: addressController),
          Gap(context.isMobile ? 8 : 12),
          DeenTextField(label: 'Email', nameController: emailController),
          const Gap(24),
          InkWell(
            splashColor: DeenColors.primaryColor,
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12,
                ),
                color: Colors.white,
              ),
              child: Text(
                'JOIN',
                style: GoogleFonts.openSans(
                  color: DeenColors.primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const Gap(24),
        ],
      ),
    );
  }
}

class DeenTextField extends StatelessWidget {
  const DeenTextField({
    super.key,
    required this.nameController,
    required this.label,
  });

  final TextEditingController nameController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: context.isMobile ? 12 : 20,
          ),
        ),
        const Gap(8),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
