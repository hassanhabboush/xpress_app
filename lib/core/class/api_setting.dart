class ApiSettings {



  static const _BASE_URL = 'https://sallah.hexacit.com/';
  static const _API_RUI = _BASE_URL + 'api/';
  static const LOGIN = _API_RUI + 'login';
  static const SIGNUP = _API_RUI + 'signUp';
  static const PRODUCTS = _API_RUI + 'getProductsByCategoryId/1';
  // static const PRODUCTS = _API_RUI + 'getProductsByCategoryId/${getId}';
  static const OFFERS = _API_RUI + 'getOffers';
  static const MYCART = _API_RUI + 'getMyCart'; // تكملة
  static const CITIES = _API_RUI + 'getCities';
  static const CATEGORIES = _API_RUI + 'getCategories';
  static const EDITPROFILE = _API_RUI + 'editProfile';
  static const CHANGEPASSWORD = _API_RUI + 'changePassword';
  static const CONTACTUS = _API_RUI + 'contactUs';
  static const SEARCH = _API_RUI + 'search';
  static const ADDPRODUCTTOCART = _API_RUI + 'addProductToCart';
  static const CHECKPROMO = _API_RUI + 'checkPromo';
  static const CHECKOUT = _API_RUI + 'checkOut';
}
