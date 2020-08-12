# Veterinary Clinic - Appointment Booking System Based on Rails Api

## Introduction

This is an appointment booking application powered by Rails Api that provides the main functions you would expect from a booking system such as an admin system, a user/patient system and a doctor/vet system.

Specification summary:

- RESTful api.
- Api versioning.
- Booking app .
- Patterns and good practices.
- Users management.
- Secret/token api key.
- Rspec testing.
- Setup scripts.
- Postgres database.
- Json serialization.

## Quick start

- Install ruby version 2.3.0 and set it with your ruby environment manager
  ([more info here](https://www.ruby-lang.org/en/documentation/installation/)).

- Install Postgres and start the PostgreSQL server in the foreground
  ([more info here](https://wiki.postgresql.org/wiki/Detailed_installation_guides)).

- Clone the repository and get inside it:

```
git clone https://github.com/bafiam/vetplus-backend.git

cd vetplus-backend
```

- Create a postgres role to let rails manage the db:

```
rails db:create
```

- Setup the gems and databases:

```
bundle install
```

```

rails db:migrate
```

- Run tests:

```
rspec
```

That's it, you app is lock and loaded!

```
rails s
```

## Documentation

### Authentication

Authentication is performed using JSON Web Tokens. JSON Web Tokens are an open, industry standard [RFC 7519](https://tools.ietf.org/html/rfc7519) method for representing claims securely between two parties. When the user successfully logs in using their credentials, a JSON Web Token will be returned, which should be kept by clients in
local storage (no cookies):

```
"token":"eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1MzYyMjU5NDUsImV4cCI6MTUzNjMxMjM0NSwic3ViIjoiMzdjMDY2ZjgtNDhjMS00NDZjLTk4OGQtYzQ0ZDQ4MDJiNzZmIiwicm9sZXMiOlsiYWRtaW4iXX0.UwqjX27pGJHJoGjCMkLhBnwoszb9d590upnkRFM0LaA"}
```

**Note** Since there is no session information and every call to the REST API requires authentication, caching is used to improve performance and avoid
excessive hits to the database. Upon login the user is cached with an expiration time of 5 minutes.

Whenever the user wants to access a protected route or resource, the user agent should send the JWT in the Authorization header using the Bearer schema:

`Authorization: Bearer <token>`

The following routes are available for authorization:

- `POST /api/v1/login?username=user&password=12345678`
- `GET /api/v1/logout`
- `POST /api/v1/user?`

### Roles Claim

#### Admin role

- Approve veterinary accounts

#### Veterinary role

- Create a detailed account
- View booked appointments

#### Patient role

- Create a detailed account
- Veiw approved veterinary
- Book an appointment
- View upcomming and past appointments

## Technology Used

- Rails api
- Postgres
- Active model serializers
- bcrypt
- jwt

### API Endpoints

| API Endpoint            | Functionality                           |
| ----------------------- | --------------------------------------- |
| POST api/v1/user        | Register a new user                     |
| POST api/v1/login       | Login in a user                         |
| GET api/v1/login/       | Get user information                    |
| GET api/v1/logout/      | Logout a user                           |
| GET api/v1/appointment  | Fetch all approved vets profile         |
| POST api/v1/appointment | Create an appointment with a vet        |
| GET api/v1/patient/     | Fetch user booked appointments          |
| GET api/v1/doctor       | Fetch vet appointments made by patients |
| GET api/v1/profile      | Fetch user profile                      |
| POST api/v1/profile     | Create a user profile                   |
| GET api/v1/vet          | Create a vet profile                    |
| POST api/v1/vet         | Create a vet profile                    |
| PUT api/v1/admin/`<id>` | Admin approve vet profile               |
| GET api/v1/admin        | Fetch unapprove vet profile             |

## Live Version

This is the link to the live preview in Heroku. Feel free to visit.<br>
[Veterinarian Appointment Booking System](https://#)<br>

<!-- CONTACT -->

## Authors

Stephen Gumba

- [Github profile](https://github.com/bafi
