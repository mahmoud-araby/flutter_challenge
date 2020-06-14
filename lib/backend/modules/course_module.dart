import 'package:tech/backend/modules/trainer_module.dart';

class Course {
  int id;
  String title;
  List images;
  String interest;
  int price;
  DateTime date;
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

  Course.fromJson(Map jsonFile) {
    this.id = jsonFile['id'] ?? 0;
    this.title = jsonFile['title'] ?? '';
    this.images = imagesFormJson(jsonFile) ?? [];
    this.interest = jsonFile['interest'] ?? '';
    this.price = jsonFile['price'] ?? 0;
    this.date = DateTime.parse(jsonFile['date']) ?? DateTime.parse('');
    this.occasionDetail = jsonFile['occasionDetail'] ?? '';
    this.trainer = Trainer.fromJson(jsonFile) ?? Trainer();
    this.latitude = jsonFile['latitude'] ?? '0';
    this.longitude = jsonFile['longitude'] ?? '0';
    this.address = jsonFile['address'] ?? '';
    this.isLiked = jsonFile['isLiked'] ?? false;
    this.isSold = jsonFile['isSold'] ?? false;
    this.isPrivate = jsonFile['isPrivateEvent'] ?? false;
    this.hiddenCashPayment = jsonFile['hiddenCashPayment'] ?? false;
    this.specialForm = jsonFile['specialForm'] ?? 0;
    this.questionnaire = jsonFile['questionnaire'] ?? '';
    this.questExplanation = jsonFile['questExplanation'] ?? "";
    this.reservTypes = jsonFile['reservTypes'][0] ?? {};
  }

  Function(Map) get imagesFormJson => (Map jsonFile) {
        List ret = [];
        ret = jsonFile['img'];
        return ret;
      };
}
