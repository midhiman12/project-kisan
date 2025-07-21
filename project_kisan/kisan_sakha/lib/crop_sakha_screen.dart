import 'package:flutter/material.dart';
import 'dart:io';        // For File
import 'package:image_picker/image_picker.dart';   // For XFile

class CropSakhaScreen extends StatefulWidget {
  final String selectedLanguage;
  const CropSakhaScreen({required this.selectedLanguage, Key? key}) : super(key: key);
  @override
  State<CropSakhaScreen> createState() => _CropSakhaScreenState();
}

class _CropSakhaScreenState extends State<CropSakhaScreen> {
  XFile? _pickedImage;
  String? _voiceText;
  bool _isProcessing = false;
  // TODO: Replace with actual diagnose result model
  String? _diagnosisResult;

  void _pickImage() async {
    // TODO: image_picker logic
  }

  void _startVoice() async {
    // TODO: speech-to-text logic
  }

  void _submit() async {
    if (_pickedImage == null && (_voiceText == null || _voiceText!.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please upload an image or describe the issue.')));
      return;
    }
    setState(() => _isProcessing = true);
    // TODO: call backend logic here
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isProcessing = false;
      _diagnosisResult = 'Leaf shows signs of blight. Recommended treatment: apply fungicide.';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('New Diagnosis', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {
                  setState(() {
                    _pickedImage = null;
                    _voiceText = null;
                    _diagnosisResult = null;
                  });
                }, child: Text('Start Over')),
              ]),
              SizedBox(height: 12),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: theme.dividerColor),
                  ),
                  child: _pickedImage != null
                      ? Image.file(File(_pickedImage!.path), fit: BoxFit.cover)
                      : Center(child: Icon(Icons.cloud_upload, size: 48, color: theme.hintColor)),
                ),
              ),
              SizedBox(height: 12),
              Text('Voice Description', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Row(children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: theme.dividerColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(_voiceText ?? 'Press the mic and describe…', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(width: 8),
                FloatingActionButton.small(
                  backgroundColor: theme.colorScheme.secondary,
                  onPressed: _startVoice,
                  child: Icon(Icons.mic, color: Colors.white),
                )
              ]),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _isProcessing ? null : _submit,
                icon: _isProcessing ? SizedBox(
                  width: 18, height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                ) : Icon(Icons.search),
                label: Text(_isProcessing ? 'Analyzing...' : 'Get Diagnosis'),
              )
            ]),
          ),
        ),

        if (_diagnosisResult != null)
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Diagnosis Result', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold).copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(_diagnosisResult!),
                SizedBox(height: 12),
                ElevatedButton(onPressed: () {
                  // TODO: schedule reminder logic
                }, child: Text('Set Reminder'))
              ]),
            ),
          )
      ]),
    );
  }
}
