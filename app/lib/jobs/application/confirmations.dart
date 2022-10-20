class confirmations {
  final String message; 

  confirmations({required this.message});

  Map<String, dynamic> toCloud() => {
        'email': message,
      };

  static confirmations fromCloud(Map<String, dynamic> json) => confirmations(
        message: json['email'],
        
      );
}
