// ignore_for_file: constant_identifier_names

//! server
const _IP = '';

const domain = _IP;

const _apiUrl = '$domain/api/v1';

//! Auth
const loginUrl = '$_apiUrl/accounts/auth/basic/login';
const logoutUrl = '$_apiUrl/accounts/auth/basic/logout';
const registerUrl = '$_apiUrl/accounts/auth/basic/register';
const deleteAccountUrl = '$_apiUrl/accounts/auth/basic/delete-user-account';
const refreshTokenUrl = '$_apiUrl/accounts/session-reactivate/';
const profileUrl = '$_apiUrl/accounts/profile/user-profile';
const resetPasswordUrl = '$_apiUrl/email-sender/send-reset-password-email';