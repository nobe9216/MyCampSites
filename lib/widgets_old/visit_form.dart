import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:input_form_controller/input_form_controller.dart';
import 'package:intl/intl.dart';
import 'package:my_camp_sites/components_old/dialogs_old.dart';
import 'package:my_camp_sites/components_old/widget_add_widget.dart';
import 'package:my_camp_sites/controller_old/visit_input_form_controller.dart';
import 'package:my_camp_sites/model_old/camp_site.dart';
import 'package:my_camp_sites/model_old/visit.dart';
import 'package:my_camp_sites/providers_old/camp_site_service_provider.dart';
import 'package:my_camp_sites/themes_old/main_theme.dart';

final evaluationDialogStateProvider = StateProvider<bool>((ref) => false);
final visitedCampSiteSelectDialogStateProvider =
    StateProvider<bool>((ref) => false);
final _selectedCampSiteProvider = StateProvider<CampSite?>((ref) => null);
final _selectedVisitedDateProvider = StateProvider<DateTime?>((ref) => null);

class VisitForm extends HookConsumerWidget {
  const VisitForm({
    super.key,
    required this.inputFormController,
    this.readOnly = false,
  });

  final InputFormController<Visit> inputFormController;
  final bool readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(_selectedVisitedDateProvider);
    final initialValue = inputFormController.initialValue;
    const verticalGap = Gap(20);
    const suffix = '円';
    final campSite = ref.watch(_selectedCampSiteProvider);
    return Form(
      key: visitFormKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TODO(y.yamanobe memo): 冗長
            Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: MainTheme.of(context).commonTextColor,
                  ),
                  onPressed: () async {
                    final now = DateTime.now();
                    final date = await showDatePicker(
                      context: context,
                      firstDate: now.copyWith(
                        year: now.year - 1,
                      ),
                      lastDate: now,
                    );
                    if (date == null) {
                      return;
                    }
                    ref.read(_selectedVisitedDateProvider.notifier).state =
                        date;
                    inputFormController.update(
                      (currentValue) => currentValue.copyWith(
                        visitedDate: date,
                      ),
                    );
                  },
                  child: Text(
                    selectedDate == null
                        ? '日付'
                        : DateFormat('yyyy/MM/dd').format(selectedDate),
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
                const Gap(30),
                Expanded(
                  child: _FormFieldWithPrefixAndSuffix(
                    prefix: '滞在',
                    suffix: '日',
                    fieldWidth: 50,
                    readOnly: readOnly,
                    counterText: '',
                    initialValue: initialValue.lengthOfStay.toString(),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]'),
                      ),
                    ],
                    maxLength: 3,
                    onSaved: (newValue) => inputFormController.update(
                      (currentValue) => currentValue.copyWith(
                        lengthOfStay: int.parse(newValue ?? '0'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            verticalGap,
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: MainTheme.of(context).commonTextColor,
                ),
                onPressed: () => ref
                    .read(visitedCampSiteSelectDialogStateProvider.notifier)
                    .state = true,
                child: Text(
                  campSite == null ? 'キャンプ場' : campSite.name,
                ),
              ),
            ),
            verticalGap,
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: MainTheme.of(context).commonTextColor,
                ),
                onPressed: () => ref
                    .read(evaluationDialogStateProvider.notifier)
                    .state = true,
                child: const Text('評価'),
              ),
            ),
            verticalGap,
            _FormFieldWithPrefixAndSuffix(
              prefix: '宿泊費',
              suffix: suffix,
              fieldWidth: 100,
              readOnly: readOnly,
              counterText: '',
              initialValue: initialValue.accommodationFee.toString(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]'),
                ),
              ],
              maxLength: 30,
              onSaved: (newValue) => inputFormController.update(
                (currentValue) => currentValue.copyWith(
                  accommodationFee: int.parse(newValue ?? '0'),
                ),
              ),
            ),
            verticalGap,
            _FormFieldWithPrefixAndSuffix(
              prefix: '交通費',
              suffix: suffix,
              fieldWidth: 100,
              readOnly: readOnly,
              counterText: '',
              initialValue: initialValue.transportationFee.toString(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]'),
                ),
              ],
              maxLength: 30,
              onSaved: (newValue) => inputFormController.update(
                (currentValue) => currentValue.copyWith(
                  transportationFee: int.parse(newValue ?? '0'),
                ),
              ),
            ),
            verticalGap,
            _FormFieldWithPrefixAndSuffix(
              prefix: '食費',
              suffix: suffix,
              fieldWidth: 100,
              readOnly: readOnly,
              counterText: '',
              initialValue: initialValue.foodCosts.toString(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]'),
                ),
              ],
              maxLength: 30,
              onSaved: (newValue) => inputFormController.update(
                (currentValue) => currentValue.copyWith(
                  foodCosts: int.parse(newValue ?? '0'),
                ),
              ),
            ),
            verticalGap,
            _FormFieldWithPrefixAndSuffix(
              prefix: '雑費',
              suffix: suffix,
              fieldWidth: 100,
              readOnly: readOnly,
              counterText: '',
              initialValue: initialValue.incidentalExpenses.toString(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]'),
                ),
              ],
              maxLength: 30,
              onSaved: (newValue) => inputFormController.update(
                (currentValue) => currentValue.copyWith(
                  incidentalExpenses: int.parse(newValue ?? '0'),
                ),
              ),
            ),
            verticalGap,
            // TODO(y.yamanobe memo): 入力中に見やすいようにしたほうがいい
            _LabeledFormField(
              label: '感想',
              readOnly: readOnly,
              initialValue: inputFormController.initialValue.impressions,
              maxLength: 500,
              onSaved: (newValue) => inputFormController.update(
                (currentValue) => currentValue.copyWith(
                  impressions: newValue ?? '',
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

class _FormFieldWithPrefixAndSuffix extends StatelessWidget {
  const _FormFieldWithPrefixAndSuffix({
    this.prefix,
    this.suffix,
    this.readOnly = false,
    this.initialValue,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.onSaved,
    this.fieldWidth,
    this.counterText,
  });

  final String? prefix;
  final String? suffix;
  final bool readOnly;
  final String? initialValue;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final double? fieldWidth;
  final String? counterText;

  @override
  Widget build(BuildContext context) {
    const gap = Gap(5);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefix != null) ...[
          SizedBox(
            width: 32,
            child: Text(
              prefix!,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          gap,
        ],
        TextFormField(
          decoration: InputDecoration(
            border: readOnly ? InputBorder.none : const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 10,
            ),
            counterText: counterText,
            isDense: true,
          ),
          readOnly: readOnly,
          initialValue: initialValue,
          maxLength: maxLength,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          onSaved: onSaved,
        ).addWidget(
          (child) => fieldWidth == null
              ? Expanded(child: child)
              : SizedBox(
                  width: fieldWidth,
                  child: child,
                ),
        ),
        if (suffix != null) ...[
          gap,
          SizedBox(
            width: 32,
            child: Text(
              suffix!,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          )
        ],
      ],
    );
  }
}

// TODO(y.yamanobe memo): 登録、編集で使うダイアログなので別で切り出す（visit_formは詳細表示などでも使うから用途が異なるため）
// TODO(y.yamanobe): nullをディスプレイに表示するのは、ログに出ないので潜在的なバグになりやすい
// TODO(y.yamanobe): 入力内容のサイズは、モバイルの推奨基準サイズがあるから調べると参考になるかも
class AddVisitedDialog extends HookConsumerWidget {
  const AddVisitedDialog({
    super.key,
    required this.inputFormController,
    required this.title,
    required this.buttonLabel,
    this.onPressed,
  });

  final InputFormController<Visit> inputFormController;
  final String title;
  final String buttonLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(visitedCampSiteSelectDialogStateProvider)) {
      return VisitedCampSiteSelectDialog(
        inputFormController: inputFormController,
      );
    }
    if (ref.watch(evaluationDialogStateProvider)) {
      return EvaluationDialog(
        inputFormController: inputFormController,
      );
    }
    return AddDialog(
      inputFormController: inputFormController,
      title: title,
      content: VisitForm(
        inputFormController: inputFormController,
      ),
      buttonLabel: buttonLabel,
      onPressed: onPressed,
    );
  }
}

