import 'package:ecommerce_app/core/helpers/dialogue_utils.dart';
import 'package:ecommerce_app/core/local_ds/prefs_helper.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/routes_manager/routes.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/widgets/main_text_field.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  ProfileTabState createState() => ProfileTabState();
}

class ProfileTabState extends State<ProfileTab> {
  bool isFullNameReadOnly = true;
  bool isEmailReadOnly = true;
  bool isPasswordReadOnly = true;
  bool isMobileNumberReadOnly = true;
  bool isAddressReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                SvgAssets.routeLogo,
                height: AppSize.s40,
                colorFilter: ColorFilter.mode(
                  ColorManager.primary,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: AppSize.s20.h),
              Text(
                'Welcome, Mohamed',
                style: getSemiBoldStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
              ),
              Text(
                'ahmedfayed@gmail.com',
                style: getRegularStyle(
                  color: ColorManager.primary.withOpacity(.5),
                  fontSize: FontSize.s14,
                ),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: isFullNameReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your full name',
                label: 'Full Name',
                controller: TextEditingController(text: 'Ahmed fayed elmorsey'),
                labelTextStyle: getMediumStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () {
                    setState(() {
                      isFullNameReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.text,
                validation: AppValidators.validateFullName,
                hintTextStyle: getRegularStyle(
                  color: ColorManager.primary,
                ).copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: isEmailReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your email address',
                label: 'E-mail address',
                controller: TextEditingController(text: 'ahmedfayed@gmail.com'),
                labelTextStyle: getMediumStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () {
                    setState(() {
                      isEmailReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.emailAddress,
                validation: AppValidators.validateEmail,
                hintTextStyle: getRegularStyle(
                  color: ColorManager.primary,
                ).copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                onTap: () {
                  setState(() {
                    isPasswordReadOnly = false;
                  });
                },
                controller: TextEditingController(text: '123456789123456'),
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: isPasswordReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your password',
                label: 'Password',
                isObscured: true,
                labelTextStyle: getMediumStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
                suffixIcon: SvgPicture.asset(SvgAssets.edit),
                textInputType: TextInputType.text,
                validation: AppValidators.validatePassword,
                hintTextStyle: getRegularStyle(
                  color: ColorManager.primary,
                ).copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                controller: TextEditingController(text: '01096640218'),
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: isMobileNumberReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your mobile no.',
                label: 'Your mobile number',
                labelTextStyle: getMediumStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () {
                    setState(() {
                      isMobileNumberReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.phone,
                validation: AppValidators.validatePhoneNumber,
                hintTextStyle: getRegularStyle(
                  color: ColorManager.primary,
                ).copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                controller: TextEditingController(
                  text: '6th October, street 11.....',
                ),
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: isAddressReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Alexandria , Fleming',
                label: 'Your Address',
                labelTextStyle: getMediumStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () {
                    setState(() {
                      isAddressReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.streetAddress,
                validation: AppValidators.validateFullName,
                hintTextStyle: getRegularStyle(
                  color: ColorManager.primary,
                ).copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s50.h),
              CustomElevatedButton(label: "Logout", onTap: () {
                //todo: remove token
                PrefHelper.removeData(key: AppConstants.token);
                //todo: navigate to login screen
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.signInRoute, (route) => false);
              })
            ],
          ),
        ),
      ),
    );
  }
}
