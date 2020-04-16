import 'dart:ui';

// ignore: implementation_imports
import 'package:flutter/src/widgets/image.dart';

class ProductData{
   String nome;
   Image image;
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
}