import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mms/blocs/issue/issue_bloc.dart';
import 'package:mms/blocs/issue/issue_states.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:mms/views/root/screen_router.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class IssueDetailsScreen extends StatefulWidget {
  final Issue issue;

  IssueDetailsScreen({required this.issue, Key? key}) : super(key: key);

  @override
  _IssueDetailsScreenState createState() => _IssueDetailsScreenState();
}

class _IssueDetailsScreenState extends State<IssueDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<IssueCubit>(context).getIssue(widget.issue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssueCubit, IssueState>(builder: (context, state) {
      return ModalProgressHUD(
          child: Scaffold(
              appBar: AppBar(title: Text('Issue Details')),
              body: _mainView(state),
              bottomNavigationBar: _bottomButton()),
          inAsyncCall: state is IssueLoading,
          progressIndicator: SpinKitDoubleBounce(
            color: Colors.white.withOpacity(0.8),
          ));
    });
  }

  _bottomButton() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(height: 1),
          TextButton(
              onPressed: () => Navigator.of(context)
                  .pushNamed(ScreenRouter.WEB_VIEW, arguments: {ScreenRouter.ARG_ISSUE: widget.issue}),
              child: Text('View on GitHub')),
        ],
      );

  _mainView(IssueState state) {
    if (state is IssueLoaded) {
      Issue issue = state.issue;
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerView(issue),
            Divider(thickness: 10),
            _bodyView(issue),
          ],
        ),
      );
    }
    return Container();
  }

  _headerView(Issue issue) {
    Color statusColor = issue.closed ? Theme.of(context).errorColor : Theme.of(context).accentColor;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('flutter/flutter #${issue.number}', style: textTheme.bodyText1),
          SizedBox(height: 8),
          Text(issue.title ?? '', style: textTheme.headline6),
          SizedBox(height: 10),
          Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: statusColor.withOpacity(0.3), width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: statusColor.withOpacity(0.1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    issue.closed ? Icons.check_circle_outline : Icons.stop_circle_outlined,
                    color: statusColor,
                    size: 18,
                  ),
                  SizedBox(width: 5),
                  Text(
                    issue.closed ? 'Closed' : 'Open',
                    style: textTheme.bodyText1!.copyWith(color: statusColor),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  _bodyView(Issue issue) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 15),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(issue.author.avatarUrl),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Text(issue.author.userName, style: textTheme.bodyText1),
              SizedBox(width: 10),
              Icon(Icons.brightness_1_rounded, size: 3),
              SizedBox(width: 10),
              Text(issue.duration, style: textTheme.bodyText2),
            ],
          ),
          Html(data: issue.bodyHTML)
        ],
      ),
    );
  }
}
