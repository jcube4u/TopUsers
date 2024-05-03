# TopUsers
 TopUsers is a native ios App using Swift and  declarative SwiftUI, fetches the latest stackoverflow Top users and displays in the simple list.

 ## Overview
 Simple App demonstrating how to use of clear seperation of Model and View with ViewModel managing the commumincation between them. Follow or Unfollow the User from the list. 

 ## Usage
   The App uses 
    - Async /Await to make netwrok calls
    - Async Image to cache image
    - Observation framework to allow the Binding of of Data with the View

 ## Architectures
 App uses MMVVM architecture pattern to seperate out the View from Data making the app easier to maintain and seperation of responsibilites.

 ## Details
  - Fetch Top users from Stackoverflow 
  - [] Cache of Follow List in UserDefaults
  - Network Error Handling and Display e.g Correct message when there is no internet connection.


 ## Testing
  - [] Unit tests for ViewModels
  - [] UI Testing

   
