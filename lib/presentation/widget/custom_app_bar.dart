import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    Widget? backButton;
    if ((canPop) || (parentRoute?.impliesAppBarDismissal ?? false)) {
      backButton = const BackButton();
    }
    return SizedBox(
      height: kToolbarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            if (backButton != null) backButton,
            const Expanded(
              child: Center(
                child: Text(
                  "Be Laundry",
                  style: TextStyle(
                    fontSize: 21.43,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  )
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}