import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/DAO/death_dao.dart';
import 'package:my_khairat/DAO/dependent_dao.dart';
import 'package:my_khairat/models/death.dart';
import 'package:my_khairat/models/dependent.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:my_khairat/styles/app_color.dart';

//the UI for now
class ReportDeath extends StatefulWidget {
  const ReportDeath({
    required this.dependentDAO,
    required this.dependentid,
    Key? key,
  }) : super(key: key);

  final DependentDAO dependentDAO;
  final DependentModel dependentid;

  @override
  State<ReportDeath> createState() => _ReportDeathState();
}

class _ReportDeathState extends State<ReportDeath> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _icCtrl = TextEditingController();
  final TextEditingController _relationCtrl = TextEditingController();
  final TextEditingController _phoneNoCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();
  final TextEditingController _deathdateCtrl = TextEditingController();
  final TextEditingController _locationCtrl = TextEditingController();
  final TextEditingController _causesCtrl = TextEditingController();

  @override
  void initState() {
    _nameCtrl.text = widget.dependentid.dependent_name!;
    _icCtrl.text = widget.dependentid.dependent_ic!;
    _relationCtrl.text = widget.dependentid.dependent_relation!;
    _phoneNoCtrl.text = widget.dependentid.dependent_phone!;
    _addressCtrl.text = widget.dependentid.dependent_address!;
    _deathdateCtrl.text = '';
    _locationCtrl.text = '';
    _causesCtrl.text = '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime? date;

    //to count whitespace
    int nameWS() {
      var whitespace =
          RegExp(" ").allMatches(widget.dependentid.dependent_name!).length;
      if (whitespace == 0) {
        return whitespace + 1;
      } else {
        return RegExp(" ")
            .allMatches(widget.dependentid.dependent_name!)
            .length;
      }
    }

    return ChangeNotifierProvider<DeathDAO>(
      create: (context) => DeathDAO(widget.dependentid.user_id!),
      child: Consumer<DeathDAO>(builder: (context, deathDAO, child) {
        List<Death> deaths = deathDAO.deaths;
        DependentDAO dependent = DependentDAO(widget.dependentid.user_id!);
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Lapor Kematian Tanggungan',
                style: TextStyle(color: AppColor.primary),
              ),
              elevation: 0.0,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Ionicons.chevron_back),
                color: AppColor.primary,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(1.h),
                width: double.infinity,
                child: Card(
                  elevation: 2,
                  color: Colors.white,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        heightFactor: 1.5,
                        child: Icon(
                          Ionicons.person_circle_sharp,
                          size: 60,
                          color: Color(0xFF616161),
                          //color: Color(0xFF424242),
                          //color: Colors.grey.shade800 ,
                          //color: Color.fromRGBO(22, 18, 184, .7),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Nama'),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 160,
                                      child: TextFormField(
                                        controller: _nameCtrl,
                                        enabled: false,
                                        maxLines: nameWS(),
                                        style:
                                            const TextStyle(color: Colors.grey),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                        cursorColor: Colors.black,
                                      ),
                                    ),
                                    const Icon(
                                      Ionicons.lock_closed_outline,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'No. Kad \nPengenalan',
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 160,
                                      child: TextFormField(
                                        controller: _icCtrl,
                                        enabled: false,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    const Icon(
                                      Ionicons.lock_closed_outline,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Hubungan',
                                ),
                                SizedBox(
                                  width: 85,
                                  child: TextFormField(
                                    controller: _relationCtrl,
                                    enabled: false,
                                    style: const TextStyle(color: Colors.grey),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                                const Icon(
                                  Ionicons.lock_closed_outline,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'No. Telefon',
                                ),
                                SizedBox(
                                  width: 180,
                                  child: TextFormField(
                                    controller: _phoneNoCtrl,
                                    validator: (value) => value!.isEmpty
                                        ? 'Sila isi nombor telefon'
                                        : null,
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF0EAD69))),
                                    ),
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.phone,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Alamat',
                                ),
                                SizedBox(
                                  width: 180,
                                  child: TextFormField(
                                    controller: _addressCtrl,
                                    maxLines: null,
                                    validator: (value) => value!.isEmpty
                                        ? 'Sila isi alamat tanggungan'
                                        : null,
                                    decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF0EAD69))),
                                    ),
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Tarikh \nMeninggal',
                                ),
                                SizedBox(
                                  width: 180,
                                  child: TextFormField(
                                    controller: _deathdateCtrl,
                                    validator: (value) => value!.isEmpty
                                        ? 'Sila isi tarikh meninggal tanggungan'
                                        : null,
                                    decoration: const InputDecoration(
                                      hintText: 'N/A',
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF0EAD69))),
                                    ),
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.none,
                                    onTap: () async {
                                      // DateTime? date;
                                      // final initialDate = DateTime.now();

                                      // DateTime input() {
                                      //   if (date == null) {
                                      //     return initialDate;
                                      //   } else {
                                      //     return date!;
                                      //   }
                                      // }

                                      final newDate = await showDatePicker(
                                        context: context,
                                        initialDate: date ?? DateTime.now(),
                                        firstDate:
                                            DateTime(DateTime.now().year - 40),
                                        lastDate:
                                            DateTime(DateTime.now().year + 5),
                                      );

                                      if (newDate == null) return;
                                      setState(() {
                                        date = newDate;
                                        _deathdateCtrl.text =
                                            '${date!.day}/${date!.month}/${date!.year}';
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Tempat',
                                ),
                                SizedBox(
                                  width: 180,
                                  child: TextFormField(
                                    controller: _locationCtrl,
                                    maxLines: null,
                                    validator: (value) => value!.isEmpty
                                        ? 'Sila isi tempat hospital tanggunngan'
                                        : null,
                                    decoration: const InputDecoration(
                                      hintText: 'e.g: Hospital Serdang',
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF0EAD69))),
                                    ),
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Sebab-sebab\nMeninggal',
                                ),
                                SizedBox(
                                  width: 180,
                                  child: TextFormField(
                                    controller: _causesCtrl,
                                    maxLines: null,
                                    validator: (value) => value!.isEmpty
                                        ? 'Sila isi sebab-sebab meninggal'
                                        : null,
                                    decoration: const InputDecoration(
                                      hintText: 'Kemalangan',
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF0EAD69))),
                                    ),
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 150,
                          child: FloatingActionButton.extended(
                            onPressed: () async {
                              //update changes to dependent table
                              widget.dependentid.death_date =
                                  _deathdateCtrl.text;
                              widget.dependentid.death_status =
                                  'Meninggal dunia';
                              await widget.dependentDAO
                                  .editDependent(widget.dependentid);

                              //add new death report
                              dynamic res = await deathDAO.addDeath(
                                  widget.dependentid.id!,
                                  Death(
                                    userid:
                                        widget.dependentid.user_id.toString(),
                                    name: _nameCtrl.text,
                                    ic: _icCtrl.text,
                                    relation: _relationCtrl.text,
                                    phonenum: _phoneNoCtrl.text,
                                    address: _addressCtrl.text,
                                    date: _deathdateCtrl.text,
                                    location: _locationCtrl.text,
                                    causes: _causesCtrl.text,
                                  ));

                              // to pop until dependent list
                              Navigator.pop(context, res);
                              Navigator.pop(context, res);
                            },
                            label: const Text('Lapor'),
                            icon: const Icon(Ionicons.reader_outline),
                            backgroundColor: Colors.amber,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }
}
