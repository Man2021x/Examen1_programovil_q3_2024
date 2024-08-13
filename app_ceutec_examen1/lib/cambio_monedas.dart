import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyExchangeWidget extends StatefulWidget {
  const CurrencyExchangeWidget({super.key});

  @override
  CurrencyExchangeWidgetState createState() => CurrencyExchangeWidgetState();
}

class CurrencyExchangeWidgetState extends State<CurrencyExchangeWidget> {
  String selectedCurrency = 'Dólar';
  String selectedAction = 'Compra';
  double exchangeRateDollarCompra = 24.50;
  double exchangeRateDollarVenta = 24.80;
  double exchangeRateEuroCompra = 28.50;
  double exchangeRateEuroVenta = 28.90;
  double result = 0.0;
  final TextEditingController amountController = TextEditingController();

  void _calculateExchange() {
    double amount = double.tryParse(amountController.text) ?? 0.0;

    if (selectedCurrency == 'Dólar') {
      if (selectedAction == 'Compra') {
        result = amount / exchangeRateDollarCompra; // Lempiras a Dólares
      } else {
        result = amount * exchangeRateDollarVenta; // Dólares a Lempiras
      }
    } else if (selectedCurrency == 'Euro') {
      if (selectedAction == 'Compra') {
        result = amount / exchangeRateEuroCompra; // Lempiras a Euros
      } else {
        result = amount * exchangeRateEuroVenta; // Euros a Lempiras
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App CEUTEC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedCurrency = 'Dólar';
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: selectedCurrency == 'Dólar' ? Colors.grey.shade300 : Colors.white,
                  ),
                  child: const Text('Dólar'),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedCurrency = 'Euro';
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: selectedCurrency == 'Euro' ? Colors.grey.shade300 : Colors.white,
                  ),
                  child: const Text('Euro'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedAction = 'Compra';
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: selectedAction == 'Compra' ? Colors.grey.shade300 : Colors.white,
                  ),
                  child: const Text('Compra'),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedAction = 'Venta';
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: selectedAction == 'Venta' ? Colors.grey.shade300 : Colors.white,
                  ),
                  child: const Text('Venta'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cantidad en Lempiras',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateExchange,
              child: const Text('Convertir'),
            ),
            const SizedBox(height: 20),
            Text(
              'Resultado: ${result.toStringAsFixed(2)} ${selectedCurrency == 'Dólar' ? 'USD' : 'EUR'}',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
