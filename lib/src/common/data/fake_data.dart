import '../model/person_model.dart';
import '../model/product_model.dart';
import '../model/promotion_model.dart';
import '../model/restourant_model.dart';

class FakeData {
  List<PersonModel> personData = [
    const PersonModel(
      id: 1,
      name: "Sirozhiddin",
      phoneNumber: "950143108",
      ordersHistory: [],
      basket: [],
      promotionalCodes: [],
      locationList: []
    ),
    const PersonModel(
      id: 2,
      name: "Jahongir",
      phoneNumber: "330143108",
      ordersHistory: [],
      basket: [],
      promotionalCodes: [],
      locationList: []
    ),
  ];

  List<RestaurantModel> restaurantData = [
    RestaurantModel(
      id: 1,
      name: "Oqtepa Lavash",
      poster: "asset/images/sushi2.png",
      products: {
        Category.burger: [
          ProductModel(
            id: 1,
            price: 123456,
            title: "Lavash",
            compound: "chees, souse",
            image: "asset/images/lavash.png",
          ),
          ProductModel(
            id: 2,
            price: 123456,
            title: "Burger",
            compound: "chees, souse",
            image: "asset/images/burger2.jpeg",
          ),
        ],
      },
      open: DateTime.now(),
      close: DateTime.now(),
    ),
  ];
  List<PromotionalCodeModel> promotionData = [];
}
