import 'package:flutter/material.dart';
import 'package:taxi/bloc/place_bloc.dart';
import 'package:taxi/model/place_model.dart';

class RidePackerPage extends StatefulWidget {
  const RidePackerPage({Key? key}) : super(key: key);

  @override
  State<RidePackerPage> createState() => _RidePackerPageState();
}

class _RidePackerPageState extends State<RidePackerPage> {
  var _addressController;
  var placeBloc = PlaceBloc();

  @override
  void initState() {
    _addressController = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color(0xfff8f8f8),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 60,
                        child: Center(
                          child: Image.asset('assets/ic_location_16x16.png'),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 0,
                          width: 40,
                          height: 60,
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                _addressController.text = "";
                              },
                              child: Image.asset('assets/ic_x_close_16x16.png'),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 50),
                        child: TextField(
                          controller: _addressController,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (str) {
                            placeBloc.searchPlace(str);
                          },
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: StreamBuilder(
                stream: placeBloc.placeStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data == 'start') {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    print("Data snapshot ${snapshot.data}");

                    List<PlaceItemRes>? places =
                        snapshot.data as List<PlaceItemRes>?;
                    return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(places.elementAt(index).name),
                            subtitle: Text(places.elementAt(index).address),
                            onTap: () {
                              print('on tap');
                            },
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(
                              height: 1,
                              color: Color(0xfff5f5f5),
                            ),
                        itemCount: places!.length);
                  } else {
                    return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
