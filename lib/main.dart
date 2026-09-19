import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // quantity
  int headphone = 1;
  int laptop = 1;
  int mouse = 1;
  int phone = 1;
  int casing = 1;

  // produk yang dipilih
  int selectedProduct = 0;

  // status like
  bool headphoneLiked = false;
  bool laptopLiked = false;
  bool mouseLiked = false;
  bool phoneLiked = false;
  bool casingLiked = false;

  // jumlah like
  int headphoneLike = 12;
  int laptopLike = 8;
  int mouseLike = 5;
  int phoneLike = 10;
  int casingLike = 6;

  // status wishlist
  bool headphoneWishlist = false;
  bool laptopWishlist = false;
  bool mouseWishlist = false;
  bool phoneWishlist = false;
  bool casingWishlist = false;

  // pesan
  String message = '';

  // harga
  int hargaHeadphone = 350000;
  int hargaLaptop = 7500000;
  int hargaMouse = 250000;
  int hargaPhone = 4500000;
  int hargaCasing = 150000;

  // format rupiah
  String rupiah(int angka) {
    return angka
        .toString()
        .replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (match) => '.',
    );
  }

  // total harga
  int get totalHarga {
    return (headphone * hargaHeadphone) +
        (laptop * hargaLaptop) +
        (mouse * hargaMouse) +
        (phone * hargaPhone) +
        (casing * hargaCasing);
  }

  // total produk
  int get totalProduk {
    return headphone +
        laptop +
        mouse +
        phone +
        casing;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.white,
        // app bar
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cart Siapa Hayo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'Belanja lebih mudah setiap hari',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          actions: const [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(width: 15),
          ],
        ),

        // body
        body: SafeArea(
          child: Column(
            children: [

              // judul
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  15,
                  15,
                  15,
                  10,
                ),
                child: const Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shopping Cart GUYS',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Yuk review sebelum checkout :D',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              // pesan
              if (message.isNotEmpty)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius:
                    BorderRadius.circular(8),
                  ),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              // daftar produk
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(15),
                  children: [

                    // headphone
                    productCard(
                      id: 1,
                      nama: 'Wireless Headphone',
                      merk: 'Sony WH-CH520',
                      harga: hargaHeadphone,
                      jumlah: headphone,
                      like: headphoneLike,
                      liked: headphoneLiked,
                      gambar:
                      'https://png.pngtree.com/png-vector/20230407/ourmid/pngtree-earphones-wireless-earphones-bluetooth-earphones-transparent-png-image_6687223.png',

                      onTap: () {
                        setState(() {
                          selectedProduct = 1;
                        });
                      },

                      onDoubleTap: () {
                        setState(() {
                          headphoneLike++;
                          headphoneLiked = true;
                          selectedProduct = 1;
                        });
                      },

                      onLongPress: () {
                        setState(() {
                          selectedProduct = 1;
                          headphoneWishlist = true;
                          message =
                          'Headphone ditambahkan ke wishlist :)';
                        });
                      },

                      onLike: () {
                        setState(() {
                          if (headphoneLiked) {
                            headphoneLike--;
                            headphoneLiked = false;
                          } else {
                            headphoneLike++;
                            headphoneLiked = true;
                          }
                        });
                      },

                      onMinus: () {
                        setState(() {
                          if (headphone > 1) {
                            headphone--;
                          }
                        });
                      },

                      onPlus: () {
                        setState(() {
                          headphone++;
                        });
                      },
                    ),

                    // laptop
                    productCard(
                      id: 2,
                      nama: 'Laptop ASUS Vivobook',
                      merk: 'ASUS',
                      harga: hargaLaptop,
                      jumlah: laptop,
                      like: laptopLike,
                      liked: laptopLiked,
                      gambar:
                      'https://static.retailworldvn.com/Products/Images/12217/321637/laptop-asus-vivobook-14-i3-1215u-8gb-256gb-opi-win11-a1404za-ips321-quiet-blue-1.jpg',

                      onTap: () {
                        setState(() {
                          selectedProduct = 2;
                        });
                      },

                      onDoubleTap: () {
                        setState(() {
                          laptopLike++;
                          laptopLiked = true;
                          selectedProduct = 2;
                        });
                      },

                      onLongPress: () {
                        setState(() {
                          selectedProduct = 2;
                          laptopWishlist = true;
                          message =
                          'Laptop ditambahkan ke wishlist :)';
                        });
                      },

                      onLike: () {
                        setState(() {
                          if (laptopLiked) {
                            laptopLike--;
                            laptopLiked = false;
                          } else {
                            laptopLike++;
                            laptopLiked = true;
                          }
                        });
                      },

                      onMinus: () {
                        setState(() {
                          if (laptop > 1) {
                            laptop--;
                          }
                        });
                      },

                      onPlus: () {
                        setState(() {
                          laptop++;
                        });
                      },
                    ),

                    // mouse
                    productCard(
                      id: 3,
                      nama: 'Wireless Mouse',
                      merk: 'HP 150',
                      harga: hargaMouse,
                      jumlah: mouse,
                      like: mouseLike,
                      liked: mouseLiked,
                      gambar:
                      'data:image/jpeg;base64,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',

                      onTap: () {
                        setState(() {
                          selectedProduct = 3;
                        });
                      },

                      onDoubleTap: () {
                        setState(() {
                          mouseLike++;
                          mouseLiked = true;
                          selectedProduct = 3;
                        });
                      },

                      onLongPress: () {
                        setState(() {
                          selectedProduct = 3;
                          mouseWishlist = true;
                          message =
                          'Mouse ditambahkan ke wishlist :)';
                        });
                      },

                      onLike: () {
                        setState(() {
                          if (mouseLiked) {
                            mouseLike--;
                            mouseLiked = false;
                          } else {
                            mouseLike++;
                            mouseLiked = true;
                          }
                        });
                      },

                      onMinus: () {
                        setState(() {
                          if (mouse > 1) {
                            mouse--;
                          }
                        });
                      },

                      onPlus: () {
                        setState(() {
                          mouse++;
                        });
                      },
                    ),

                    // smartphone
                    productCard(
                      id: 4,
                      nama: 'Smartphone',
                      merk: 'Samsung Galaxy',
                      harga: hargaPhone,
                      jumlah: phone,
                      like: phoneLike,
                      liked: phoneLiked,
                      gambar:
                      'data:image/jpeg;base64,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',

                      onTap: () {
                        setState(() {
                          selectedProduct = 4;
                        });
                      },

                      onDoubleTap: () {
                        setState(() {
                          phoneLike++;
                          phoneLiked = true;
                          selectedProduct = 4;
                        });
                      },

                      onLongPress: () {
                        setState(() {
                          selectedProduct = 4;
                          phoneWishlist = true;
                          message =
                          'Smartphone ditambahkan ke wishlist :)';
                        });
                      },

                      onLike: () {
                        setState(() {
                          if (phoneLiked) {
                            phoneLike--;
                            phoneLiked = false;
                          } else {
                            phoneLike++;
                            phoneLiked = true;
                          }
                        });
                      },

                      onMinus: () {
                        setState(() {
                          if (phone > 1) {
                            phone--;
                          }
                        });
                      },

                      onPlus: () {
                        setState(() {
                          phone++;
                        });
                      },
                    ),

                    // casing
                    productCard(
                      id: 5,
                      nama: 'Phone Case',
                      merk: 'Soft Case',
                      harga: hargaCasing,
                      jumlah: casing,
                      like: casingLike,
                      liked: casingLiked,
                      gambar:
                      'data:image/jpeg;base64,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',

                      onTap: () {
                        setState(() {
                          selectedProduct = 5;
                        });
                      },

                      onDoubleTap: () {
                        setState(() {
                          casingLike++;
                          casingLiked = true;
                          selectedProduct = 5;
                        });
                      },

                      onLongPress: () {
                        setState(() {
                          selectedProduct = 5;
                          casingWishlist = true;
                          message =
                          'Phone Case ditambahkan ke wishlist :)';
                        });
                      },

                      onLike: () {
                        setState(() {
                          if (casingLiked) {
                            casingLike--;
                            casingLiked = false;
                          } else {
                            casingLike++;
                            casingLiked = true;
                          }
                        });
                      },

                      onMinus: () {
                        setState(() {
                          if (casing > 1) {
                            casing--;
                          }
                        });
                      },

                      onPlus: () {
                        setState(() {
                          casing++;
                        });
                      },
                    ),
                  ],
                ),
              ),

              // total
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                child: Row(
                  children: [

                    // informasi total
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total ($totalProduk Produk)',
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Rp ${rupiah(totalHarga)}',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // checkout
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          message =
                          'Checkout berhasil!';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Checkout',
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
        ),

        // navbar
        bottomNavigationBar:
        BottomNavigationBar(
          currentIndex: 2,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view),
              label: 'Kategori',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Keranjang',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Akun',
            ),
          ],
        ),
      ),
    );
  }

  // product card
  Widget productCard({
    required int id,
    required String nama,
    required String merk,
    required int harga,
    required int jumlah,
    required int like,
    required bool liked,
    required String gambar,
    required VoidCallback onTap,
    required VoidCallback onDoubleTap,
    required VoidCallback onLongPress,
    required VoidCallback onLike,
    required VoidCallback onMinus,
    required VoidCallback onPlus,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: selectedProduct == id
              ? Colors.blue
              : Colors.grey.shade300,
          width: selectedProduct == id ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),

      child: GestureDetector(
        // tap produk
        onTap: onTap,

        // double tap produk
        onDoubleTap: onDoubleTap,

        // long press produk
        onLongPress: onLongPress,

        child: Padding(
          padding: const EdgeInsets.all(10),

          child: Row(
            children: [

              // gambar
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius:
                  BorderRadius.circular(8),
                ),

                child: Image.network(
                  gambar,
                  fit: BoxFit.contain,

                  errorBuilder:
                      (context, error, stackTrace) {
                    return const Icon(
                      Icons.image,
                      size: 45,
                      color: Colors.grey,
                    );
                  },
                ),
              ),

              const SizedBox(width: 10),

              // informasi produk
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      nama,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                    Text(
                      merk,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      'Rp ${rupiah(harga)}',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    // like
                    GestureDetector(
                      onTap: onLike,
                      child: Row(
                        children: [

                          Icon(
                            liked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: liked
                                ? Colors.red
                                : Colors.grey,
                            size: 18,
                          ),

                          const SizedBox(width: 5),

                          Text('$like'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // quantity
              Row(
                children: [

                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius:
                      BorderRadius.circular(5),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: onMinus,
                      icon: const Icon(
                        Icons.remove,
                        size: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 30,
                    child: Text(
                      '$jumlah',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                      BorderRadius.circular(5),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: onPlus,
                      icon: const Icon(
                        Icons.add,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}