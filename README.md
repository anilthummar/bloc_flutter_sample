[lib](..%2F..%2Fdemo_bloc_flutter%2Flib)# bloc_sample_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Below is the implementation of a login model using the BLoC pattern:

Step 1: Define the Models
Create the LoginRequestModel and LoginResponseModel.

Step 2: Define the Repository
Implement a repository to handle the login API call.

Step 3: Define the Events
Create an abstract class for login events and a specific event for login requests.

Step 4: Define the States
Create an abstract class for login states and specific states for different scenarios.

Step 5: Define the BLoC
Develop the LoginBloc class to handle login events and manage states.

Step 6: Implement the UI
Build a UI to interact with the BLoC and display different states.

**_Summary_**
**Models**: Define LoginRequestModel and LoginResponseModel for request and response data.
**Repository**: Implement LoginRepository to manage the login API call.
**Events**: Define events extending LoginEvent, specifically LoginRequestEvent.
**States**: Define states extending LoginState, including LoginInitState, LoginLoadingState, LoginLoadedState, and LoginErrorState.
**BLoC**: Implement LoginBloc to handle events and manage states.
**UI**: Create a login page UI that interacts with the BLoC and displays different states.


**Models**: Define LoginRequestModel and LoginResponseModel for request and response data.
**Repository**: Implement LoginRepository for making the login API call.
**Events**: Define events extending LoginEvent, specifically LoginRequestEvent.
**States**: Define states extending LoginState, including LoginInitState, LoginLoadingState, LoginLoadedState, and LoginErrorState.
**BLoC**: Implement LoginBloc to handle events and manage states.
**UI**: Create a login page UI that interacts with the BLoC and displays different states.


**LoginPage**: The main LoginPage widget builds the scaffold and uses padding for consistent spacing.
_**LoginTextField**: A reusable stateless widget for the text fields, accepting hintText and obscureText parameters. The obscureText parameter is used to obscure the password input.
_**LoginButton**: A reusable stateless widget for the login button with a placeholder for the onPressed logic.

**LoginEvent** is an abstract class extending Equatable to enable event comparison.
**LoginRequestEvent** represents the event to initiate a login request with the required loginRequestModel parameter.


**BlocProvider** - to access your bloc with single and whole app must have to add in main.dart with MultiBlocProvider
**BlocBuild** -(BlocBuilder<LoginBloc,LoginState>) => update your ui with builder: (context, state){} this will return widgets 





Bloc Listener - > doing logic leve operation like condition,navigation,display toast ,etc 
Bloc Consumer -> its both combine bloc listener and bloc builder in single widgets



Using the bloc library **allows us to separate our application into three layers**:

**->Presentation
->Business Logic
->DataLayer = 1.Repository  2.Data Provider**

**Data Provider**
![Bloc State Management](/Users/jeelshah/Desktop/bloc_ui_logic_data.png "Bloc")