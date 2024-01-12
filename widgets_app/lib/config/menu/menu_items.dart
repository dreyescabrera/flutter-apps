import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String url;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.url,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Buttons',
      subTitle: 'Some buttons in Flutter',
      url: AppRouter.buttons,
      icon: Icons.smart_button),
  MenuItem(
      title: 'Cards',
      subTitle: 'A styled container',
      url: AppRouter.cards,
      icon: Icons.credit_card),
  MenuItem(
      title: 'Cards',
      subTitle: 'A styled container',
      url: AppRouter.cards,
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicator',
      subTitle: 'Controlled and uncontrolled',
      url: AppRouter.progress,
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snack bars and dialogs',
      subTitle: 'Screen indicators',
      url: AppRouter.snackbar,
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated Container',
      subTitle: 'Animated stateful widget',
      url: AppRouter.animatedContainer,
      icon: Icons.check_box_outline_blank),
  MenuItem(
      title: 'UI Controls + Tiles',
      subTitle: 'Flutter controllers',
      url: AppRouter.uiControls,
      icon: Icons.video_camera_back_outlined),
  MenuItem(
      title: 'Tutorial',
      subTitle: 'Small intro tutorial',
      url: AppRouter.tutorial,
      icon: Icons.interests_rounded),
];
