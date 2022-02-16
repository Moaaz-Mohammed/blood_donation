import 'package:blood_donation/Screens/settings/profile/edit_profile_screen.dart';
import 'package:blood_donation/Screens/settings/profile/profile_card_item.dart';
import 'package:blood_donation/UsableWidgets/custom_sized_box_height.dart';
import 'package:blood_donation/shared/Functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../Styles/CustomColors.dart';
import '../../../Styles/Strings.dart';
import '../../../UsableWidgets/loading.dart';
import '../../../shared/Constants.dart';
import '../../../translations/locale_keys.g.dart';

class ProfileBodyWidget extends StatelessWidget {
  const ProfileBodyWidget({
    Key? key,
    required this.userData,
  });

  final userData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return userData != null
        ? SafeArea(
            child: Container(
              padding: Constants.primaryPadding,
              child: Column(
                children: [
                  SizedBox(
                    width: width * 0.25,
                    height: width * 0.25,
                    child: Stack(
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: CustomColors.primaryWhiteColor,
                            radius: double.infinity,
                            child: Icon(
                              Icons.account_circle,
                              size: 100,
                              color: CustomColors.primaryRedColor,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              Functions.navigatorPush(
                                context: context,
                                screen: EditProfileScreen(userData: userData),
                              );
                            },
                            child: const Icon(
                              Icons.edit,
                              color: CustomColors.primaryRedColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomSizedBoxHeight(),
                  CustomSizedBoxHeight(),
                  CustomSizedBoxHeight(),
                  ProfileCardItem(
                    title: LocaleKeys.name.tr(),
                    subTitle: userData[Strings.userName],
                  ),
                  const Divider(
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                  ProfileCardItem(
                    title: LocaleKeys.date_of_birth.tr(),
                    subTitle: userData[Strings.userDateofBirth],
                  ),
                  const Divider(
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                  ProfileCardItem(
                    title: LocaleKeys.address.tr(),
                    subTitle: userData[Strings.userAddress],
                  ),
                  const Divider(
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                  ProfileCardItem(
                    title: LocaleKeys.phone.tr(),
                    subTitle: userData[Strings.userPhone],
                  ),
                  const Divider(
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                  ProfileCardItem(
                    title: LocaleKeys.email.tr(),
                    subTitle: userData[Strings.userEmail],
                  ),
                  const Divider(
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                  ProfileCardItem(
                    title: LocaleKeys.blood_type.tr(),
                    subTitle: userData[Strings.userBloodType],
                  ),
                ],
              ),
            ),
          )
        : const Loading();
  }
}
