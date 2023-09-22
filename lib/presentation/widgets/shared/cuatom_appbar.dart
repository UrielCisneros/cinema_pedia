import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;

    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.movie_outlined, color: themeColor.primary),
                const SizedBox(
                  width: 5,
                ),
                const Text("Cinepedia"),
                const Spacer(),
                const IconButton(onPressed: null, icon: Icon(Icons.search))
              ],
            ),
          ),
        ));
  }
}
