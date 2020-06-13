class Trainer {
  String name;
  String image;
  String info;
  Trainer(this.name, this.image, this.info);

  Trainer.fromJson(Map<String, dynamic> jsonFile) {
    this.name = jsonFile['trainerName'];
    this.image = jsonFile['trainerImg'];
    this.info = jsonFile['trainerInfo '];
  }
}
