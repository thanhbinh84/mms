import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mms/blocs/issues/issues_bloc.dart';
import 'package:mms/blocs/issues/issues_states.dart';
import 'package:mms/common/utils.dart';
import 'package:mms/data/models/issue_criteria.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:mms/screen_router.dart';
import 'package:mms/views/widgets/dropdown_widget.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:pull_to_refresh/pull_to_refresh.dart';

class IssuesScreen extends StatefulWidget {
  IssuesScreen({
    Key? key,
  }) : super(key: key);

  @override
  _IssuesScreenState createState() => _IssuesScreenState();
}

class _IssuesScreenState extends State<IssuesScreen> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  late IssuesCubit _issuesCubit;
  IssueList _issueList = IssueList();
  bool _isLoading = false;
  IssueCriteria _issueCriteria = IssueCriteria();

  @override
  void initState() {
    _issuesCubit = BlocProvider.of<IssuesCubit>(context);
    _getIssues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<IssuesCubit, IssuesState>(
        listener: (context, state) {
          if (state is IssuesError) {
            _refreshCompleted();
            Utils.errorToast(state.error);
          }
        },
        child: BlocBuilder<IssuesCubit, IssuesState>(
          builder: (context, state) {
            _isLoading = state is IssuesLoading;
            if (state is IssuesLoaded) {
              _issueList = state.issues;
              _refreshCompleted();
            }
            return Scaffold(
              appBar: AppBar(title: Text('Flutter - Issues')),
              body: _mainView(),
            );
          },
        ));
  }

  _refreshCompleted() {
    _refreshController.refreshCompleted();
    _refreshController.loadComplete();
  }

  _mainView() => Column(children: [_criteriaView(), Divider(), Expanded(child: _listView())]);

  _criteriaView() => Row(children: [_statusView(), _sortView()], mainAxisAlignment: MainAxisAlignment.start);

  _statusView() => DropdownWidget(
        child: DropdownButton<Status>(
            value: _issueCriteria.status,
            icon: const Icon(Icons.keyboard_arrow_down),
            underline: Container(),
            iconSize: 24,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
            onChanged: (value) => setState(() {
                  _issueCriteria.status = value!;
                  _onRefresh();
                }),
            items: Status.list.map<DropdownMenuItem<Status>>((Status status) {
              return DropdownMenuItem<Status>(
                value: status,
                child: Text(status.name),
              );
            }).toList()),
      );

  _sortView() => DropdownWidget(
        child: DropdownButton<SortBy>(
            value: _issueCriteria.sortBy,
            icon: const Icon(Icons.keyboard_arrow_down),
            underline: Container(),
            iconSize: 24,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
            onChanged: (value) => setState(() {
                  _issueCriteria.sortBy = value!;
                  _onRefresh();
                }),
            items: SortBy.list.map<DropdownMenuItem<SortBy>>((SortBy sortBy) {
              return DropdownMenuItem<SortBy>(
                value: sortBy,
                child: Text(sortBy.name),
              );
            }).toList()),
      );

  void _getIssues() {
    _issuesCubit.getIssues(_issueList, _issueCriteria);
  }

  _listView() {
    List<Issue> issues = _issueList.currentList;
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: _issueList.hasNextPage,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _getIssues,
        child: _isLoading && _issueList.currentList.isEmpty
            ? SpinKitWave(color: Colors.black26, size: 25.0)
            : ListView.separated(
                itemBuilder: (context, index) {
                  Issue issue = issues[index];
                  return ListTile(
                    title: Text(issue.title ?? ''),
                    onTap: () => _goToIssueDetailsScreen(issue),
                  );
                },
                itemCount: issues.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ));
  }

  void _onRefresh() {
    _issueList = IssueList();
    _getIssues();
  }

  _goToIssueDetailsScreen(Issue issue) {
    Navigator.pushNamed(context, ScreenRouter.ISSUE_DETAILS, arguments: {ScreenRouter.ARG_ISSUE: issue});
  }
}
