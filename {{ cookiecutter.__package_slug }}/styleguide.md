# Git Commit Message Style Guide
Angel Martinez Tenor, 2018-2024

## Message Structure
- Type: Subject
- Body (Optional)

## Types
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Changes to documentation
- `style`: Formatting, missing semi colons, etc; no code change
- `refactor`: Refactoring production code
- `test`: Adding tests, refactoring test; no production code change
- `setup`: Updating build tasks, package manager configs, etc; no production code change
- `data`: Adding or updating data files (csv, parquet ...)
- `release`: Add a new release (python package...)

## Subject
The subject should:
- Be no greater than 50 characters
- Begin with a capital letter
- Not end with a period
- Use an imperative tone to describe what a commit does, rather than what it did. For example, use "Change", not "Changed" or "Changes".

## Examples
- `feat`: Replace Dense layers by LSTM layers
- `docs`: Add instructions for executing the open OCR app
- `refactor`: Move the missing features function to the helper library
- `feat`: Add a dummy classifier to the helper library
- `feat`: Automate (stratified) training/test and features/target splits
- `fix`: Display categorical targets (previously not shown)
- `fix`: Binary target parsed to float instead of int

## Credits
This guide is adapted from the [Udacity Git Commit Message Style Guide](https://udacity.github.io/git-styleguide/).