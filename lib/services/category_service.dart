import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List>getCategory()async{
  List category =[];

  CollectionReference collectionReferenceCategory = db.collection('categorias');

  QuerySnapshot queryCategory = await collectionReferenceCategory.get();

  queryCategory.docs.forEach((element) { 
    category.add(element.data());
  });

  return category;
}