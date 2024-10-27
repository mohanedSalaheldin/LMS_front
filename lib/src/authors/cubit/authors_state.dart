
sealed class AuthorsState {}

final class AuthorsInitial extends AuthorsState {}

final class AuthorsFetchAllLoading extends AuthorsState {}

final class AuthorsFetchAllSuccess extends AuthorsState {}

final class AuthorsFetchAllError extends AuthorsState {}
