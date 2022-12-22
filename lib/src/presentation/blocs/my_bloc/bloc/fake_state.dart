part of 'fake_bloc.dart';

@immutable
abstract class FakeState {
  ScrollController scrollController = ScrollController();
}

class FakeInitial extends FakeState {}

class FakeLoaded extends FakeState {
  List<PostEntity> posts;
  int pageKey;
  bool isLoading;

  FakeLoaded({required this.posts, required this.pageKey,required this.isLoading});
}
