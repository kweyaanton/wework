class Clients {
  var UID;
  final String email; 

  Clients({required this.email, required this.UID});

  Map<String, dynamic> toCloud() => {
        'UID': UID,
        'email': email,
      };

  static Clients fromCloud(Map<String, dynamic> json) => Clients(
        UID: json['UID'],
        email: json['email'],
        
      );
}
