import 'package:flutter/material.dart';
import 'package:smc/core/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../core/ui/back_floating_button.dart';

class OPDPage extends ReactiveStatelessWidget {
  const OPDPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'OPD'.textify(),
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 4,
        itemBuilder: (_, i) => ListTile(
          title: 'pt'.textify(),
          leading: CircleAvatar(
            child: '5'.textify(),
          ),
          subtitle: Column(
            children: [
              'details'.textify(),
              // DropdownButtonFormField(
              //   value: CaseStatus.opd,
              //   items: CaseStatus.values
              //       .map(
              //         (e) => DropdownMenuItem(
              //           value: e,
              //           child: e.textify(),
              //         ),
              //       )
              //       .toList(),
              //   onChanged: (_) {},
              // ),
              // OnFormFieldBuilder<List<CaseType>>(
              //   listenTo: selectedCaseTypes,
              //   inputDecoration: InputDecoration(
              //     labelText: 'CaseType',
              //     hintText: 'select at least one item',
              //     suffixIcon: selectedCaseTypes.hasError ? const Icon(Icons.error, color: Colors.red) : const Icon(Icons.check, color: Colors.green),
              //   ),
              //   builder: (val, onChanged) {
              //     return Wrap(
              //       children: CaseType.values
              //           .map(
              //             (e) => Row(
              //               children: [
              //                 Checkbox(
              //                   value: val.contains(e),
              //                   onChanged: (checked) {
              //                     if (checked!) {
              //                       selectedCaseTypes.value = [...val, e];
              //                     } else {
              //                       selectedCaseTypes.value = val.where((el) => e != el).toList();
              //                     }
              //                   },
              //                 ),
              //                 e.name.textify(),
              //                 const SizedBox(width: 8),
              //               ],
              //             ),
              //           )
              //           .toList(),
              //     ).pad;
              //   },
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: const BackFloatingButton(),
    );
  }
}

// final selectedCaseTypes = RM.injectFormField<List<CaseType>>(
//   [],
//   validators: [
//     (val) {
//       if (val.isEmpty) {
//         return 'choose at least one item';
//       }
//       return null;
//     }
//   ],
// );
