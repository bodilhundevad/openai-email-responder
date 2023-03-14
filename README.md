# Email Generator App

This is a Ruby on Rails application that generates email responses based on the OpenAI API. It allows users to generate a new email based on context they provide or generate a response to an email they received. Additionally, users can select different tonalities for the email and copy the generated email to their clipboard.

## Usage

The app is available through: https://email-generator.osc-fr1.scalingo.io/

## Features

- Generate emails based on the context provided or received email
- Select different tonalities for the email
- Copy generated email to clipboard
- Uses OpenAI API to generate email

## Technologies
This app was developed using Test-Driven Development principles.

- Ruby on Rails
- RSpec
- Capybara
- VCR
- Webmock
- OpenAI API

## Requirements

 - Ruby 3.1.2
 - Rails 7.0.4
 - PostgreSQL 1.1

## Installation

To install the app locally, follow these steps:

1. Clone the repository to your local machine
2. Run `bundle` to install the required gems
3. Run `yarn` to install JavaScript dependencies for Rails
4. Set up the database by running `rails db:create db:migrate`
5. Set up the OpenAI API by adding your API key to your environment variables file (.env)

To use the app, start the server by running `dev` and navigate to `http://localhost:3000` in your web browser.

## License

This project is licensed under the [MIT License](LICENSE.md).
