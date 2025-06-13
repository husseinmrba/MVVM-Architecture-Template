import 'dart:async';
import 'package:flutter/material.dart';
import 'package:store_ads/core/widgets/custom_progress_indicator.dart';
import 'package:video_player/video_player.dart';

class BannerItem {
  final String url;
  final String? thumbnailUrl;
  final bool isVideo;

  BannerItem({
    required this.url,
    this.thumbnailUrl,
  }) : isVideo = url.toLowerCase().endsWith('.mp4');
}

class BannerCarousel extends StatefulWidget {
  final List<BannerItem> items;
  final double height;
  final double maxImageWidth;
  final EdgeInsetsGeometry padding;

  const BannerCarousel({
    super.key,
    required this.items,
    this.height = 200.0,
    this.maxImageWidth = 350,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
  });

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late final PageController _controller;
  Timer? _timer;
  int _currentPage = 0;
  final Map<int, VideoPlayerController> _videoControllers = {};
  final Map<int, Future<void>> _videoFutures = {};

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 7), (timer) async {
      if (_controller.hasClients && mounted) {
        int nextPage = _currentPage + 1;
        if (nextPage >= widget.items.length) {
          // فوراً ارجع لأول صفحة بدون تمرير سريع
          _controller.jumpToPage(0);

          // نؤجل تحديث الحالة قليلاً بعد القفز مباشرة
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _currentPage = 0;
              });
            }
          });
        } else {
          await _controller.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          if (mounted) {
            setState(() {
              _currentPage = nextPage;
            });
          }
        }
      }
    });
  }

  void _stopAutoScroll() {
    _timer?.cancel();
  }

  void _initVideo(int index) {
    final url = widget.items[index].url;
    if (!_videoControllers.containsKey(index)) {
      final controller = VideoPlayerController.networkUrl(Uri.parse(url));
      _videoControllers[index] = controller;
      _videoFutures[index] = controller.initialize();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    for (var controller in _videoControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // نحدد العرض بناءً على الشاشة والحد الأقصى
    final imageWidth =
        screenWidth < widget.maxImageWidth ? screenWidth : widget.maxImageWidth;

    return SizedBox(
      height: widget.height,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              // وقف تشغيل الفيديو الحالي لو شغال
              if (_videoControllers[_currentPage]?.value.isPlaying ?? false) {
                _videoControllers[_currentPage]?.pause();
              }
              setState(() {
                _currentPage = index;
              });
              // لو حابب تشغل الفيديو تلقائياً عند التبديل (اختياري)
              // _videoControllers[index]?.play();
            },
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];

              final content = item.isVideo
                  ? _buildVideoItem(item, index)
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        item.url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: widget.height,
                      ),
                    );

              return Padding(
                padding: widget.padding,
                child: Center(
                  child: SizedBox(
                    width: imageWidth,
                    child: content,
                  ),
                ),
              );
            },
          ),
          // Dots Indicator
          // Dots Indicator
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.items.length, (index) {
                final isActive = _currentPage == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  width: isActive ? 12 : 8,
                  height: isActive ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? Colors.white : Colors.white54,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoItem(BannerItem item, int index) {
    _initVideo(index);

    return FutureBuilder(
      future: _videoFutures[index],
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CustomProgressIndicator(
              size: 25,
            ),
          );
        }
        final controller = _videoControllers[index]!;

        return Stack(
          alignment: Alignment.center,
          children: [
            if (!controller.value.isPlaying)
              item.thumbnailUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        item.thumbnailUrl!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: widget.height,
                      ),
                    )
                  : const ColoredBox(color: Colors.black), // fallback
            if (controller.value.isInitialized && controller.value.isPlaying)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: widget.height,
                  child: VideoPlayer(controller),
                ),
              ),

            IconButton(
              icon: Icon(
                controller.value.isPlaying
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_fill,
                size: 64,
                color: Colors.white.withOpacity(0.1),
              ),
              onPressed: () {
                setState(() {
                  if (controller.value.isPlaying) {
                    controller.pause();
                    _startAutoScroll();
                  } else {
                    controller.play();
                    _stopAutoScroll();
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }
}