// TODO(y.yamanobe memo): モデルへのデータ変更方法について
// 現在は、インスタンスを参照してその値を書き換えている（mutable）
// mutableだと、同じインスタンスを同時に複数の人が触れてしまう
// immutableにすればそれを防げる（freezedを使えば簡単に実現できるが、Isarと組み合わせて使えるかどうかは要調査、無理なら自分で実装するしかない）

// TODO(y.yamanobe memo): privateにしたい
// TODO(y.yamanobe memo): ダイアログ上部に総合評価をリアルタイムで表示すれば、このダイアログが閉じた後に総合評価だけが表示されても何の星の数なのかわかりやすい
// 星
class EvaluationDialog extends HookConsumerWidget {
  const EvaluationDialog({
    super.key,
    required this.inputFormController,
  });

  final InputFormController<Visit> inputFormController;

  RatingBar ratingBar(void Function(double) onRatingUpdate) {
    // TODO(y.yamanobe memo): 現状、評価の星を消すのに一度星1にする必要がある
    // もっと簡単に、現在選択中の星を押したら消えるように
    return RatingBar.builder(
      itemBuilder: (context, index) => const Icon(Icons.star),
      onRatingUpdate: onRatingUpdate,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const verticalGap = Gap(10);
    return AlertDialog(
      scrollable: true,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('トイレ評価'),
          verticalGap,
          ratingBar(
            (rate) {},
          ),
          verticalGap,
          const Text('洗い場評価'),
          verticalGap,
          ratingBar(
            (rate) {},
          ),
          verticalGap,
          const Text('売店評価'),
          verticalGap,
          ratingBar(
            (rate) {},
          ),
          verticalGap,
          const Text('立地評価'),
          verticalGap,
          ratingBar(
            (rate) {},
          ),
          verticalGap,
          const Text('景観評価'),
          verticalGap,
          ratingBar(
            (rate) {},
          ),
          verticalGap,
          const Text('混雑評価'),
          verticalGap,
          ratingBar(
            (rate) {},
          ),
          verticalGap,
          const Text('サイト評価'),
          verticalGap,
          ratingBar(
            (rate) {},
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () =>
              ref.read(evaluationDialogStateProvider.notifier).state = false,
          child: const Text('戻る'),
        ),
      ],
    );
  }
}

