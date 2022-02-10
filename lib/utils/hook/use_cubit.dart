import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

C useCubit<C extends Cubit<S>, S>(
  C Function() create, [
  List<Object> keys = const [],
]) {
  final bloc = useMemoized(create, keys);

  useEffect(() => bloc.close, [bloc]);

  return bloc;
}
