import 'package:uzum_tezkor/src/common/model/basket_model.dart';
import 'package:uzum_tezkor/src/common/model/client_model.dart';
import 'package:uzum_tezkor/src/common/model/location/place_location.dart';

import '../model/product_model.dart';
import '../model/promotion_model.dart';
import '../model/restourant_model.dart';

class FakeData {
  static List<ProductModel> burges = [
    ProductModel(
      id: 1,
      price: 12000,
      title: "Burger",
      compound: "Салат, Хлеб, Приправы",
      image: "asset/images/burger.jpeg",
    ),
    ProductModel(
      id: 2,
      price: 12000,
      title: "Burger",
      compound: "Салат, Хлеб, Приправы, Сыр, Помидор",
      image: "asset/images/burger2.jpeg",
    ),
    ProductModel(
      id: 3,
      price: 16000,
      title: "Burger",
      compound: "Салат, Хлеб, Сыр, Горчица, Огурец, Помидор",
      image: "asset/images/burger3.jpeg",
    ),
    ProductModel(
      id: 4,
      price: 16000,
      title: "Burger",
      compound: "Салат, Хлеб, Сыр, Горчица, Огурец, Помидор",
      image: "asset/images/burger4.jpeg",
    ),
    ProductModel(
      id: 5,
      price: 16000,
      title: "Burger",
      compound: "Салат, Хлеб, Сыр, Горчица, Огурец, Помидор",
      image: "asset/images/burger5.png",
    ),
    ProductModel(
      id: 6,
      price: 16000,
      title: "Burger",
      compound: "Салат, Хлеб, Сыр, Горчица, Огурец, Помидор",
      image: "asset/images/burger6.png",
    ),
    ProductModel(
      id: 7,
      price: 16000,
      title: "Burger",
      compound: "Салат, Хлеб, Сыр, Горчица, Огурец, Помидор",
      image: "asset/images/burger7.png",
    ),
  ];
  static List<ProductModel> chikens = [
    ProductModel(
      id: 1,
      price: 32045,
      title: "Chiken",
      compound: "Нежная курица, соус",
      image: "asset/images/chiken1.jpeg",
    ),
    ProductModel(
      id: 2,
      price: 32045,
      title: "Chiken",
      compound: "Нежная курица, соус",
      image: "asset/images/chiken2.jpeg",
    ),
    ProductModel(
      id: 3,
      price: 32045,
      title: "Chiken",
      compound: "Нежная курица, соус",
      image: "asset/images/chiken3.jpeg",
    ),
    ProductModel(
      id: 4,
      price: 32045,
      title: "Chiken",
      compound: "Нежная курица, соус",
      image: "asset/images/chiken4.jpeg",
    ),
    ProductModel(
      id: 5,
      price: 32045,
      title: "Chiken",
      compound: "Нежная курица, соус",
      image: "asset/images/chiken5.png",
    ),
    ProductModel(
      id: 6,
      price: 32045,
      title: "Chiken",
      compound: "Нежная курица, соус",
      image: "asset/images/chiken6.png",
    ),
    ProductModel(
      id: 7,
      price: 32045,
      title: "Chiken",
      compound: "Нежная курица, соус",
      image: "asset/images/chiken7.png",
    ),
    ProductModel(
      id: 8,
      price: 32045,
      title: "Chiken",
      compound: "Нежная курица, соус",
      image: "asset/images/chiken8.png",
    ),
  ];

