import 'package:cloud_firestore/cloud_firestore.dart';

class Complaint {
  final String id;
  final String userId;
  final String description;
  final String status;
  final List<String> evidenceUrls;
  final DateTime createdAt;

  Complaint({
    required this.id,
    required this.userId,
    required this.description,
    required this.status,
    required this.evidenceUrls,
    required this.createdAt,
  });

  factory Complaint.fromMap(String id, Map<String, dynamic> data) {
    return Complaint(
      id: id,
      userId: data['userId'],
      description: data['description'],
      status: data['status'],
      evidenceUrls: List<String>.from(data['evidenceUrls'] ?? []),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
}