import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/parent_dashboard/announcement_list.dart';
import 'appointment_page/appointment.dart';
import 'package:vaccine_scheduler/parent_dashboard/child_profile/child_profile.dart';
import 'package:vaccine_scheduler/parent_dashboard/moreaboutvaccines.dart';
import 'package:vaccine_scheduler/parent_dashboard/vaccine_timeline/timeline.dart';
import 'package:vaccine_scheduler/parent_dashboard/faqs.dart';
import 'package:vaccine_scheduler/parent_dashboard/parent_drawer.dart';
import 'package:vaccine_scheduler/parent_dashboard/home_landing/home_landing.dart';
class ParentDashboard extends StatefulWidget {
  final String email;

  const ParentDashboard({super.key, required this.email});

  @override
  State<ParentDashboard> createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _pages = [
      ParentHomeLanding(email: widget.email),
      Appointments(email: widget.email),
      ChildProfile(email: widget.email),
      VaccineTimeline(email: widget.email),
      FAQs(email: widget.email),
      MoreAboutVaccines(email: widget.email),
      AnnouncementList(email: widget.email),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ParentDrawer(
        email: widget.email,
        onItemSelected: (index) {
          setState(() => _selectedIndex = index);
          Navigator.pop(context);
        },
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A2A3A), Color(0xFF2F4F6F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Row(
                  children: [
                    const SizedBox(width: 4),
                   
              //const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _pages[_selectedIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

