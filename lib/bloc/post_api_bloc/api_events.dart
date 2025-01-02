import 'package:equatable/equatable.dart';

abstract class ApiEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostFetchedEvent extends ApiEvents {}

class APIDataFilterEvent extends ApiEvents {
  final String searchText;
  APIDataFilterEvent(this.searchText);
}
