class Trainer {
  String name;
  String image;
  String info;
  Trainer({this.name, this.image, this.info});

  factory Trainer.fromJson(Map jsonFile) {
    return Trainer(
        name: jsonFile['trainerName'] ?? '',
        image: jsonFile['trainerImg'] ?? '',
        info: jsonFile['trainerInfo'] ?? '');
  }
}
