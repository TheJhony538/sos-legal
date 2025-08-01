import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/job.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JobsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empleos Verificados'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('jobs').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final jobs = snapshot.data!.docs
              .map((doc) => Job.fromMap(doc.id, doc.data() as Map<String, dynamic>))
              .toList();
          return ListView.builder(
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              final job = jobs[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(job.title),
                  subtitle: Text(job.description),
                  trailing: job.isVerified
                      ? Icon(Icons.verified, color: Colors.blue[700])
                      : Icon(Icons.warning, color: Colors.grey),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(job.title),
                        content: Text(job.description),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              await FirebaseFirestore.instance.collection('applications').add({
                                'userId': FirebaseAuth.instance.currentUser!.uid,
                                'jobId': job.id,
                                'createdAt': FieldValue.serverTimestamp(),
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Postulación enviada')),
                              );
                              Navigator.pop(context);
                            },
                            child: Text('Postular', style: TextStyle(color: Colors.blue[700])),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ).animate().slideY(begin: 0.2, duration: 500.ms);
            },
          );
        },
      ),
    );
  }
}