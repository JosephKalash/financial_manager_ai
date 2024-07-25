import 'package:ai_financial_manager/injectable/injecter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/wallets_cubit.dart';

class WalletsPage extends StatelessWidget {
  const WalletsPage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<WalletsCubit>(),
      child: const _PageContent(),
    );
  }
}

class _PageContent extends StatefulWidget {
  const _PageContent();

  @override
  State<_PageContent> createState() => __PageContentState();
}

class __PageContentState extends State<_PageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
