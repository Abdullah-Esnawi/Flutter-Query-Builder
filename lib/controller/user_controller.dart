import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:query_builder/api/fetch_data.dart';
import 'package:query_builder/api/model/user_model.dart';

enum typeAttS1 {
  String,
  Number,
}

enum typeAttS2 {
  String,
  Number,
}

class UserController with ChangeNotifier {
  final List<String> userAtt = [
    'User Id',
    'First Name',
    'Last Name',
    'Full Name',
    'Gender',
    'Age'
  ];
  final optionOperators = [
    'AND',
    'OR',
  ];
  final operatorsNumber = ['=', '!=', '>', '<'];
  final operatorsString = ['Starts With', 'Ends With', 'Contains', 'Exact'];

  typeAttS1 typeAttributeS1 = typeAttS1.Number;
  typeAttS2 typeAttributeS2 = typeAttS2.Number;
  String? firstField;
  String? secondField;
  String? selectedAttS1;
  String? selectedAttS2;
  String? selectedOperatorS1;
  String? selectedOperatorS2;
  String? selectedOptionOperator;
  UserController();
////////// START Updates Value For First Section ///////////////
  updateFirstField(String inputField) {
    copyWithFiled(firstField: inputField);
  }

  updateSelectedAttS1(String selectedAtt) {
    copyWithSelectionS1(selectedAtt: selectedAtt);
  }
    updateSelectedOperatorS1(String selectedOp) {
    copyWithSelectionS1(selectedOperator: selectedOp);
  }

////////// END Updates Value For First Section ///////////////
///
////////// START Updates Value For Second Section ///////////////
  updateSelectedAttS2(String selectedAtt) {
    copyWithSelectionS2(selectedAtt: selectedAtt);
  }
  updateSecondField(String inputField) {
    copyWithFiled(secondField: inputField);
  }
  updateSelectedOperatorS2(String selectedOp) {
    copyWithSelectionS2(selectedOperator: selectedOp);
  }

  updateSlctdOptionOperator(String slctdOptionOperator) {
    copyWithOptionOperator(slctdOptionOperator: slctdOptionOperator);
  }
////////// END Updates Value For Second Section ///////////////


  void copyWithFiled({String? firstField, String? secondField}) {
    this.firstField = firstField ?? this.firstField;
    this.secondField = secondField ?? this.secondField;
    notifyListeners();
  }
  void copyWithOptionOperator({required String slctdOptionOperator}) {
    this.selectedOptionOperator = slctdOptionOperator;
    notifyListeners();
  }
  void copyWithSelectionS1({String? selectedAtt, String? selectedOperator}) {
    this.selectedAttS1 = selectedAtt ?? this.selectedAttS1;
    this.selectedOperatorS1 = selectedOperator;
    notifyListeners();
  }
  void copyWithSelectionS2({String? selectedAtt, String? selectedOperator}) {
    this.selectedAttS2 = selectedAtt ?? this.selectedAttS2;
    this.selectedOperatorS2 = selectedOperator;
    notifyListeners();
  }

  // changeOperators(String? newValue, {bool? isSection1}) {
  //   if ((newValue == 'User Id' || newValue == 'Age') && isSection1==true) {
  //     if (isSection1 == true) {
  //       typeAttributeS1 = typeAttS1.Number;
  //     } else if (isSection1 == false) {
  //       typeAttributeS2 = typeAttS2.Number;
  //     } else {
  //       typeAttributeS2 = typeAttributeS2;
  //       typeAttributeS1 = typeAttributeS1;
  //     }
  //   } else {
  //     if (isSection1 == true) {
  //       typeAttributeS1 = typeAttS1.String;
  //     } else if (isSection1 == false) {
  //       typeAttributeS2 = typeAttS2.String;
  //     } else {
  //       typeAttributeS2 = typeAttributeS2;
  //       typeAttributeS1 = typeAttributeS1;
  //     }
  //   }
  //   notifyListeners();
  // }

  changeOperators(String? newValue, {bool? isSection1}) {
    if ((newValue == 'User Id' || newValue == 'Age') && isSection1 == true) {
      typeAttributeS1 = typeAttS1.Number;
    } else if ((newValue != 'User Id' && newValue != 'Age') &&
        isSection1 == true) {
      typeAttributeS1 = typeAttS1.String;
    } else if ((newValue == 'User Id' || newValue == 'Age') &&
        isSection1 == false) {
      typeAttributeS2 = typeAttS2.Number;
    } else if ((newValue != 'User Id' && newValue != 'Age') &&
        isSection1 == false) {
      typeAttributeS2 = typeAttS2.String;
    }
    notifyListeners();
  }
}
