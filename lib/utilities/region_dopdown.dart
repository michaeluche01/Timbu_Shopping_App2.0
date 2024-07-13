import 'package:flutter/material.dart';

class RegionDropDown extends StatefulWidget {
  final String labeltext;
  const RegionDropDown({super.key, required this.labeltext});

  @override
  State<RegionDropDown> createState() => _RegionDropDownState();
}

class _RegionDropDownState extends State<RegionDropDown> {
  String? _selectedStatus;

  final List<String> _regionstatus = [
    'Region 1',
    'Region 2',
    'Region 3',
  ];

  @override
  Widget build(BuildContext context) {
    return maritalStatusDropdown();
  }

  Column maritalStatusDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButton<String>(
            dropdownColor: Theme.of(context).colorScheme.secondary,
            value: _selectedStatus,
            hint: const Text('Select Region'),
            onChanged: (String? newValue) {
              setState(() {
                _selectedStatus = newValue;
              });
            },
            items: _regionstatus.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        // SizedBox(height: 20),
        // if (_selectedStatus != null)
        //   Text("Selected Marital Status: $_selectedStatus"),
      ],
    );
  }
}
