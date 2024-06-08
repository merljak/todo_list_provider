import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/services/tasks/tasks_service.dart';

class TaskCreateController extends DefaultChangeNotifier {
  // ignore: unused_field
  final TasksService _tasksService;
  DateTime? _selectedDate;
  TaskCreateController({required TasksService tasksService})
      : _tasksService = tasksService;

  set selectedDate(DateTime? selectedDate) {
    resetState();
    _selectedDate = selectedDate;
    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;

  Future<void> save(String description) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      if (_selectedDate != null) {
        await _tasksService.save(_selectedDate!, description);
        success();
      } else {
        setError('Data da Task nao selecionada');
      }
    } catch (e, s) {
       // ignore: avoid_print
       print(s);
      setError('Erro ao Cadastrar Task');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
