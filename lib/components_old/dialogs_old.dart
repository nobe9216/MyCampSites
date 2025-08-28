import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:input_form_controller/input_form_controller.dart';
import 'package:my_camp_sites/strings.dart';

@deprecated
class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    this.content,
    this.defaultAction,
    this.cancelAction,
  });

  final Widget? content;
  final void Function()? defaultAction;
  final void Function()? cancelAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: content,
      actions: [
        TextButton(
          onPressed: defaultAction,
          child: const Text(Strings.yes),
        ),
        TextButton(
          onPressed: cancelAction,
          child: const Text(Strings.no),
        ),
      ],
    );
  }
}

// TODO(y.yamanobe): フルスクリーンの方がいい
// navigatorのメソッドを使ってpushする表示の仕方で、MaterialPageRouteを設定すればフルスクリーンにできる
// TODO(y.yamanobe): 表示領域が狭いので、押しやすくするならwizardなんかもありかも（ステッパーみたいなもの）
// モバイル端末なら、スクロールでもいいけど
// ステップを踏ませるなら、中断できる

// TODO(y.yamanobe): 金額の桁数は内部的に制限をして、最大文字数を表示しない方法がある（桁数が表示されると違和感があるため）
// 感想はもっとエリア広く
@deprecated
class AddDialog<T> extends HookConsumerWidget {
  const AddDialog({
    super.key,
    required this.inputFormController,
    required this.title,
    this.content,
    required this.buttonLabel,
    this.onPressed,
  });

  final InputFormController<T> inputFormController;
  final String title;
  final Widget? content;
  final String buttonLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      content: content,
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text(buttonLabel),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(Strings.back),
        ),
      ],
    );
  }
}
