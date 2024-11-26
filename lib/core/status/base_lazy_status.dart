sealed class BaseLazyStatus {
  const BaseLazyStatus();
}

class BaseLazyInit extends BaseLazyStatus {
  const BaseLazyInit();
}

class BaseLazyLoading extends BaseLazyStatus {
  const BaseLazyLoading();
}

class BaseLazyEmpty extends BaseLazyStatus {
  const BaseLazyEmpty();
}

class BaseLazyNotAuth extends BaseLazyStatus {
  const BaseLazyNotAuth();
}

class BaseLazyComplete<T> extends BaseLazyStatus {
  final T data;

  const BaseLazyComplete(this.data);
}

class BaseLazyError extends BaseLazyStatus {
  final String errorMessage;

  const BaseLazyError(this.errorMessage);
}
