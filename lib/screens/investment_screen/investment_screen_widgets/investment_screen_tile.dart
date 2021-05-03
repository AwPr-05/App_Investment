import 'package:flutter/material.dart';
import 'package:investment/core/models/investment_model.dart';

class InvestmentScreenTile extends StatelessWidget {
  final InvestmentModel value;

  InvestmentScreenTile(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Empresa e data
          Row(
            children: [
              // Empresa
              Text(
                value.company,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              // Data
              Text(
                " - ${value.date}",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),

          // Espaçamento
          SizedBox(height: 5),

          // Nome
          Row(
            children: [
              Text(
                "Investidor: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              // Nome
              Text(value.name),
            ],
          ),

          // Espaçamento
          SizedBox(height: 5),

          // Quantidade de Meses
          Text("${value.monthQuantity} meses"),

          // Espaçamento
          SizedBox(height: 5),

          // Valor
          Text(
            "R\$ ${value.investmentValue}",
            style: TextStyle(color: Colors.green, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
