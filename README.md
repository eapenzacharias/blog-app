# Blog App

> Blog website made with Ruby on Rails.

| ![](https://user-images.githubusercontent.com/49812651/157978814-2f4f2625-698f-4e47-9830-01a4d33df19b.png)  | ![](https://user-images.githubusercontent.com/49812651/157978830-9c9c33d9-b8a6-4326-803b-723c661781c3.png)
|:---:|:---:|

## Built With

- Ruby on Rails

## Getting Started

### Prerequisites

- Ruby
- Postgres server

### Setup

Clone this repo and enter the directory.

```sh
git clone git@github.com:eapenzacharias/blog-app.git && cd blog-app
```

### Install

Run the following command to install all the dependencies.

```sh
bundler install
```

### Usage

Run the following command to start the server, then go to http://localhost:3000

```sh
rails db:create # create database
rails db:migrate # migrate tables
rails db:seed # load all data in database from seed.rb
    
bin/dev # necessary to start the app for the first time
---- or ----
rails s # can be used after starting the app at least once  
```

### Run tests

```sh
bundle exec rspec
```

## Author

👤 **Eapen Zacharias**

- GitHub: [@eapenzacharias](https://github.com/eapenzacharias)
- Twitter: [@eapenzac](https://twitter.com/eapenzac)
- LinkedIn: [LinkedIn](https://linkedin.com/in/eapenzac)

## Show your support

Give a ⭐️ if you like this project!
