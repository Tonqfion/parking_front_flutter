import 'package:flutter/material.dart';
import 'package:parking/commons/widgets/custom_button.dart';
import 'package:parking/commons/widgets/small_vertical_sized_box.dart';
import 'package:parking/commons/widgets/texts/text_large_bold.dart';
import 'package:parking/features/guest/services/auth_service.dart';
import 'package:parking/features/profile/services/profile_service.dart';
import 'package:provider/provider.dart';

import '../../../models/user.dart';
import '../../../providers/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final User user;
  final AuthService _authService = AuthService();
  final ProfileService _profileService = ProfileService();
  bool _loading = true;
  bool _isConfirmationDeleteVisible = false;
  bool _isEditingUsername = false;
  late String _username;
  late final TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _authService.getUserdata(context);
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _loading = false;
      });
    });
  }

  void changeDeleteConfirmationVisibility() {
    setState(() {
      _isConfirmationDeleteVisible = !_isConfirmationDeleteVisible;
    });
  }

  void changeUsernameEditFormFieldVisibility() {
    setState(() {
      _isEditingUsername = !_isEditingUsername;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    setState(() {
      _username = user.username;
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: _loading
            ? Center(
                child: Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator()))
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/icon.png',
                        height: 80,
                      ),
                      const SmallVerticalSizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextLargeBoldBlack(
                            text: 'Coucou, ',
                          ),
                          TextLargeBoldBlack(text: _username),
                        ],
                      ),
                      const SmallVerticalSizedBox(),
                      CustomButton(
                          text: 'Se déconnecter',
                          onPressed: () {
                            _profileService.logOut(context);
                          }),
                      const SmallVerticalSizedBox(),
                      CustomDeleteButton(
                          text: 'Supprimer votre compte',
                          onPressed: () {
                            changeDeleteConfirmationVisibility();
                          }),
                      const SmallVerticalSizedBox(),
                      _isConfirmationDeleteVisible
                          ? Column(
                              children: [
                                const Text(
                                    'Confirmez vous la suppression du compte ?'),
                                const SmallVerticalSizedBox(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: CustomButton(
                                          text: 'Non',
                                          onPressed: () {
                                            changeDeleteConfirmationVisibility();
                                          }),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: CustomDeleteButton(
                                          text: 'Oui', onPressed: () {}),
                                    ),
                                    const SmallVerticalSizedBox(),
                                  ],
                                ),
                              ],
                            )
                          : const SmallVerticalSizedBox(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
