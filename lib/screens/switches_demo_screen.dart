import 'package:flutter/material.dart';
import 'package:untitled1/utils/global_theme.dart';

class SwitchesDemoScreen extends StatefulWidget {
  const SwitchesDemoScreen ({Key? key}) : super(key: key);

  @override
  _SwitchesDemoScreenState createState() => _SwitchesDemoScreenState();
}

enum SkillLevel { junior, middle, senior }

class _SwitchesDemoScreenState extends State<SwitchesDemoScreen> {
  bool _checked = false;
  bool _confirmAgreement = true;
  SkillLevel? _SkillLevel = SkillLevel.junior;
  void _onCheckedChange(bool? val){
    setState(() {
      _checked = !_checked;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
        home: Scaffold(
          appBar: AppBar (),
        body: Center(
        child: Column(children: [
          Row(
            children: [
              Checkbox(value: _checked, onChanged: _onCheckedChange),
              const Text('Выбор'),
            ],
          ),
          CheckboxListTile(
              title: const Text('Принять условия соглашения'),
              value: _confirmAgreement, onChanged: (val){
                setState(() {
                  _confirmAgreement = !_confirmAgreement;
                });
          }),

          Switch (value: _checked, onChanged: _onCheckedChange),
          const Text ('Включить'),


          SwitchListTile(
              title: const Text ('Выключить'),
              value: _checked,
              onChanged:_onCheckedChange
    ),
          const Text ('Уровень навыков:'),
          RadioListTile <SkillLevel>(
            title: const Text('junior'),
              value: SkillLevel.junior,
              groupValue: _SkillLevel,
              onChanged:(SkillLevel? value) {
              setState(() {
                _SkillLevel = value;
              });
              },
          ),
          RadioListTile <SkillLevel>(
            title: const Text('middle'),
            value: SkillLevel.middle,
            groupValue: _SkillLevel,
            onChanged:(SkillLevel? value) {
              setState(() {
                _SkillLevel = value;
              });
            },
          ),
          RadioListTile <SkillLevel>(
            title: const Text('senior'),
            value: SkillLevel.senior,
            groupValue: _SkillLevel,
            onChanged:(SkillLevel? value) {
              setState(() {
                _SkillLevel = value;
              });
            },
          ),
  ] )
    )
    )
    );
  }
}
