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
  final String ingredient;
  final int quantity;
  final double costPerPax;
  final double totalCost;

  const Stock(
      {required this.ingredient,
      required this.quantity,
      required this.costPerPax,
      required this.totalCost});

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
        ingredient: json['Ingredient'],
        quantity: json['Quantity'],
        costPerPax: json['CostPerPax'],
        totalCost: json['TotalCost']);
  }

  Map toJson() => {
        'ingredient': ingredient,
        'quantity': quantity,
        'costPerPax': costPerPax,
        'totalCost': totalCost
      };

  @override
  String toString() {
    return '{ingredient: $ingredient, quantity: $quantity, costPerPax: $costPerPax, totalCost: $totalCost}';
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
