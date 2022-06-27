import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Rida extends StatefulWidget {
  const Rida({ Key? key }) : super(key: key);

  @override
  State<Rida> createState() => _RidaState();
}

class _RidaState extends State<Rida> {
final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('poetry').snapshots();
 
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}