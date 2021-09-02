import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mms/blocs/issues/issues_bloc.dart';
import 'package:mms/blocs/issues/issues_states.dart';
import 'package:mms/graphql/graphql_api.graphql.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Root extends StatefulWidget {
  Root({
    Key? key,
  }) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  late IssuesCubit _issuesCubit;
  List<GraphqlApi$Query$Repository$Issues$Edges?> _issues = [];
  bool _isLoading = false;

  @override
  void initState() {
    _issuesCubit = BlocProvider.of<IssuesCubit>(context);
    _loadIssues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<IssuesCubit, IssuesState>(listener: (context, state) {
      _isLoading = state is IssuesLoading;
      if (state is IssuesLoaded) _issues = state.issues!;
    }, child: BlocBuilder<IssuesCubit, IssuesState>(
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: _isLoading,
            child: Scaffold(
              appBar: AppBar(title: Text('Flutter issues')),
              body: _listView(),
            ),
            progressIndicator: SpinKitDoubleBounce(
              color: Colors.white.withOpacity(0.8),
            ));
      },
    ));
  }

  void _loadIssues() {
    _issuesCubit.getIssues();
  }

  _listView() {
    return ListView.separated(
      itemBuilder: (context, index) {
        GraphqlApi$Query$Repository$Issues$Edges? edge = _issues[index];
        return ListTile(title: Text(edge!.node!.title));
      },
      itemCount: _issues.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }
}
