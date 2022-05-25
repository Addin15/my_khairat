import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_khairat/DAO/mosque_dao.dart';
import 'package:my_khairat/DAO/user_dao.dart';
import 'package:my_khairat/models/mosque.dart';
import 'package:my_khairat/models/person.dart';
import 'package:my_khairat/models/user.dart';
import 'package:my_khairat/models/village.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:my_khairat/styles/custom_text_field.dart';
import 'package:provider/provider.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({required this.userDAO, Key? key}) : super(key: key);

  final UserDAO userDAO;

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final TextEditingController _icController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();

  final FocusNode _icFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _occupationFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey();

  bool isLoading = false;

  String selectedMosqueID = '';
  String selectedVillageID = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MosqueDAO>(
      create: (context) => MosqueDAO(),
      child: Consumer<MosqueDAO>(builder: (context, mosqueDAO, child) {
        List<Mosque> mosques = mosqueDAO.mosques;
        log(mosques.length.toString());

        List<Village> villages = mosqueDAO.villages;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     AppColor.secondary,
                //     AppColor.primary,
                //   ],
                // ),
                color: Colors.white54,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'MyKhairat',
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      hintText: 'Kad Pengenalan',
                      focusNode: _icFocus,
                      controller: _icController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      hintText: 'Nama',
                      focusNode: _nameFocus,
                      controller: _nameController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      hintText: 'Alamat',
                      focusNode: _addressFocus,
                      controller: _addressController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      hintText: 'No Telefon',
                      focusNode: _phoneFocus,
                      controller: _phoneController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      hintText: 'Pekerjaan',
                      focusNode: _occupationFocus,
                      controller: _occupationController,
                    ),
                    const SizedBox(height: 10),
                    const Text('Masjid'),
                    SizedBox(
                      width: double.infinity,
                      child: DropdownButton(
                          hint: Text(selectedMosqueID.isEmpty
                              ? '--Pilih Masjid--'
                              : mosques
                                  .where((e) => e.id == selectedMosqueID)
                                  .first
                                  .name!),
                          items: mosques.map((e) {
                            return DropdownMenuItem(
                              child: Text(e.name!),
                              value: e.id,
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedMosqueID = value!;
                              mosqueDAO.getVillages(value);
                            });
                          }),
                    ),
                    const SizedBox(height: 10),
                    const Text('Kampung'),
                    SizedBox(
                      width: double.infinity,
                      child: DropdownButton(
                          hint: Text(selectedVillageID.isEmpty
                              ? '--Pilih Kampung--'
                              : villages
                                  .where((e) => e.id == selectedVillageID)
                                  .first
                                  .name!),
                          items: villages.map((e) {
                            return DropdownMenuItem(
                              child: Text(e.name!),
                              value: e.id,
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedVillageID = value!;
                            });
                          }),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        User user = widget.userDAO.user;
                        widget.userDAO.complete(user.id!, {
                          'user_id': user.id,
                          'person_id': user.personID,
                          'mosque_id': selectedMosqueID,
                          'village_id': selectedMosqueID,
                          'person_name': _nameController.text,
                          'person_ic': _icController.text,
                          'person_phone': _phoneController.text,
                          'person_address': _addressController.text,
                          'person_occupation': _occupationController.text,
                          'person_status': 'pending',
                          'person_details_prove': 'test',
                          'person_payment_prove': 'test',
                        });
                      },
                      child: const Text(
                        'Selesai',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
