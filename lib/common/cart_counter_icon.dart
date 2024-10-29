import 'package:add_cart_provider/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor = Colors.white,
  });
  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Stack(
        children: [
          IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.add_shopping_cart_outlined,
                color: iconColor,
              )),
          Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return Text(
                      '${cart.count}',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: Colors.blueGrey, fontSizeFactor: .8),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
