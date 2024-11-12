// import 'package:flutter/material.dart';
//
// class ImageWithProgress extends StatefulWidget {
//   const ImageWithProgress({
//     super.key,
//     required this.imageUrl,
//     required this.width,
//     required this.height,
//   });
//
//   final String imageUrl;
//   final double height;
//   final double width;
//
//   @override
//   _ImageWithProgressState createState() => _ImageWithProgressState();
// }
//
// class _ImageWithProgressState extends State<ImageWithProgress> {
//   bool _isLoading = true; // Track whether the image is loading
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Circular progress indicator while the image is loading
//         _isLoading
//             ? Center(child: CircularProgressIndicator())
//             : SizedBox.shrink(),
//
//         // Image loading with a loadingBuilder to handle progress and error state
//         Image.network(
//           widget.imageUrl,
//           width: widget.width,
//           height: widget.height,
//           fit: BoxFit.cover,
//           loadingBuilder: (BuildContext context, Widget child,
//               ImageChunkEvent? loadingProgress) {
//             if (loadingProgress == null) {
//               setState(() {
//                 _isLoading = false;
//               });
//               return child;
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(
//                   value: loadingProgress.expectedTotalBytes != null
//                       ? loadingProgress.cumulativeBytesLoaded /
//                           (loadingProgress.expectedTotalBytes ?? 1)
//                       : null,
//                 ),
//               );
//             }
//           },
//           errorBuilder: (context, error, stackTrace) {
//             return Center(child: Text('Failed to load image'));
//           },
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

class ImageWithProgress extends StatefulWidget {
  const ImageWithProgress({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  final String imageUrl;
  final double height;
  final double width;

  @override
  _ImageWithProgressState createState() => _ImageWithProgressState();
}

class _ImageWithProgressState extends State<ImageWithProgress> {
  bool _isLoading = true; // Track whether the image is loading

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12), // Rounded corners for the image
      child: Card(
        elevation: 8, // Adding elevation to the card
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12), // Rounded corners for the card
        ),
        shadowColor: Colors.black.withOpacity(0.2), // Slight shadow effect
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image loading with progress indicator
            Image.network(
              widget.imageUrl,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  // Image loaded, set loading state to false
                  setState(() {
                    _isLoading = false;
                  });
                  return AnimatedOpacity(
                    opacity: 1.0, // Fade-in effect once image is loaded
                    duration: const Duration(milliseconds: 500),
                    child: child,
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                // Show error message in case image fails to load
                return Center(
                  child: Icon(Icons.error, color: Colors.red, size: 30),
                );
              },
            ),
            // Optionally, add an overlay for text or gradient
            if (!_isLoading)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            // You can add any overlay content such as text here
            if (!_isLoading)
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Text(
                  'Your Image Title', // Example title
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
