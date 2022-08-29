
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCustomLoading extends StatelessWidget {

  const AppCustomLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: isIOS
              ? const CupertinoActivityIndicator(
                  radius: 20.0,
                )
              : const CircularProgressIndicator(),
        ),
        const SizedBox(height: 20),
        const Text('Loading'),
      ],
    );
  }
}
