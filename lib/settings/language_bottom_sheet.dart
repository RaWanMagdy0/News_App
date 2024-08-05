import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../my_provider.dart';
import '../my_theme.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.english,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: provider.local == "en"
                          ? MyThemeData.primaryLightColor
                          : MyThemeData.blackColor),
                ),
                provider.local == "en"
                    ? Icon(
                        Icons.check,
                        color: MyThemeData.primaryLightColor,
                        size: 30,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: provider.local == "ar"
                            ? MyThemeData.primaryLightColor
                            : MyThemeData.blackColor),
                  ),
                ),
                provider.local == "ar"
                    ? Icon(
                        Icons.check,
                        color: MyThemeData.primaryLightColor,
                        size: 30,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ]));
  }
}
