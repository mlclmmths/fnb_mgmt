class Role {
  final String role;

  const Role({required this.role});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(role: json['Role']);
  }

  Map toJson() => {'role': role};
}

class Stock {
  @override
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
