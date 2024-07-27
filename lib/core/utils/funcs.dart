import 'package:ai_financial_manager/core/logical/constaints.dart';
import 'package:ai_financial_manager/core/logical/errors/error_model.dart';
import 'package:ai_financial_manager/core/logical/errors/failures.dart';
import 'package:ai_financial_manager/core/logical/urls.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart';

import 'lang.dart';

String getErrorMessage(Failure error) {
  if (error is ServerFailure) {
    return kSomthingWentWrong;
  } else if (error is InternetFailure) {
    return kInternetNotAvailable;
  } else if (error is HttpFailure) {
    if (error.errorModel?.message != null) return error.errorModel!.message;
    return error.message;
  } else {
    return kSomthingWentWrong;
  }
}

(String, ErrorDictionary?) getErrorMessageAndDic(Failure error) {
  if (error is ServerFailure) {
    return (kSomthingWentWrong, null);
  } else if (error is InternetFailure) {
    return (kInternetNotAvailable, null);
  } else if (error is HttpFailure) {
    if (error.errorModel != null) {
      return (error.errorModel!.message, error.errorModel!.messageDic);
    }
    return (error.message, null);
  } else {
    return ('Unknown error occurred... try again later', null);
  }
}

void plog(dynamic value) => kDebugMode ? Logger().d(value) : null;
void eplog(dynamic value) => kDebugMode ? Logger().e(value) : null;
void wplog(dynamic value) => kDebugMode ? Logger().w(value) : null;

String getNameTr(String? nameEn, String? nameAr) => (AppLanguage.isLTR ? nameEn ?? nameAr : nameAr ?? nameEn) ?? '';

showToast({context, required String message, List<String>? args}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(msg: message.tr(args: args));
}

showErrorToast({context, required String? message, List<String>? args}) {
  if (message == null || message.isEmpty) return;
  Fluttertoast.cancel();
  Fluttertoast.showToast(msg: message.tr(args: args));
}

void onPaginate(ScrollController scrollController, VoidCallback call) {
  scrollController.addListener(() {
    // final maxPixel = _scrollController.position.maxScrollExtent;
    // final curr = _scrollController.position.pixels;
    // if ((maxPixel - curr).floor() == 0) cubit.getAttendances();
    if (scrollController.position.extentAfter < 100) call();
  });
}




///check if there is internet connection berfore execut the function

String? getImageUrl(String? url) {
  if (url == null) return null;
  if (url.startsWith('http')) return url;
  return domain + url;
}

void copyToClipboard(String textToCopy) {
  Clipboard.setData(ClipboardData(text: textToCopy));
  showToast(message: 'copied_to_clipboard');
}