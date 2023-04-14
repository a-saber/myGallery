

abstract class AppStates
{
  const AppStates();
}

class AppInitialState extends AppStates{}

class GetImagesLoadingState extends AppStates{}

class GetImagesSuccessState extends AppStates {}

class GetImagesErrorState extends AppStates{
  final String error;
  GetImagesErrorState (this.error);
}


class ChangeShowSelectViewState extends AppStates{}

class LoginLoadingState extends AppStates{}

class LoginSuccessState extends AppStates {}

class LoginErrorState extends AppStates{
  final String error;
  LoginErrorState (this.error);
}


class UploadLoadingState extends AppStates{}

class UploadSuccessState extends AppStates {}

class NotPickedState extends AppStates {}

class UploadErrorState extends AppStates{
  final String error;
  UploadErrorState (this.error);
}