  static List<ProductModel> coffee = [
    ProductModel(
      id: 1,
      price: 2000,
      title: "Latte",
      compound: "Latte",
      image: "asset/images/coffee1.jpeg",
    ),
    ProductModel(
      id: 2,
      price: 2000,
      title: "Latte",
      compound: "Latte",
      image: "asset/images/coffee2.jpeg",
    ),
    ProductModel(
      id: 3,
      price: 2000,
      title: "Latte",
      compound: "Latte",
      image: "asset/images/coffee3.jpeg",
    ),
    ProductModel(
      id: 4,
      price: 2000,
      title: "Latte",
      compound: "Latte",
      image: "asset/images/coffee4.jpeg",
    ),
    ProductModel(
      id: 5,
      price: 2000,
      title: "Latte",
      compound: "Latte",
      image: "asset/images/coffee5.jpeg",
    ),
    ProductModel(
      id: 6,
      price: 2000,
      title: "Latte",
      compound: "Latte",
      image: "asset/images/coffee6.jpeg",
    ),
    ProductModel(
      id: 7,
      price: 2000,
      title: "Latte",
      compound: "Latte",
      image: "asset/images/coffee7.jpeg",
    ),
    ProductModel(
      id: 8,
      price: 2000,
      title: "Latte",
      compound: "Latte",
      image: "asset/images/coffee8.jpeg",
    ),
  ];
  static List<ProductModel> desert = [
    ProductModel(
      id: 1,
      price: 2000,
      title: "Desert",
      compound: "Desert",
      image: "asset/images/desert1.jpeg",
    ),
    ProductModel(
      id: 2,
      price: 2000,
      title: "Desert",
      compound: "Desert",
      image: "asset/images/desert2.jpeg",
    ),
    ProductModel(
      id: 3,
      price: 2000,
      title: "Desert",
      compound: "Desert",
      image: "asset/images/desert3.jpeg",
    ),
    ProductModel(
      id: 4,
      price: 2000,
      title: "Desert",
      compound: "Desert",
      image: "asset/images/desert4.jpeg",
    ),
    ProductModel(
      id: 5,
      price: 2000,
      title: "Desert",
      compound: "Desert",
      image: "asset/images/desert5.jpeg",
    ),
    ProductModel(
      id: 6,
      price: 2000,
      title: "Desert",
      compound: "Desert",
      image: "asset/images/desert6.jpeg",
    ),
    ProductModel(
      id: 7,
      price: 2000,
      title: "Desert",
      compound: "Desert",
      image: "asset/images/desert7.jpeg",
    ),
    ProductModel(
      id: 8,
      price: 2000,
      title: "Desert",
      compound: "Desert",
      image: "asset/images/desert8.jpeg",
    ),
  ];
  static List<ProductModel> drinks = [
    ProductModel(
      id: 1,
      price: 400,
      title: "Drink",
      compound: "Яблочный сок",
      image: "asset/images/drink1.jpeg",
    ),
    ProductModel(
      id: 2,
      price: 400,
      title: "Drink",
      compound: "Яблочный сок",
      image: "asset/images/drink2.jpeg",
    ),
    ProductModel(
      id: 3,
      price: 400,
      title: "Drink",
      compound: "Яблочный сок",
      image: "asset/images/drink3.jpeg",
    ),
    ProductModel(
      id: 4,
      price: 400,
      title: "Drink",
      compound: "Яблочный сок",
      image: "asset/images/drink4.jpeg",
    ),
    ProductModel(
      id: 5,
      price: 400,
      title: "Drink",
      compound: "Яблочный сок",
      image: "asset/images/drink5.jpeg",
    ),
    ProductModel(
      id: 6,
      price: 400,
      title: "Drink",
      compound: "Яблочный сок",
      image: "asset/images/drink6.jpeg",
    ),
    ProductModel(
      id: 7,
      price: 400,
      title: "Drink",
      compound: "Яблочный сок",
      image: "asset/images/drink1.png",
    ),
    ProductModel(
      id: 8,
      price: 400,
      title: "Drink",
      compound: "Яблочный сок",
      image: "asset/images/drink2.png",
    ),
  ];

