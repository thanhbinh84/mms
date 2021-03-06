# Github issue browser app

A Flutter app showing flutter respository's issues using GraphQL API. 

## Steps to run:
• Generate access token key https://docs.github.com/en/graphql/guides/forming-calls-with-graphql#authenticating-with-graphql

• Put your access token in lib/common/local.dart and .graphqlconfig

## User story :
As a user I want to:

• see a list of all issues of a Flutter GitHub repository (https://github.com/flutter/flutter)

• be able to navigate to a detail screen of an issue that features relevant information

• see the already visited issues distinguished at the list of all issues

• be able to switch between dark and light modes

• be able to sort and filter the list of issues

## Libraries and tools included:
• flutter_bloc

• graphql_flutter

• graphql plugin - https://jimkyndemeyer.github.io/js-graphql-intellij-plugin/docs/getting-started

• artemis - cmd: flutter pub run build_runner build --delete-conflicting-outputs 

• golden_toolkit - cmd: flutter test --update-goldens

## Technical:
• Unit and golden tests

• Make use of the GitHub’s GraphQL API

• Build a CI on GitHub Actions - https://github.com/thanhbinh84/mms/actions

• Deploy app to Firebase App Distribution - https://appdistribution.firebase.dev/i/3887af97f447eaf0

## Demo:



https://user-images.githubusercontent.com/366768/132605508-3845aec8-a6d1-423b-a4d1-8549b48a48e5.mp4

Goden test results: 

![multiple_screens_testing](https://user-images.githubusercontent.com/366768/132611519-ca2b32d3-d9e1-4940-80e6-6b7c69f0b840.png)

