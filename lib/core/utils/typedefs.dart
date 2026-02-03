import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Type alias for Either result with Failure as left type
typedef ResultFuture<T> = Future<Either<Failure, T>>;

/// Type alias for synchronous Either result
typedef ResultSync<T> = Either<Failure, T>;

/// Type alias for void result
typedef ResultVoid = ResultFuture<void>;

/// Type alias for map data
typedef DataMap = Map<String, dynamic>;

/// Type alias for list of maps
typedef DataMapList = List<Map<String, dynamic>>;
