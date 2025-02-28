# Servitor

Servitor is a lightweight container designed to execute commands within a specified project directory, equipped with essential development and testing tools. It's built on Alpine Linux and includes tools like `git`, `git-lfs`, `curl`, `jq`, `bash`, `build-base`, `python3`, `valgrind`, `cppcheck`, `alpine-sdk`, `pcre-dev`, `pcre2`, `check-dev`, `subunit-dev`, `lcov`, `gzip`, and `clang18-extra-tools`.

## Usage

### Prerequisites

*   Docker

### Quick Start

1.  Clone the repository:

    ```bash
    git clone https://github.com/spinagon/servitor
    cd servitor
    ```

2.  Build the Docker image (run this only the first time or when the `Dockerfile` is modified):

    ```bash
    ./build.sh
    ```

3.  Run a command within your project directory using Servitor:

    ```bash
    ./run.sh <your project dir> "make test"
    ```

    *   Replace `<your project dir>` with the absolute path to your project directory.  This directory will be mounted into the container at `/git`.
    *   Replace `"make test"` with the command you want to execute within the container. The container changes directory to `/git/src` and then executes the given command. The container also switches to the `develop` branch before executing the command, so ensure the directory is a git repo with a `develop` branch.

### Example

To run `make test` in a project located at `/home/user/myproject`:

```bash
./run.sh /home/user/myproject "make test"
```

This command will:

*   Mount `/home/user/myproject` into the container at `/git`.
*   Change directory to `/git/src`.
*   Switch to the `develop` branch.
*   Execute `make test` within the container.

## Scripts

*   **`build.sh`**: Builds the Docker image named `servitor`.  It first attempts to remove any existing image with the same name.
*   **`run.sh`**: Runs a Docker container based on the `servitor` image, mounting the specified project directory and executing the given command.
*   **`main.sh`**: Entrypoint script for the Docker container. It configures git to consider /git a safe directory, clones the git repo from `/git/.git` to `/git/project`, changes to the `/git/project/src` directory, and switches to the `develop` branch before finally executing the user-provided command.

## Dockerfile Details

The `Dockerfile` sets up the Alpine Linux environment and installs the necessary tools:

*   **Base Image**: `alpine:3.20`
*   **Installed Packages**: `git`, `git-lfs`, `curl`, `jq`, `bash`, `build-base`, `python3`, `valgrind`, `cppcheck`, `alpine-sdk`, `pcre-dev`, `pcre2`, `check-dev`, `subunit-dev`, `lcov`, `gzip`, `clang18-extra-tools`.
*   **clang-format symlink**: Creates a symbolic link for `clang-format` for easy access.
*   **Entrypoint**: Sets `/bin/bash main.sh` as the entrypoint.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
