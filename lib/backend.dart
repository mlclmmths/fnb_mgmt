import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fnb_mgmt/models.dart';
import 'package:http/http.dart' as http;

var domain = "https://localhost:5100/Foodie";

///TODO:
///1. Login (/)
///2. NewEmp (/)
///3. Clock (/)
///4. Ins Stock (/)
///5. Get Stock (/)
///6. Upd Menu (/)
///7. Edit Branch (/)
///8. Branch Sales (/)
///9. Total Sales (/)
///10. Add Sales (/)
///11. Restock (/)
///12. Confirm Stock (/)
///13. Categorise (/)
///14. Ingredient Ids (/)
///15. Edit Sales (/)
/// FINITO

String listJsonFormatter(List<dynamic> inputList) {
  JsonEncoder encoder = const JsonEncoder.withIndent(' ');
  String jsonOutput = encoder.convert(inputList);

  return jsonOutput;
}

Future<List<Stock>> getStock() async {
  try {
    final response = await http.get(Uri.parse('$domain/GetStock'));

    if (response.statusCode == 200) {
      List<Stock> stockList;
      stockList = (json.decode(response.body) as List)
          .map((i) => Stock.fromJson(i))
          .toList();
      print(listJsonFormatter(stockList));
      return stockList;
    }
    throw Exception('Failed to load stock');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<List<Ingredient>> getIngredient() async {
  try {
    final response = await http.get(Uri.parse('$domain/IngredientIds'));

    if (response.statusCode == 200) {
      List<Ingredient> ingredientList;
      ingredientList = (json.decode(response.body) as List)
          .map((i) => Ingredient.fromJson(i))
          .toList();
      print(listJsonFormatter(ingredientList));
      return ingredientList;
    }
    throw Exception('Failed to load ingredients');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<List<Menu>> getCategoryMenu(String category) async {
  try {
    final response = await http.post(Uri.parse('$domain/Categorise'),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, dynamic>{
          'Category': category,
        }));
    if (response.statusCode == 200) {
      List<Menu> categoryList;
      categoryList = (json.decode(response.body) as List)
          .map((e) => Menu.fromJson(e))
          .toList();

      print(listJsonFormatter(categoryList));
      return categoryList;
    }
    throw Exception('Failed to get category menu');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<List<Sales>> getBranchSales(
    int branchId, String startDate, String endDate) async {
  try {
    final response = await http.post(Uri.parse('$domain/BranchSales'),
        headers: <String, String>{
          "Content-type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, dynamic>{
          'BranchId': branchId,
          'StartDate': startDate,
          'EndDate': endDate
        }));
    if (response.statusCode == 200) {
      List<Sales> salesList;
      salesList = (json.decode(response.body) as List)
          .map((i) => Sales.fromJson(i))
          .toList();
      print(listJsonFormatter(salesList));
      return salesList;
    }
    throw Exception('Failed to fetch sales from branch');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<Sales> updateSales(int salesId, int stat) async {
  try {
    final response = await http.post(Uri.parse('$domain/EditSales'),
        headers: <String, String>{
          "Content-type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, dynamic>{
          'SalesId': salesId,
          'Stat': stat,
        }));
    if (response.statusCode == 200) {
      print(response.body);
      return Sales.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to edit sales');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<double> getTotalSales(String startDate, String endDate) async {
  try {
    final response = await http.post(Uri.parse('$domain/TotalSales'),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(
            <String, dynamic>{'StartDate': startDate, 'EndDate': endDate}));

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    }
    throw Exception('Failed to get total');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<int> insertSales(
    String branchName, bool isCash, List<String> meal) async {
  try {
    final response = await http.post(Uri.parse('$domain/AddSales'),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, dynamic>{
          'BranName': branchName,
          'IsCash': isCash,
          'Meal': meal
        }));
    if (response.statusCode == 200) {
      print(response.statusCode);
      return response.statusCode;
    }
    throw Exception('Failed to add sales');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<int> confirmStock(ConfirmStock confirmStock) async {
  try {
    final response = await http.post(Uri.parse('$domain/ConfirmStock'),
        headers: <String, String>{
          "Content-type": "application/json; charset=UTF-8",
        },
        body: confirmStockToJson(confirmStock));
    if (response.statusCode == 200) {
      print(response.statusCode);
      return response.statusCode;
    }
    throw Exception('Failed to confirm stock');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<int> insertStock(
    String ingredient, String unit, int quantity, double price) async {
  try {
    final response = await http.post(Uri.parse('$domain/InsertStock'),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, dynamic>{
          'Ingredient': ingredient,
          'Measurement': unit,
          'Quantity': quantity,
          'Price': price
        }));

    if (response.statusCode == 200) {
      print(response.statusCode);
      return response.statusCode;
    }
    throw Exception('Failed to insert stock');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<List<Stock>> restockIngredients(Restock restock) async {
  try {
    final response = await http.post(Uri.parse('$domain/Restock'),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: restockToJson(restock));
    print(response.body);
    if (response.statusCode == 200) {
      List<Stock> restockList;
      restockList = (json.decode(response.body) as List)
          .map((i) => Stock.fromJson(i))
          .toList();
      print(listJsonFormatter(restockList));
      return restockList;
    }
    throw ('Failed to restock ingredients');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<Role> loginUser(int id, String password) async {
  try {
    final response = await http.post(Uri.parse('$domain/Login'),
        headers: <String, String>{
          "Content-type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, dynamic>{'Id': id, 'Password': password}));

    if (response.statusCode == 200) {
      print(response.body);
      return Role.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to get user role');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<Branch> editBranch(
    String name, String location, String menuList, bool removeFlag) async {
  try {
    final response = await http.post(Uri.parse('$domain/EditBranch'),
        headers: <String, String>{
          "Content-type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, dynamic>{
          'Name': name,
          'Location': location,
          'MenuList': menuList,
          'Remove': removeFlag
        }));
    if (response.statusCode == 200) {
      print(response.body);
      return Branch.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to edit branch');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<int> clockInOut(String employeeId, bool clockFlag) async {
  try {
    final response = await http.post(Uri.parse('$domain/Clock'),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(
            <String, dynamic>{'EmployeeId': employeeId, 'ClockIn': clockFlag}));
    if (response.statusCode == 200) {
      print(response.statusCode);
      return response.statusCode;
    }
    throw Exception('Failed to clock-in/clock-out');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<Employee> insertNewEmployee(
    int id,
    String name,
    String position,
    String icNumber,
    String contactNumber,
    String primarySupervisor,
    double baseRate,
    String pass) async {
  try {
    final response = await http.post(Uri.parse('$domain/NewEmp'),
        headers: {
          "Content-type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, dynamic>{
          'EmployeeId': id,
          'Name': name,
          'Position': position,
          'IcNumber': icNumber,
          'ContNum': contactNumber,
          'PriSup': primarySupervisor,
          'BaseRate': baseRate,
          'Pass': pass
        }));
    if (response.statusCode == 200) {
      print(response.body);
      return Employee.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to create new employee');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}

Future<int> updateMenu(bool removeFlag, String meal, String ingredientsUsed,
    double price, String category) async {
  try {
    final response = await http.post(Uri.parse('$domain/UpdMenu'),
        headers: {
          "Content-type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, dynamic>{
          'Remove': removeFlag,
          'Meal': meal,
          'IngUsed': ingredientsUsed,
          'Price': price,
          'Category': category
        }));
    if (response.statusCode == 200) {
      print('OK');
      return response.statusCode;
    }
    throw Exception('Failed to update menu');
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}
