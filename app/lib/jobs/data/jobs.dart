class Client {
  final int price;
  final String jobtype;
  final String location;

  Client({required this.price, required this.jobtype, required this.location});

  Map<String, dynamic> toCloud() => {
        'price': price,
        'jobtype': jobtype,
        'location': location,
      };

  static Client fromCloud(Map<String, dynamic> json) => Client(
        price: json['price'],
        jobtype: json['jobtype'],
        location: json['location'],
      );
}
