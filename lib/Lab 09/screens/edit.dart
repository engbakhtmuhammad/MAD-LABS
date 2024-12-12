import 'package:flutter/material.dart';

import '../model/post.dart';
import '../services/api.dart';

class EditPostScreen extends StatefulWidget {
  final Post post;

  EditPostScreen({required this.post});

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.post.title;
    _bodyController.text = widget.post.body;
  }

  void _submitEdit() async {
    final updatedPost = Post(
      id: widget.post.id,
      title: _titleController.text,
      body: _bodyController.text,
    );

    try {
      await _apiService.updatePost(widget.post.id, updatedPost);
      Navigator.pop(context, updatedPost);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update post')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitEdit,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