// TODO(y.yamanobe memo): privateにしたい
class VisitedCampSiteSelectDialog extends HookConsumerWidget {
  const VisitedCampSiteSelectDialog({
    super.key,
    required this.inputFormController,
  });

  final InputFormController<Visit> inputFormController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campSiteList = ref.watch(campSiteListProvider.future);
    final deviceSize = MediaQuery.of(context).size;
    return AlertDialog(
      content: FutureBuilder(
        future: campSiteList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('取得失敗'),
            );
          } else if (snapshot.hasData) {
            final campSiteList = snapshot.data!;
            return SizedBox(
              width: deviceSize.width,
              height: deviceSize.height,
              child: ListView.builder(
                itemCount: campSiteList.length,
                itemBuilder: (context, index) {
                  final campSite = campSiteList[index];
                  return ListTile(
                    title: (campSite.name).isEmpty
                        ? const Text('名無し')
                        : Text(campSite.name),
                    onTap: () {
                      inputFormController.update(
                        (currentValue) => currentValue.copyWith(
                          campSiteId: campSite.id!,
                        ),
                      );
                      ref.read(_selectedCampSiteProvider.notifier).state =
                          campSite;
                      ref
                          .read(
                              visitedCampSiteSelectDialogStateProvider.notifier)
                          .state = false;
                    },
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text('しばらくお待ちください'),
            );
          }
        },
      ),
      actions: [
        TextButton(
          onPressed: () => ref
              .read(visitedCampSiteSelectDialogStateProvider.notifier)
              .state = false,
          child: const Text('戻る'),
        ),
      ],
    );
  }
}
