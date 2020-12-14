// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:mysecont_desktop_demo/Practice/Memory/memory_page.dart';
import 'package:mysecont_desktop_demo/Practice/Memory/one_argument_page.dart';

const ROUTE_MEMORY_PAGE = 'memory_page';
const ROUTE_ONE_ARGUMENT_PAGE = 'one_argument_page';

RouteFactory onGenerateRoute = (settings) => Map.fromEntries([
      ..._memoryPage.entries,
      ..._oneArgumentPage.entries,
    ])[settings.name](settings);

Map<String, RouteFactory> _memoryPage = <String, RouteFactory>{
  'memory_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) {
          final arguments = settings.arguments as Map<String, dynamic>;
          return MemoryPage(
            title: arguments['title'],
            subTitle: arguments['subTitle'],
          );
        },
      ),
};
Map<String, RouteFactory> _oneArgumentPage = <String, RouteFactory>{
  'one_argument_page': (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) =>
            OneArgumentPage(title: settings.arguments),
      ),
};
