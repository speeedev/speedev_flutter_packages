import 'package:flutter/material.dart';
import 'package:speedev_ui/src/widgets/button/button.dart';

class SDErrorView extends StatelessWidget {
  final String? title;
  final String? description;
  final VoidCallback? onTryAgain;
  const SDErrorView({super.key, this.title, this.description, this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.error),
        Column(
          children: [
            Text(title ?? 'Error'),
            Text(description ?? 'Error'),
            SDButton(
              onPressed: onTryAgain ?? () {},
              text: 'Try Again',
            ),
          ],
        )
      ],
    );
  }
}
