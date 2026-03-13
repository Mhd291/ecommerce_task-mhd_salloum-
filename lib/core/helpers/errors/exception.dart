abstract class AppException implements Exception {
  final String message;

  const AppException({required this.message});

  @override
  String toString() => message;
}

class BadRequestException extends AppException {
  const BadRequestException({required String message})
      : super(message: message);
}

class UnAuthorizedException extends AppException {
  const UnAuthorizedException({String message = "Forbidden"})
      : super(message: message);
}

class UnAuthenticatedException extends AppException {
  const UnAuthenticatedException({String message = "Unauthenticated"})
      : super(message: message);
}

class NotFoundException extends AppException {
  const NotFoundException({String message = "Resource not found"})
      : super(message: message);
}

class InternalServerErrorException extends AppException {
  const InternalServerErrorException({String message = "Server error"})
      : super(message: message);
}

class UnexpectedException extends AppException {
  const UnexpectedException({String message = "Unexpected error"})
      : super(message: message);
}

class OfflineException extends AppException {
  const OfflineException({String message = "No internet connection"})
      : super(message: message);
}

class StorageException extends AppException {
  const StorageException({String message = "Storage error"})
      : super(message: message);
}