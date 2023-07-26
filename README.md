# BetaTopics
This is a place where you can find a curated list of useful articles on selected technologies/topics. \
Web view can be found at the following link: **[Beta Topics](https://djolewalker.github.io/BetaTopics/)**.

The idea behind this library is not to provide tutorials and official documentation that anyone can easily reach. 
Instead, the goal is to create a centralized repository of valuable articles that can expand your knowledge and make good use of your free moments at work to enhance your knowledge base.

The articles are organized into folders based on specific technologies. 
Each article will be accompanied by a brief description. Additionally, it would be helpful to include some highlighted keywords or phrases under each description to facilitate topic browsing.

## Table of currently available technologies

| No. | Technology                                    | Readme at GitHub                                                    | URL at web pages                                           |
| --- | --------------------------------------------- | ------------------------------------------------------------------- | ---------------------------------------------------------- |
| 1   | React                                         | [README](https://github.com/djolewalker/BetaTopics/tree/main/React)    | [WEB](https://djolewalker.github.io/BetaTopics/React/)     |
| 2   | Angular                                       | [README](https://github.com/djolewalker/BetaTopics/blob/main/Angular)  | [WEB](https://djolewalker.github.io/BetaTopics/Angular/)   |
| 3   | Programming in general                        | [README](https://github.com/djolewalker/BetaTopics/blob/main/Programming)  | [WEB](https://djolewalker.github.io/BetaTopics/Programming/)   |

## Contribution
Feel free to participate. Join me as contributor or Fork this repo.

## Example of an article:

...

---

### **1. JWT Authentication in React with react-router** - [https://dev.to/sanjayttg/jwt-authentication-in-react-with-react-router-1d03](https://dev.to/sanjayttg/jwt-authentication-in-react-with-react-router-1d03)
Good example how we can integrate JWT authentication with React and react-router. How to handle public routes, secure authenticated routes. 
Utilize the axios library to make API requests with the authentication token. \
Highlights: `JWT`  `react-router` `axios`

---

...

## Commit conventions and Notification
Commits messages from commits that are adding new articles will be used as notification messages in Google Chat Group!
Split your commits to have single commit per technology. This will make notifications look better.
Therefore we should follow next convention when we are creating commits:

### We recognize 2 types of commits:
#### 1. Commits that are adding new articles and should trigger notifications
Those commits should follow be composed of commit `head` and commit `body`.\
Head should describe technology that new articles covers while body contains list of articles.\
Example:
```
Couple of Programming articles

1. Hashing
2. XML is the future
```
First sentence in commit message is commit `head` and it will be used as notification title. 
Between commit `head` and `body` we have single empty line. 
Commit `body` should be list of articles that we are adding with commit. 
Numbers are order that new articles have in article list of their technology. 
Body will be also displayed in Google Chat notification. 

#### 2. Updates and enhancements that should not be followed with notifications
To prevent notifications just start commit message with prefix `dev:` \
Example:
```
dev: workflows to support google chat notifications.
```