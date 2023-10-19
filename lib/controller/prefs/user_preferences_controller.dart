import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpress_app/data/model/user.dart';

enum PrefKeys {
  loggedIn,
  id,
  name,
  email,
  mobile,
  imageProfile,
  rememberToken,
  active,
  token,
  onBoard,
  status,
  type,
  accessToken,
}

class UserPreferencesController {
  // هذا بناء singleton
  static final UserPreferencesController _instance =
      UserPreferencesController._internal();

  late SharedPreferences _sharedPreferences;

  factory UserPreferencesController() {
    return _instance;
  }

  UserPreferencesController._internal();

  Future<void> intSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //*************************
  // هذه الدالة تقوم بحفظ بيانات المستخدم و بدنا نعرف هل المستخدم مسجل الدخول ام لا لانه اذا كان مسجل دخول يذهب مباشرتا الى ال home

  Future<void> saveUser({required User user}) async {
    _sharedPreferences.setBool('logged_in', true);
    _sharedPreferences.setInt('id', user.id);
    _sharedPreferences.setString('name', user.name);
    _sharedPreferences.setString('email', user.email);
    _sharedPreferences.setString('mobile', user.mobile);
    _sharedPreferences.setString('imageProfile', user.imageProfile);
    // _sharedPreferences.setString('rememberToken', user.rememberToken);
    _sharedPreferences.setString('type', user.type);
    _sharedPreferences.setString('access_token', "Bearer ${user.accessToken}");
    _sharedPreferences.setString('status', user.status); //isActive
    // _sharedPreferences.setBool('isActive', user.isActive);
  }


  Future<void> saveUserEdit({required User user}) async {
    _sharedPreferences.setInt('id', user.id);
    _sharedPreferences.setString('name', user.name);
    _sharedPreferences.setString('email', user.email);
    _sharedPreferences.setString('mobile', user.mobile);
    _sharedPreferences.setString('type', user.type);
    _sharedPreferences.setString('access_token', "Bearer ${user.accessToken}");
    _sharedPreferences.setString('status', user.status); //isActive
  }

  T? getValueFor<T>(PrefKeys key) {
    if (_sharedPreferences.containsKey(key.name)) {
      dynamic value = _sharedPreferences.get(key.name);
      if (value is T) {
        return value;
      }
    }
    return null;
  }

  bool get loggedIn =>
      _sharedPreferences.getBool('logged_in') ??
      false; // هذا برجع  null اذا رجع null نقول له خود رجع false (طبعا راح يرجع  false اذا كانت ال (logged_in)key لم تخزن بأول عملية قراءة ممكن تكون )

  String get accessToken =>
      _sharedPreferences.getString('access_token') ??
      ''; // طبعا ما راح ارجع فارغ الا ان اكون عامل  login و بالتالي ما راح يعمل مشكلة

  String get email =>
      _sharedPreferences.getString('email') ??
          '';

  String get phone =>
      _sharedPreferences.getString('mobile') ??
          '';

  String get name =>
      _sharedPreferences.getString('name') ??
          '';

  Future<bool> logOut() async {
    return await _sharedPreferences.clear(); //يقوم بحذف جميع البيانات
  }
}
