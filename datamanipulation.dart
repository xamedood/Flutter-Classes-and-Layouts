void main() {
  //   for (var pastry in PastriesOption) {
  //     print("${pastry.name}");
  //   }
  for (var element in suppliedIngredients) {
    //     final firstItem = Ingredient
    final res1 = checkCake(element);
    if (res1 != null) {
      final results1 = element.bakeCake(element);
      print('Oven successfully bakled cake: $results1');
      return;
    }
    print('Oven failed to baked cake');

    final res2 = checkBread(element);
  }
}

String? checkBread(Ingredient data) {
  switch (data.yeast) {
    case null:
      return null;
    default:
      return 'bread';
  }
}

String? checkCake(Ingredient data) {
  switch (data.egg) {
    case null:
      return null;

    default:
      return 'cake';
  }
}

class Ingredient {
  final String butter;
  final String? nutmeg;
  final String sugar;
  final String salt;
  final String flour;
  final String? yeast; // required for making puffpuff
  final String? milk; // required for making bread
  final String? egg;
  final String bakingpowder; // required for making cake

  Ingredient({
    required this.bakingpowder,
    required this.butter,
    this.nutmeg,
    required this.sugar,
    required this.salt,
    required this.flour,
    this.yeast,
    this.milk,
    this.egg,
  });

  Cake bakeCake(Ingredient data) {
    return Cake(
      salt: data.salt,
      flour: data.flour,
      butter: data.butter,
      egg: data.egg,
      bakingpowder: data.bakingpowder,
      sugar: data.sugar,
      candle: 5,
      addIcingSugar: true,
      timer: 45,
    );
  }
}

// class methods {
//   final String name;
//   final List<String> Ingredient;

//   methods({required this.name, required this.Ingredient});
// }

class Cake {
  final String butter;
  final String sugar;
  final String salt;
  final String flour;
  final String? egg;
  final String bakingpowder;
  final int timer;
  final bool addIcingSugar;
  final int candle;

  Cake({
    required this.butter,
    required this.sugar,
    required this.bakingpowder,
    required this.flour,
    required this.salt,
    required this.timer,
    required this.addIcingSugar,
    required this.candle,
    this.egg,
  });
}

// final puffpuff = methods(
//   name: "puffpuff",
//   Ingredient: ["flour", "butter", "yeast"],
// );
// final meatpie = methods(
//   name: "puffpuff",
//   Ingredient: ["flour", "butter", "milk", "egg", "baking powder"],
// );

List<Ingredient> suppliedIngredients = [
  Ingredient(
    flour: '2kg',
    salt: '50g',
    sugar: '100g',
    butter: '60g',
    bakingpowder: '3g',
    egg: '40g',
  ),
];

// final allpastries = [puffpuff, meatpie];

// List<methods> getAvailablePastries(
//   List<String> myIngredient,
//   List<methods> methods,
// ) {
//   return allpastries
//       .where(
//         (allpastries) => allpastries.Ingredient.every(myIngredient.contains),
//       )
//       .toList();
// }

// final PastriesOption = getAvailablePastries(myIngredient, allpastries);
