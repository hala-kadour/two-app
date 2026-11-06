import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/constants/sizes_config.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/error/validation.dart';
import 'package:two_client_app/core/widgets/buttons/elevated-button/main_green_button.dart';
import 'package:two_client_app/core/widgets/main_text_field.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _isSecurePassword = false;
  ValueNotifier<bool> isHover = ValueNotifier(false);
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: SizesConfig.spaceBtwSections,
        ),
        child: Column(
          children: [
            // Email
            MainTextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              validator: (email) {
                if (email != null && email.isValidEmail()) {
                  return null;
                } else {
                  return TextStrings.emailValidation;
                }
              },
              fillColor: AppColors.fieldfield,
              hint: TextStrings.email,
              hintColor: AppColors.fontLightColor,
              prefixIcon: const Icon(
                Iconsax.sms,
                color: AppColors.fontLightColor,
              ),
            ),
            PaddingConfig.h8,
            // Password
            MainTextField(
              controller: _passwordController,
              validator: (password) {
                if (password != null) {
                  return null;
                } else {
                  return TextStrings.passwordValidation;
                }
              },
              fillColor: AppColors.fieldfield,
              prefixIcon: const Icon(
                Iconsax.lock,
                color: AppColors.fontLightColor,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(11),
                child: togglepassword(),
              ),
              hint: TextStrings.password,
              hintColor: AppColors.fontLightColor,
              counterText: '',
              isPassword: _isSecurePassword,
            ),
            //Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    TextStrings.forgetPassword,
                    style: AppTextStyle.bodySm(color: AppColors.green3),
                  ),
                ),
              ],
            ),
            PaddingConfig.h8,
            const SizedBox(height: SizesConfig.spaceBtwItems),
            MainGreenButton(
              onpressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AppBloc>().add(
                    LoginEvent(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  );
                }
              },
              text: TextStrings.login,
            ),
            const SizedBox(height: SizesConfig.spaceBtwItems),
            // Google Githup Sign
            //const CustomGoogleGitHupColumn(),
          ],
        ),
      ),
    );
  }

  Widget togglepassword() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      child: _isSecurePassword
          ? const Icon(Iconsax.eye, color: AppColors.fontLightColor)
          : const Icon(Iconsax.eye_slash, color: AppColors.fontLightColor),
    );
  }
}
