enum GeneralStates {
  // Normal States
  init,
  loading,
  success,

  // User Problems States
  offline,
  storageError,
  badRequest,
  unexpectedProblem,

  // Backend Problems States
  notFound,
  forbidden,
  unAuthenticated,
  internalServerProblem,
}
