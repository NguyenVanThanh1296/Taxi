import 'package:flutter/material.dart';
import 'package:taxi/resourse/ride_picker_page.dart';

class RidePicker extends StatefulWidget {
  const RidePicker({Key? key}) : super(key: key);

  @override
  State<RidePicker> createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Color(0x88999999), offset: Offset(0, 5), blurRadius: 5.0)
          ]),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RidePackerPage()));
              },
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                          child: Image.asset(
                              'assets/ic_define_location_16x16.png')),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      width: 30,
                      height: 35,
                      child: Center(
                        child: Image.asset('assets/ic_x_close_16x16.png'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 40, right: 50),
                      child: Text(
                        'Tòa nhà Keangnam Landmark 72, Khu E6, Phạm Hùng, Cầu Giấy, Hà Nội, Việt Nam',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: TextButton(
              onPressed: () {},
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                          child: Image.asset('assets/ic_location_16x16.png')),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      width: 30,
                      height: 35,
                      child: Center(
                        child: Image.asset('assets/ic_x_close_16x16.png'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 40, right: 50),
                      child: Text(
                        'Home ',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
