import 'package:flutter/material.dart';

class MandiSakhaScreen extends StatefulWidget {
  final String selectedLanguage;
  const MandiSakhaScreen({required this.selectedLanguage, Key? key}) : super(key: key);

  @override
  State<MandiSakhaScreen> createState() => _MandiSakhaScreenState();
}

class _MandiSakhaScreenState extends State<MandiSakhaScreen> {
  String? _selectedCrop;
  String? _selectedMandi;
  bool _isProcessing = false;
  String? _forecastResult;

  // Dummy data – replace with your crops and mandis lists
  final List<String> _crops = ['Tomato', 'Potato', 'Onion', 'Wheat', 'Rice'];
  final List<String> _mandis = ['Bangalore', 'Tumkur', 'Hassan', 'Mandya', 'Mysore'];

  void _getForecast() async {
    if (_selectedCrop == null || _selectedMandi == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select both crop and mandi')),
      );
      return;
    }
    setState(() {
      _isProcessing = true;
      _forecastResult = null;
    });
    // TODO: Replace with real API call
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isProcessing = false;
      _forecastResult =
          'Forecast: Tomato prices in Bangalore likely to rise by 8% next week based on last 7 days’ trend.';
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
                  Text('Mandi Sakha Forecast', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text(
                    'Get price trends and a simple forecast for your crop.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedCrop,
                    decoration: InputDecoration(
                      labelText: 'Crop',
                      border: OutlineInputBorder(),
                    ),
                    items: _crops.map((crop) {
                      return DropdownMenuItem(
                        value: crop,
                        child: Text(crop),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedCrop = val),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedMandi,
                    decoration: InputDecoration(
                      labelText: 'Mandi (Market)',
                      border: OutlineInputBorder(),
                    ),
                    items: _mandis.map((mandi) {
                      return DropdownMenuItem(
                        value: mandi,
                        child: Text(mandi),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedMandi = val),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _isProcessing ? null : _getForecast,
                    icon: _isProcessing
                        ? SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          )
                        : Icon(Icons.search),
                    label: Text(_isProcessing ? 'Analyzing...' : 'Get Forecast'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 48),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_forecastResult != null)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Forecast Result', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(_forecastResult!, style: theme.textTheme.bodyLarge),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
