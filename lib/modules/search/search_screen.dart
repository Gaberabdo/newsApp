import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/states.dart';
import '../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getSports()
        ..getScience()
        ..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).search;

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultTextForm(
                    OnTap:(){
                      NewsCubit.get(context).getSearch(searchController.text);
                    },
                    obscureText: false,
                    controller: searchController,
                    type: TextInputType.text,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    labelText: 'Search',
                    prefixIcon: Icons.search,
                    redius: 20,
                  ),
                ),
                Expanded(
                  child: articleBuilder(
                    list,
                    context,
                    isSearch: true,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
