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
                      'assets/images/Headphone.jpg',
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
                      'assets/images/Laptop.jpg',

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
                      'assets/images/Mouse.jpg',
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
                      'assets/images/Handphone.jpg',
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
                      'assets/images/Softcase.jpg',
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

                child: Image.asset(
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