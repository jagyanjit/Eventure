class Event {
  final String id;
  final String title;
  final String description;
  final DateTime dateTime;
  final String location;
  final String category;
  final String imageUrl;
  final double? price;
  final int? attendees;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.location,
    required this.category,
    required this.imageUrl,
    this.price,
    this.attendees,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'].toString(),
      title: json['title'] ?? json['name'] ?? 'Untitled Event',
      description: json['description'] ?? 'No description available',
      dateTime: DateTime.parse(
          json['datetime'] ?? json['date'] ?? DateTime.now().toIso8601String()),
      location: json['location'] ?? json['venue']?['name'] ?? 'TBA',
      category: json['category'] ?? json['type'] ?? 'General',
      imageUrl: json['image_url'] ??
          json['performers']?[0]?['image'] ??
          'https://via.placeholder.com/400x200',
      price: json['price']?.toDouble(),
      attendees: json['attendees']?.toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'datetime': dateTime.toIso8601String(),
      'location': location,
      'category': category,
      'image_url': imageUrl,
      'price': price,
      'attendees': attendees,
    };
  }
}
