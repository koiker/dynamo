# Building Dynamo Locally

This document provides instructions for building the Dynamo project from the source on a Linux environment.

## Prerequisites

Before building the project, you need to install the following dependencies:

```bash
sudo apt-get update
sudo apt-get install -y build-essential libclang-dev
```

## Build Steps

1.  **Activate the Python virtual environment:**
    ```bash
    source .venv/bin/activate
    ```

2.  **Build the Rust binaries:**
    ```bash
    cargo build --release
    ```

3.  **Install the Python package in editable mode:**
    ```bash
    pip install -e .
    ```

## Development Setup

For development and debugging, especially when using an IDE like VSCode, you need to configure the `PYTHONPATH` to include the multiple source directories in this project. This ensures that the Python interpreter and tools like Pylance can find all the necessary modules.

A `.env` file has been created in the root of the project with the following content:

```
PYTHONPATH=./deploy/sdk/src:./components/planner/src
```

To make VSCode automatically use this configuration, a `.vscode/settings.json` file has also been created:

```json
{
    "python.envFile": "${workspaceFolder}/.env"
}
```

With this setup, you should be able to run and debug the application without `ModuleNotFoundError` issues.
