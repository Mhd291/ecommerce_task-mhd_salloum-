class AppEndpoints {

  static const subUrl = '/';
  static const String baseUrl = "https://fakestoreapi.com";



  /// home
  static const getCategories = '${subUrl}products/categories';
  static const getProducts = '${subUrl}products';


  /// Product
  static const getSingleProduct = '${subUrl}products/';
  static const addProduct = '${subUrl}products';


  ///Carts
  static const getAllCarts = '${subUrl}carts';
  static const getSingleCart = '${subUrl}carts/';
  static const addNewCart = '${subUrl}carts';
}
