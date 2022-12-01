class ColorModel{

ColorModel({required this.colorA, required this.colorB});

  final String colorA;
  final String colorB;

  factory ColorModel.fromJson(Map<String,dynamic> json){
    return  ColorModel(colorA:json["color_a"] as String? ?? "",colorB:json["color_b"] as String? ?? "");
  }
}