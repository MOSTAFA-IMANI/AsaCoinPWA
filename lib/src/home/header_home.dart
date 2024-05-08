import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../urls.dart';
import '../webview/web_view.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              alignment:Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "assets/images/logo_type.png",
                  height: 25,
                ),
              ),
            ),
            Text(
              "آساکوین الکترونیک",
              textDirection: TextDirection.rtl,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            Text(
              "به کامل ترین صرافی ارز دیجیتال خوش آمدید 👋",
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Lottie.asset(
              "assets/anim/anim.json",
              height: 200,
              width: 300,
            ),
            TextButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebViewApp(
                      url: AppUrls.signUp,
                    ),
                  ),
                )
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "در کمتر از ۵ دقیقه ثبت نام کنید",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "قبلا ثبت نام کرده اید؟",
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1),
                    child: TextButton(
                      child: Text(
                        "ورود",
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebViewApp(
                              url: AppUrls.login,
                            ),
                          ),
                        )
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
