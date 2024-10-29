import 'package:add_cart_provider/checkout.dart';
import 'package:add_cart_provider/common/cart_counter_icon.dart';
import 'package:add_cart_provider/model/cart.dart';
import 'package:add_cart_provider/model/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [
    Item(
        img: "assets/images/serie8.jpeg",
        name: "Apple Watch Series 8",
        desc:
            "L'Apple Watch Ultra, Apple Watch Series 8 et l'Apple Watch SE nécessitent un iPhone 8 (ou modèle ultérieur) avec iOS 16 (ou version ultérieure).",
        price: 5990),
    Item(
        img: "assets/images/15pro_1.jpeg",
        name: "iPhone 15 Pro Max",
        desc:
            "Réalisez des photos et des portraits en super haute résolution grâce à l'appareil photo principal 48 Mpx doté du plus grand capteur jamais vu sur iPhone.",
        price: 17790),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CartCounterIcon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CheckOut();
                  },
                ),
              );
            },
          ),
        ],
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                  color: const Color.fromARGB(255, 234, 237, 243),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Consumer<Cart>(builder: (context, cart, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            item.img,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.desc,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    "DH${item.price}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        cart.addItem(item);
                                      },
                                      icon: const Icon(
                                        Icons.add_sharp,
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }));
            },
          ),
        ),
      ),
    );
  }
}
