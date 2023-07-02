import 'package:aplication/app/constans/app_colors.dart';
import 'package:aplication/app/constans/app_text.dart';
import 'package:aplication/app/constans/app_text_styles.dart';
import 'package:aplication/app/modules/home/controllers/home_controller.dart';
import 'package:aplication/app/modules/receipt/controllers/receipt_controller.dart';
import 'package:aplication/app/modules/receipt/widgets/vertical_divider_widget.dart';
import 'package:aplication/app/utils/categ_list.dart';
import 'package:aplication/app/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReceiptView extends StatefulWidget {
  const ReceiptView({super.key});

  @override
  State<ReceiptView> createState() => _ReceiptViewState();
}

class _ReceiptViewState extends State<ReceiptView> {
  final HomeController _homeController = Get.put(HomeController());

  final ReceiptController _receiptController = Get.put(ReceiptController());
  bool circul = false;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: CustomAppBar(
              text: AppText.receipt.toUpperCase(),
              child: IconButton(
                onPressed: () {
                  _homeController.navigateToHomeView(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 22,
                  color: AppColors.white,
                ),
              ),
            )),
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Form(
                key: _receiptController.formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 36,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(AppText.kvi.toUpperCase(),
                            style: AppTextStyle.S16W700FGen),
                        SizedBox(
                          width: sizeWidth * 0.85,
                          height: sizeHeight * 0.18,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Obx(() => SizedBox(
                                    width: 100,
                                    child: DropdownButton(
                                      iconSize: 20,
                                      iconEnabledColor: Colors.red,
                                      iconDisabledColor: Colors.black,
                                      dropdownColor: Colors.yellow.shade400,
                                      disabledHint: const Text('*'),
                                      value:
                                          _receiptController.mainCatValue.value,
                                      items: mainCoursName
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        _receiptController
                                            .selectedMainCateg(value);
                                      },
                                    ),
                                  )),
                              const VerticalDividerWidget(),
                              Obx(() => DropdownButton(
                                    iconSize: 40,
                                    iconEnabledColor: Colors.red,
                                    iconDisabledColor: Colors.black,
                                    dropdownColor: Colors.yellow.shade400,
                                    disabledHint: const Text('~'),
                                    value:
                                        _receiptController.subCategValue.value,
                                    items: _receiptController.subCategList
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      _receiptController.subCategValue.value =
                                          value!;
                                    },
                                  )),
                            ],
                          ),
                        ),
                        Obx(() => DropdownButton(
                              iconSize: 20,
                              iconEnabledColor: Colors.red,
                              iconDisabledColor: Colors.black,
                              dropdownColor: Colors.yellow.shade400,
                              disabledHint: const Text('~'),
                              value: _receiptController.lvlCategValue.value,
                              items: selectCoursLevel
                                  .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                _receiptController.lvlCategValue.value = value!;
                              },
                            )),
                        SizedBox(
                          height: sizeHeight * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_receiptController.formattedTime,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.w700S16),
                            const SizedBox(
                              height: 20,
                              width: 20,
                            ),
                            Text(_receiptController.formattedDate,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.w700S16),
                          ],
                        ),
                        SizedBox(
                          height: sizeHeight * 0.05,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _receiptController.firstNameController,
                          decoration: InputDecoration(
                            fillColor: AppColors.whiteF5,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: AppColors.whiteF5, width: 2.0),
                            ),
                            labelText: AppText.name,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Пожалуйста напишите Имя ученика';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: sizeHeight * 0.02,
                        ),
                        TextFormField(
                          controller: _receiptController.amountController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.whiteF5,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: AppColors.whiteF5, width: 2.0),
                            ),
                            labelText: AppText.price,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Пожалуйста напишите сумму';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: sizeHeight * 0.08,
                        ),
                        InkWell(
                            onTap: () {
                              _receiptController.uploadProduct();
                              // _receiptController.add();
                            },
                            // circul == true
                            //     CircularProgressIndicator(
                            //         color: Colors.black,
                            //       )
                            //     :
                            child: _receiptController.processing.value == true
                                ? const CircularProgressIndicator(
                                    color: Colors.black,
                                  )
                                : Container(
                                    height: sizeHeight * 0.065,
                                    width: sizeWidth * 0.9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.green50,
                                    ),
                                    child: Center(
                                      child: Text(AppText.payment.toUpperCase(),
                                          style: AppTextStyle.whiteS16W700FGen),
                                    ),
                                  )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ReceiptView receiptView = const ReceiptView();
