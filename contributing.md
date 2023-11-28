```markdown
# Contributing to [No RISC No FUN]

Thank you for your interest in contributing to our project! By contributing, you help make this project better for everyone. Here are some guidelines to follow:

## Getting Started

1. **Fork the repository:**
   Click on the "Fork" button at the top right corner of the repository page on GitHub. This will create a copy of the project in your GitHub account.

2. **Clone your fork:**
   ```bash
   git clone https://github.com/MohamedEbrahem1/DDProject2
   ```

3. **Navigate to your project's directory:**
   ```bash
   cd your-project
   ```

4. **Set up upstream:**
   ```bash
   git remote add upstream https://github.com/MohamedEbrahem1/DDProject2
   ```

## Development Workflow

1. **Create a branch:**
   ```bash
   git checkout -b feature-branch-name
   ```

2. **Make your changes:**
   Make your contributions and ensure that your changes follow the project's coding conventions.

3. **Commit your changes:**
   ```bash
   git commit -m "Brief description of your changes"
   ```

4. **Pull from upstream:**
   Before pushing your changes, it's good to pull the latest changes from the upstream repository to avoid conflicts.
   ```bash
   git pull upstream main
   ```

   **Note:** You can pull from the `main` branch or the `working_directory` branch. However, when uploading your changes, create a pull request to merge your version into the `working_directory` branch. We aim to implement and test changes on FPGA with the `working_directory` before merging into `main`, which represents the version available for users.

5. **Push your changes:**
   ```bash
   git push origin feature-branch-name
   ```

6. **Create a Pull Request (PR):**
   Go to your fork on GitHub, switch to the branch you made changes in, and click "New Pull Request." Provide a clear description of your changes.

7. **Code Review:**
   Expect feedback and be responsive to comments on your PR. Make necessary changes based on the feedback.

8. **Merge:**
   Once your changes are approved, they will be merged into the `working_directory` branch. The `main` branch is reserved for versions that users can use.

Certainly! Here's the modified section with additional details for Windows users in the `CONTRIBUTING.md` file:

```markdown
...

## Verilog Coding and Simulation

If you're working on Verilog code, we recommend using `iverilog` for simulation. You can know more about the installation and how to use from that repo: https://github.com/steveicarus/iverilog


## Code Style Guidelines

Please note that for every module created, there should be a test bench file to test the module. PRs without testbenches won't be accepted and would be requested to put a test bench. The test bench file should be named as `tb_module` to make it easier for review. Consistent coding style makes it easier to review and maintain the codebase. 

## Issue Tracking

If you find a bug or have an enhancement idea, please create an issue on GitHub. Be clear and provide as much detail as possible. We have templates to help you.

## Questions?

If you have questions or need further clarification, feel free to reach out to us through GitHub issues.

Thank you for your contributions!
```