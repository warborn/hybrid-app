# README

## Installation

Clone the project and install the dependencies

```sh
git clone git@github.com:warborn/hybrid-app.git

cd hybrid-app

bundle install

yarn install

```

Prepare the database and start the server

```sh
rails db:setup

rails s
```

You can view the app live [here](http://localhost:3000)

## Sign up

You can create a new account [here](http://localhost:3000/users/sign_up)

## GraphQL API

The project supports authentication via GraphQL, you can use the following queries:

Login

```graphql
mutation LOGIN {
  login(email: "user@app.com", password: "password") {
    email
    id
    token
  }
}
```

Logout

```graphql
mutation {
  logout
}
```

Getting logged in user data:

```graphql
query {
  me {
    id
    email
  }
}
```

Note: The `logout` mutation and `me` query are protected by the authentication mechanism, in order to run them properly, an authorization header with a valid token should be sent along with the request.

```
Authorization: Bearer {VALID_TOKEN}
```