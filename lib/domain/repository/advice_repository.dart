import '../models/models.dart';

abstract class AdviceRepository {
  Future<void> registerAdviceUser(ParamRegisterAdviceUser param);
}
