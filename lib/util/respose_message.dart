class ResponseMessage {
  String message;
  bool success;

  ResponseMessage(
      {required this.message, required this.success});

  factory ResponseMessage.fromJson(Map<String, dynamic> json) =>
      ResponseMessage(
        message: json['message'] ?? '',
        success: json['status'] ?? '',
      );
}
