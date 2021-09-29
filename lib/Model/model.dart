class ImeiModel {
  String product;
  String imei;

  ImeiModel(this.product, this.imei);

  factory ImeiModel.fromJson(dynamic json) {
    return ImeiModel("${json['product']}", "${json['imei']}");
  }

  Map toJson() => {
        'product': product,
        'imei': imei,
      };
}
