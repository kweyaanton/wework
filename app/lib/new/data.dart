class NavigationItem {
  String title;

  NavigationItem(this.title);
}

List<NavigationItem> getNavigationItemList() {
  return <NavigationItem>[
    NavigationItem("Jobs"),
    NavigationItem("Applications"),
    NavigationItem("wallet")
  ];
}

class Application {
  String position;
  String company;
  String status;
  String price;
  String logo;

  Application(this.position, this.company, this.status, this.price, this.logo);
}

List<Application> getApplications() {
  var status = "pending";

  return <Application>[
    Application("wework.", "delivery", status, "part-time",
        "assets/images/delivery.jpg"),
    Application("uganda cookery", "chef", status, "Part-Time",
        "assets/images/farmer.jpg"),
    Application("wework", "Baby siter", status, "per-day",
        "assets/images/babysiter.jpg"),
    Application("Namilyiango SS", "math tutor", status, "Part-week",
        "assets/images/tutor.jpg"),
    Application("uganda plumbers", "Plumbers", status, "plumber",
        "assets/images/tutor.jpg"),
  ];
}

class Job {
  String position;
  String company;
  String price;
  String concept;
  String logo;
  String city;

  Job(this.position, this.company, this.price, this.concept, this.logo,
      this.city);
}

List<Job> getJobs() {
  return <Job>[
    Job("wework.", "delivery", "4000", "part-time",
        "assets/images/delivery.jpg", "Kampala, Bwayise"),
    Job("uganda cookery", "chef", "12000", "Part-Time",
        "assets/images/farmer.jpg", "Mukono, UCU"),
    Job("wework", "Baby siter", "5000", "per-day",
        "assets/images/babysiter.jpg", "kampala, nakawa"),
    Job("Namilyiango SS", "math tutor", "50000", "Part-week",
        "assets/images/tutor.jpg", "Mukono, Namiliyango"),
    Job("uganda plumbers", "Plumbers", "60000", "plumber",
        "assets/images/tutor.jpg", "Kampala , Kyebando"),
  ];
}

List<String> getJobsRequirements() {
  return <String>[
    "Exceptional communication skills and team-working skills",
    "Know the principles of animation and you can create high fidelity prototypes",
    "Direct experience using Adobe Premiere, Adobe After Effects & other tools used to create videos, animations, etc.",
    "Good UI/UX knowledge",
  ];
}
