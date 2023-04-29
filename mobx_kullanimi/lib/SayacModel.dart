import 'package:mobx/mobx.dart';

part 'SayacModel.g.dart';
class SayacModel = SayacModelBase with _$SayacModel;


//  flutter packages pub run build_runner watch . terminal ekrarına yazınız gerekli paketleri yulkleycektir.
abstract class SayacModelBase with Store {
  @observable
  int sayac = 0;

  @action
  void sayacArtir() {
    sayac = sayac + 1;
  }

  @action
  void sayacAzalt(int miktar) {
    sayac = sayac - 1;
  }
}
