import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_state.dart';

// ServiceCubit definition
class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial());

  void selectService(String serviceName) {
    emit(ServiceSelected(serviceName));
  }
}
