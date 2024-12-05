class Message {
  Message({
    required this.message,
    required this.timestamp,
    required this.isSentByMe,
    this.isRead = false,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'],
      timestamp: json['timestamp'],
      isSentByMe: json['isSentByMe'],
      isRead: json['isRead'] ?? false,
    );
  }

  final String message;
  final DateTime timestamp;
  final bool isSentByMe;
  final bool isRead;

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'timestamp': timestamp,
      'isSentByMe': isSentByMe,
      'isRead': isRead,
    };
  }
}
