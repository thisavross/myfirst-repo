import 'package:flutter/material.dart';

class HomeScreenPengayaan extends StatelessWidget {
  const HomeScreenPengayaan({super.key});

  @override
  Widget build(BuildContext context) {
    final dataObject = [
      "assets/Berlin.png",
      "assets/Monas.png",
      "assets/Roma.png",
      "assets/Tokyo.png"
    ];
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.alarm),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.add_shopping_cart)
                ],
              ),
            ),
            const Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff54C5F8)),
            ),
            const Text(
              "Hilmy",
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff01579B)),
            ),
            const SizedBox(
              height: 40,
            ),
            const TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  hintText: "Search"),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width / 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Recomended Place"),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: GridView.builder(
                          itemCount: dataObject.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 250),
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.grey,
                              child: Center(
                                  child: Image.network(dataObject[index])),
                            );
                          }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
