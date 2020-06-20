class ToData {
  Map data = {
    "1": [
      {"time": "15:30", "location": "Pari Chowk"},
      {"time": "18:30", "location": "Pari Chowk"},
      {"time": "18:00", "location": "Sector 16"}
    ],
    "2": [
      {"time": "15:30", "location": "Pari Chowk"},
      {"time": "18:00", "location": "Sector 16"}
    ],
    "3": [
      {"time": "15:30", "location": "Chowk"},
      {"time": "18:00", "location": "Sector 16"}
    ],
    "4": [
      {"time": "15:30", "location": "Pari Chowk"},
      {"time": "18:00", "location": "Sector 16"}
    ],
    "5": [
      {"time": "15:30", "location": "Pari Chowk"},
      {"time": "18:00", "location": "Sector 16"}
    ],
    "6": [
      {"time": "15:30", "location": "Pari Chowk"},
      {"time": "18:00", "location": "Sector 16"}
    ],
    "7": [
      {"time": "15:30", "location": "Pari Chowk"},
      {"time": "18:00", "location": "Sector 16"}
    ],
  };

  List getLocations(int _weekDay) {
    List temp =
        data['$_weekDay'].map((info) => info['location'].toString()).toList();
    List<String> _locations = new List<String>.from(temp);
    _locations = _locations.toSet().toList();
    return _locations;
  }

  List getTimings(int _weekDay, String _location) {
    List temp = data['$_weekDay'].map((info) {
      if (info['location'] == _location) return info['time'].toString();
    }).toList();
    temp.removeLast();
    return temp;
  }
}