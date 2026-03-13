import 'errors/exception.dart';
import 'errors/failures.dart';

Failure getFailureFromException(Object exception) {

  if (exception is BadRequestException) {
    return BadRequestFailure(message: exception.message);
  }

  if (exception is UnAuthenticatedException) {
    return UnAuthenticatedFailure(message: exception.message);
  }

  if (exception is UnAuthorizedException) {
    return UnAuthorizedFailure(message: exception.message);
  }

  if (exception is NotFoundException) {
    return NotFoundFailure(message: exception.message);
  }

  if (exception is InternalServerErrorException) {
    return InternalServerErrorFailure(message: exception.message);
  }

  if (exception is OfflineException) {
    return OfflineFailure(message: exception.message);
  }

  if (exception is StorageException) {
    return StorageFailure(message: exception.message);
  }

  return UnexpectedFailure(
    message: exception.toString(),
  );
}