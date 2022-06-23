import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // doesnt update the interface because no setState is called
              // setState can't be called because this is a stateless widget, not a stateful widget
              /* onChanged: (val) => titleInput = val, */
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              /*   onChanged: (val) => amountInput = val, */
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: () => addNewTransaction(
                titleController.text,
                double.parse(amountController.text),
              ),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
