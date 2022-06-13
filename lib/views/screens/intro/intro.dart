import 'package:flutter/material.dart';
import 'package:flutter_sliding_tutorial/flutter_sliding_tutorial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ringrin_1440task/views/main_view_model.dart';
import 'package:ringrin_1440task/views/screens/task_list/task_list_screen.dart';

import '../../constants/constant_color.dart';
import '../../constants/constant_text.dart';
import '../../constants/style.dart';
import 'organisms/intro_button.dart';


class IntroScreen extends HookConsumerWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<double> notifier = ValueNotifier(0);
    const int pageCount = 4;
    return Scaffold(
      backgroundColor: ConstantColor.introBackGroundColor,
      body: SlidingTutorial(
        pageCount: pageCount,
        notifier: notifier,
        ref: ref
      ),
    );
  }
}

class SlidingTutorial extends StatefulWidget {
  const SlidingTutorial({required this.notifier, required this.pageCount, required this.ref});

  final ValueNotifier<double> notifier;
  final int pageCount;
  final WidgetRef ref;

  @override
  _SlidingTutorialState createState() => _SlidingTutorialState();
}

class _SlidingTutorialState extends State<SlidingTutorial> {
  final _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _pageController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: PageView(
        controller: _pageController,
        children: List.generate(
            widget.pageCount, (index) => _getPageByIndex(index, _pageController, widget.ref)),
      ),
    );
  }

  void _onScroll() {
    widget.notifier.value = _pageController.page!;
  }

  Widget _getPageByIndex(int index, PageController pageController, WidgetRef ref) {

    String introTitle = ConstantText.introTitle1;
    String introContent = ConstantText.introContent1;

    switch (index) {
      case 0:
        introTitle = ConstantText.introTitle1;
        introContent = ConstantText.introContent1;
        break;
      case 1:
        introTitle = ConstantText.introTitle2;
        introContent = ConstantText.introContent2;
        break;
      case 2:
        introTitle = ConstantText.introTitle3;
        introContent = ConstantText.introContent3;
        break;
      case 3:
        introTitle = ConstantText.introTitle4;
        introContent = ConstantText.introContent4;
        break;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IntroPage(introTitle: introTitle, introContent: introContent, index: index, pageController: _pageController, notifier: widget.notifier, pageCount: widget.pageCount,),
        IntroButton(index: index, buttonName: index != 3 ? "次へ": "はじめる", onTap: () => _goToNextPage(pageController, context, index, ref), skip: () => _skip(pageController),),
      ],
    );

  }


  _goToNextPage(PageController pageController, BuildContext context, int index, WidgetRef ref) async{
    if (index == 3) {
      final viewModel = ref.watch(mainViewModelProvider);
      await viewModel.skipIntro();
      _openHomeScreen(context);
    } else {
      pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,);
    }
  }

  _skip(PageController pageController) {
    pageController.jumpToPage(3);
  }

  void _openHomeScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const TaskListScreen();
    }));
  }
}

class IntroPage extends StatelessWidget {
  const IntroPage({required this.introTitle, required this.introContent, required this.index, required this.pageController, required this.notifier, required this.pageCount});
  final String introTitle;
  final String introContent;
  final int index;
  final PageController pageController;
  final ValueNotifier<double> notifier;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final imageName = "assets/images/intro${index + 1}.png";
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.10,
                ),
                SizedBox(
                  height: 220,
                  width: 220,
                  child: Image.asset(imageName, alignment: Alignment.center,
                    fit: BoxFit.contain,),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                    height: size.height * 0.06,
                    child: Text(introTitle, textAlign: TextAlign.center ,style: introTitleTextStyle,)),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                    height: size.height * 0.1,
                    child: Text(introContent, textAlign: TextAlign.center,style: introContentTextStyle,)),
                index == 0 ? SizedBox(
                    height: size.height * 0.04,
                    child: Text("このアプリがサポートします", style: TextStyle(fontSize: 16.0),)) :SizedBox(height:size.height * 0.04 ,),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  child: SlidingIndicator(
                    indicatorCount: pageCount,
                    notifier: notifier,
                    activeIndicator: FaIcon(FontAwesomeIcons.solidCircle, color: ConstantColor.baseColor,),
                    inActiveIndicator: FaIcon(FontAwesomeIcons.solidCircle, color: ConstantColor.grey01,),
                    margin: 8,
                    inactiveIndicatorSize: 10,
                    activeIndicatorSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

