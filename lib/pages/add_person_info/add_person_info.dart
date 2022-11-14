import 'package:flutter/material.dart';
import 'package:personal_info/pages/add_person_info/widgets/custom_input.dart';

class AddPersonInfoPage extends StatefulWidget {
  const AddPersonInfoPage({super.key});

  @override
  State<AddPersonInfoPage> createState() => _AddPersonInfoPageState();
}

class _AddPersonInfoPageState extends State<AddPersonInfoPage> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('เพิ่มข้อมูลบุคคล'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stepper(
              onStepTapped: (value) {
                setState(() {
                  currentStep = value;
                });
              },
              currentStep: currentStep,
              onStepContinue: () {
                final isLastStep = currentStep == getSteps(context).length - 1;
                if (isLastStep) {
                  Navigator.of(context).pop();
                }
                if (currentStep != getSteps(context).length - 1) {
                  setState(() {
                    currentStep++;
                  });
                }
              },
              onStepCancel: () {
                if (currentStep <= 0) {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                }
                if (currentStep != 0) {
                  setState(() {
                    currentStep--;
                  });
                }
              },
              steps: getSteps(context),
            ),
          ],
        ),
      ),
    );
  }

  getSteps(BuildContext context) {
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text('ข้อมูลส่วนตัว'),
        content: Column(
          children: [
            CustomInput(
              hint: 'ชื่อ',
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hint: 'นามสกุล',
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hint: 'อายุ',
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hint: 'เพศ',
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hint: 'อีเมล',
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hint: 'เบอร์โทรศัพท์',
              inputBorder: OutlineInputBorder(),
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text('ที่อยู่ตามบัตรประชาชน'),
        content: Column(
          children: [
            CustomInput(
              hint: 'บ้านเลขที่',
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hint: 'ถนน',
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hint: 'แขวง',
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hint: 'เขต',
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hint: 'จังหวัด',
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hint: 'รหัสไปรษณีย์',
              inputBorder: OutlineInputBorder(),
            ),
          ],
        ),
      ),
    ];
  }
}
