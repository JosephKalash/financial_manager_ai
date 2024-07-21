import 'package:ai_financial_manager/core/UI/router/router.gr.dart';
import 'package:ai_financial_manager/index.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/UI/widgets/custom_widgets/custom_input_widgets.dart';
import '../../../../core/UI/widgets/custom_widgets/custom_widgets.dart';
import '../../../../core/UI/widgets/loading_widget.dart';
import '../../../../core/logical/errors/error_model.dart';
import '../../domain/models/auth_params.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/animated_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final AuthParams params = AuthParams();
  late ErrorDictionary errorDictionary;
  bool isRegister = true;
  bool showPassword = true;

  @override
  void initState() {
    errorDictionary = [];
    super.initState();
  }

  Future<void> _submit() async {
    errorDictionary.clear();
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final cubit = context.read<AuthCubit>();
    if (isRegister)
      cubit.register(params);
    else
      cubit.loginUser(params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getFormWidget(),
        ],
      ),
    );
  }

  Widget getFormWidget() {
    return Form(
      key: _formKey,
      child: Wrap(
        runSpacing: 30,
        children: [
          CustomInputField(
            outerLabel: 'email',
            hint: 'email_address',
            isRequired: true,
            isEmail: true,
            errorDictionaryKey: 'email',
            errorDictionary: errorDictionary,
            onSaved: (email) => params.email = email,
          ),
          Column(
            children: [
              CustomInputField(
                // suffixIcon: IconButton(
                //   icon: Icon(!showPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                //   onPressed: () {
                //     showPassword = !showPassword;
                //     setState(() {});
                //   },
                // ),
                outerLabel: 'password',
                hint: 'password',
                isObscureText: showPassword,
                isRequired: true,
                onChanged: (pass) => params.password = pass,
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: AnimatedContainer(
                  duration: 330.duration,
                  height: isRegister ? 0 : 30,
                  child: AnimatedOpacity(
                    duration: 330.duration,
                    opacity: isRegister ? 0 : 1,
                    child: MaterialInk(
                      onTap: () {
                        context.pushRoute(const ForgetPasswordRoute());
                      },
                      child: TextTr(
                        'forget_password',
                        style: infoStyle(color: AppColors.white, size: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedField(
            isRegister: isRegister,
            child: CustomInputField(
              // suffixIcon: IconButton(
              //   icon: Icon(!showConfrimPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
              //   onPressed: () {
              //     showConfrimPassword = !showConfrimPassword;
              //     setState(() {});
              //   },
              // ),
              enabled: isRegister ? true : false,
              outerLabel: 'confirm_password',
              hint: 'password',
              isObscureText: showPassword,
              validator: (val) {
                if (!isRegister) return null;
                if (val != params.password) return 'passwords_arent_match';
                return null;
              },
            ),
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                // gotProfile: (_) => context.router.replaceAll([MainRoute()]),
                authenticated: () {},
                error: (message, dictionary) async {
                  if (dictionary != null) errorDictionary.addAll(dictionary);
                  if (message.isNotEmpty) showToast(message: message);
                  _formKey.currentState!.validate();
                },
                orElse: () {},
              );
            },
            builder: (_, state) {
              return state.maybeWhen(
                orElse: () => CustomButton(
                  onPressed: _submit,
                  label: isRegister ? 'signup' : 'login',
                ),
                loading: () => const LoadingWidget(),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextTr(
                isRegister ? 'already_account' : 'new_masar',
                style: subLabelStyle(),
              ),
              UnderlineTextWidget(
                isRegister ? 'login' : 'signup',
                onTap: () {
                  setState(() {
                    isRegister = !isRegister;
                  });
                },
                size: 16,
                color: Colors.white,
              ).padding(horizontal: 10)
            ],
          ),
        ],
      ),
    ).padding(top: 20);
  }
}
