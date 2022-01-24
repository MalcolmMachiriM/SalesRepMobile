import 'package:flutter/material.dart';

orderItems() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        // borderRadius: BorderRadius.all(ra)
      ),
      // width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 2),
                    child: Text(
                      'Code',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('123463455375'),
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: const TextButton(
                      onPressed: null, child: Text('Approved')))
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [Text('Order Date'), Text('03/11/2021')],
          ),
          const Divider(
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total'),
              Row(
                children: const [Icon(Icons.attach_money), Text('30000')],
              )
            ],
          ),
        ],
      ),
    ),
  );
}
