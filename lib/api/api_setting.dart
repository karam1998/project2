class ApiSettings {
  static const baseUrlStorage = "https://smart-store.mr-dev.tech/storage/";
  static const categories = "categories/";
  static const products = "products/";
  static const subCategories = "sub_categories/";
  static const baseUrlApi = "https://smart-store.mr-dev.tech/api/";
  static const apiKeyStore = "46c65437-1cd9-42cb-9fd5-166e1506eeb8";
  static const indexCities = baseUrlApi + "cities";
  static const registerUser = baseUrlApi + "auth/register";
  static const activeAccountUser = baseUrlApi + "auth/activate";
  static const loginUser = baseUrlApi + "auth/login";
  static const forgetPassword = baseUrlApi + "auth/forget-password";
  static const resetPassword = baseUrlApi + "auth/reset-password";
  static const logoutUser = baseUrlApi + "auth/logout";
  static const categorisesIndex = baseUrlApi + "categories";
  static const home = baseUrlApi + "home";
  static const productIndex = baseUrlApi + "sub-categories/";
  static const productDetails = baseUrlApi + "products/";
  static const productsRate = baseUrlApi + "products/rate";
  static const productsFavorite = baseUrlApi + "favorite-products";
  // static const addresses = baseUrlApi + "addresses";
  static const changePassword = baseUrlApi + "auth/change-password";
  static const updateProfile = baseUrlApi + "auth/update-profile";
  static const refreshToken = baseUrlApi + "auth/refresh-fcm-token";
}
