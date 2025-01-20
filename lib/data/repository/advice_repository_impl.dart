import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/domain.dart';
import '../../domain/models/models.dart';

class AdviceRepositoryImpl implements AdviceRepository {
  @override
  Future<void> registerAdviceUser(ParamRegisterAdviceUser param) async {
    try {
      final db = FirebaseFirestore.instance;
      db
          .collection('advice')
          .add(param.toMap())
          .then((data) {})
          .onError((error, a) {});
    } catch (e) {
      throw Exception(e);
    }
  }
}
