import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});
  static const int START_HOUR = 6;
  static const int END_HOUR = 22;
  static const int TOTAL_HOURS = END_HOUR - START_HOUR;
  static const double MINUTE_WIDTH = 1.8;
  static const double HOUR_WIDTH = MINUTE_WIDTH * 60;
  static const Color STAFF_BLOCK_GREEN = Color(0xFF66BB6A);
  static const Color STAFF_BLOCK_YELLOW = Color(0xFFFFF176);
  static const Color STAFF_BLOCK_LIGHT_GREEN = Color(0xFFE8F5E9);
  static const Color EVENT_TEXT_COLOR = Color(0xFF90A4AE);
  static const Color LIGHT_TEXT_COLOR = Colors.white;
  static const Color EVENT_BLOCK_DARK = Color(0xFF424242);

  List<Map<String, dynamic>> get _staffAssignments {
    return [
      {
        'name': 'Rajeev Singh',
        'role': 'Head Chef',
        'rate': '3:45/hour',
        'startMin': 0,
        'durationMin': 180,
        'row': 1,
        'color': STAFF_BLOCK_GREEN,
      },
      {
        'name': 'Rajeev Singh',
        'role': 'Head Chef',
        'rate': '3:45/hour',
        'startMin': 360,
        'durationMin': 180,
        'row': 1,
        'color': STAFF_BLOCK_GREEN,
      },
      {
        'name': 'Rajeev Singh',
        'role': 'Head Chef',
        'rate': '3:45/hour',
        'startMin': 600,
        'durationMin': 180,
        'row': 1,
        'color': STAFF_BLOCK_GREEN,
      },
      {
        'name': 'Rajeev Singh',
        'role': 'Head Chef',
        'rate': '3:45/hour',
        'startMin': 180,
        'durationMin': 180,
        'row': 2,
        'color': STAFF_BLOCK_YELLOW,
      },
      {
        'name': 'Rajeev Singh',
        'role': 'Head Chef',
        'rate': '3:45/hour',
        'startMin': 360,
        'durationMin': 180,
        'row': 3,
        'color': STAFF_BLOCK_GREEN,
      },
      {
        'name': 'Rajeev Singh',
        'role': 'Head Chef',
        'rate': '3:45/hour',
        'startMin': 480,
        'durationMin': 180,
        'row': 4,
        'color': STAFF_BLOCK_GREEN,
      },
      {
        'name': 'Rajeev Singh',
        'role': 'Head Chef',
        'rate': '3:45/hour',
        'startMin': 0,
        'durationMin': 360,
        'row': 5,
        'color': STAFF_BLOCK_LIGHT_GREEN,
      },
      {
        'name': 'Rajeev Singh',
        'role': 'Head Chef',
        'rate': '3:45/hour',
        'startMin': 600,
        'durationMin': 180,
        'row': 5,
        'color': STAFF_BLOCK_GREEN,
      },
      {
        'name': 'Rajeev Singh',
        'role': 'Head Chef',
        'rate': '3:45/hour',
        'startMin': 0,
        'durationMin': 180,
        'row': 6,
        'color': STAFF_BLOCK_YELLOW,
      },
      {
        'name': 'Rajeev Singh',
        'role': 'Head Chef',
        'rate': '3:45/hour',
        'startMin': 360,
        'durationMin': 180,
        'row': 6,
        'color': STAFF_BLOCK_GREEN,
      },
      {
        'name': 'Rajeev Singh',
        'role': 'Head Chef',
        'rate': '3:45/hour',
        'startMin': 180,
        'durationMin': 180,
        'row': 7,
        'color': STAFF_BLOCK_GREEN,
      },
      {
        'name': 'Rajeev Singh',
        'role': 'Head Chef',
        'rate': '3:45/hour',
        'startMin': 360,
        'durationMin': 180,
        'row': 8,
        'color': STAFF_BLOCK_LIGHT_GREEN,
      },
    ];
  }

  List<Map<String, dynamic>> get _eventDetails {
    return [
      {
        'title': 'Break Fast',
        'prep': '6:00 AM - 8:30 AM',
        'serve': null,
        'row': 0,
        'col': 0,
        'startMin': 0,
        'durationMin': 150,
      },
      {
        'title': 'Break Fast',
        'prep': null,
        'serve': '8:30 AM - 11:00 AM',
        'row': 0,
        'col': 1,
        'startMin': 150,
        'durationMin': 150,
      },
      {
        'title': 'Lunch',
        'prep': '11:00 AM - 12:30 PM',
        'serve': null,
        'row': 0,
        'col': 2,
        'startMin': 300,
        'durationMin': 90,
      },
      {
        'title': 'Lunch',
        'prep': null,
        'serve': '12:30 PM - 2:30 PM',
        'row': 0,
        'col': 3,
        'startMin': 390,
        'durationMin': 120,
      },
      {
        'title': 'N/A',
        'prep': null,
        'serve': null,
        'row': 0,
        'col': 4,
        'startMin': 510,
        'durationMin': 150,
      },
      {
        'title': 'Dinner',
        'prep': '05:00 PM - 7:30 PM',
        'serve': null,
        'row': 0,
        'col': 5,
        'startMin': 660,
        'durationMin': 150,
      },
      {
        'title': 'Dinner',
        'prep': null,
        'serve': '07:30 PM - 10:00 PM',
        'row': 0,
        'col': 6,
        'startMin': 810,
        'durationMin': 150,
      },
      {
        'title': 'N/A',
        'prep': null,
        'serve': null,
        'row': 1,
        'col': 0,
        'startMin': 0,
        'durationMin': 240,
      },
      {
        'title': 'Event Name 1',
        'prep': '10:00 AM - 12:00 PM',
        'serve': null,
        'row': 1,
        'col': 1,
        'startMin': 240,
        'durationMin': 120,
      },
      {
        'title': 'Event Name 1',
        'prep': null,
        'serve': '12:00 PM - 2:30 PM',
        'row': 1,
        'col': 2,
        'startMin': 360,
        'durationMin': 150,
      },
      {
        'title': 'N/A',
        'prep': null,
        'serve': null,
        'row': 1,
        'col': 3,
        'startMin': 510,
        'durationMin': 150,
      },
      {
        'title': 'Event Name 2',
        'prep': '5:00 PM - 7:00 PM',
        'serve': null,
        'row': 1,
        'col': 4,
        'startMin': 660,
        'durationMin': 120,
      },
      {
        'title': 'Event Name 2',
        'prep': null,
        'serve': '7:00 PM - 9:30 PM',
        'row': 1,
        'col': 5,
        'startMin': 780,
        'durationMin': 150,
      },
    ];
  }

  Widget _buildTimeAxis(BuildContext context) {
    List<Widget> timeMarkers = [];
    for (int h = START_HOUR; h <= END_HOUR; h++) {
      String label = '';
      if (h == 12) {
        label = '12pm';
      } else if (h == 24 || h == 0) {
        label = '12am';
      } else if (h > 12) {
        label = '${h - 12}pm';
      } else {
        label = '${h}am';
      }

      if (h < END_HOUR) {
        timeMarkers.add(
          SizedBox(
            width: HOUR_WIDTH,
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        );
      }
    }
    return Container(child: Row(children: timeMarkers));
  }

  Widget _buildTimelineGrid() {
    return Row(
      children: List.generate(TOTAL_HOURS + 1, (index) {
        return Container(
          width: index == TOTAL_HOURS ? 0 : HOUR_WIDTH,
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1.0),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildStaffBlock(
    BuildContext context,
    Map<String, dynamic> staff,
    double topOffset,
  ) {
    final double left = (staff['startMin'] as int) * MINUTE_WIDTH;
    final double width = (staff['durationMin'] as int) * MINUTE_WIDTH;
    final Color blockColor = staff['color'] as Color;
    final bool isDarkBlock = blockColor == STAFF_BLOCK_GREEN;
    return Positioned(
      top: topOffset,
      left: left,
      child: Container(
        width: width,
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        margin: const EdgeInsets.symmetric(vertical: 2.0),
        decoration: BoxDecoration(
          color: blockColor.withOpacity(isDarkBlock ? 0.9 : 1.0),
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: Colors.grey.shade600, width: 0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (width > 80)
              Text(
                staff['rate'] as String,
                style: TextStyle(
                  fontSize: 10,
                  color: isDarkBlock ? LIGHT_TEXT_COLOR : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (width > 120)
              Row(
                children: [
                  Text(
                    staff['name'] as String,
                    style: TextStyle(
                      fontSize: 10,
                      color: isDarkBlock ? LIGHT_TEXT_COLOR : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (staff['role'] != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        staff['role'] as String,
                        style: TextStyle(
                          fontSize: 10,
                          color: isDarkBlock ? LIGHT_TEXT_COLOR : Colors.black,
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventBlock(
    BuildContext context,
    Map<String, dynamic> event,
    double topOffset,
  ) {
    final double left = (event['startMin'] as int) * MINUTE_WIDTH;
    final double width = (event['durationMin'] as int) * MINUTE_WIDTH;
    String mainTitle = event['title'] as String;
    String? prepTime = event['prep'] as String?;
    String? serveTime = event['serve'] as String?;
    bool isNA = mainTitle == 'N/A';
    final Color blockBackgroundColor = isNA
        ? Colors.transparent
        : EVENT_BLOCK_DARK;

    return Positioned(
      top: topOffset,
      left: left,
      child: Container(
        width: width,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0),
            bottom: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0),
          ),
          color: blockBackgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isNA)
              Text(
                'N/A',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: EVENT_TEXT_COLOR,
                ),
              ),

            if (!isNA) ...[
              Text(
                mainTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  color: LIGHT_TEXT_COLOR,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                prepTime != null ? 'Preparation Time' : 'Serve Time',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 8.5, color: EVENT_TEXT_COLOR),
              ),
              const SizedBox(height: 1),
              Text(
                prepTime ?? serveTime ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 9.5, color: LIGHT_TEXT_COLOR),
              ),
              const SizedBox(height: 1),
              Text(
                prepTime != null ? 'Menu' : 'Live Counter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 8.5,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const double TIME_AXIS_HEIGHT = 30.0;
    const double EVENT_ROW_HEIGHT = 70.0;
    const double STAFF_BLOCK_ROW_HEIGHT = 35.0;
    const double HEADER_HEIGHT = TIME_AXIS_HEIGHT + (EVENT_ROW_HEIGHT * 2);
    const double STAFF_SECTION_TOP = HEADER_HEIGHT;
    final int STAFF_ROWS = _staffAssignments
        .map((s) => s['row'] as int)
        .reduce((a, b) => a > b ? a : b);
    final double TOTAL_SCROLLABLE_WIDTH =
        (HOUR_WIDTH * TOTAL_HOURS) + (5 * MINUTE_WIDTH);
    final double TOTAL_HEIGHT =
        HEADER_HEIGHT + (STAFF_ROWS * STAFF_BLOCK_ROW_HEIGHT) + 16.0;

    return SingleChildScrollView(
      child: Container(
        height: TOTAL_HEIGHT,
        color: theme.scaffoldBackgroundColor,
        child: Row(
          children: [
            Container(
              width: 60,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.0,
                  ),
                ),
              ),
              padding: const EdgeInsets.only(right: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: TIME_AXIS_HEIGHT,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          '06:43\nAM',
                          textAlign: TextAlign.right,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                            height: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    height: EVENT_ROW_HEIGHT,
                    alignment: Alignment.topRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Guest',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: EVENT_TEXT_COLOR,
                          ),
                        ),
                        Text('Buffet', style: theme.textTheme.bodyMedium),
                        Text(
                          'Details',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: EVENT_ROW_HEIGHT,
                    alignment: Alignment.topRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Event',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: EVENT_TEXT_COLOR,
                          ),
                        ),
                        Text('Buffet', style: theme.textTheme.bodyMedium),
                        Text(
                          'Details',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: STAFF_ROWS * STAFF_BLOCK_ROW_HEIGHT),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: TOTAL_SCROLLABLE_WIDTH,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: _buildTimeAxis(context),
                      ),
                      _buildTimelineGrid(),
                      Positioned(
                        left: 43 * MINUTE_WIDTH,
                        top: 0,
                        bottom: 0,
                        child: Container(width: 2, color: theme.primaryColor),
                      ),
                      ..._eventDetails
                          .where((e) => e['row'] == 0)
                          .map(
                            (e) =>
                                _buildEventBlock(context, e, TIME_AXIS_HEIGHT),
                          )
                          .toList(),
                      ..._eventDetails
                          .where((e) => e['row'] == 1)
                          .map(
                            (e) => _buildEventBlock(
                              context,
                              e,
                              TIME_AXIS_HEIGHT + EVENT_ROW_HEIGHT,
                            ),
                          )
                          .toList(),
                      ..._staffAssignments.map((staff) {
                        double topOffset =
                            STAFF_SECTION_TOP +
                            ((staff['row'] as int) - 1) *
                                STAFF_BLOCK_ROW_HEIGHT;
                        return _buildStaffBlock(context, staff, topOffset);
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
