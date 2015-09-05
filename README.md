# yelp-vote
I want to create a group messaging application that allows users to vote on various places to have dinner/go out/visit/have drinks. I will be using the Yelp API in order for people to look up suggestions of where to go.

# Goals of Project
- Ship a usable project at the end of a week

# Target Audience
- Anyone who wants a more effective way than group messaging to plan group events

# Personal Learning Goals
- Use more JavaScript
- Stick to TDD
- Improve estimates of the time I need to allot for task completion
- Creating an interface that has good flow and is easy/intuitive to use

# Technologies/Frameworks/Patterns
- Bootstrap
- JavaScript
- Ruby + Ruby on Rails
- CSS
- HTML
- Yelp API
- OAuth?

# Tech/Skill Dependencies
- Being able to apply Rails logic done in the controller over to JavaScript

# Success/Done-ness
- Users will be able to send messages to each other
- Users search for places to suggest via Yelp
- Users can send a suggestion inside of the group message
- Users can vote for a suggestion inside of the group message


# Deliverables
- A user can send a message to another user
- A user can send a message to many users
- One user can add a Yelp suggestion inside of a message
- A user can vote for a Yelp suggestion

# Models
- User
  - username
  - password
  - has_many_and_belongs_to messages (join table)
  - has_many entries
- Message
  - has_many suggestions
  - has_many entries
  - has_many_and_belongs_to users (join table)
- Entry
  - text
  - user_id
  - message_id
  - belongs_to user
  - belongs_to message
- Suggestion
  - user_id
  - things from yelp API
  - belongs_to_one user
- Vote
  - yes
  - no
  - suggestion_id
  - belongs_to_one suggestion

## FINISH WRITING REMAINING TESTS FOR USER MODEL
## CREATE SIGN IN FORM THAT CREATES NEW SESSION
