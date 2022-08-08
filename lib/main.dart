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
  //insertNewEmployee(6789, 'John Smith', 'Regional Manager', '000101131234',
  //    '0123456789', 'Monfos Fowton', 1800, 'A56789');
  //updateMenu(true, 'Pickled Cucumbers', '21,58,60,32,46', 12.5, 'Main Course');
  //editBranch('Padungan Branch', 'ABC Kopitiam', '9,11,12', false);
  //getBranchSales(1, '2022-06-30', '2022-07-31');
  //updateSales(2, 1);
  //getTotalSales('2022-07-01', '2022-07-30');
  getCategoryMenu('Main Course');
}
