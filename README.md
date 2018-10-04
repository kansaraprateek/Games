# Games
List of card games available. 


## Project Architecture

Build using MVVM architecture for list displays and the same table view model class can be used for any other lists. Though I could use the default and basic MVC approach but keeping the code extensible and in future there might be different games category list that can be added. So, MVVM approach will let use the existing code for any future enhancements.

No third party has been used but added a "PKStatusBarLoader" for UI messages for any updates. The library itself is created by me and it's up on my github page.


## Enhancement (If, more time)

1. A database could have been added for storing the games details and updating when necessary, and not to hold data in an object model.
2. Also caching support can be given for games images. 
3. Building a wrapper around URLSession class for network support and fetch the game list in a paging, so that huge chunk of data is not fetched at once. 
4. Write a class for tableView delegates to handle all the user intiated actions. 
5. Create a detail page for all games and animate before going into detail in each of them.
6. A refresh way to update all the games when user intiates.


## Author

kansaraprateek, prateek@kansara.in

## License
