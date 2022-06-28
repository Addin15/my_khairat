import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/models/payment.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:sizer/sizer.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  List<Payment> payments = [];
  List<Payment> filteredPayments = [];

  bool isLoading = true;

  filterPayments() {
    filteredPayments.clear();
    for (var payment in payments) {
      if (DateTime.parse(payment.paymentDate!).month == selectedMonth &&
          payment.status == 'completed') {
        filteredPayments.add(payment);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Rekod Transaksi',
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
      body: SizedBox(
        width: 100.w,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Row(
                children: [
                  Flexible(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Bulan',
                        ),
                        DropdownButton(
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(
                              child: Text(
                                'Januari',
                              ),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text('Februari'),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: Text('Mac'),
                              value: 3,
                            ),
                            DropdownMenuItem(
                              child: Text('April'),
                              value: 4,
                            ),
                            DropdownMenuItem(
                              child: Text('Mei'),
                              value: 5,
                            ),
                            DropdownMenuItem(
                              child: Text('Jun'),
                              value: 6,
                            ),
                            DropdownMenuItem(
                              child: Text('Julai'),
                              value: 7,
                            ),
                            DropdownMenuItem(
                              child: Text('Ogos'),
                              value: 8,
                            ),
                            DropdownMenuItem(
                              child: Text('September'),
                              value: 9,
                            ),
                            DropdownMenuItem(
                              child: Text('Oktober'),
                              value: 10,
                            ),
                            DropdownMenuItem(
                              child: Text('November'),
                              value: 11,
                            ),
                            DropdownMenuItem(
                              child: Text('Disember'),
                              value: 12,
                            ),
                          ],
                          value: selectedMonth,
                          onChanged: (int? month) {
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Flexible(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Tahun'),
                        DropdownButton(
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                              child: Text('2022'),
                              value: 2022,
                            ),
                          ],
                          value: selectedYear,
                          onChanged: (int? year) {
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: filteredPayments.isEmpty
                  ? const Center(child: Text("Tiada Rekod"))
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: filteredPayments.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.w),
                          color: Colors.grey.shade400,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  filteredPayments[index].payerName!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 1.5.w,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'RM${filteredPayments[index].amount!.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('dd/MM/yyyy').format(
                                        DateTime.parse(filteredPayments[index]
                                            .paymentDate!)),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
