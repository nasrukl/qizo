import 'package:flutter/material.dart';
import 'package:qizoproject/services/api_service.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: apiServices.getapi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 207,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data![index].name!,
                                ),
                              ),
                            ),
                            Container(
                              height: 65,
                              color: Colors.black,
                              width: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(snapshot.data![index].brand!),
                            ),
                            Container(
                              height: 65,
                              color: Colors.black,
                              width: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(snapshot.data![index].price!),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
