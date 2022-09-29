part of 'models.dart';

class ProductModel {
  final String? productName;
  final String? productDesc;
  final String? imageUrl;
  final double? productPrice;

  ProductModel(
      {this.productName, this.productDesc, this.imageUrl, this.productPrice});
}
