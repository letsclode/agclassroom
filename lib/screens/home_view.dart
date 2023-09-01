import 'package:flutter/material.dart';

import '../models/homeViewModel.dart';
import '../providers/orientation_layout.dart';
import '../providers/screen_type_layout.dart';
import '../widgets/base_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) => model.initialise(),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => NavigationBarMobilePortrait(),
          landscape: (context) => NavigationBarMobileLandscape(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => NavigationBarTabletPortrait(),
          landscape: (context) => NavigationBarTabletLandscape(),
        ),
        desktop: OrientationLayout(
          portrait: (context) => NavigationBarDesktopPortrait(),
          landscape: (context) => NavigationBarDesktopLandscape(),
        ),
      ),
    );
  }
}
