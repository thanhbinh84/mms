import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/rendering.dart';
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
import 'package:mms/views/widgets/theme_button.dart';

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
          if (state is IssuesFailure) {
            _refreshCompleted();
            Utils.errorToast(state.error);
          } else if (state is IssuesLoaded) _refreshCompleted();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter - Issues'),
            actions: [ThemeButton()],
          ),
          body: _mainView(),
        ));
  }

  _refreshCompleted() {
    _refreshController.refreshCompleted();
    _refreshController.loadComplete();
  }

  _mainView() => Column(children: [_criteriaView(), Divider(), Expanded(child: _smartRefresherView())]);

  _criteriaView() => BlocBuilder<IssuesCubit, IssuesState>(
      builder: (context, state) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                  children: [_statusView(state), _sortView(state)],
                  mainAxisAlignment: MainAxisAlignment.start))));

  _statusView(IssuesState state) => DropdownWidget(
      onItemSelected: (value) => _getIssues(status: value as Status),
      currentItem: state.issueCriteria.status,
      itemList: Status.list);

  _sortView(IssuesState state) => DropdownWidget(
      onItemSelected: (value) => _getIssues(sortBy: value as SortBy),
      currentItem: state.issueCriteria.sortBy,
      itemList: SortBy.list);

  void _getIssues({SortBy? sortBy, Status? status, bool loadMore = false}) {
    _issuesCubit.getIssues(sortBy: sortBy, status: status, loadMore: loadMore);
  }

  _smartRefresherView() {
    return BlocBuilder<IssuesCubit, IssuesState>(
      builder: (context, state) {
        return SmartRefresher(
            enablePullDown: true,
            enablePullUp: state is IssuesLoaded ? state.issueList.hasNextPage : true,
            controller: _refreshController,
            onRefresh: _getIssues,
            onLoading: () => _getIssues(loadMore: true),
            child: state is IssuesLoading && state.issueList.currentList.isEmpty
                ? SpinKitWave(color: Colors.black26, size: 25.0)
                : _listView(state));
      },
    );
  }

  _goToIssueDetailsScreen(Issue issue) async {
    await Navigator.pushNamed(context, ScreenRouter.ISSUE_DETAILS,
        arguments: {ScreenRouter.ARG_ISSUE: issue});
    _issuesCubit.addVisitedIssue(issue);
  }

  _listView(IssuesState state) {
    IssueList? issueList = state.issueList;
    List<Issue> currentList = issueList.currentList;
    return currentList.isEmpty
        ? Center(child: Text('No issue found'))
        : ListView.builder(
            itemBuilder: (context, index) => _listItemView(currentList[index]),
            itemCount: currentList.length,
          );
  }

  _listItemView(Issue issue) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: issue.closed
                ? Icon(
                    Icons.check_circle_outline,
                    color: Theme.of(context).errorColor,
                  )
                : Icon(
                    Icons.stop_circle_outlined,
                    color: Theme.of(context).accentColor,
                  ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('flutter/flutter #${issue.number}', style: Theme.of(context).textTheme.bodyText2),
                SizedBox(height: 8),
                Text(issue.title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: issue.isVisited ? FontWeight.normal : FontWeight.bold)),
                SizedBox(height: 10),
                Divider(height: 1)
              ],
            ),
          )
        ]),
      ),
      onTap: () => _goToIssueDetailsScreen(issue),
    );
  }
}
