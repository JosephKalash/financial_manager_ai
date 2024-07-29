import 'package:ai_financial_manager/features/wallets/domain/models/wallet_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../domain/wallets_params.dart';
import '../../domain/wallets_repo.dart';

part 'wallets_cubit.freezed.dart';
part 'wallets_state.dart';

@injectable
class WalletsCubit extends Cubit<WalletsState> {
  WalletsCubit(this._repo) : super(const WalletsState.initial());

  final IWalletsRepo _repo;
  final params = WalletsParams();
  List<WalletModel> wallets = [];
  void rest() {
    params.reset();
  }

  void addWallet(WalletModel wallet) {
    _repo.addWallet(wallet);
  }

  void deleteWallet(int id) {
    _repo.deleteWallet(id);
  }

  void buildWalletsStream() async {
    final data = await _repo.getWalletsStream();
    wallets = data.$1;
    emit(const WalletsState.updated());
    final stream = data.$2.watch();
    stream.listen((wallets) {
      this.wallets = wallets;
      emit(const WalletsState.loading());
      emit(const WalletsState.updated());
    });
  }
}
