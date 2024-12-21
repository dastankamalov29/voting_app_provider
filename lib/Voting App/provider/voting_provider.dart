import 'dart:async';

import 'package:flutter/material.dart';

import '../model/model.dart';

class VotingProvider with ChangeNotifier {
  List<Candidate> _candidates = [
    Candidate(
      id: "1",
      name: "Dastan 1",
    ),
    Candidate(
      id: "2",
      name: "Kanu 2 ",
    ),
    Candidate(
      id: "3",
      name: "Stas 3",
    ),
    Candidate(
      id: "4",
      name: "Assik 4",
    ),
  ];

  String? selectedCandidateId;

  List<Candidate> get candidates => _candidates;

  void vote(String candidateId){
    _candidates = _candidates.map((candidate){
      if (candidate.id == candidateId){
        candidate.votes += 1;

      }
      return candidate;
    }).toList();



    selectedCandidateId = candidateId;
    notifyListeners();
    Timer(Duration(seconds: 1), (){
      selectedCandidateId = null;
      notifyListeners();
    });
  }

  List<Candidate> get winners {
    if(_candidates.isEmpty) return [];
    

    int highetsVotes = _candidates.map((c)=>c.votes).reduce((a,b)=>a>b?a:b);
    


    if(highetsVotes == 0)return [];

    List<Candidate> topCandidates = _candidates.where((c)=>c.votes == highetsVotes).toList();

    return topCandidates;
  }
  bool get isTie => winners.length > 1;
  
}

