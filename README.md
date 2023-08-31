# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Features

### Sold Out Badge

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/sold-out-badge.png?raw=true" alt="a screenshot of the sold out badge" height="60%" width="60%">

### Admin Functionality

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/admin-authorization.png?raw=true" alt="a screenshot of the admin authorization modal" height="60%" width="60%">

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/admin-categories-page.png?raw=true" alt="a screenshot of the admin categories page" height="60%" width="60%">

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/admin-products-page.png?raw=true" alt="a screenshot of the admin products page" height="60%" width="60%">

### User Authentication

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/nav-bar.png?raw=true" alt="a screenshot of the nav-bar" height="60%" width="60%">

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/login-form.png?raw=true" alt="a screenshot of the login form" height="60%" width="60%">

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/password-digest.png?raw=true" alt="a screenshot of passwords being stored as a secure digest" height="60%" width="60%">

### Ordering

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/cart-with-total.png?raw=true" alt="a screenshot of a cart showing the order total" height="60%" width="60%">

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/empty-cart.png?raw=true" alt="a screenshot of an empty cart" height="60%" width="60%">

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/guest-checkout.png?raw=true" alt="a screenshot of the guest checkout modal" height="60%" width="60%">

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/order-confirmation-msg.png?raw=true" alt="a screenshot of an order confirmation message" height="60%" width="60%">

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/order-confirmation-email.png?raw=true" alt="a screenshot of an order confirmation email preview" height="60%" width="60%">

### Testing

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/feature-specs-passing.png?raw=true" alt="a screenshot of passing feature specs" height="60%" width="60%">

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/e2e-tests-add-to-cart.png?raw=true" alt="a screenshot of passing end to end tests in cypress" height="60%" width="60%">

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/e2e-tests-homepage.png?raw=true" alt="a screenshot of passing end to end tests in cypress" height="60%" width="60%">

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/e2e-tests-login-registration.png?raw=true" alt="a screenshot of passing end to end tests in cypress" height="60%" width="60%">

<img src="https://github.com/Puzzlebottom/jungle-rails/blob/feature/documentation/docs/e2e-tests-product-details-page.png?raw=true" alt="a screenshot of passing end to end tests in cypress" height="60%" width="60%">













