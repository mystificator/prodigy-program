## Setup

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/mystificator/prodigy-program.git
    cd prodigy-program
    ```

2.  **Install dependencies:**

    ```bash
    bundle install
    ```

3.  **Create and migrate the database:**

    ```bash
    rails db:create
    rails db:migrate
    ```

4.  **Seed the database:**

    ```bash
    rails db:seed
    ```

5.  **Start the Rails server:**
    ```bash
    rails server
    ```

## API Endpoints

- **POST /signup:** User Signup.

  - **Parameters:**
    - `name`: User's name.
    - `email`: User's email address.
    - `password`: User's password.
  - **Response:** Returns a JWT token upon successful registration.

- **POST /login:** User login.

  - **Parameters:**
    - `email`: User's email address.
    - `password`: User's password.
  - **Response:** Returns a JWT token upon successful authentication.

- **DELETE /logout:** User logout.

  - **Headers:**
    - `Authorization: Bearer <JWT_TOKEN>`

- **GET /schedules/:day** Retrieves the schedule for a specific day.

  - **Parameters:**
    - `day`: The day number (1-30).
    - `direction` (optional): "next" or "prev" for navigating to the next or previous day.
  - **Headers:**
    - `Authorization: Bearer <TOKEN>`

- **POST /schedules/complete_activity?day&activity_id** Marks an activity as complete for the current user in a schedule.
  - **Parameters:**
    - `day`: The day number.
    - `activity_id`: The ID of the activity.
  - **Headers:**
    - `Authorization: Bearer <TOKEN>`
