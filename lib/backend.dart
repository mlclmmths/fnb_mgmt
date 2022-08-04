import 'dart:convert';
import 'package:fnb_mgmt/models.dart';
import 'package:http/http.dart' as http;

var domain = "https://localhost:5100/Foodie";

///TODO:
///1. Login (/)
///2. NewEmp (/)
///3. Clock (/)
///4. Ins Stock (/)
///5. Get Stock (/)
///6. Upd Menu
///7. Edit Branch
///8. Branch Sales
///9. Total Sales
///10. Add Sales
///11. Restock
///12. Confirm Stock
///13. Categorise
///14. Ingredient Ids (/)
///15. Edit Sales

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

Future<Role> loginUser(int id, String password) async {
  try {
    final response = await http.post(Uri.parse('$domain/Login'),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
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

Future<int> clockInOut(String employeeId, bool clockIn) async {
  try {
    final response = await http.post(Uri.parse('$domain/Clock'),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(
            <String, dynamic>{'EmployeeId': employeeId, 'ClockIn': clockIn}));
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
