import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];

  get query => null;
}

class Search extends SearchEvent {
  final query;

  Search({this.query});
  @override
  List<Object> get props => [query];
}
