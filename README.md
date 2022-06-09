# Intrinsic-Value
1. News Tab
 - Problems Encountered:
  - The tabeview cells were resizing, changing the row height on the tableview instead of the actual cell managed to keep the cell at the set height.
  - The JSON araay from the API was inside a dictionery and had three value pairs, with 1 of the values being the array with the article information. I         therefore had to declare an additional struct which mimicked the dictionery.

 - Skills Learnt:
  - iOS networking classes, namely URL, URLSession and DataTask.
  - Used these classes to retrieve data from the news API.
  - Transformed that JSON data into useable code and pass it to the view controller to display.
  - Created a structure/model to match the JSON data from the API and conforming to the Decodable protocol.
  - Established communication between the API model and view controller through the protocol and delegate method.
  - Created a tableview and customised the cells by creating a custom subclass for the cell and modifying the data I want to display in the subclass.
  - Caching: Storing the data temporarily, using caching, so that the data does not have to be downloaded from the internet each time the cell comes into       display
  - WebKit: Used segue and WebKit to display the full article
  - Animation: UIView.animate was used to adjust the alpha property of the cells to fade each cell into view.
  - Animation: A spinner(UIActivityIndicatorView), using the WKNavigationDelegte to inform the spinner when the webpage is done loading.
<img width="609" alt="Screenshot 2022-06-09 at 13 44 00" src="https://user-images.githubusercontent.com/91250039/172839014-8381bb6c-d4ef-479b-a963-366e75108f7b.png">
<img width="497" alt="Screenshot 2022-06-09 at 12 56 46" src="https://user-images.githubusercontent.com/91250039/172838988-bdc606d8-6b6c-420a-a909-735dce2d34d5.png">
<img width="498" alt="Screenshot 2022-06-09 at 13 18 31" src="https://user-images.githubusercontent.com/91250039/172838993-dffa02ae-7dcb-43a1-8eae-3b134c488455.png">
<img width="686" alt="Screenshot 2022-06-09 at 13 35 53" src="https://user-images.githubusercontent.com/91250039/172839005-907be97d-d9e3-4d84-bf37-4b3547828944.png">

