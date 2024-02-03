import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/bloc/news_org_bloc.dart';
import 'package:news_api/models/news_org_model.dart';
import 'package:news_api/news_services.dart/news_services.dart';
import 'package:news_api/ui/bloc_provider8.dart';

class NewsOrgPage extends StatelessWidget {
  const NewsOrgPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tesla news page"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1,
        child: BlocProvider(
          create: (context) =>
              NewsOrgBloc(NewsServices())..add(LoadNewsEvent()),
          child: BlocBuilder<NewsOrgBloc, NewsOrgState>(
            builder: (context, state) {
              print("Our news : " + state.toString());
              if (state is NewsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is NewsErrorState) {
                return Center(
                  child: Text('Error'),
                );
              }
              if (state is NewsLoadedState) {
                List<NewsOrgModel> newsModel = state.news;
                return Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                      itemCount: newsModel.length,
                      itemBuilder: (conetext, index) {
                        var data = newsModel[index];
                        return Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  data.title.toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Image.network(data.urlToImage != null
                                    ? data.urlToImage.toString()
                                    : "https://www.the-sun.com/wp-content/uploads/sites/6/2024/02/newspress-collage-9qrnx7zq0-1706884876065.jpg?1706868489&strip=all&quality=100&w=1920&h=1080&crop=1"),
                                Text(data.description.toString()),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   leading: Text(data.title.toString()),
                          //   // subtitle: Text(data.description.toString()),
                          // ),
                        );
                      }),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
