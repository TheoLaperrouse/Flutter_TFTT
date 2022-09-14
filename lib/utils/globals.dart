library globals;

import 'package:flutter_tftt/models/player.dart';
import 'package:flutter_tftt/models/live.dart';
import 'package:flutter_tftt/models/team.dart';
import 'package:flutter_tftt/models/ticketing.dart';

Player player;
Live live;
TicketingData ticketing;
List<Team> teams;
Map<String, Team> teamSettings = {};
Map<String, String> teamName = {};
