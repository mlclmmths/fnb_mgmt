import 'dart:convert';

class Role {
  final String role;

  const Role({required this.role});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(role: json['Role']);
  }

  Map toJson() => {'role': role};
}

class Branch {
  final bool removeFlag;
  final String branchName;
  final String menuList;

  const Branch(
      {required this.removeFlag,
      required this.branchName,
      required this.menuList});

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
        removeFlag: json['Remove'],
        branchName: json['BranName'],
        menuList: json['MenuList']);
  }
}

Restock restockFromJson(String str) => Restock.fromJson(json.decode(str));

String restockToJson(Restock data) => json.encode(data.toJson());

class Restock {
  Restock({
    this.branName,
    this.item,
  });

  String? branName;
  List<Item>? item;

  factory Restock.fromJson(Map<String, dynamic> json) => Restock(
        branName: json["BranName"],
        item: List<Item>.from(json["Item"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "BranName": branName,
        "Item": List<dynamic>.from(item!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.ingredient,
    this.quantity,
  });

  String? ingredient;
  int? quantity;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        ingredient: json["Ingredient"],
        quantity: json["Quantity"],
      );

  Map<String, dynamic> toJson() => {
        "Ingredient": ingredient,
        "Quantity": quantity,
      };
}

class Menu {
  final String name;
  final double price;

  const Menu({required this.name, required this.price});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      name: json['Name'],
      price: json['Price'],
    );
  }

  Map toJson() => {
        'name': name,
        'price': price,
      };

  @override
  String toString() {
    return '{name: $name, price: $price}';
  }
}

class Sales {
  final int salesId;
  final String? meal;
  final String? datetime;
  final String? stat;

  const Sales({required this.salesId, this.meal, this.datetime, this.stat});

  factory Sales.fromJson(Map<String, dynamic> json) {
    return Sales(
        salesId: json['SalesId'],
        meal: json['Meal'],
        datetime: json['DateTime'],
        stat: json['Stat']);
  }

  Map toJson() => {
        'salesId': salesId,
        'meal': meal,
        'datetime': datetime,
        'stat': stat,
      };

  @override
  String toString() {
    return '{salesId: $salesId, meal: $meal, datetime: $datetime, stat: $stat}';
  }
}

// class _Sales extends Sales {
//   final String stat;

//   const _Sales({required super.salesId, required this.stat});

//   factory _Sales.fromJson(Map<String, dynamic> json) {
//     return _Sales(
//       salesId: json['SalesId'],
//       stat: json['Stat'],
//     );
//   }

//   Map toJson() => {
//         'salesId': salesId,
//         'stat': stat,
//       };

//   @override
//   String toString() {
//     return '{salesId: $salesId, stat: $stat}';
//   }
// }

class Stock {
  final int? restockId;
  final int? ingredientId;
  final String? ingredient;
  final int? quantity;
  final String? measurement;
  final double? costPerPax;
  final double? totalCost;

  const Stock(
      {this.restockId,
      this.ingredientId,
      this.ingredient,
      this.quantity,
      this.measurement,
      this.costPerPax,
      this.totalCost});

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
        restockId: json['RestockId'],
        ingredientId: json['IngredientId'],
        ingredient: json['Ingredient'],
        quantity: json['Quantity'],
        measurement: json['Measurement'],
        costPerPax: json['CostPerPax'],
        totalCost: json['TotalCost']);
  }

  Map toJson() => {
        'restockId': restockId,
        'ingredientId': ingredientId,
        'ingredient': ingredient,
        'quantity': quantity,
        'measurement': measurement,
        'costPerPax': costPerPax,
        'totalCost': totalCost
      };

  @override
  String toString() {
    return '{restockId: $restockId, ingredientId: $ingredientId, $ingredient, quantity: $quantity, measurement: $measurement, costPerPax: $costPerPax, totalCost: $totalCost}';
  }
}

class Ingredient {
  final int id;
  final String ingredient;

  const Ingredient({required this.id, required this.ingredient});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(id: json['id'], ingredient: json['ing']);
  }

  Map toJson() => {'id': id, 'ingredient': ingredient};

  @override
  String toString() {
    return '{id : $id, ingredient: $ingredient}';
  }
}

class Employee {
  final int id;
  final String name;
  final String position;
  final String icNumber;
  final String contact;
  final String primarySupervisor;
  final double baseRate;
  final String pass;

  const Employee(
      {required this.id,
      required this.name,
      required this.position,
      required this.icNumber,
      required this.contact,
      required this.primarySupervisor,
      required this.baseRate,
      required this.pass});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json['Id'],
        name: json['Name'],
        position: json['Position'],
        icNumber: json['IcNumber'],
        contact: json['ContNum'],
        primarySupervisor: json['PriSup'],
        baseRate: json['BaseRate'],
        pass: json['Pass']);
  }

  Map toJson() => {
        'id': id,
        'name': name,
        'position': position,
        'icNumber': icNumber,
        'contact': contact,
        'primarySupervisor': primarySupervisor,
        'baseRate': baseRate,
        'pass': pass
      };
}

ConfirmStock confirmStockFromJson(String str) =>
    ConfirmStock.fromJson(json.decode(str));

String confirmStockToJson(ConfirmStock data) => json.encode(data.toJson());

class ConfirmStock {
  ConfirmStock({
    this.idList,
  });

  List<int>? idList;

  factory ConfirmStock.fromJson(Map<String, dynamic> json) => ConfirmStock(
        idList: List<int>.from(json["IdList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "IdList": List<dynamic>.from(idList!.map((x) => x)),
      };
}