  static List<ProductModel> hotFoods = [
    ProductModel(
      id: 1,
      price: 120000,
      title: "Hot food",
      compound: "Hot food",
      image: "asset/images/hot1.jpeg",
    ),
    ProductModel(
      id: 2,
      price: 120000,
      title: "Hot food",
      compound: "Hot food",
      image: "asset/images/hot2.jpeg",
    ),
    ProductModel(
      id: 3,
      price: 120000,
      title: "Hot food",
      compound: "Hot food",
      image: "asset/images/hot3.jpeg",
    ),
    ProductModel(
      id: 4,
      price: 120000,
      title: "Hot food",
      compound: "Hot food",
      image: "asset/images/hot4.jpeg",
    ),
    ProductModel(
      id: 5,
      price: 120000,
      title: "Hot food",
      compound: "Hot food",
      image: "asset/images/hot5.jpeg",
    ),
    ProductModel(
      id: 6,
      price: 120000,
      title: "Hot food",
      compound: "Hot food",
      image: "asset/images/hot6.jpeg",
    ),
    ProductModel(
      id: 7,
      price: 120000,
      title: "Hot food",
      compound: "Hot food",
      image: "asset/images/hot7.jpeg",
    ),
    ProductModel(
      id: 8,
      price: 120000,
      title: "Hot food",
      compound: "Hot food",
      image: "asset/images/hot8.jpeg",
    ),
  ];
  static List<ProductModel> lavash = [
    ProductModel(
      id: 1,
      price: 21000,
      title: "Lavash",
      compound: "Тесто для лаваша, Помидоры, Горчица, Огурец",
      image: "asset/images/lavash.png",
    ),
    ProductModel(
      id: 2,
      price: 21000,
      title: "Lavash",
      compound: "Тесто для лаваша, Помидоры, Горчица, Огурец",
      image: "asset/images/lavash2.png",
    ),
    ProductModel(
      id: 3,
      price: 21000,
      title: "Lavash",
      compound: "Тесто для лаваша, Помидоры, Горчица, Огурец",
      image: "asset/images/lavash3.jpeg",
    ),
    ProductModel(
      id: 4,
      price: 21000,
      title: "Lavash",
      compound: "Тесто для лаваша, Помидоры, Горчица, Огурец",
      image: "asset/images/lavash4.jpeg",
    ),
    ProductModel(
      id: 5,
      price: 21000,
      title: "Lavash",
      compound: "Тесто для лаваша, Помидоры, Горчица, Огурец",
      image: "asset/images/lavash5.jpeg",
    ),
    ProductModel(
      id: 6,
      price: 21000,
      title: "Lavash",
      compound: "Тесто для лаваша, Помидоры, Горчица, Огурец",
      image: "asset/images/lavash6.jpeg",
    ),
    ProductModel(
      id: 7,
      price: 21000,
      title: "Lester",
      compound: "Тесто для лаваша, Помидоры, Горчица, Огурец",
      image: "asset/images/lester1.jpeg",
    ),
    ProductModel(
      id: 8,
      price: 21000,
      title: "Lester",
      compound: "Тесто для лаваша, Помидоры, Горчица, Огурец",
      image: "asset/images/lester2.jpeg",
    ),
  ];

