
 class CarTypesState {}

final class CarTypesInitial extends CarTypesState {}

final class GetCarTypesLoading extends CarTypesState {}
final class GetCarTypesSuccess extends CarTypesState {}
final class GetCarTypesFaluire extends CarTypesState {
  final String errorMassege;
  GetCarTypesFaluire({required this.errorMassege});
}


