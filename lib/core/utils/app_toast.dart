import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile_editor/core/constants/app_colors.dart';

class AppToast {
  static void show(String message, {ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.cancel(); // Cancel previous toasts
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: AppColors.black87,
      textColor: AppColors.white,
      fontSize: 16.0,
    );
  }
}
