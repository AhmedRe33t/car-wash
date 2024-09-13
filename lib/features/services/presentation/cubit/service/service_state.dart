// ServiceState definitions
abstract class ServiceState {}

class ServiceInitial extends ServiceState {}

class ServiceSelected extends ServiceState {
  final String selectedService;

  ServiceSelected(this.selectedService);
}
