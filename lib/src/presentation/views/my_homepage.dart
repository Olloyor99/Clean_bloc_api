import 'package:clean_block_api_dec22/src/presentation/blocs/my_bloc/bloc/fake_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
   // final fakeBloc = context.read<FakeBloc>();
    return BlocBuilder<FakeBloc, FakeState>(builder: ((context, state) {
      if (state is FakeLoaded) {
        return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      controller: controller
                        ..addListener(() {
                          if (controller.offset ==
                              controller.position.maxScrollExtent) {
                            context.read<FakeBloc>().add(FetchEvent());
                          }
                        }),
                      itemCount: state.posts.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: Text(state.posts[index].title.toString()),
                          subtitle: Text(state.posts[index].body.toString()),
                          leading: Text(state.posts[index].id.toString()),


                        );
                      })),
                ),
                state.isLoading?Center(child: CircularProgressIndicator(),):SizedBox()
              ],
            ));
      } else {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }
    }));
  }
}
