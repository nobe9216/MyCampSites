import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:input_form_controller/input_form_controller.dart';
import 'package:my_camp_sites/controller/camp_site_input_form_controller.dart';
import 'package:my_camp_sites/model/camp_site.dart';

class CampSiteForm extends StatelessWidget {
  const CampSiteForm({
    super.key,
    required this.inputFormController,
    this.readOnly = false,
  });

  final InputFormController<CampSite> inputFormController;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(
      height: 30,
    );
    return Form(
      key: campSiteFormKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _LabeledFormField(
              label: 'キャンプ場名',
              readOnly: readOnly,
              initialValue: inputFormController.initialValue.name,
              maxLength: 30,
              validator: (value) {
                if (value == null || value == '') {
                  return '入力必須です';
                }
                return null;
              },
              onSaved: (newValue) => inputFormController.update(
                (currentValue) => currentValue.copyWith(
                  name: newValue ?? '',
                ),
              ),
            ),
            gap,
            _LabeledFormField(
              label: '住所',
              readOnly: readOnly,
              initialValue: inputFormController.initialValue.address,
              maxLength: 100,
              onSaved: (newValue) => inputFormController.update(
                (currentValue) => currentValue.copyWith(
                  address: newValue ?? '',
                ),
              ),
            ),
            gap,
            _LabeledFormField(
              label: '電話番号',
              readOnly: readOnly,
              initialValue: inputFormController.initialValue.phoneNumber,
              maxLength: 20,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSaved: (newValue) => inputFormController.update(
                (currentValue) => currentValue.copyWith(
                  phoneNumber: newValue ?? '',
                ),
              ),
            ),
            gap,
            _LabeledFormField(
              label: 'メモ',
              readOnly: readOnly,
              initialValue: inputFormController.initialValue.memo,
              onSaved: (newValue) => inputFormController.update(
                (currentValue) => currentValue.copyWith(
                  memo: newValue ?? '',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LabeledFormField extends StatelessWidget {
  const _LabeledFormField({
    required this.label,
    this.readOnly = false,
    this.initialValue,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.onSaved,
  });

  final String label;
  final bool readOnly;
  final String? initialValue;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            border: readOnly ? InputBorder.none : const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
          ),
          readOnly: readOnly,
          initialValue: initialValue,
          maxLength: maxLength,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          onSaved: onSaved,
        ),
      ],
    );
  }
}
