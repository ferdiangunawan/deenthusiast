import 'package:deenthusiast/config/themes/themes.dart';
import 'package:deenthusiast/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../cubit/home_cubit.dart';

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
    final cubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: context.isMobile ? 24 : tabletPadding),
          color: DeenColors.primaryColor,
          child: Column(
            children: [
              Gap(context.isMobile ? 24 : 34),
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/deen_advice.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const Gap(24),
                  Expanded(
                    child: Image.asset(
                      'assets/deen_hijrah.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
              DeenTextField(
                label: 'Nama',
                nameController: nameController,
                onChanged: cubit.onNameUpdate,
              ),
              Gap(context.isMobile ? 8 : 12),
              DeenTextField(
                label: 'Asal',
                nameController: addressController,
                onChanged: cubit.onAddressUpdate,
              ),
              Gap(context.isMobile ? 8 : 12),
              DeenTextField(
                label: 'Email',
                nameController: emailController,
                onChanged: cubit.onEmailUpdate,
              ),
              Gap(context.isMobile ? 8 : 12),
              // CheckboxListTile(
              //     value: state.param.isMale,
              //     onChanged: (gender) {
              //       if (gender != null) {
              //         cubit.onGenderUpdate(gender);
              //       }
              //     }),
              // CheckboxListTile(
              //     value: !state.param.isMale,
              //     onChanged: (gender) {
              //       if (gender != null) {
              //         cubit.onGenderUpdate(gender);
              //       }
              //     }),
              const Gap(24),
              InkWell(
                splashColor: DeenColors.primaryColor,
                onTap: () async {
                  await cubit.registerAdviceUser();
                  final url = Uri.parse(
                    'https://chat.whatsapp.com/EauedZa7VVOHDFWLi2Cezt',
                  );

                  launchUrl(url);
                },
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
      },
    );
  }
}

class DeenTextField extends StatelessWidget {
  const DeenTextField({
    super.key,
    required this.nameController,
    required this.label,
    required this.onChanged,
  });

  final TextEditingController nameController;
  final String label;
  final ValueChanged<String> onChanged;

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
          onChanged: onChanged,
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
