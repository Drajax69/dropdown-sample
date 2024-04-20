import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T? value;
  final String hint;
  final ValueSetter<T?> onChanged; // Change ValueChanged to ValueSetter
  final double width;
  final double height;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.hint,
    required this.onChanged,
    required this.width,
    required this.height,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  late T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.value;
  }

// Add didUpdateWidget method
  @override
  void didUpdateWidget(covariant CustomDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _selectedItem = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: widget.width,
        maxHeight: widget.height,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          isExpanded: true,
          value: _selectedItem,
          hint: Text("Select ${widget.hint}"),
          onChanged: (newValue) {
            setState(() {
              _selectedItem = newValue;
              widget.onChanged(newValue);
            });
          },
          items: widget.items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(item.toString()),
            );
          }).toList(),
        ),
      ),
    );
  }
}