  static List<ProductModel> mangal = [
    ProductModel(
      id: 1,
      price: 54000,
      title: "Шашлык",
      compound: "Баранина на гриле",
      image: "asset/images/mangal1.jpeg",
    ),
    ProductModel(
      id: 2,
      price: 54000,
      title: "Шашлык",
      compound: "Баранина на гриле",
      image: "asset/images/mangal2.jpeg",
    ),
    ProductModel(
      id: 3,
      price: 54000,
      title: "Шашлык",
      compound: "Баранина на гриле",
      image: "asset/images/mangal3.jpeg",
    ),
    ProductModel(
      id: 4,
      price: 54000,
      title: "Шашлык",
      compound: "Баранина на гриле",
      image: "asset/images/mangal4.jpeg",
    ),
    ProductModel(
      id: 5,
      price: 54000,
      title: "Шашлык",
      compound: "Баранина на гриле",
      image: "asset/images/mangal5.jpeg",
    ),
  ];
  static List<ProductModel> meal = [
    ProductModel(
      id: 1,
      price: 12000,
      title: "Meal",
      compound: "Картофель, Помидоры, Салат, Гречка",
      image: "asset/images/meal1.jpeg",
    ),
    ProductModel(
      id: 2,
      price: 12000,
      title: "Meal",
      compound: "Картофель, Помидоры, Салат, Гречка",
      image: "asset/images/meal2.jpeg",
    ),
    ProductModel(
      id: 3,
      price: 12000,
      title: "Meal",
      compound: "Картофель, Помидоры, Салат, Гречка",
      image: "asset/images/meal3.jpeg",
    ),
    ProductModel(
      id: 4,
      price: 12000,
      title: "Meal",
      compound: "Картофель, Помидоры, Салат, Гречка",
      image: "asset/images/meal4.jpeg",
    ),
  ];
  static List<ProductModel> pizza = [
    ProductModel(
      id: 1,
      price: 54300,
      title: "Pizza",
      compound: "Сыр гальбани, Помидоры, Томат Линана",
      image: "asset/images/pizza1.jpeg",
    ),
    ProductModel(
      id: 2,
      price: 54300,
      title: "Pizza",
      compound: "Сыр гальбани, Помидоры, Томат Линана",
      image: "asset/images/pizza2.jpeg",
    ),
    ProductModel(
      id: 3,
      price: 54300,
      title: "Pizza",
      compound: "Сыр гальбани, Помидоры, Томат Линана",
      image: "asset/images/pizza3.jpeg",
    ),
    ProductModel(
      id: 4,
      price: 54300,
      title: "Pizza",
      compound: "Сыр гальбани, Помидоры, Томат Линана",
      image: "asset/images/pizza4.jpeg",
    ),
    ProductModel(
      id: 5,
      price: 54300,
      title: "Pizza",
      compound: "Сыр гальбани, Помидоры, Томат Линана",
      image: "asset/images/pizza5.jpeg",
    ),
  ];
  static List<ProductModel> potato = [
    ProductModel(
      id: 1,
      price: 12000,
      title: "Potato",
      compound: "Картофель избранный",
      image: "asset/images/potato1.png",
    ),
    ProductModel(
      id: 2,
      price: 12000,
      title: "Potato",
      compound: "Картофель избранный",
      image: "asset/images/potato2.png",
    ),
    ProductModel(
      id: 3,
      price: 12000,
      title: "Potato",
      compound: "Картофель избранный",
      image: "asset/images/potato3.png",
    ),
    ProductModel(
      id: 4,
      price: 12000,
      title: "Potato",
      compound: "Картофель избранный",
      image: "asset/images/potato4.png",
    ),
    ProductModel(
      id: 5,
      price: 12000,
      title: "Potato",
      compound: "Картофель избранный",
      image: "asset/images/potato5.png",
    ),
  ];
  static List<ProductModel> salad = [
    ProductModel(
      id: 1,
      price: 23000,
      title: "Salad",
      compound: "Salad",
      image: "asset/images/salad1.jpeg",
    ),
    ProductModel(
      id: 2,
      price: 23000,
      title: "Salad",
      compound: "Salad",
      image: "asset/images/salad2.png",
    ),
    ProductModel(
      id: 3,
      price: 23000,
      title: "Salad",
      compound: "Salad",
      image: "asset/images/salad3.jpeg",
    ),
    ProductModel(
      id: 4,
      price: 23000,
      title: "Salad",
      compound: "Salad",
      image: "asset/images/salad4.jpeg",
    ),
    ProductModel(
      id: 5,
      price: 23000,
      title: "Salad",
      compound: "Salad",
      image: "asset/images/salad5.jpeg",
    ),
    ProductModel(
      id: 6,
      price: 23000,
      title: "Salad",
      compound: "Salad",
      image: "asset/images/salad6.jpeg",
    ),
    ProductModel(
      id: 7,
      price: 23000,
      title: "Salad",
      compound: "Salad",
      image: "asset/images/salad7.jpeg",
    ),
    ProductModel(
      id: 8,
      price: 23000,
      title: "Salad",
      compound: "Salad",
      image: "asset/images/salad8.jpeg",
    ),
  ];

