///轮播组件图片
class CustomSwiperBean {
  String image;

  CustomSwiperBean({this.image});

  factory CustomSwiperBean.fromJson(dynamic json) {
    return CustomSwiperBean(
      image: json['image'],
    );
  }
}