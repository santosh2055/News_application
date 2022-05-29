import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class NewsEvents extends Equatable {
  const NewsEvents();

  @override
  List<Object> get props => [];
}

class StartEvent extends NewsEvents {}

// @immutable
// class SearchEvents extends NewsEvents {
//   final String query;

//   const SearchEvents({required this.query});
// }
