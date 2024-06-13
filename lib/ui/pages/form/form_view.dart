import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uuid/uuid.dart';
import 'package:work_shop/models/card_data.dart';
import 'package:work_shop/ui/components/button.dart';
import 'package:work_shop/ui/pages/form/form_controller.dart';

class FormView extends StatelessWidget {
  FormView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ctrl = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      bottomNavigationBar: _buildBottom(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildFormItem(
                label: 'Title',
                txtHint: 'title',
                controller: ctrl.txtTitleController),
            const SizedBox(
              height: 16,
            ),
            _buildFormItem(
                label: 'Desc',
                txtHint: 'desc',
                controller: ctrl.txtDescController),
          ],
        ),
      ),
    );
  }

  Widget _buildFormItem(
      {required String label,
      required String txtHint,
      required TextEditingController controller}) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          obscureText: false,
          decoration: InputDecoration(
            hintText: txtHint,
            labelText: label,
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ));

    // return TextFormField(
    //   decoration: InputDecoration(
    //     // icon: Icon(Icons.person),
    //     hintText: txtHint,
    //     labelText: label,
    //   ),
    //   onSaved: (String? value) {
    //     // This optional block of code can be used to run
    //     // code when the user saves the form.
    //   },
    //   validator: (String? value) {
    //     return (value != null && value.contains('@'))
    //         ? 'Do not use the @ char.'
    //         : null;
    //   },
    // );
  }

  Widget _buildBottom() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: IPrimaryButton(
          text: 'Save',
          onPressed: () => {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.

                if (_formKey.currentState!.validate())
                  {
                    Get.back(
                        result: CardData(
                            title: ctrl.txtTitleController.text,
                            desc: ctrl.txtDescController.text,
                            id: ctrl.argMode != 'edit'
                                ? Uuid().v4()
                                : ctrl.argData?.id ?? ''))
                  }
              }),
    );
  }
}
