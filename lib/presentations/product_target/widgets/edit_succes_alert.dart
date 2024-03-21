import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/presentations/product_target/page/product_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class EditProductSuccessPage extends StatefulWidget {
  const EditProductSuccessPage({super.key});

  @override
  State<EditProductSuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<EditProductSuccessPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Alert(
        context: context,
        style: const AlertStyle(
          backgroundColor: Colors.white,
          animationType: AnimationType.grow,
          animationDuration: Duration(seconds: 1),
          ),
        type: AlertType.success,
        desc: "Target Berhasil diedit",
        buttons: [
          DialogButton(
            onPressed: () =>
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return const ProductTargetPage();
            })),
            width: 120,
            color: Colors.yellow,
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),

        ],
      ).show();

    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    );
  }
}

