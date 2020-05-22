import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/image.dart';

class ProductData{
   String id;
   String nome;
   Image image;
   List images = [];
   String title;
   double preco;
   String descricao;

   ProductData.document(
      this.nome,
      this.image,
      this.title,
      this.preco,
       this.descricao
       );

   ProductData.fromDocument(DocumentSnapshot document){
      id = document.documentID;
      nome = document.data["nome"];
      image = document.data["image"];
      images = document.data["images"];
      title = document.data["title"];
      preco = document.data["preco"];
      descricao = document.data["descricao"];
   }

   Map<String, dynamic>toResumedMap(){
      return {
         "title": title,
         "descricao": descricao,
         "preco": preco,
      };
   }

}