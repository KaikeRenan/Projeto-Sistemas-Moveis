import 'package:flutter/material.dart';
import 'package:projeto_sistemas_moveis/widgets/custom_bottom_nav.dart';
import 'package:table_calendar/table_calendar.dart';

class TelaCalendario extends StatefulWidget {
  const TelaCalendario({super.key});

  @override
  State<TelaCalendario> createState() => _TelaCalendarioState();
}

class _TelaCalendarioState extends State<TelaCalendario> {
  DateTime _hoje = DateTime.now();
  DateTime? _diaSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendário'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0))),
      ),
      bottomNavigationBar: BottomNavigationBarPersonalizada(currentIndex: 2),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TableCalendar(
          firstDay: DateTime.utc(2026, 01, 01),
          lastDay: DateTime.utc(2026, 12, 31),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: Colors.deepPurple),
          ),
          calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(color: Colors.deepPurple),
            selectedDecoration: BoxDecoration(color: Colors.purple),
          ),
          focusedDay: _hoje,
          selectedDayPredicate: (day) => isSameDay(_diaSelecionado, day),
          onDaySelected: _onDaySelected,
        ),
      ),
    );
  }

  void _onDaySelected(DateTime diaSelecionado, DateTime hoje) {
    if (!isSameDay(_diaSelecionado, diaSelecionado)) {
      setState(() {
        _diaSelecionado = diaSelecionado;
        _hoje = hoje;
      });
    }
  }
}
