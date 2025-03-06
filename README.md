# Komutracker

## Getting Started

### Prerequisites

Ensure you have the following installed:
- PostgreSQL
- Python 3.8
- Poetry (Might install by `make init-poetry`)

### Initialization

1. Run the following command to initialize the project:
    ```sh
    make init
    ```

2. Configure the environment variables by setting up the `.env` file in the `aw-webui` directory.

### Database Setup

1. Edit the connection details in the `aw-core/aw-datastore/storages/peewee.py` file.

2. Create or restore the database.

### Build and Run
1. Edit `aw-server.toml` config file at: `%LOCALAPPDATA%\komutracker\komutracker\aw-server` (Windows). Sample:
    ```toml
    [server]
    host = "0.0.0.0"
    port = "5600"
    storage = "peewee"
    cors_origins = "*"
    secret = "secret"
    mongo_url = "mongodb://localhost:27017/"
    application_domain = "tracker.komu.vn"

    [oauth2]
    auth_url = "oauth2.mezon.ai"
    client_id = ""
    client_secret = ""
    redirect_uri = "https://tracker-api.komu.vn/api/0/auth/callback"

    [server.custom_static]

    [server-testing]
    host = "localhost"
    port = "5666"
    storage = "peewee"
    cors_origins = ""

    [server-testing.custom_static]
    ```

2. Build the project:
    ```sh
    make build
    ```

3. Start the development servers:
    - For the server:
      ```sh
      aw-server
      ```
    - For the web UI:
      ```sh
      cd aw-webui && npm run serve
      ```