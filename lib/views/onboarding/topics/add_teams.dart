import 'package:coding_game/providers/team_names_provider.dart';
import 'package:coding_game/views/home/home.dart';
import 'package:coding_game/views/home/home_image_page.dart';
import 'package:coding_game/views/reusables/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:coding_game/sharedPreferences/team_names.dart';

class AddTeams extends StatefulWidget {
  const AddTeams({super.key});

  @override
  State<AddTeams> createState() => _AddTeamsState();
}

class _AddTeamsState extends State<AddTeams> {
  final TextEditingController _teamNameController = TextEditingController();

  bool _isTeamAdded = false;
  List<String> _teams = [];

  Future<void> _provideTeamNames() async {
    final List<String> teamNames = await getTeamNames();

    if (!mounted) return;

    setState(() {
      _teams = teamNames;
    });
  }

  @override
  void initState() {
    super.initState();
    _provideTeamNames();
  }

  @override
  void dispose() {
    _teamNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TeamNamesProvider teamNamesProvider = context
        .read<TeamNamesProvider>();

    return Scaffold(
      body: HomeImagePage(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),

                  // Header
                  const Text(
                    'TEAM SETUP',
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'JetBrainsMono',
                      fontSize: 11,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "What is your team's name?",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'JetBrainsMono',
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Create teams to organize your game.',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.55),
                      fontFamily: 'JetBrainsMono',
                      fontSize: 12,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Team count and add button
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.12),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: mainButttonColor.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: FaIcon(
                              FontAwesomeIcons.peopleGroup,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${_teams.length} teams added',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'JetBrainsMono',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Manage your teams below',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  fontFamily: 'JetBrainsMono',
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Material(
                          color: mainButttonColor,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              setState(() {
                                _isTeamAdded = !_isTeamAdded;
                              });
                            },
                            child: const SizedBox(
                              height: 46,
                              width: 46,
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Add team input
                  AnimatedSize(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: _isTeamAdded
                        ? Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.25),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.18),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'NEW TEAM',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'JetBrainsMono',
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  TextField(
                                    controller: _teamNameController,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'JetBrainsMono',
                                      fontSize: 13,
                                    ),
                                    textCapitalization:
                                        TextCapitalization.words,
                                    onSubmitted: (_) {
                                      _addTeam(teamNamesProvider);
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Enter team name',
                                      hintStyle: TextStyle(
                                        color: Colors.white.withValues(
                                          alpha: 0.35,
                                        ),
                                        fontFamily: 'JetBrainsMono',
                                        fontSize: 12,
                                      ),
                                      filled: true,
                                      fillColor: Colors.black.withValues(
                                        alpha: 0.2,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 14,
                                          ),
                                      suffixIcon: IconButton(
                                        tooltip: 'Add team',
                                        onPressed: () {
                                          _addTeam(teamNamesProvider);
                                        },
                                        icon: const FaIcon(
                                          FontAwesomeIcons.paperPlane,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.white.withValues(
                                            alpha: 0.15,
                                          ),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),

                  const SizedBox(height: 28),

                  // Team list heading
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'YOUR TEAMS',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'JetBrainsMono',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Text(
                        '${_teams.length}',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.55),
                          fontFamily: 'JetBrainsMono',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Team list
                  Container(
                    constraints: const BoxConstraints(minHeight: 150),
                    height: _teams.isEmpty ? null : 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.15),
                      ),
                    ),
                    child: _teams.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 30,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.peopleGroup,
                                  color: Colors.white.withValues(alpha: 0.35),
                                  size: 28,
                                ),
                                const SizedBox(height: 14),
                                const Text(
                                  'No teams yet',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'JetBrainsMono',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Tap + above to create your first team.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.5),
                                    fontFamily: 'JetBrainsMono',
                                    fontSize: 11,
                                    height: 1.6,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.all(10),
                            itemCount: _teams.length,
                            separatorBuilder: (context, index) => Divider(
                              height: 1,
                              color: Colors.white.withValues(alpha: 0.08),
                            ),
                            itemBuilder: (context, index) {
                              final String teamName = _teams[index];

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                        color: mainButttonColor.withValues(
                                          alpha: 0.2,
                                        ),
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      child: const Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.users,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 12),

                                    Expanded(
                                      child: Text(
                                        teamName,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'JetBrainsMono',
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),

                                    IconButton(
                                      tooltip: 'Delete team',
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () async {
                                        await deleteTeamNames(
                                          teamNameIndex: index,
                                        );

                                        await _provideTeamNames();

                                        if (index <
                                            teamNamesProvider
                                                .teamNames
                                                .length) {
                                          teamNamesProvider.deleteTeam(
                                            teamNameIndex: index,
                                          );
                                        }
                                      },
                                      icon: const FaIcon(
                                        FontAwesomeIcons.trash,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),

                  const SizedBox(height: 28),

                  // Proceed button
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: mainButttonColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'PROCEED',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'JetBrainsMono',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(width: 10),
                          FaIcon(FontAwesomeIcons.arrowRight, size: 14),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addTeam(TeamNamesProvider teamNamesProvider) {
    if (_teamNameController.text.isNotEmpty) {
      teamNamesProvider.addTeam(teamName: _teamNameController.text);

      saveTeamNames(teamNames: teamNamesProvider.teamNames);

      _provideTeamNames();
      _teamNameController.clear();
    }

    setState(() {});
  }
}
