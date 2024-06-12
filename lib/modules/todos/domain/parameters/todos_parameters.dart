import 'package:equatable/equatable.dart';

class GetTodosParameters extends Equatable {
  final int pageSize;
  final int pageIndex;

  const GetTodosParameters({required this.pageSize, required this.pageIndex});

  int get skip => pageIndex * pageSize;

  String get toUrl => '?limit=$pageSize&skip=$skip';

  @override
  List<Object> get props => [pageSize, pageIndex];
}
