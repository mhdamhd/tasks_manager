import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasksmanager/core/constants/app_colors.dart';
import 'package:tasksmanager/core/constants/app_gradient.dart';
import 'package:tasksmanager/core/core_compoent/app_button.dart';
import 'package:tasksmanager/core/core_compoent/app_text_field.dart';
import 'package:tasksmanager/core/core_compoent/custom_appbar.dart';
import 'package:tasksmanager/core/core_compoent/empty_component.dart';
import 'package:tasksmanager/core/core_compoent/failuer_component.dart';
import 'package:tasksmanager/core/core_compoent/loading_compoent.dart';
import 'package:tasksmanager/core/core_compoent/show_toast.dart';
import 'package:tasksmanager/core/extensions/theme_extensions/text_theme_extension.dart';
import 'package:tasksmanager/core/services/cache_storage_services.dart';
import 'package:tasksmanager/core/services/service_locator.dart';
import 'package:tasksmanager/core/utils/app_validator.dart';
import 'package:tasksmanager/core/utils/base_state.dart';
import 'package:tasksmanager/generated/l10n.dart';
import 'package:tasksmanager/modules/auth/presentation/routes/login_route.dart';
import 'package:tasksmanager/modules/todos/domain/entities/todos_entity.dart';
import 'package:tasksmanager/modules/todos/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:tasksmanager/modules/todos/presentation/blocs/todos_bloc/todos_bloc.dart';
import 'package:tasksmanager/modules/todos/presentation/components/todo_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TodosScreen extends StatelessWidget {
  TodosScreen({Key? key}) : super(key: key);

  final RefreshController refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TodosBloc>(),
      child: BlocConsumer<TodosBloc, BaseState<TodosEntity>>(
        listener: (context, state) {
          if (state.isUpdating) {
            LoadingComponent.showProgressModal(context);
          } else if (state.isUpdateSuccess) {
            context.pop();
            showToast(message: "Success");
          } else if (state.isUpdateError) {
            context.pop();
            FailureComponent.handleFailure(
                context: context, failure: state.failure);
          } else if (state.isSuccess || state.isError) {
            refreshController.loadComplete();
            refreshController.refreshCompleted();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: buildAppBar(context),
            floatingActionButton: !state.isError
                ? FloatingActionButton(
                    onPressed: state.isLoading || state.isUpdating
                        ? null
                        : () => showAddTodoDialog(context),
                    child: const Icon(Icons.add),
                  )
                : const SizedBox.shrink(),
            body: buildBody(state, context),
          );
        },
      ),
    );
  }

  CustomAppBar buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Row(
        children: [
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).welcome, style: context.f12700),
              Text("@${CacheStorageServices().user!.userName}",
                  style: context.f10500)
            ],
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () async {
          context.read<AppConfigBloc>().add(const LogOutEvent());
          context.go(LoginRoute.name);
        }, icon: const Icon(Icons.logout, color: Colors.white,)),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget buildBody(BaseState<TodosEntity> state, BuildContext context) {
    if (state.isInit) _getTodos(context);
    if (state.isLoading) return const LoadingComponent();
    if (state.isError) {
      return FailureComponent(
          failure: state.failure, retry: () => _getTodos(context));
    }
    return SmartRefresher(
      controller: refreshController,
      onRefresh: () => _getTodos(context, refresh: true),
      onLoading: () => _getTodos(context),
      enablePullUp: state.enablePullUp,
      footer: const ClassicFooter(),
      child: ListView(
        children: state.isSuccess && state.data!.todos.isEmpty
            ? [const EmptyComponent()]
            : [
                const SizedBox(height: 10),
                ...state.data?.todos
                        .map((e) => TodoCard(
                              todo: e,
                            ))
                        .toList() ??
                    [],
                const SizedBox(height: 50),
              ],
      ),
    );
  }

  void _getTodos(BuildContext context, {bool refresh = false}) {
    context.read<TodosBloc>().add(FetchTodosEvent(refresh: refresh));
  }

  Future<void> showAddTodoDialog(BuildContext context) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController textController = TextEditingController();
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return buildRedeemDialog(formKey, textController, context);
        }).then((value) {
      if (value is String) {
        context.read<TodosBloc>().add(AddTodoEvent(todo: textController.text));
      }
    });
  }

  Widget buildRedeemDialog(GlobalKey<FormState> formKey,
      TextEditingController textController, BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.dialogGradient,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Enter todo text", style: context.f20700),
            const SizedBox(height: 20),
            Form(
              key: formKey,
              child: AppTextField(
                controller: textController,
                fillColor: AppColors.blue.withOpacity(0.5),
                hintStyle: context.f12400?.copyWith(color: AppColors.grey1),
                style: context.f16600,
                maxLines: 7,
                validator: AppValidator(validators: [
                  InputValidator.requiredField,
                ]).validate,
                hintText: "Watch a movie",
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                      text: S.of(context).cancel,
                      onPressed: () {
                        context.pop();
                      }),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: AppButton(
                      text: S.of(context).confirm,
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          context.pop(textController.text);
                        }
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