  static List<ProductModel> snacs = [
    ProductModel(
      id: 1,
      price: 12456,
      title: "Snac",
      compound: "Snac",
      image: "asset/images/snacs1.jpeg",
    ),
    ProductModel(
      id: 2,
      price: 12456,
      title: "Snac",
      compound: "Snac",
      image: "asset/images/snacs2.jpeg",
    ),
    ProductModel(
      id: 3,
      price: 12456,
      title: "Snac",
      compound: "Snac",
      image: "asset/images/snacs3.jpeg",
    ),
    ProductModel(
      id: 4,
      price: 12456,
      title: "Snac",
      compound: "Snac",
      image: "asset/images/snacs4.jpeg",
    ),
    ProductModel(
      id: 5,
      price: 12456,
      title: "Snac",
      compound: "Snac",
      image: "asset/images/snacs5.jpeg",
    ),
    ProductModel(
      id: 6,
      price: 12456,
      title: "Snac",
      compound: "Snac",
      image: "asset/images/snacs6.jpeg",
    ),
  ];
  static List<ProductModel> sous = [
    ProductModel(
      id: 1,
      price: 123456,
      title: "Sous",
      compound: "Sous",
      image: "asset/images/snacs1.jpeg",
    ),
    ProductModel(
      id: 2,
      price: 123456,
      title: "Sous",
      compound: "Sous",
      image: "asset/images/snacs2.jpeg",
    ),
    ProductModel(
      id: 3,
      price: 123456,
      title: "Sous",
      compound: "Sous",
      image: "asset/images/snacs3.jpeg",
    ),
    ProductModel(
      id: 4,
      price: 123456,
      title: "Sous",
      compound: "Sous",
      image: "asset/images/snacs4.jpeg",
    ),
    ProductModel(
      id: 5,
      price: 123456,
      title: "Sous",
      compound: "Sous",
      image: "asset/images/snacs5.jpeg",
    ),
    ProductModel(
      id: 6,
      price: 123456,
      title: "Sous",
      compound: "Sous",
      image: "asset/images/snacs6.jpeg",
    ),
    ProductModel(
      id: 7,
      price: 123456,
      title: "Sous",
      compound: "Sous",
      image: "asset/images/snacs7.jpeg",
    ),
  ];
  static List<ProductModel> sushi = [
    ProductModel(
      id: 1,
      price: 2345,
      title: "Sushi",
      compound: "Sushi",
      image: "asset/images/sushi1.jpeg",
    ),
    ProductModel(
      id: 2,
      price: 2345,
      title: "Sushi",
      compound: "Sushi",
      image: "asset/images/sushi2.png",
    ),
    ProductModel(
      id: 3,
      price: 2345,
      title: "Sushi",
      compound: "Sushi",
      image: "asset/images/sushi3.jpeg",
    ),
    ProductModel(
      id: 4,
      price: 2345,
      title: "Sushi",
      compound: "Sushi",
      image: "asset/images/sushi4.jpeg",
    ),
    ProductModel(
      id: 5,
      price: 2345,
      title: "Sushi",
      compound: "Sushi",
      image: "asset/images/sushi5.jpeg",
    ),
    ProductModel(
      id: 6,
      price: 2345,
      title: "Sushi",
      compound: "Sushi",
      image: "asset/images/sushi6.jpeg",
    ),
    ProductModel(
      id: 7,
      price: 2345,
      title: "Sushi",
      compound: "Sushi",
      image: "asset/images/sushi7.jpeg",
    ),
    ProductModel(
      id: 8,
      price: 2345,
      title: "Sushi",
      compound: "Sushi",
      image: "asset/images/sushi8.jpeg",
    ),
    ProductModel(
      id: 9,
      price: 2345,
      title: "Sushi",
      compound: "Sushi",
      image: "asset/images/sushi9.jpeg",
    ),
  ];

