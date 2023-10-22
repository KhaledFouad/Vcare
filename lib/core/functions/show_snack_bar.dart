import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showSuccessSnackBar({
  required BuildContext context,
  required String message,
}) {
  showTopSnackBar(
    displayDuration: const Duration(seconds: 2),
    Overlay.of(context),
    CustomSnackBar.success(
      message: message,
    ),
  );
}

void showErrorSnackBar({
  required BuildContext context,
  required String message,
}) {
  showTopSnackBar(
    displayDuration: const Duration(seconds: 2),
    Overlay.of(context),
    CustomSnackBar.error(
      message: message,
    ),
  );
}
