import 'package:tech/backend/modules/trainer_module.dart';

class Course {
  int id;
  String title;
  List<String> images;
  String interest;
  double price;
  String date;
  String occasionDetail;
  Trainer trainer;
  String latitude;
  String longitude;
  String address;
  bool isLiked;
  bool isSold;
  bool isPrivate;
  bool hiddenCashPayment;
  int specialForm;
  String questionnaire;
  String questExplanation;
  Map<String, dynamic> reservTypes;

  Course(
      this.id,
      this.title,
      this.images,
      this.interest,
      this.price,
      this.date,
      this.occasionDetail,
      this.trainer,
      this.latitude,
      this.longitude,
      this.address,
      this.isLiked,
      this.isSold,
      this.isPrivate,
      this.hiddenCashPayment,
      this.specialForm,
      this.questionnaire,
      this.questExplanation,
      this.reservTypes);

  Course.fromJson(Map<String, dynamic> jsonFile) {
    this.id = jsonFile['id'];
    this.title = jsonFile['title'];
    this.images = imagesFormJson(jsonFile);
    this.interest = jsonFile['interest'];
    this.price = jsonFile['price'];
    this.date = jsonFile['date'];
    this.occasionDetail = jsonFile['occasionDetail'];
    this.trainer = Trainer.fromJson(jsonFile);
    this.latitude = jsonFile['latitude'];
    this.longitude = jsonFile['longitude'];
    this.address = jsonFile['Address'];
    this.isLiked = jsonFile['isLiked'];
    this.isSold = jsonFile['isSold'];
    this.isPrivate = jsonFile['isPrivateEvent'];
    this.hiddenCashPayment = jsonFile['hiddenCashPayment'];
    this.specialForm = jsonFile['specialForm'];
    this.questionnaire = jsonFile['questionnaire'];
    this.questExplanation = jsonFile['questExplanation'];
    this.reservTypes = jsonFile['reservTypes'][0];
  }

  Function(Map) get imagesFormJson => (Map jsonFile) {
        List<String> ret = [];
        jsonFile.forEach((img, imageSource) {
          ret.add(imageSource);
        });
        return ret;
      };
}
