import 'dart:html';
import 'package:flutter/material.dart';
import 'package:fnb_mgmt/backend.dart';
import 'package:fnb_mgmt/models.dart';
import 'package:http/http.dart';

void main() {
  //loginUser(1, "Linkell123");
  //getIngredient();
  //getStock();
  //insertStock('Spinach', 'g', 3000, 0.00555);
  //clockInOut('1', false);
  insertNewEmployee(6789, 'John Smith', 'Regional Manager', '000101131234',
      '0123456789', 'Monfos Fowton', 1800, 'A56789');
}
