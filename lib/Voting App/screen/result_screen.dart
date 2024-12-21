import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_provider/Voting%20App/provider/voting_provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final votingProvider = Provider.of<VotingProvider>(context);
    final isTie = votingProvider.isTie;
    final winners = votingProvider.winners;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Voting Result"),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            
            itemCount: votingProvider.candidates.length,
            itemBuilder: (context,index){
              final candidate = votingProvider.candidates[index];
              final isWinners =  winners.contains(candidate); 
            return ListTile(
              title: Text(candidate.name),
              trailing: Text("Votes: ${candidate.votes}"),
            );
          }),),
        ],
      ),
    );
  }
}
