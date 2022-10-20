class account {
  final String email;
  final String FirstName;
  final String LastName;
  final String Age;
  final String Gender;

  account(
      {required this.email,
      required this.FirstName,
      required this.LastName,
      required this.Age,
      required this.Gender,
      });

  Map<String, dynamic> toCloud() => {
        'email': email,
        'FirstName': FirstName,
        'Last': LastName,
        'Age': Age,
        'Gender': Gender,
      };

  static account fromCloud(Map<String, dynamic> json) => account(
      email: json['email'],
      FirstName: json['First'],
      LastName: json['LastName'],
      Age: json['Age'],
      Gender: json['Gender'],
      );
}
