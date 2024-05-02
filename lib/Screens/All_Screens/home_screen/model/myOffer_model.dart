class MyOfferModel {
  String? userId;
  String? fullName;
  String? email;
  String? mobileNo;
  String? category;
  String? organizationName;
  String? designation;
  String? serviceDetails;
  String? address;
  String? curAddress;
  String? curPincode;
  String? curCity;
  String? curState;
  String? isAvailable;
  String? userAvgRating;
  String? providerAvgRating;
  String? selfieFile;
  String? offerValidity;
  String? offerFile;
  String? offerDate;
  String? kycStatus;

  MyOfferModel({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.mobileNo,
    required this.category,
    required this.organizationName,
    required this.designation,
    required this.serviceDetails,
    required this.address,
    required this.curAddress,
    required this.curPincode,
    required this.curCity,
    required this.curState,
    required this.isAvailable,
    required this.userAvgRating,
    required this.providerAvgRating,
    required this.selfieFile,
    required this.offerValidity,
    required this.offerFile,
    required this.offerDate,
    required this.kycStatus,
  });

  factory MyOfferModel.fromJson(Map<String, dynamic> json) {
    return MyOfferModel(
      userId: json['userid'],
      fullName: json['fullname'],
      email: json['email'],
      mobileNo: json['mobile_no'],
      category: json['category'],
      organizationName: json['organization_name'],
      designation: json['designation'],
      serviceDetails: json['service_details'],
      address: json['address'],
      curAddress: json['cur_address'],
      curPincode: json['cur_pincode'],
      curCity: json['cur_city'],
      curState: json['cur_state'],
      isAvailable: json['isavailable'],
      userAvgRating: json['user_avg_rating'],
      providerAvgRating: json['provider_avg_rating'],
      selfieFile: json['selfifile'],
      offerValidity: json['offervalidity'],
      offerFile: json['offerfile'],
      offerDate: json['offerdate'],
      kycStatus: json['kycstatus'],
    );
  }
}
