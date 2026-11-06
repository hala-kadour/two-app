import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_client_app/core/widgets/nav-bar/custom_bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.shell});
  final StatefulNavigationShell shell;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.shell,
      bottomNavigationBar: CustomBottomNavBar(
        pageIndex: widget.shell.currentIndex,
        onTap: (newPageIndex) {
          widget.shell.goBranch(newPageIndex);
        },
      ),
    );
  }
}
