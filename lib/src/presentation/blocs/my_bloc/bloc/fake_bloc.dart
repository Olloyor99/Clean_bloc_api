import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../domain/usecases/fake_usecase.dart';
import 'package:clean_block_api_dec22/src/data/respository/fake_repo.dart';
import 'package:clean_block_api_dec22/src/domain/entities/post_entity.dart';
part 'fake_event.dart';
part 'fake_state.dart';

class FakeBloc extends Bloc<FakeEvent, FakeState> {
  FakeBloc() : super(FakeInitial()) {
    on<InitalFakeEvent>((event, emit) async {
      if (state is FakeInitial) {
        final data = await FakeUsecase(repo: FakeRepo()).call(0);

        emit(FakeLoaded(posts: data, pageKey: 1, isLoading: false));
      } else if (state is FakeLoaded) {
        final fakeLoadedState = state as FakeLoaded;

        final data =
            await FakeUsecase(repo: FakeRepo()).call(fakeLoadedState.pageKey);

        emit(FakeLoaded(
            posts: data,
            pageKey: fakeLoadedState.pageKey + 1,
            isLoading: false));
      }
    });
    on<FetchEvent>((event, emit) async {
      final fakeLoadedState = state as FakeLoaded;
      emit(FakeLoaded(
          posts: fakeLoadedState.posts,
          pageKey: fakeLoadedState.pageKey,
          isLoading: true));

      final data =
          await FakeUsecase(repo: FakeRepo()).call(fakeLoadedState.pageKey);

      emit(FakeLoaded(
          posts: List.from(fakeLoadedState.posts)..addAll(data),
          pageKey: fakeLoadedState.pageKey + 1,
          isLoading: false));
    });
  }
}
