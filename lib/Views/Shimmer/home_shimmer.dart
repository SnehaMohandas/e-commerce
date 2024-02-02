import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShimmerHome extends StatelessWidget {
  ShimmerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardLoading(
            borderRadius: BorderRadius.circular(10),
            height: 50,
            width: double.infinity,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          CardLoading(
            borderRadius: BorderRadius.circular(10),
            height: MediaQuery.of(context).size.height * 0.22,
            width: double.infinity,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CardLoading(
                    borderRadius: BorderRadius.circular(10),
                    margin: const EdgeInsets.only(left: 5),
                    height: 25,
                    width: 130,
                  );
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CardLoading(
            height: 25,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CardLoading(
                    borderRadius: BorderRadius.circular(10),
                    margin: const EdgeInsets.only(right: 18),
                    height: 330,
                    width: 140,
                  );
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CardLoading(
            height: 25,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Expanded(
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const CardLoading(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      margin: EdgeInsets.only(right: 18),
                      height: 330,
                      width: 140,
                    );
                  }),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
