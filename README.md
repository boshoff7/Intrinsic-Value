# Intrinsic-Value
1. News Tab

<img width="609" alt="Screenshot 2022-06-09 at 13 44 00" src="https://user-images.githubusercontent.com/91250039/172839014-8381bb6c-d4ef-479b-a963-366e75108f7b.png">

SKILLS LEARNT:
  - iOS networking classes, namely URL, URLSession and DataTask.
  - Used these classes to retrieve data from the news API.
  - JSON: Transformed that JSON data into useable code and pass it to the view controller to display.
  - Created a structure/model to match the JSON data from the API and conforming to the Decodable protocol.
  - Protocol and Delegate Method: Established communication between the API model and view controller through the protocol and delegate method.
  - Custom TableView Cell: Created a tableview and customised the cells by creating a custom subclass for the cell and modifying the data I want to display     in the subclass.
  - Caching: Storing the data temporarily, using caching, so that the data does not have to be downloaded from the internet each time the cell comes into       display
  - WebKit: Used segue and WebKit to display the full article
  - Animation: UIView.animate was used to adjust the alpha property of the cells to fade each cell into view.
  - Animation: A spinner(UIActivityIndicatorView), using the WKNavigationDelegte to inform the spinner when the webpage is done loading.


2. Intrinsic Value Calculator Tab

<img width="497" alt="Screenshot 2022-06-09 at 12 56 46" src="https://user-images.githubusercontent.com/91250039/172838988-bdc606d8-6b6c-420a-a909-735dce2d34d5.png">

SKILLS LEARNT:
 - Extensions: Created an extension to programmatically add a done button to the keyboard, to be called for each text field.
 - Alert/Action: Made an alert with an action to popup each time the user tried to calculate without all the textfields having values.
 - Popup View Controller: The result is displayed on another view controller but as a popup created programmatically, using .instantViewController it
   creates the view controller with the specified identifier and initializes it with the data from the storyboard.
 - Animations: Alpha properties of the elements on the result view controller was adjusted to create a dim and fade in/out effect.
 - Functions: A function, with input values and a return value was used to perform the calculation.

3. Calculator Tab

<img width="498" alt="Screenshot 2022-06-09 at 13 18 31" src="https://user-images.githubusercontent.com/91250039/172838993-dffa02ae-7dcb-43a1-8eae-3b134c488455.png">


4. Twitter Sentiment Tab

<img width="686" alt="Screenshot 2022-06-09 at 13 35 53" src="https://user-images.githubusercontent.com/91250039/172839005-907be97d-d9e3-4d84-bf37-4b3547828944.png">

SKILLS LEARNT:
 - Machine Learning: Built an app that uses Natural Language Processing to go onto Twitter and look at whatever company the user has entered and analyses      whether is has been tweeted about in a negative, positive or neutral light.
 - Model: The model was created using MacOS playground. Here I loaded up the csv file with all the twitter data.
 - Split Data: Used the randomSplit() method to split the data 80% training and 20% testing.
 - Create Model: Cerated the model with MLTextClassifier, and imported the split data.
 - Accuracy: Checked the accuracy of the result with .classificationError. Making sure the data is as close to 75% accurate.
 - API: Used Twitter API to retrieve live tweets for the ML model.
 - Swifter: The swifter framework was implemented to make the use of the Twitter API easier.

