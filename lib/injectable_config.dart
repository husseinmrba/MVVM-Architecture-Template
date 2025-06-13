import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:store_ads/injectable_config.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies(String env) => getIt.init(environment: env);
