import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/core/extensions/build_context_ext.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../core/components/button.dart';
import '../../../data/datasources/onboarding_local_datasource.dart';
import '../../auth/pages/login_page.dart';
import '../models/onboarding_model.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/onboarding_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  final pageController = PageController();

  final onboardingData = [
    OnboardingModel(
        image: Assets.images.menanamOnboarding.path,
        text:
            'Mulai petualangan pertanian Anda dengan langkah pertama yang tepat. Aplikasi kami siap membimbing Anda dalam menanam bibit yang berkualitas untuk hasil yang optimal.'),
    OnboardingModel(
        image: Assets.images.merawatOnboarding.path,
        text: 'Kami hadir untuk memastikan setiap tanaman Anda mendapatkan perhatian yang tepat. Dengan aplikasi kami, Anda bisa mengatur jadwal perawatan dan mendapatkan pemberitahuan yang akan membantu Anda tetap terhubung dengan tanaman Anda.'),
    OnboardingModel(
      image: Assets.images.memamenOnboarding.path,
      text: 'Tiba saatnya untuk menuai hasil jerih payah Anda. Dengan aplikasi kami, Anda akan mendapatkan panduan langkah demi langkah untuk memastikan panen yang berkualitas dan pemasaran yang sukses.',
    ),
    OnboardingModel(
      image: Assets.images.onboardingJoinUs.path,
      text: 'Ayo bergabung bersama ribuan petani lainnya yang sudah merasakan perubahan positif dalam hasil pertanian mereka dengan dukungan dari aplikasi kami. Tingkatkan hasil panen dan keuntungan Anda mulai sekarang!',
    ),
  ];
  void navigate() {
    context.pushReplacement(const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Container(
          //   height: 400.0,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage(Assets.images.frameBg.path),
          //       fit: BoxFit.contain,
          //     ),
          //   ),
          // ),
          Column(
            children: [
              OnboardingContent(
                pageController: pageController,
                onPageChanged: (index) {
                  currentPage = index;
                  setState(() {});
                },
                contents: onboardingData,
              ),
              OnboardingIndicator(
                length: onboardingData.length,
                currentPage: currentPage,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Button.filled(
                  onPressed: () {
                    if (currentPage < onboardingData.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(microseconds: 500),
                        curve: Curves.ease,
                      );
                      currentPage++;
                      setState(() {});
                    } else {
                      OnboardingLocalDatasource().saveOnboardingPassed();
                      navigate();
                    }
                  },
                  label: 'Continue',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
