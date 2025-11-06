import 'package:flutter/material.dart';
import '../widgets/empty_state.dart';

class EventHistoryScreen extends StatelessWidget {
  const EventHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event History'),
      ),
      body: const EmptyState(
        icon: Icons.history,
        title: 'No event history yet',
        subtitle: 'Events you attend will appear here',
      ),
    );
  }
}
