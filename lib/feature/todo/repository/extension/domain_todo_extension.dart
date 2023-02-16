import 'package:dart3_sample/feature/local_data/todo_database.dart';
import 'package:dart3_sample/feature/todo/repository/extension/todo_status_extension.dart';
import 'package:dart3_sample/feature/todo/domain/value/todo.dart' as domain;

extension DomainTodoExtension on domain.Todo {
  Todo toDTO() {
    return Todo(
      id: id,
      title: title,
      content: content,
      status: progressStatus.toDatabaseObject(),
      updatedAt: updatedAt,
    );
  }

  static domain.Todo fromDTO(Todo todo) {
    return domain.Todo(
      id: todo.id,
      title: todo.title,
      content: todo.content,
      progressStatus: TodoStatusExtension.fromDTO(todo.status),
      updatedAt: todo.updatedAt,
    );
  }
}
