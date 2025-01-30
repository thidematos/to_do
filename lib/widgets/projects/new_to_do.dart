import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/tasks_provider.dart';
import 'package:to_do/services/firebase_firestore_api.dart';
import 'package:to_do/services/firebase_storage_api.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';
import 'package:to_do/widgets/ui/error_snackbar.dart';
import 'package:to_do/widgets/ui/styled_button.dart';

class NewToDo extends ConsumerStatefulWidget {
  const NewToDo(this.projectID, {super.key});

  final String projectID;

  @override
  ConsumerState<NewToDo> createState() => _NewToDoState();
}

class _NewToDoState extends ConsumerState<NewToDo> {
  String selectedPriority = 'medium';
  final formKey = GlobalKey<FormState>();
  String? taskName = '';
  int? storypoints = 0;

  bool isLoading = false;

  void submit() async {
    final bool isValidate = formKey.currentState!.validate();

    if (!isValidate) {
      showSnackbar(context, 'Erro em criar task');
      return;
    }

    formKey.currentState!.save();

    setState(() {
      isLoading = true;
    });

    await FirebaseFirestoreApi.addNewTask(
        taskName!, storypoints!, selectedPriority, widget.projectID);

    ref.invalidate(TasksProvider);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 350,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 24,
          children: [
            Text(
              'Nova task',
              style: LetterTheme.logo.copyWith(
                color: ColorTheme.black,
                fontSize: 20,
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                spacing: 20,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Uma task precisa de um título';
                      }

                      return null;
                    },
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration().copyWith(
                      hintText: 'Criar Frontend',
                      prefixIcon: Icon(Icons.settings),
                    ),
                    onSaved: (value) => taskName = value,
                  ),
                  Row(
                    spacing: 24,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || int.tryParse(value) == null) {
                              return 'Valor de Storypoints';
                            }

                            int num = int.parse(value);

                            if (num <= 0) {
                              return 'Valor de Storypoints';
                            }

                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration().copyWith(
                            labelText: 'Story Points',
                            hintText: '46',
                          ),
                          onSaved: (newValue) =>
                              storypoints = int.parse(newValue!),
                        ),
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          decoration: InputDecoration().copyWith(
                            labelText: 'Prioridade',
                          ),
                          value: selectedPriority,
                          items: [
                            DropdownMenuItem(
                              value: 'high',
                              child: Text('Crítica'),
                            ),
                            DropdownMenuItem(
                              value: 'medium',
                              child: Text('Importante'),
                            ),
                            DropdownMenuItem(
                              value: 'low',
                              child: Text('Desejável'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedPriority = value!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  if (isLoading)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  if (!isLoading)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: StyledButton(
                        'Adicionar Task 🚀',
                        colorBg: ColorTheme.ctaBG,
                        fontWeight: FontWeight.w900,
                        colorLabel: ColorTheme.ctaAccent,
                        onTap: submit,
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
