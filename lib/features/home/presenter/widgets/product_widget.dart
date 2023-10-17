import 'package:flutter/material.dart';
import 'package:unlee/core/utils/converter.dart';

class ProductWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final int price;
  final int stock;
  final String category;
  final String expiredAt;
  final Function() onClick;

  const ProductWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
    required this.category,
    required this.expiredAt,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: InkWell(
        onTap: onClick,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                    flex: 0,
                    child: Image.network(
                      imageUrl,
                      width: 120,
                      height: 120,
                      cacheWidth: 200,
                    )),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Flex(
                            direction: Axis.vertical,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                toRupiah(price),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text("Expired : $expiredAt"),
                            ],
                          ),
                        ),
                        Flex(
                          direction: Axis.vertical,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Stock"),
                            Text(
                              "$stock",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductWidgetGrid extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final int price;
  final int stock;
  final String category;
  final String expiredAt;
  final Function() onClick;
  final Function() addToChart;

  const ProductWidgetGrid({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
    required this.category,
    required this.expiredAt,
    required this.onClick,
    required this.addToChart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: InkWell(
        onTap: onClick,
        child: Flex(
          mainAxisSize: MainAxisSize.max,
          direction: Axis.vertical,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  color: Colors.black26,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        if (loadingProgress.expectedTotalBytes != null) {
                          if (loadingProgress.cumulativeBytesLoaded ==
                              loadingProgress.expectedTotalBytes!) {
                            return child;
                          } else {
                            return const Center(
                              child: SizedBox(
                                height: 32,
                                width: 32,
                                child: CircularProgressIndicator(
                                  color: Colors.pink,
                                ),
                              ),
                            );
                          }
                        } else {
                          return const Center(
                            child: SizedBox(
                              height: 32,
                              width: 32,
                              child: CircularProgressIndicator(
                                color: Colors.pink,
                              ),
                            ),
                          );
                        }
                      } else {
                        return child;
                      }
                    },
                    width: double.infinity,
                    cacheWidth: 300,
                  ),
                ),
              ),
            ),
            const Divider(
              height: 10,
              color: Colors.transparent,
            ),
            Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Divider(
                  height: 8,
                  color: Colors.transparent,
                ),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      toRupiah(price),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Expanded(
                      child: Text(""),
                    ),
                    InkWell(
                      onTap: addToChart,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 4,
                          left: 10,
                          bottom: 4,
                        ),
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
