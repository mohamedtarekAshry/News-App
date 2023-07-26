// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/Data/Cubit/cubit/all_news_cubit.dart';
import 'package:news_app/Pages/News_detals_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Dogecoin to the Moon...",
                        hintStyle: TextStyle(
                          color: Color(0XFF818181),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(22),
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0XFFFF3A44),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset("assets/images/Group 38.svg"),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AllNewsCubit>().getAllNews();
                  },
                  child: const Text("Get News"),
                )),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Latest News",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      const InkWell(
                        child: Text(
                          "See All",
                          style: TextStyle(
                            color: Color(0XFF0080FF),
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset("assets/images/Combined Shape.svg")
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<AllNewsCubit, AllNewsState>(
                builder: (context, state) {
                  if (state is AllNewsInitial) {
                    return const Center(
                      child: Text('Press the above to get news'),
                    );
                  } else if (state is AllNewsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AllNewsSuccess) {
                    return ListView.builder(
                      itemCount: state.ourResponse.articles!.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailsPage(
                                image: state.ourResponse.articles![index]
                                            .urlToImage ==
                                        null
                                    ? "https://th.bing.com/th/id/OIP.eqAifC8QFEN9ccPaVVNNsQHaEK?pid=ImgDet&rs=1"
                                    : state.ourResponse.articles![index]
                                        .urlToImage!,
                                deta: state.ourResponse.articles![index]
                                            .publishedAt! ==
                                        null
                                    ? ''
                                    : state.ourResponse.articles![index]
                                        .publishedAt!,
                                title: state.ourResponse.articles![index]
                                            .title! ==
                                        null
                                    ? ''
                                    : state.ourResponse.articles![index].title!,
                                author:
                                    state.ourResponse.articles![index].author ==
                                            null
                                        ? ''
                                        : state.ourResponse.articles![index]
                                            .author!,
                                content: state.ourResponse.articles![index]
                                            .content! ==
                                        null
                                    ? ''
                                    : state
                                        .ourResponse.articles![index].content!,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          padding: const EdgeInsets.all(15),
                          height:
                              MediaQuery.of(context).size.height * 240 / 812,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  state.ourResponse.articles![index]
                                              .urlToImage ==
                                          null
                                      ? "https://th.bing.com/th/id/OIP.eqAifC8QFEN9ccPaVVNNsQHaEK?pid=ImgDet&rs=1"
                                      : state.ourResponse.articles![index]
                                          .urlToImage!,
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Text(
                                state.ourResponse.articles![index].author ==
                                        null
                                    ? ''
                                    : state
                                        .ourResponse.articles![index].author!,
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                state.ourResponse.articles![index].title == null
                                    ? ''
                                    : state.ourResponse.articles![index].title!,
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                state.ourResponse.articles![index]
                                            .description ==
                                        null
                                    ? ''
                                    : state.ourResponse.articles![index]
                                        .description!,
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
