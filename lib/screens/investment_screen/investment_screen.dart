import 'package:flutter/material.dart';
import 'package:investment/core/models/investment_model.dart';

import 'investment_screen_widgets/investment_screen_tile.dart';

class InvestmentScreen extends StatefulWidget {
  @override
  _InvestmentScreenState createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<InvestmentScreen> {
  final nameController = TextEditingController();

  final cpfController = TextEditingController();

  final investmentValueController = TextEditingController();

  final dateController = TextEditingController();

  final monthQuantityController = TextEditingController();

  final companyController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final List<InvestmentModel> investmentDataTiles = [
    InvestmentModel(
        name: "Pedro Ruas",
        company: "Amazon",
        date: "20/04/2021",
        monthQuantity: 5,
        investmentValue: 700000),
    InvestmentModel(
        name: "Pedro Ruas",
        company: "Amazon",
        date: "20/04/2021",
        monthQuantity: 5,
        investmentValue: 700000),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          // Lista de Investimentos
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: investmentDataTiles.map((value) {
                return InvestmentScreenTile(value);
              }).toList(),
            ),
          ),

          // Botao de investimento
          GestureDetector(
            onTap: () {
              //  //
              //  //
              //  //
              // Modal == algo que surge na tela e so desoparecera com uma condicao e ja possui seu crescimento size.height * 0.6
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Form(
                      key: formKey,
                      child: ListView(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        children: [
                          customTextField(
                              controller: nameController,
                              label: "Nome Do Cliente",
                              ),
                          customTextField(
                              controller: cpfController,
                              label: "Cpf Do Cliente"),
                          customTextField(
                              controller: investmentValueController,
                              label: "Valor a Investir"),
                          Row(
                            children: [
                              Expanded(
                                child: customTextField(
                                    controller: dateController, label: "Data"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: customTextField(
                                    controller: monthQuantityController,
                                    label: "Qtd Meses"),
                              ),
                            ],
                          ),
                          customTextField(
                            controller: companyController,
                            label: "Empresa a Investir",
                            isNext: false,
                          ),
                          // Botao Investimento
                          GestureDetector(
                            onTap: () {
                              if (formKey.currentState.validate()) {
                                // Investir
                                InvestmentModel model = InvestmentModel(
                                    company: companyController.text,
                                    cpf: cpfController.text,
                                    date: dateController.text,
                                    investmentValue: double.parse(
                                        investmentValueController.text),
                                    monthQuantity:
                                        int.parse(monthQuantityController.text),
                                    name: nameController.text);

                                setState(() {
                                  investmentDataTiles.add(model);
                                });

                                nameController.clear();
                                cpfController.clear();
                                investmentValueController.clear();
                                dateController.clear();
                                monthQuantityController.clear();
                                companyController.clear();

                                // Removendo o BottomSheet
                                Navigator.of(context).pop();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                              margin: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "Investir",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
              //  //
              //  //
              //  //
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "Investir",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customTextField({
    @required TextEditingController controller,
    @required String label,
    bool isNext = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        textInputAction: isNext ? TextInputAction.next : TextInputAction.done,
        // 
        // 
        // 
        onSaved: (value) {},
        // 
        // 
        // 
        controller: controller,
        style: TextStyle(color: Colors.white),
        validator: (value) {
          if (value.isEmpty) {
            return "Digite um valor";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          border: customBorder(),
          focusedBorder: customBorder(),
          errorBorder: customBorder(),
          focusedErrorBorder: customBorder(),
          enabledBorder: customBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder customBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.white));
}
