// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/Data/Models/all_news/all_news.dart';

import 'package:news_app/Data/Repo/all_new_repo.dart';

part 'all_news_state.dart';

class AllNewsCubit extends Cubit<AllNewsState> {
  AllNewsCubit() : super(AllNewsInitial());

  getAllNews() {
    emit(AllNewsLoading());

    AllNewRepo().getAllNew().then((value) {
      if (value != null) {
        emit(AllNewsSuccess(ourResponse: value));
      } else {
        emit(AllNewsError());
      }
    });
  }
}
