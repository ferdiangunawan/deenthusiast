import 'package:adaptive_screen_flutter/adaptive_screen_flutter.dart';
import 'package:deenthusiast/config/themes/themes.dart';
import 'package:deenthusiast/data/repository/advice_repository_impl.dart';
import 'package:deenthusiast/presentation/home/cubit/home_cubit.dart';
import 'package:deenthusiast/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/views.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final programKey = GlobalKey();
  final aboutUsKey = GlobalKey();
  final cubit = HomeCubit(AdviceRepositoryImpl());

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    addressController.dispose();
    emailController.dispose();
    scrollController.dispose();
    cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = context.isMobile ? 24.0 : 64.0;

    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            DeenHeaderView(
              scrollController: scrollController,
              programKey: programKey,
              aboutUsKey: aboutUsKey,
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        26,
                        horizontalPadding,
                        12,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: DeenColors.primaryColor,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  'Muslim Da’wah Space.',
                                  style: GoogleFonts.openSans(
                                    color: DeenColors.primaryColor,
                                    fontSize: context.isMobile ? 34 : 49,
                                  ),
                                  maxLines: 3,
                                ),
                              ),
                              const Gap(7),
                              Container(
                                transform: Matrix4.translationValues(0, 6, 0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: DeenColors.primaryColor,
                                ),
                                child: Text(
                                  'Bangka Based',
                                  style: GoogleFonts.questrial(
                                    fontSize: 14.9,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                          Image.asset(
                            'assets/deen_main_cover.png',
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                          const Gap(20),
                          Image.asset(
                            'assets/deen_skema.png',
                            key: aboutUsKey,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                          const Gap(13),
                          AdaptiveScreen(
                            mobile: Column(
                              children: [
                                Text(
                                  'Kami adalah media dakwah Islam digital,',
                                  style: GoogleFonts.openSans(
                                    color: DeenColors.primaryColor,
                                    fontSize: 52,
                                  ),
                                ),
                                const Gap(20),
                                Text(
                                  'yang terbentuk dan bergerak sesuai dengan Al-Qur’an dan As-Sunnah bersama metode beragama dari 3 generasi terbaik Islam.',
                                  style: GoogleFonts.openSans(
                                    color: DeenColors.primaryColor,
                                    fontSize: 17,
                                  ),
                                ),
                                const Gap(20),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 17,
                                    vertical: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: DeenColors.primaryColor,
                                  ),
                                  child: Text(
                                    'Deenthusiast untuk sementara merupakan media independen, yang tidak terhubung dengan komunitas apapun.',
                                    style: GoogleFonts.openSans(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const Gap(20),
                                Image.asset(
                                  'assets/deen_principle.png',
                                  width: double.infinity,
                                  fit: BoxFit.fitWidth,
                                ),
                              ],
                            ),
                            web: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Kami adalah media dakwah Islam digital,',
                                        style: GoogleFonts.openSans(
                                          color: DeenColors.primaryColor,
                                          fontSize: 52,
                                        ),
                                        maxLines: 3,
                                      ),
                                      const Gap(20),
                                      Text(
                                        'yang terbentuk dan bergerak sesuai dengan Al-Qur’an dan As-Sunnah bersama metode beragama dari 3 generasi terbaik Islam.',
                                        style: GoogleFonts.openSans(
                                          color: DeenColors.primaryColor,
                                          fontSize: 17,
                                        ),
                                        maxLines: 3,
                                      ),
                                      const Gap(20),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 17,
                                          vertical: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: DeenColors.primaryColor,
                                        ),
                                        child: Text(
                                          'Deenthusiast untuk sementara merupakan media independen, yang tidak terhubung dengan komunitas apapun.',
                                          style: GoogleFonts.openSans(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                          maxLines: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(20),
                                Expanded(
                                  flex: 3,
                                  child: Image.asset(
                                    'assets/deen_principle.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(18),
                    DeenRegisterView(
                      key: programKey,
                      nameController: nameController,
                      addressController: addressController,
                      emailController: emailController,
                    ),
                    const DeenFindUsView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
