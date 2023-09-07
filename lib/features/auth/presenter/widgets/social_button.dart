import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {
  final String title;
  final String iconSource;
  const SocialButton(
      {required this.iconSource, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width > 420 ? 134 : 46,
      height: 46,
      child: Flexible(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 17,
            ),
            fixedSize: MediaQuery.of(context).size.width > 420
                ? const Size(134, 46)
                : const Size(64, 64),
            maximumSize: MediaQuery.of(context).size.width > 420
                ? const Size(140, 46)
                : const Size(64, 64),
            padding: MediaQuery.of(context).size.width > 420
                ? const EdgeInsets.all(8.0)
                : const EdgeInsets.all(0.0),
            minimumSize: null,
            foregroundColor: Colors.black,
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? const Color.fromARGB(255, 232, 232, 235)
                : Colors.white,
          ),
          onPressed: () async {
            var apiBaseUrl = 'https://truedev.com:5501';
            var oauth2RedirectUri =
                'com.example.clean_architecture_flutter/oauth2/redirect';
            var googleAuthUrl =
                '$apiBaseUrl/oauth2/authorize/google?redirect_uri=$oauth2RedirectUri';
            final Uri url = Uri.parse(googleAuthUrl);
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
          },
          child: MediaQuery.of(context).size.width > 420
              ? Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      iconSource,
                      width: 32,
                      height: 32,
                    ),
                    Expanded(
                      child: Center(child: Text(title)),
                    ),
                  ],
                )
              : SvgPicture.asset(
                  iconSource,
                  width: 36,
                  height: 36,
                ),
        ),
      ),
    );
  }
}
