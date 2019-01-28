class UserApi {
  String birthDate;
  String email;
  String firstName;
  num idCard;
  String lastName;
  num phoneNumber;

  UserApi(this.firstName, this.lastName, this.birthDate, this.email, this.idCard, this.phoneNumber);

  UserApi.fromMap(Map item) {
    this.birthDate = item['birthdate'];
    this.email = item['email'];
    this.firstName = item['firstName'];
    this.idCard = item['idCard'];
    this.lastName = item['lastName'];
    this.phoneNumber = item['phoneNumber'];
  }
}
