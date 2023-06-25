import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_app/model/repository/auth_repo.dart';
import 'package:mvvm_app/model/user_model.dart';
import 'package:mvvm_app/routes/routes_names.dart';
import 'package:mvvm_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../view/widgets/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _authRepo.loginApi(data).then((value) {
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(UserModel(
        token: value['token'].toString(),
      ));
      Utils.toastMessage('Login Successfully');
      // Utils.flushBarErrorMessage("message", context);
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

  Future<void> signUpapi(dynamic data, BuildContext context) async {
    _authRepo.registre(data).then((value) {
      Utils.toastMessage('Signed up Successfully');
      Navigator.pushNamed(context, RoutesName.login);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    });
    ;
  }
}
