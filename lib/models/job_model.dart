class JobModel {
    JobModel({
        required this.id,
        required this.name,
        required this.category,
        required this.companyName,
        required this.companyLogo,
        required this.location,
        required this.about,
        required this.qualifications,
        required this.responsibilities,
        required this.createdAt,
        required this.updatedAt,
    });

    final String? id;
    final String? name;
    final String? category;
    final String? companyName;
    final String? companyLogo;
    final String? location;
    final List<dynamic> about;
    final List<dynamic> qualifications;
    final List<dynamic> responsibilities;
    final int? createdAt;
    final int? updatedAt;

    factory JobModel.fromJson(Map<String, dynamic> json){ 
        return JobModel(
            id: json["id"],
            name: json["name"],
            category: json["category"],
            companyName: json["companyName"],
            companyLogo: json["companyLogo"],
            location: json["location"],
            about: json["about"] == null ? [] : List<dynamic>.from(json["about"]!.map((x) => x)),
            qualifications: json["qualifications"] == null ? [] : List<dynamic>.from(json["qualifications"]!.map((x) => x)),
            responsibilities: json["responsibilities"] == null ? [] : List<dynamic>.from(json["responsibilities"]!.map((x) => x)),
            createdAt: json["createdAt"],
            updatedAt: json["updatedAt"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "companyName": companyName,
        "companyLogo": companyLogo,
        "location": location,
        "about": about.map((x) => x).toList(),
        "qualifications": qualifications.map((x) => x).toList(),
        "responsibilities": responsibilities.map((x) => x).toList(),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };

}
