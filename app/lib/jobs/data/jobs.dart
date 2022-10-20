class Client {
  final int price;
  final String jobtype;
  final String location;
  var ID;

  Client({required this.price, required this.jobtype, required this.location,required this.ID});

  Map<String, dynamic> toCloud() => {
        'price': price,
        'jobtype': jobtype,
        'location': location,
        'ID': ID,
      };

  static Client fromCloud(Map<String, dynamic> json) => Client(
        price: json['price'],
        jobtype: json['jobtype'],
        location: json['location'],
        ID: json['ID'],
      );
}
