import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UlasanPage extends StatefulWidget {
  final int wisataId;

  const UlasanPage({Key? key, required this.wisataId}) : super(key: key);

  @override
  _UlasanPageState createState() => _UlasanPageState();
}

class _UlasanPageState extends State<UlasanPage> {
  int? _selectedRating;
  TextEditingController _reviewController = TextEditingController();

  bool _isLoading = false;
  List<dynamic> _ulasanList = [];
  String _username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
    _fetchUlasanList();
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('email') ?? 'Anonymous';
    });
  }

  Future<void> _fetchUlasanList() async {
    setState(() {
      _isLoading = true;
    });

    final url =
        'http://192.168.1.53:3000/api/ulasan/${widget.wisataId}'; // Replace with your API URL
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print("Fetched Ulasan Data: $jsonData"); // Debugging print
        setState(() {
          _ulasanList = jsonData['data'];
          _isLoading = false;
        });
        print("Ulasan List: $_ulasanList"); // Debugging print
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error: $e');
    }
  }

  Future<void> _submitUlasan() async {
    if (_selectedRating == null) {
      print('Rating not selected');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final url =
        'http://192.168.1.53:3000/api/addUlasan'; // Replace with your API URL
    final body = {
      'wisata_id': widget.wisataId,
      'username': _username,
      'rating': _selectedRating,
      'review': _reviewController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Review successfully added, fetch the latest reviews
        await _fetchUlasanList();
        // Clear input fields
        _selectedRating = null;
        _reviewController.clear();
      } else {
        print('Failed to add review');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ulasan'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Username: $_username'),
                  DropdownButtonFormField<int>(
                    value: _selectedRating,
                    onChanged: (value) {
                      setState(() {
                        _selectedRating = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Rating'),
                    items:
                        [1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Row(
                          children: List.generate(
                            value,
                            (index) => Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  TextFormField(
                    controller: _reviewController,
                    decoration: InputDecoration(labelText: 'Review'),
                    maxLines: 5,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _submitUlasan();
                    },
                    child: Text('Submit'),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Ulasan Wisata',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  _ulasanList.isEmpty
                      ? Center(child: Text('Belum ada ulasan untuk wisata ini'))
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _ulasanList.length,
                          itemBuilder: (context, index) {
                            final ulasan = _ulasanList[index];
                            print(
                                "Displaying Ulasan: $ulasan"); // Debugging print
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                title: Text(ulasan['username']),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.yellow),
                                        SizedBox(width: 4),
                                        Text(ulasan['rating'].toString()),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(ulasan['review']),
                                  ],
                                ),
                                trailing: Text(ulasan['created_at']),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
    );
  }
}
