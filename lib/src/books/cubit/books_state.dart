sealed class BooksState {}

final class BooksInitial extends BooksState {}

final class BooksFetchAllLoading extends BooksState {}

final class BooksFetchAllSuccess extends BooksState {}

final class BooksFetchAllError extends BooksState {}

final class BooksAddNewLoading extends BooksState {}

final class BooksAddNewSuccess extends BooksState {}

final class BooksAddNewError extends BooksState {}

final class BooksEditLoading extends BooksState {}

final class BooksEditSuccess extends BooksState {}

final class BooksEditError extends BooksState {}

final class BooksRemoveLoading extends BooksState {}

final class BooksRemoveSuccess extends BooksState {}

final class BooksRemoveError extends BooksState {}
