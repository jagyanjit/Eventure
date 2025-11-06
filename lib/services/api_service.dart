import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/event.dart';

class ApiService {
  static const String baseUrl = 'https://api.seatgeek.com/2/events';
  static const String clientId = 'your_client_id';

  static Future<List<Event>> fetchEvents() async {
    try {
      final response = await http
          .get(
            Uri.parse('$baseUrl?client_id=$clientId&per_page=20'),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List eventsJson = data['events'];
        return eventsJson.map((json) => Event.fromJson(json)).toList();
      } else {
        return _getLocalEvents();
      }
    } catch (e) {
      debugPrint('API Error: $e');
      return _getLocalEvents();
    }
  }

  static List<Event> _getLocalEvents() {
    // 42 Indian-themed events with prices in ₹500-10000
    return [
      // Technology (8 events)
      Event(
        id: '1',
        title: 'India Tech Summit 2024',
        description:
            'The largest technology conference in India featuring AI, ML, and emerging tech innovations. Network with industry leaders and explore cutting-edge technologies.',
        dateTime: DateTime.now().add(const Duration(days: 5)),
        location: 'Bangalore International Exhibition Centre, Karnataka',
        category: 'Technology',
        imageUrl:
            'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800',
        price: 2999,
        attendees: 2500,
      ),
      Event(
        id: '2',
        title: 'Flutter India Dev Meetup',
        description:
            'Join fellow Flutter developers for an evening of talks, networking, and hands-on workshops. Learn about Flutter 3.0 and best practices.',
        dateTime: DateTime.now().add(const Duration(days: 7)),
        location: 'Microsoft Reactor, Gurgaon, Haryana',
        category: 'Technology',
        imageUrl:
            'https://images.unsplash.com/photo-1551434678-e076c223a692?w=800',
        price: 799,
        attendees: 180,
      ),
      Event(
        id: '3',
        title: 'Startup Grind Bangalore',
        description:
            'Monthly startup event featuring successful entrepreneurs, investors, and innovators. Learn from their journeys and network with the ecosystem.',
        dateTime: DateTime.now().add(const Duration(days: 12)),
        location: '91springboard, Koramangala, Bangalore',
        category: 'Technology',
        imageUrl:
            'https://images.unsplash.com/photo-1515187029135-18ee286d815b?w=800',
        price: 500,
        attendees: 250,
      ),
      Event(
        id: '4',
        title: 'Cybersecurity Summit India',
        description:
            'Learn about the latest cybersecurity threats and solutions. Expert speakers from government and private sectors.',
        dateTime: DateTime.now().add(const Duration(days: 18)),
        location: 'India Habitat Centre, New Delhi',
        category: 'Technology',
        imageUrl:
            'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=800',
        price: 1500,
        attendees: 450,
      ),
      Event(
        id: '5',
        title: 'Blockchain & Crypto Expo',
        description:
            'Explore the future of finance with blockchain technology and cryptocurrency. Workshops, talks, and networking.',
        dateTime: DateTime.now().add(const Duration(days: 25)),
        location: 'World Trade Centre, Mumbai, Maharashtra',
        category: 'Technology',
        imageUrl:
            'https://images.unsplash.com/photo-1639762681485-074b7f938ba0?w=800',
        price: 1200,
        attendees: 380,
      ),
      Event(
        id: '6',
        title: 'Women in Tech India',
        description:
            'Celebrating and empowering women in technology. Inspiring talks, mentorship sessions, and networking opportunities.',
        dateTime: DateTime.now().add(const Duration(days: 30)),
        location: 'Phoenix Marketcity, Pune, Maharashtra',
        category: 'Technology',
        imageUrl:
            'https://images.unsplash.com/photo-1573164713714-d95e436ab8d6?w=800',
        price: 699,
        attendees: 320,
      ),
      Event(
        id: '7',
        title: 'IoT India Congress',
        description:
            'Discover the Internet of Things applications in smart cities, healthcare, and agriculture. Live demos and use cases.',
        dateTime: DateTime.now().add(const Duration(days: 35)),
        location: 'Hyderabad International Convention Centre',
        category: 'Technology',
        imageUrl:
            'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?w=800',
        price: 1800,
        attendees: 520,
      ),
      Event(
        id: '8',
        title: 'DevOps Days Delhi',
        description:
            'Two-day conference on DevOps practices, tools, and culture. Hands-on workshops and expert talks.',
        dateTime: DateTime.now().add(const Duration(days: 40)),
        location: 'JW Marriott, Aerocity, New Delhi',
        category: 'Technology',
        imageUrl:
            'https://images.unsplash.com/photo-1504384764586-bb4cdc1707b0?w=800',
        price: 2200,
        attendees: 400,
      ),

      // Music (7 events)
      Event(
        id: '9',
        title: 'Sunburn Goa Festival',
        description:
            'Asia\'s biggest electronic music festival featuring international DJs and artists. Three days of non-stop music and entertainment.',
        dateTime: DateTime.now().add(const Duration(days: 60)),
        location: 'Vagator Beach, Goa',
        category: 'Music',
        imageUrl:
            'https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=800',
        price: 4999,
        attendees: 15000,
      ),
      Event(
        id: '10',
        title: 'NH7 Weekender',
        description:
            'Multi-genre music festival featuring indie, rock, electronic, and hip-hop artists from India and abroad.',
        dateTime: DateTime.now().add(const Duration(days: 45)),
        location: 'Mahalakshmi Race Course, Mumbai',
        category: 'Music',
        imageUrl:
            'https://images.unsplash.com/photo-1501281668745-f7f57925c3b4?w=800',
        price: 3500,
        attendees: 8000,
      ),
      Event(
        id: '11',
        title: 'Classical Music Night',
        description:
            'An evening of soulful Hindustani classical music by renowned artists. Experience the richness of Indian classical tradition.',
        dateTime: DateTime.now().add(const Duration(days: 15)),
        location: 'Kamani Auditorium, New Delhi',
        category: 'Music',
        imageUrl:
            'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=800',
        price: 800,
        attendees: 350,
      ),
      Event(
        id: '12',
        title: 'Bollywood Music Concert',
        description:
            'Live performance by top Bollywood singers. Sing along to your favorite Hindi film songs.',
        dateTime: DateTime.now().add(const Duration(days: 22)),
        location: 'NSCI Dome, Mumbai, Maharashtra',
        category: 'Music',
        imageUrl:
            'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800',
        price: 1500,
        attendees: 5000,
      ),
      Event(
        id: '13',
        title: 'Indie Music Fest Bangalore',
        description:
            'Showcasing independent Indian artists across genres. Support local talent and discover new music.',
        dateTime: DateTime.now().add(const Duration(days: 28)),
        location: 'Jayamahal Palace Grounds, Bangalore',
        category: 'Music',
        imageUrl:
            'https://images.unsplash.com/photo-1506157786151-b8491531f063?w=800',
        price: 999,
        attendees: 2500,
      ),
      Event(
        id: '14',
        title: 'Jazz by the Bay',
        description:
            'Smooth jazz evening with live performances. Enjoy great music, food, and drinks by the waterfront.',
        dateTime: DateTime.now().add(const Duration(days: 10)),
        location: 'Gateway of India, Mumbai',
        category: 'Music',
        imageUrl:
            'https://images.unsplash.com/photo-1415201364774-f6f0bb35f28f?w=800',
        price: 1200,
        attendees: 180,
      ),
      Event(
        id: '15',
        title: 'Sufi Music Night',
        description:
            'Experience the mystical world of Sufi music. Soul-stirring performances that touch the heart.',
        dateTime: DateTime.now().add(const Duration(days: 20)),
        location: 'Siri Fort Auditorium, Delhi',
        category: 'Music',
        imageUrl:
            'https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?w=800',
        price: 600,
        attendees: 420,
      ),

      // Arts & Culture (7 events)
      Event(
        id: '16',
        title: 'India Art Fair',
        description:
            'South Asia\'s leading international art fair showcasing modern and contemporary art from galleries worldwide.',
        dateTime: DateTime.now().add(const Duration(days: 50)),
        location: 'NSIC Exhibition Grounds, Okhla, Delhi',
        category: 'Arts',
        imageUrl:
            'https://images.unsplash.com/photo-1460661419201-fd4cecdf8a8b?w=800',
        price: 500,
        attendees: 850,
      ),
      Event(
        id: '17',
        title: 'Kochi-Muziris Biennale',
        description:
            'International exhibition of contemporary art. One of the most significant art events in Asia.',
        dateTime: DateTime.now().add(const Duration(days: 90)),
        location: 'Fort Kochi, Kerala',
        category: 'Arts',
        imageUrl:
            'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?w=800',
        price: 600,
        attendees: 1200,
      ),
      Event(
        id: '18',
        title: 'Street Art Festival Mumbai',
        description:
            'Watch artists transform city walls into masterpieces. Graffiti, murals, and live art performances.',
        dateTime: DateTime.now().add(const Duration(days: 14)),
        location: 'Bandra West, Mumbai',
        category: 'Arts',
        imageUrl:
            'https://images.unsplash.com/photo-1499781350541-7783f6c6a0c8?w=800',
        price: 500,
        attendees: 520,
      ),
      Event(
        id: '19',
        title: 'Theatre Fest Delhi',
        description:
            'A week-long celebration of theatre featuring plays in Hindi, English, and regional languages.',
        dateTime: DateTime.now().add(const Duration(days: 32)),
        location: 'National School of Drama, Delhi',
        category: 'Arts',
        imageUrl:
            'https://images.unsplash.com/photo-1503095396549-807759245b35?w=800',
        price: 650,
        attendees: 280,
      ),
      Event(
        id: '20',
        title: 'Photography Exhibition: Indian Stories',
        description:
            'Capturing the diversity of India through lenses. Works by award-winning photographers.',
        dateTime: DateTime.now().add(const Duration(days: 8)),
        location: 'National Gallery of Modern Art, Bangalore',
        category: 'Arts',
        imageUrl:
            'https://images.unsplash.com/photo-1452587925148-ce544e77e70d?w=800',
        price: 550,
        attendees: 340,
      ),
      Event(
        id: '21',
        title: 'Traditional Dance Festival',
        description:
            'Showcasing classical Indian dance forms: Bharatanatyam, Kathak, Odissi, and more.',
        dateTime: DateTime.now().add(const Duration(days: 38)),
        location: 'Ravindra Bharathi, Hyderabad',
        category: 'Arts',
        imageUrl:
            'https://images.unsplash.com/photo-1508807526345-15e9b5f4eaff?w=800',
        price: 750,
        attendees: 450,
      ),
      Event(
        id: '22',
        title: 'Comic Con India',
        description:
            'The ultimate pop culture convention. Comics, cosplay, gaming, and celebrity guests.',
        dateTime: DateTime.now().add(const Duration(days: 55)),
        location: 'KTPO Trade Centre, Bangalore',
        category: 'Arts',
        imageUrl:
            'https://images.unsplash.com/photo-1612036782180-6f0b6cd846fe?w=800',
        price: 799,
        attendees: 3500,
      ),

      // Food & Culinary (6 events)
      Event(
        id: '23',
        title: 'The Great Indian Food Festival',
        description:
            'Taste culinary delights from all states of India. Street food, regional cuisines, and celebrity chefs.',
        dateTime: DateTime.now().add(const Duration(days: 16)),
        location: 'Jawaharlal Nehru Stadium, Delhi',
        category: 'Food',
        imageUrl:
            'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800',
        price: 600,
        attendees: 5200,
      ),
      Event(
        id: '24',
        title: 'Wine & Cheese Tasting',
        description:
            'An elegant evening of fine wines paired with artisanal cheeses. Expert sommeliers guide you through the experience.',
        dateTime: DateTime.now().add(const Duration(days: 21)),
        location: 'Taj Palace, New Delhi',
        category: 'Food',
        imageUrl:
            'https://images.unsplash.com/photo-1510812431401-41d2bd2722f3?w=800',
        price: 3500,
        attendees: 120,
      ),
      Event(
        id: '25',
        title: 'Street Food Carnival',
        description:
            'The best street food vendors from across India under one roof. Chaat, biryani, momos, and more!',
        dateTime: DateTime.now().add(const Duration(days: 6)),
        location: 'Phoenix Marketcity, Pune',
        category: 'Food',
        imageUrl:
            'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800',
        price: 500,
        attendees: 2800,
      ),
      Event(
        id: '26',
        title: 'Masterchef Live Cooking Show',
        description:
            'Watch celebrity chefs create magic in the kitchen. Live cooking demonstrations and Q&A.',
        dateTime: DateTime.now().add(const Duration(days: 27)),
        location: 'ITC Grand Chola, Chennai',
        category: 'Food',
        imageUrl:
            'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=800',
        price: 1500,
        attendees: 350,
      ),
      Event(
        id: '27',
        title: 'Vegan Food Festival',
        description:
            'Discover delicious plant-based cuisine. Cooking demos, health talks, and sustainable food practices.',
        dateTime: DateTime.now().add(const Duration(days: 42)),
        location: 'Indiranagar, Bangalore',
        category: 'Food',
        imageUrl:
            'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800',
        price: 700,
        attendees: 680,
      ),
      Event(
        id: '28',
        title: 'Dessert Festival Mumbai',
        description:
            'A sweet lover\'s paradise! Sample desserts from India and around the world.',
        dateTime: DateTime.now().add(const Duration(days: 11)),
        location: 'Bandra Kurla Complex, Mumbai',
        category: 'Food',
        imageUrl:
            'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=800',
        price: 650,
        attendees: 920,
      ),

      // Sports & Fitness (5 events)
      Event(
        id: '29',
        title: 'Mumbai Marathon',
        description:
            'India\'s most prestigious marathon. Full marathon, half marathon, and fun run categories.',
        dateTime: DateTime.now().add(const Duration(days: 70)),
        location: 'Chhatrapati Shivaji Terminus, Mumbai',
        category: 'Sports',
        imageUrl:
            'https://images.unsplash.com/photo-1452626038306-9aae5e071dd3?w=800',
        price: 1200,
        attendees: 45000,
      ),
      Event(
        id: '30',
        title: 'Yoga Day Celebration',
        description:
            'International Yoga Day celebration with mass yoga sessions, meditation, and wellness talks.',
        dateTime: DateTime.now().add(const Duration(days: 85)),
        location: 'India Gate, New Delhi',
        category: 'Sports',
        imageUrl:
            'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=800',
        price: 500,
        attendees: 8500,
      ),
      Event(
        id: '31',
        title: 'IPL Cricket Fan Fest',
        description:
            'Meet your favorite IPL players, games, activities, and live cricket screening.',
        dateTime: DateTime.now().add(const Duration(days: 48)),
        location: 'Chinnaswamy Stadium, Bangalore',
        category: 'Sports',
        imageUrl:
            'https://images.unsplash.com/photo-1531415074968-036ba1b575da?w=800',
        price: 899,
        attendees: 12000,
      ),
      Event(
        id: '32',
        title: 'Cycling Tour Goa',
        description:
            'A scenic cycling tour through the beautiful landscapes of Goa. All skill levels welcome.',
        dateTime: DateTime.now().add(const Duration(days: 24)),
        location: 'Panaji to Ponda, Goa',
        category: 'Sports',
        imageUrl:
            'https://images.unsplash.com/photo-1541625602330-2277a4c46182?w=800',
        price: 800,
        attendees: 250,
      ),
      Event(
        id: '33',
        title: 'Adventure Sports Expo',
        description:
            'Try rock climbing, zip-lining, bungee jumping, and more. Gear exhibition and workshops.',
        dateTime: DateTime.now().add(const Duration(days: 33)),
        location: 'Rishikesh, Uttarakhand',
        category: 'Sports',
        imageUrl:
            'https://images.unsplash.com/photo-1533167649158-6d508895b680?w=800',
        price: 1500,
        attendees: 780,
      ),

      // Business & Networking (5 events)
      Event(
        id: '34',
        title: 'Economic Times Startup Awards',
        description:
            'Celebrating India\'s most promising startups. Networking with founders, VCs, and industry leaders.',
        dateTime: DateTime.now().add(const Duration(days: 52)),
        location: 'Grand Hyatt, Mumbai',
        category: 'Business',
        imageUrl:
            'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800',
        price: 5000,
        attendees: 850,
      ),
      Event(
        id: '35',
        title: 'Women Entrepreneurs Summit',
        description:
            'Empowering women in business. Inspiring talks, mentorship, and networking opportunities.',
        dateTime: DateTime.now().add(const Duration(days: 29)),
        location: 'Leela Palace, Bangalore',
        category: 'Business',
        imageUrl:
            'https://images.unsplash.com/photo-1511578314322-379afb476865?w=800',
        price: 2500,
        attendees: 520,
      ),
      Event(
        id: '36',
        title: 'Digital Marketing Conference',
        description:
            'Learn latest digital marketing trends, SEO, social media strategies from industry experts.',
        dateTime: DateTime.now().add(const Duration(days: 19)),
        location: 'India Expo Mart, Greater Noida',
        category: 'Business',
        imageUrl:
            'https://images.unsplash.com/photo-1557804506-669a67965ba0?w=800',
        price: 1800,
        attendees: 940,
      ),
      Event(
        id: '37',
        title: 'Real Estate Expo India',
        description:
            'Explore residential and commercial properties. Meet developers and investment consultants.',
        dateTime: DateTime.now().add(const Duration(days: 44)),
        location: 'Bombay Exhibition Centre, Mumbai',
        category: 'Business',
        imageUrl:
            'https://images.unsplash.com/photo-1560518883-ce09059eeffa?w=800',
        price: 750,
        attendees: 3200,
      ),
      Event(
        id: '38',
        title: 'Franchise India Expo',
        description:
            'Discover franchise opportunities across sectors. Meet brands looking for partners.',
        dateTime: DateTime.now().add(const Duration(days: 63)),
        location: 'Pragati Maidan, New Delhi',
        category: 'Business',
        imageUrl:
            'https://images.unsplash.com/photo-1552664730-d307ca884978?w=800',
        price: 990,
        attendees: 2800,
      ),

      // Education & Workshops (4 events)
      Event(
        id: '39',
        title: 'TEDx Mumbai',
        description:
            'Ideas worth spreading. Inspiring talks from innovators, artists, and thought leaders.',
        dateTime: DateTime.now().add(const Duration(days: 36)),
        location: 'Sophia Bhabha Auditorium, Mumbai',
        category: 'Education',
        imageUrl:
            'https://images.unsplash.com/photo-1505373877841-8d25f7d46678?w=800',
        price: 1200,
        attendees: 650,
      ),
      Event(
        id: '40',
        title: 'Study Abroad Fair',
        description:
            'Meet representatives from universities worldwide. Guidance on admissions, visas, and scholarships.',
        dateTime: DateTime.now().add(const Duration(days: 17)),
        location: 'World Trade Center, Bangalore',
        category: 'Education',
        imageUrl:
            'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=800',
        price: 500,
        attendees: 1850,
      ),
      Event(
        id: '41',
        title: 'Photography Workshop by Prashanth Vishwanathan',
        description:
            'Learn from award-winning photographer. Hands-on sessions on portrait and street photography.',
        dateTime: DateTime.now().add(const Duration(days: 13)),
        location: 'Dilli Haat, New Delhi',
        category: 'Education',
        imageUrl:
            'https://images.unsplash.com/photo-1452587925148-ce544e77e70d?w=800',
        price: 3500,
        attendees: 45,
      ),
      Event(
        id: '42',
        title: 'Financial Planning Seminar',
        description:
            'Learn investment strategies, tax planning, and wealth creation from certified financial planners.',
        dateTime: DateTime.now().add(const Duration(days: 9)),
        location: 'Hotel Taj Vivanta, Pune',
        category: 'Education',
        imageUrl:
            'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=800',
        price: 800,
        attendees: 220,
      ),
    ];
  }
}