  static List<ProductModel> tea = [
    ProductModel(
      id: 1,
      price: 1000,
      title: "Tea",
      compound: "Tea",
      image: "asset/images/tea1.jpeg",
    ),
    ProductModel(
      id: 2,
      price: 1000,
      title: "Tea",
      compound: "Tea",
      image: "asset/images/tea2.jpeg",
    ),
    ProductModel(
      id: 3,
      price: 1000,
      title: "Tea",
      compound: "Tea",
      image: "asset/images/tea3.png",
    ),
    ProductModel(
      id: 4,
      price: 1000,
      title: "Tea",
      compound: "Tea",
      image: "asset/images/tea4.png",
    ),
  ];

  List<RestaurantModel> restaurantData = [
    RestaurantModel(
      id: 1,
      name: "Oqtepa Lavash",
      poster: "asset/images/poster1.jpg",
      products: {
        Category.burger: burges,
        Category.chicken: chikens,
        Category.pizza: pizza,
        Category.coffee: [...coffee, ...tea],
      },
      open: DateTime.now(),
      close: DateTime.now(),
    ),
    RestaurantModel(
      id: 2,
      name: "MaxWay",
      poster: "asset/images/poster2.jpg",
      products: {
        Category.kebab: mangal,
        Category.asia: [...hotFoods, ...meal],
        Category.pita: lavash,
        Category.coffee: [...tea, ...drinks],
      },
      open: DateTime.now(),
      close: DateTime.now(),
    ),
    RestaurantModel(
      id: 3,
      name: "Feed Up",
      poster: "asset/images/poster3.jpg",
      products: {
        Category.burger: burges,
        Category.kebab: mangal,
        Category.pita: lavash,
        Category.coffee: [...tea, ...drinks, ...drinks],
      },
      open: DateTime.now(),
      close: DateTime.now(),
    ),
    RestaurantModel(
      id: 4,
      name: "Les Ailes",
      poster: "asset/images/poster5.jpg",
      products: {
        Category.burger: burges,
        Category.pizza: pizza,
        Category.nationalFood: [...hotFoods, ...potato],
        Category.coffee: [...tea, ...drinks, ...drinks],
      },
      open: DateTime.now(),
      close: DateTime.now(),
    ),
    RestaurantModel(
      id: 5,
      name: "Mahmud Kebab",
      poster: "asset/images/poster4.jpg",
      products: {
        Category.kebab: mangal,
        Category.pizza: pizza,
        Category.nationalFood: [...hotFoods, ...potato],
        Category.coffee: [...tea, ...drinks, ...drinks],
      },
      open: DateTime.now(),
      close: DateTime.now(),
    ),
    RestaurantModel(
      id: 6,
      name: "KFC",
      poster: "asset/images/poster2.jpg",
      products: {
        Category.chicken: chikens,
        Category.asia: [...hotFoods, ...meal],
        Category.pita: lavash,
        Category.coffee: [...tea, ...drinks],
      },
      open: DateTime.now(),
      close: DateTime.now(),
    ),
  ];
  List<PromotionalCodeModel> promotionData = [];

  List<ClientModel> clientData = [
    ClientModel(
      ordersHistory: [],
      basket: [
        BasketModel(
          productModel: salad.first,
          amount: 2,
        ),
        BasketModel(
          productModel: tea.first,
          amount: 2,
        ),
        BasketModel(
          productModel: meal.last,
          amount: 4,
        ),
      ],
      promotionalCodes: [],
      locationList: [
        PlaceLocation(
          longitude: 41,
          latitude: 41,
          address: "Beruniy 8 a",
        )
      ],
    ),
  ];
}
