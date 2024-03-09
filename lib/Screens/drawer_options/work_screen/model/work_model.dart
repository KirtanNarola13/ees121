import 'dart:convert';

WorkApi WorkApiFromJson(String str) => WorkApi.fromJson(json.decode(str));

String WorkApiToJson(WorkApi data) => json.encode(data.toJson());

class WorkApi {
  final List<Datum> workSent;
  final List<Datum> workReceived;

  WorkApi({
    required this.workSent,
    required this.workReceived,
  });

  factory WorkApi.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return WorkApi(
      workSent: List<Datum>.from((data["worksent"] as List<dynamic>? ?? [])
          .map((x) => Datum.fromJson(x))),
      workReceived: List<Datum>.from(
          (data["workreceived"] as List<dynamic>? ?? [])
              .map((x) => Datum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "worksent": List<dynamic>.from(workSent.map((x) => x.toJson())),
        "workreceived": List<dynamic>.from(workReceived.map((x) => x.toJson())),
      };
}

class Datum {
  final String userid; // Add this field
  final String fullname;
  final String email;
  final String mobileNo;
  final String category;
  final String organizationName;
  final String designation;
  final String serviceDetails;
  final String address;
  final String curAddress;
  final String curPincode;
  final String curCity;
  final String curState;
  final String isAvailable;
  final String userAvgRating;
  final String providerAvgRating;
  final String selfiFile;
  final String kycStatus;
  final String adharNo;
  final String paymentStatus;
  final String joinDate;
  final String walletBalance;
  final String workRequestDate;
  final String callRequestStatus;
  final String userRating;
  final String providerRating;
  final String rewardRefNo;
  final String rewardPaymentVerified;

  Datum({
    required this.userid,
    required this.fullname,
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
    required this.selfiFile,
    required this.kycStatus,
    required this.adharNo,
    required this.paymentStatus,
    required this.joinDate,
    required this.walletBalance,
    required this.workRequestDate,
    required this.callRequestStatus,
    required this.userRating,
    required this.providerRating,
    required this.rewardRefNo,
    required this.rewardPaymentVerified,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userid: json["userid"] ?? "", // Add this line
        fullname: json["fullname"] ?? "",
        email: json["email"] ?? "",
        mobileNo: json["mobile_no"] ?? "",
        category: json["category"] ?? "",
        organizationName: json["organization_name"] ?? "",
        designation: json["designation"] ?? "",
        serviceDetails: json["service_details"] ?? "",
        address: json["address"] ?? "",
        curAddress: json["cur_address"] ?? "",
        curPincode: json["cur_pincode"] ?? "",
        curCity: json["cur_city"] ?? "",
        curState: json["cur_state"] ?? "",
        isAvailable: json["isavailable"] ?? "",
        userAvgRating: json["user_avg_rating"] ?? "",
        providerAvgRating: json["provider_avg_rating"] ?? "",
        selfiFile: json["selfifile"] ?? "",
        kycStatus: json["kycstatus"] ?? "",
        adharNo: json["adharno"] ?? "",
        paymentStatus: json["paymentstatus"] ?? "",
        joinDate: json["joindate"] ?? "",
        walletBalance: json["walletbalance"] ?? "",
        workRequestDate: json["workrequestdate"] ?? "",
        callRequestStatus: json["callrequest_status"] ?? "",
        userRating: json["user_rating"] ?? "",
        providerRating: json["provider_rating"] ?? "",
        rewardRefNo: json["reward_refno"] ?? "",
        rewardPaymentVerified: json["reward_payment_verified"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "userid": userid, // Add this line
        "fullname": fullname,
        "email": email,
        "mobile_no": mobileNo,
        "category": category,
        "organization_name": organizationName,
        "designation": designation,
        "service_details": serviceDetails,
        "address": address,
        "cur_address": curAddress,
        "cur_pincode": curPincode,
        "cur_city": curCity,
        "cur_state": curState,
        "isavailable": isAvailable,
        "user_avg_rating": userAvgRating,
        "provider_avg_rating": providerAvgRating,
        "selfifile": selfiFile,
        "kycstatus": kycStatus,
        "adharno": adharNo,
        "paymentstatus": paymentStatus,
        "joindate": joinDate,
        "walletbalance": walletBalance,
        "workrequestdate": workRequestDate,
        "callrequest_status": callRequestStatus,
        "user_rating": userRating,
        "provider_rating": providerRating,
        "reward_refno": rewardRefNo,
        "reward_payment_verified": rewardPaymentVerified,
      };
}
