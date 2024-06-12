import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tasksmanager/core/enums/request_status.dart';
import 'package:tasksmanager/core/errors/failure.dart';
import 'package:tasksmanager/core/utils/base_state.dart';
import 'package:tasksmanager/modules/todos/domain/entities/todos_entity.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/add_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/delete_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/todos_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/update_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/repository/todos_repository.dart';
import 'package:tasksmanager/modules/todos/presentation/blocs/todos_bloc/todos_bloc.dart';

import 'todos_bloc_test.mocks.dart';

@GenerateMocks([
  TodosRepository,
])
void main() {
  final mockTodos = [
    TodoEntity(id: 1, todo: "todo num 1", completed: false, userId: 5),
    TodoEntity(id: 2, todo: "todo num 2", completed: true, userId: 5),
    TodoEntity(id: 3, todo: "todo num 3", completed: false, userId: 5),
  ];
  final mockTodosEntity = TodosEntity(todos: mockTodos);

  group('TodosBloc', () {
    late TodosRepository todosRepository;
    const addTodoString = 'test todo add';
    var addTodoEntity =
        TodoEntity(id: 5, todo: addTodoString, completed: false, userId: 5);
    const getTodosParameters = GetTodosParameters(pageIndex: 0, pageSize: 10);
    const addTodosParameters = AddTodoParameters(todo: addTodoString);
    var updateTodosParameters =
        UpdateTodoParameters(id: mockTodos.first.id, completed: true);
    var deleteTodosParameters = DeleteTodoParameters(id: mockTodos.first.id);
    todosRepository = MockTodosRepository();

    setUp(() {
      when(todosRepository.getTodos(getTodosParameters))
          .thenAnswer((_) async => Right(mockTodosEntity));
      when(todosRepository.addTodo(addTodosParameters))
          .thenAnswer((_) async => Right(addTodoEntity));
      when(todosRepository.updateTodo(updateTodosParameters))
          .thenAnswer((_) async => Right(mockTodos.first));
      when(todosRepository.deleteTodo(deleteTodosParameters))
          .thenAnswer((_) async => Right(mockTodos.first));
    });

    TodosBloc buildBloc() {
      return TodosBloc(todosRepository);
    }

    group('constructor', () {
      test('works properly', () => expect(buildBloc, returnsNormally));

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(const BaseState<TodosEntity>()),
        );
      });
    });

    group('TodosFetch', () {
      blocTest<TodosBloc, BaseState<TodosEntity>>(
        'starts listening to repository getTodos',
        build: buildBloc,
        act: (bloc) => bloc.add(const FetchTodosEvent()),
        verify: (_) {
          verify(todosRepository.getTodos(getTodosParameters)).called(1);
        },
      );

      blocTest<TodosBloc, BaseState<TodosEntity>>(
        'emits state with updated status and todos '
        'when repository getTodos returns response',
        build: buildBloc,
        act: (bloc) => bloc.add(const FetchTodosEvent()),
        expect: () => [
          const BaseState<TodosEntity>(
            enablePullUp: true,
            requestStatus: RequestStatus.loading,
          ),
          BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: false,
            requestStatus: RequestStatus.success,
          ),
        ],
      );

      blocTest<TodosBloc, BaseState<TodosEntity>>(
        'emits state with failure status '
        'when repository getTodos emits error',
        setUp: () {
          when(
            todosRepository.getTodos(getTodosParameters),
          ).thenAnswer((_) async => Left(UnknownFailure()));
        },
        build: buildBloc,
        act: (bloc) => bloc.add(const FetchTodosEvent()),
        expect: () => [
          const BaseState<TodosEntity>(
            enablePullUp: true,
            requestStatus: RequestStatus.loading,
          ),
          BaseState<TodosEntity>(
              enablePullUp: true,
              requestStatus: RequestStatus.error,
              failure: UnknownFailure()),
        ],
      );
    });

    group('TodosAdd', () {
      blocTest<TodosBloc, BaseState<TodosEntity>>(
        'sent a request to add a todo',
        build: buildBloc,
        seed: () => BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.success),
        act: (bloc) => bloc.add(
          const AddTodoEvent(
            todo: addTodoString,
          ),
        ),
        verify: (_) {
          verify(
            todosRepository.addTodo(
              addTodosParameters,
            ),
          ).called(1);
        },
      );

      blocTest<TodosBloc, BaseState<TodosEntity>>(
        'add a todo success',
        build: buildBloc,
        seed: () => BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.success),
        act: (bloc) => bloc.add(
          const AddTodoEvent(
            todo: addTodoString,
          ),
        ),
        expect: () => [
          BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.updating,
          ),
          BaseState<TodosEntity>(
            data: TodosEntity(todos: [addTodoEntity, ...mockTodos]),
            enablePullUp: true,
            requestStatus: RequestStatus.updateSuccess,
          ),
        ],
      );

      blocTest<TodosBloc, BaseState<TodosEntity>>(
        'add a todo fails',
        build: buildBloc,
        seed: () => BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.success),
        setUp: () {
          when(
            todosRepository.addTodo(addTodosParameters),
          ).thenAnswer((_) async => Left(UnknownFailure()));
        },
        act: (bloc) => bloc.add(
          const AddTodoEvent(
            todo: addTodoString,
          ),
        ),
        expect: () => [
          BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.updating,
          ),
          BaseState<TodosEntity>(
              data: mockTodosEntity,
              enablePullUp: true,
              requestStatus: RequestStatus.updateError,
              failure: UnknownFailure()),
        ],
      );
    });

    group('TodosUpdate', () {
      blocTest<TodosBloc, BaseState<TodosEntity>>(
        'sent a request to update the completion of a todo',
        build: buildBloc,
        seed: () => BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.success),
        act: (bloc) => bloc.add(
          UpdateTodoEvent(
            id: mockTodos.first.id,
            completed: true,
          ),
        ),
        verify: (_) {
          verify(
            todosRepository.updateTodo(
              updateTodosParameters,
            ),
          ).called(1);
        },
      );

      blocTest<TodosBloc, BaseState<TodosEntity>>(
        'update a todo success',
        build: buildBloc,
        seed: () => BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.success),
        act: (bloc) => bloc.add(
          UpdateTodoEvent(
            id: mockTodos.first.id,
            completed: true,
          ),
        ),
        expect: () => [
          BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.updating,
          ),
          BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.updateSuccess,
          ),
        ],
      );

      blocTest<TodosBloc, BaseState<TodosEntity>>(
        'update a todo fails',
        build: buildBloc,
        seed: () => BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.success),
        setUp: () {
          when(
            todosRepository.updateTodo(updateTodosParameters),
          ).thenAnswer((_) async => Left(UnknownFailure()));
        },
        act: (bloc) => bloc.add(
          UpdateTodoEvent(
            id: mockTodos.first.id,
            completed: true,
          ),
        ),
        expect: () => [
          BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.updating,
          ),
          BaseState<TodosEntity>(
              data: mockTodosEntity,
              enablePullUp: true,
              requestStatus: RequestStatus.updateError,
              failure: UnknownFailure()),
        ],
      );
    });

    group('TodosDelete', () {

      blocTest<TodosBloc, BaseState<TodosEntity>>(
        'delete a todo success',
        build: buildBloc,
        seed: () => BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.success),
        act: (bloc) => bloc.add(
          DeleteTodoEvent(
            id: mockTodos.first.id,
          ),
        ),
        expect: () => [
          BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.updating,
          ),
          BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.updateSuccess,
          ),
        ],
      );

      blocTest<TodosBloc, BaseState<TodosEntity>>(
        'delete a todo fails',
        build: buildBloc,
        seed: () => BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.success),
        setUp: () {
          when(
            todosRepository.deleteTodo(deleteTodosParameters),
          ).thenAnswer((_) async => Left(UnknownFailure()));
        },
        act: (bloc) => bloc.add(
          DeleteTodoEvent(
            id: deleteTodosParameters.id,
          ),
        ),
        expect: () => [
          BaseState<TodosEntity>(
            data: mockTodosEntity,
            enablePullUp: true,
            requestStatus: RequestStatus.updating,
          ),
          BaseState<TodosEntity>(
              data: mockTodosEntity,
              enablePullUp: true,
              requestStatus: RequestStatus.updateError,
              failure: UnknownFailure()),
        ],
      );
    });
  });
}
