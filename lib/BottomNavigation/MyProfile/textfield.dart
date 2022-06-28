import 'package:flutter/material.dart';

class Textfield1 extends StatefulWidget {
  const Textfield1({Key? key}) : super(key: key);

  @override
  State<Textfield1> createState() => _Textfield1State();
}

class _Textfield1State extends State<Textfield1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.copy),),
                filled: true,
                enabled: false,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 300),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.white,),),
          ),
        ],
      ),
    );
  }
}
