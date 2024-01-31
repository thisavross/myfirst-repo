import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pengayaan17/bloc/news_org_bloc.dart';
import 'package:pengayaan17/models/news_org_model.dart';
import 'package:pengayaan17/services.dart/news_services.dart';
import 'package:pengayaan17/ui/bloc_providers17.dart';

class NewsOrgPage extends StatelessWidget {
  const NewsOrgPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("news org page"),
      ),
  body: Container(
        height: MediaQuery.of(context).size.height / 1,
        child: BlocProvider(
          create: (context) =>
              NewsOrgBloc(NewsServices())..add(LoadNewsEvent()),
          child: BlocBuilder<NewsOrgBloc, NewsOrgState>(
            builder: (context, state) {
              print("isinya: " + state.toString());
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
                                    : "https://www.mobil-mitsubishi.co.id/wp-content/uploads/2023/03/1636383523-new-front-bumper-grille-designjpg.jpg"),
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