class WorkDetailUser {
  final String userId;
  final String fullName;
  final String email;
  final String mobileNo;
  final String category;
  final String organizationName;
  final String designation;
  final String serviceDetails;
  final String address;
  final String currentAddress;
  final String currentPincode;
  final String currentCity;
  final String currentState;
  // final bool isAvailable;
  final double userAvgRating;
  final double providerAvgRating;
  final String selfieFile;
  final String kycStatus;
  final String aadharNo;
  final String paymentStatus;
  final DateTime joinDate;
  final double walletBalance;
  final DateTime workRequestDate;
  final String callRequestStatus;
  final double userRating;
  final double providerRating;
  final String rewardRefNo;
  // final bool rewardPaymentVerified;

  WorkDetailUser({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.mobileNo,
    required this.category,
    required this.organizationName,
    required this.designation,
    required this.serviceDetails,
    required this.address,
    required this.currentAddress,
    required this.currentPincode,
    required this.currentCity,
    required this.currentState,
    // required this.isAvailable,
    required this.userAvgRating,
    required this.providerAvgRating,
    required this.selfieFile,
    required this.kycStatus,
    required this.aadharNo,
    required this.paymentStatus,
    required this.joinDate,
    required this.walletBalance,
    required this.workRequestDate,
    required this.callRequestStatus,
    required this.userRating,
    required this.providerRating,
    required this.rewardRefNo,
    // required this.rewardPaymentVerified,
  });
}
