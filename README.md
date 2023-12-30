# Task List BLoC

A basic introduction to state management in flutter apps using BLoC (Business Logic Component) design pattern.

See inspiration: https://ticktick.com

## Roadmap

Current task: Using BLoC architecture to split the codebase into smaller more manageable units of code - `feature -> domain -> data`.

Sub tasks:

- [-] LocalStorageApi: implements `TaskListApi` using `shared_preferences` to allow storing and retrieval of tasks from mobile local storage.
- [ ] Domain Layer: Create a `TaskListRepository` 
- [ ] Feature Layer: Cleanup existing UI code, removing `setState()` implementations and whatnot.

Completed:

- List all tasks
- Create a new tasks
- Mark task as complete
- Add task description

Ideas, issues, note, and pending:

- List all completed tasks
- Clear completed tasks
- Create a separate stateful widget for task description
- Capture `createdAt`, `updatedAt`, `completedAt`, `dueAt`
- Capture subtasks
- Material3 theming

## Getting Started with Flutter

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
