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

  _mainView() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_criteriaView(), Divider(), Expanded(child: _smartRefresherView())]);

  _criteriaView() => BlocBuilder<IssuesCubit, IssuesState>(
      builder: (context, state) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [_statusView(state), _sortView(state), SizedBox(width: 15)])));

  _statusView(IssuesState state) => DropdownWidget(
      onItemSelected: (value) => _getIssues(status: value as Status),
      currentItem: state.issueCriteria.status,
      itemList: Status.list);

  _sortView(IssuesState state) => DropdownWidget(
      onItemSelected: (value) => _getIssues(sortBy: value as SortBy),
      currentItem: state.issueCriteria.sortBy,
      itemList: SortBy.list);

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
                ? SpinKitWave(color: Theme.of(context).accentColor, size: 25.0)
                : _listView(state));
      },
    );
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
        child:
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [_listIcon(issue), _listText(issue)]),
      ),
      onTap: () => _goToIssueDetailsScreen(issue),
    );
  }

  _getIssues({SortBy? sortBy, Status? status, bool loadMore = false}) {
    _issuesCubit.getIssues(sortBy: sortBy, status: status, loadMore: loadMore);
  }

  _goToIssueDetailsScreen(Issue issue) async {
    await Navigator.pushNamed(context, ScreenRouter.ISSUE_DETAILS,
        arguments: {ScreenRouter.ARG_ISSUE: issue});
    _issuesCubit.addVisitedIssue(issue);
  }

  _listIcon(issue) => Padding(
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
      );

  _listText(Issue issue) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'flutter/flutter #${issue.number}',
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 8),
                      Text(issue.title ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: issue.isVisited ? FontWeight.normal : FontWeight.bold)),
                      _totalCommentView(issue),
                      SizedBox(height: 10),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                _listDate(issue)
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            Divider(height: 1)
          ],
        ),
      );

  _listDate(Issue issue) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(issue.duration, style: Theme.of(context).textTheme.bodyText2),
      );

  _totalCommentView(Issue issue) {
    TextStyle textTheme = Theme.of(context).textTheme.bodyText2!;
    Color statusColor = textTheme.color!;

    return issue.totalComments == 0
        ? Container()
        : Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 7),
            decoration: BoxDecoration(
              border: Border.all(color: statusColor.withOpacity(0.3), width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.chat,
                  color: statusColor,
                  size: 11,
                ),
                SizedBox(width: 5),
                Text(
                  issue.totalComments.toString(),
                  style: textTheme.copyWith(fontSize: 13),
                ),
              ],
            ));
  }
}
