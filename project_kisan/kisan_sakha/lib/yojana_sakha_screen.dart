import 'package:flutter/material.dart';

class YojanaSakhaScreen extends StatefulWidget {
  final String selectedLanguage;
  const YojanaSakhaScreen({required this.selectedLanguage, Key? key}) : super(key: key);

  @override
  State<YojanaSakhaScreen> createState() => _YojanaSakhaScreenState();
}

class _YojanaSakhaScreenState extends State<YojanaSakhaScreen> {
  String? _selectedState;
  String? _userQuery;
  bool _isProcessing = false;
  String? _schemeResult;

  // Dummy states – replace with your list of Indian states
  final List<String> _states = [
    'Karnataka', 'Andhra Pradesh', 'Telangana', 'Tamil Nadu', 'Maharashtra', 'West Bengal', 'Punjab'
  ];

  final TextEditingController _queryController = TextEditingController();

  void _findSchemes() async {
    if (_selectedState == null || (_userQuery == null || _userQuery!.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select your state and enter your question.')),
      );
      return;
    }
    setState(() {
      _isProcessing = true;
      _schemeResult = null;
    });
    // TODO: Replace with real API call
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isProcessing = false;
      _schemeResult = 'For your query in Karnataka: PM-Kisan Yojana, Crop Insurance Scheme, and Subsidy for Drip Irrigation are available. Visit your state agriculture portal for step-by-step application.';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Yojana Sakha', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text(
                    'Ask about government schemes for farmers in your state.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedState,
                    decoration: InputDecoration(
                      labelText: 'Select your state',
                      border: OutlineInputBorder(),
                    ),
                    items: _states.map((state) {
                      return DropdownMenuItem(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedState = val),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _queryController,
                    onChanged: (val) => _userQuery = val,
                    decoration: InputDecoration(
                      labelText: 'Your Question',
                      hintText: 'Ask e.g. "Is there any help for crop insurance?"',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.mic, color: theme.colorScheme.secondary),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _isProcessing ? null : _findSchemes,
                    icon: _isProcessing
                        ? SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          )
                        : Icon(Icons.search),
                    label: Text(_isProcessing ? 'Searching...' : 'Find Schemes'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 48),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_schemeResult != null)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Schemes Found', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(_schemeResult!, style: theme.textTheme.bodyLarge),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
