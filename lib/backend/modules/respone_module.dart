class CourseReservation {
  String name;
  String phoneNumber;
  String emailAddress;

  CourseReservation({this.name, this.phoneNumber, this.emailAddress});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
    };
  }
}
