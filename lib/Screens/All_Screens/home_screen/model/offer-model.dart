class OfferData {
  final String userId;
  final String fullName;
  final String email;
  final String mobileNumber;
  final String category;
  final String organizationName;
  final String designation;
  final String serviceDetails;
  final String address;
  // final String currentAddress;
  final String currentPincode;
  final String currentCity;
  final String currentState;
  final String isAvailable;
  final String userAverageRating;
  final String providerAverageRating;
  final String selfieFile;
  final String offerValidity;
  final String offerFile;
  final String offerDate;
  final String kycStatus;

  OfferData({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.mobileNumber,
    required this.category,
    required this.organizationName,
    required this.designation,
    required this.serviceDetails,
    required this.address,
    // required this.currentAddress,
    required this.currentPincode,
    required this.currentCity,
    required this.currentState,
    required this.isAvailable,
    required this.userAverageRating,
    required this.providerAverageRating,
    required this.selfieFile,
    required this.offerValidity,
    required this.offerFile,
    required this.offerDate,
    required this.kycStatus,
  });

  factory OfferData.fromJson(Map json) {
    return OfferData(
      userId: json['userid'],
      fullName: json['fullname'],
      email: json['email'],
      mobileNumber: json['mobile_no'],
      category: json['category'],
      organizationName: json['organization_name'],
      designation: json['designation'],
      serviceDetails: json['service_details'],
      address: json['address'],
      // currentAddress: json['cur_address'],
      currentPincode: json['cur_pincode'],
      currentCity: json['cur_city'],
      currentState: json['cur_state'],
      isAvailable: json['isavailable'],
      userAverageRating: json['user_avg_rating'],
      providerAverageRating: json['provider_avg_rating'],
      selfieFile: json['selfifile'],
      offerValidity: json['offervalidity'],
      offerFile: json['offerfile'],
      offerDate: json['offerdate'],
      kycStatus: json['kycstatus'],
    );
  }
}
