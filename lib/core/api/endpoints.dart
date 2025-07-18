class EndPoints {
  static const String register = "/api/v1/auth/signup";
  static const String login = "/api/v1/auth/signin";
  static const String getAllCategories = "/api/v1/categories";
  static const String getAllBrands = "/api/v1/brands";
  static const String getAllProducts = "/api/v1/products";
  static const String addToCart = "/api/v1/cart";

  static String getAllSubCategoriesByCategoryId(String id) =>
      "/api/v1/categories/$id/subcategories";
}
