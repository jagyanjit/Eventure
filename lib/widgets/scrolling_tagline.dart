import 'package:flutter/material.dart';

class ScrollingTagline extends StatefulWidget {
  const ScrollingTagline({super.key});

  @override
  State<ScrollingTagline> createState() => _ScrollingTaglineState();
}

class _ScrollingTaglineState extends State<ScrollingTagline>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final ScrollController _scrollController = ScrollController();

  static const String tagline =
      'You can take the man out of the city, not the city outta him.  •  ';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Start auto-scrolling
    _startScrolling();
  }

  void _startScrolling() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;

    _scrollController
        .animateTo(
      1000,
      duration: const Duration(seconds: 20),
      curve: Curves.linear,
    )
        .then((_) {
      if (mounted) {
        _scrollController.jumpTo(0);
        _startScrolling();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 24,
      child: ListView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Text(
            '$tagline$tagline$tagline$tagline',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.secondary,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
