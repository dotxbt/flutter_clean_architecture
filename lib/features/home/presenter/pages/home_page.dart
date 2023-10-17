import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:unlee/features/home/presenter/widgets/product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animControl;
  double heightCart = 0;
  bool showAddProduct = false;
  bool showCart = false;
  bool isNego = false;

  @override
  void initState() {
    setState(() {
      animControl = AnimationController(
        vsync: this,
        upperBound: 0.5,
        duration: const Duration(milliseconds: 10),
      );
      animControl.addStatusListener((status) {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const SizedBox(
                width: 120,
              ),
              FloatingActionButton(
                backgroundColor: Colors.amber.shade600,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height - 300,
                    ),
                    backgroundColor: Colors.white,
                    barrierColor: Colors.black.withOpacity(0.1),
                    context: context,
                    builder: ((context) {
                      return SizedBox(
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width > 450
                            ? 450
                            : MediaQuery.of(context).size.width,
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 24.0,
                              ),
                              child: const Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      Icon(Icons.shopping_cart),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Keranjang",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "120",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 0.5,
                              color: Colors.black.withOpacity(0.4),
                            ),
                            Expanded(
                              child: CustomScrollView(
                                slivers: [
                                  SliverPadding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    sliver: SliverList(
                                      delegate: SliverChildListDelegate([
                                        ...[
                                          1,
                                          2,
                                          3,
                                          4,
                                          5,
                                          6,
                                          7,
                                          8,
                                          9,
                                          10,
                                          11,
                                          12,
                                          13,
                                          14,
                                          15,
                                          16,
                                          17
                                        ].map((e) => const CartItem()).toList(),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 0.5,
                              color: Colors.black.withOpacity(0.4),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flex(
                                    direction: Axis.vertical,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isNego = !isNego;
                                          });
                                        },
                                        child: Flex(
                                          direction: Axis.horizontal,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Checkbox(
                                                value: isNego,
                                                onChanged: (e) {}),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Nego Harga"),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flex(
                                        direction: Axis.horizontal,
                                        children: [
                                          const Text("Total Bayar"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Rp 120.000",
                                            style: TextStyle(
                                              decoration: isNego
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        maximumSize: const Size(100, 46)),
                                    onPressed: () {},
                                    child: const Text(
                                      "Bayar",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              Positioned(
                bottom: 16,
                right: 44,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "1000",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            backgroundColor: Colors.teal.shade600,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            expandedHeight: 320,
            collapsedHeight: 64,
            pinned: true,
            stretch: true,
            flexibleSpace: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Container(
                    height: double.infinity,
                    color: Colors.white,
                    child: SafeArea(
                      child: CarouselSlider(
                        items: [1, 2, 3, 4, 5, 6]
                            .map((e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                    horizontal: 4.0,
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24.0),
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            "https://cff2.earth.com/uploads/2018/11/01142049/Hot-or-iced-Hot-coffee-has-more-antioxidants-than-cold-brew-960x640.jpg",
                                            height: double.infinity,
                                            width: double.infinity,
                                            cacheWidth: (MediaQuery.of(context)
                                                    .size
                                                    .width)
                                                .toInt(),
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                              height: 240,
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Colors.transparent,
                                                    Colors.black38,
                                                    Colors.black,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                        options: CarouselOptions(
                          height: 220,
                          aspectRatio: 1 / 2,
                          viewportFraction: 0.9,
                          disableCenter: true,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          pageSnapping: true,
                          autoPlayInterval: const Duration(milliseconds: 4000),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 2000),
                          autoPlayCurve: Curves.easeInOut,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 64,
                  width: double.infinity,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: index == 1
                                ? Colors.pink.shade600
                                : Colors.black,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text(
                            "CATEGORY ${index + 1}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(24.0),
            sliver: SliverGrid(
              delegate:
                  SliverChildBuilderDelegate(childCount: 10, (context, index) {
                return ProductWidgetGrid(
                  imageUrl:
                      "https://static.desty.app/desty-page/1658935790393283497d30baa4326a31956dba855c6b1.jpg",
                  title: "COFFEE LATTE",
                  description: "Perpaduan expresso dan susu murni",
                  price: 32000,
                  stock: 10,
                  category: "category",
                  expiredAt: "3 Januari 2024",
                  addToChart: () {},
                  onClick: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const KasirPage()),
                    // );
                  },
                );
              }),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24),
              height: 160,
              color: Colors.black,
              child: const Flex(
                direction: Axis.vertical,
                children: [
                  Text(
                    "Nama Toko",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Alamat Toko",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20.0),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              "https://static.desty.app/desty-page/1658935790393283497d30baa4326a31956dba855c6b1.jpg",
              height: 100,
              width: 100,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cafe Latte".toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "Expresso + Susu Murni",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Rp 32.000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          InkWell(
                            onTap: () {
                              print("sada");
                            },
                            child: const Icon(Icons.remove_circle),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "12",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print("sada");
                            },
                            child: const Icon(Icons.add_circle),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void addProduct(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    barrierColor: Colors.black.withOpacity(0.2),
    context: context,
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.9,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 24),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  collapsedHeight: 72,
                  pinned: true,
                  flexibleSpace: Flexible(
                      child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                          top: 24,
                          bottom: 16,
                        ),
                        child: const Text(
                          "Tambahkan Item",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0.5,
                        color: Color.fromARGB(255, 233, 233, 240),
                      ),
                    ],
                  )),
                ),
                SliverToBoxAdapter(
                  child: Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 8.0,
                          left: 16.0,
                          top: 8.0,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "https://www.netmeds.com/images/cms/wysiwyg/blog/Post/2018/11/Hotcoffee_contains_898.jpg",
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  return "Pleaseeeee error";
                                },
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                scrollPadding: const EdgeInsets.all(10.0),
                                decoration: InputDecoration(
                                  label: const Text("Nama Item"),
                                  border: OutlineInputBorder(
                                    gapPadding: 10.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 240, 239, 241),
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  return "Pleaseeeee error";
                                },
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                scrollPadding: const EdgeInsets.all(10.0),
                                decoration: InputDecoration(
                                  label: const Text("Deskripsi Item"),
                                  border: OutlineInputBorder(
                                    gapPadding: 10.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 240, 239, 241),
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  return "Pleaseeeee error";
                                },
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                scrollPadding: const EdgeInsets.all(10.0),
                                decoration: InputDecoration(
                                  label: const Text("Kategori"),
                                  border: OutlineInputBorder(
                                    gapPadding: 10.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 240, 239, 241),
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 2,
                          child: TextFormField(
                            validator: (value) {
                              return "Pleaseeeee error";
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            scrollPadding: const EdgeInsets.all(10.0),
                            decoration: InputDecoration(
                              label: const Text("Harga"),
                              border: OutlineInputBorder(
                                gapPadding: 10.0,
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 240, 239, 241),
                                  width: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            validator: (value) {
                              return "Pleaseeeee error";
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            scrollPadding: const EdgeInsets.all(10.0),
                            decoration: InputDecoration(
                              label: const Text("Stok"),
                              border: OutlineInputBorder(
                                gapPadding: 10.0,
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 240, 239, 241),
                                  width: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
