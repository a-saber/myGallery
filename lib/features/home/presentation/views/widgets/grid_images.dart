import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task2/core/core_widgets/custom_button.dart';
import 'package:task2/core/resources_manager/colors_manager.dart';
import 'package:task2/features/home/presentation/views/widgets/show_single_image.dart';
import 'package:task2/features/manager/app_cubit.dart';

import '../../../../manager/app_states.dart';

class GridImages extends StatelessWidget {
  const GridImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          if (state is UploadErrorState || state is GetImagesErrorState) {
            return Column(
              children: [
                const SizedBox(height: 50,),
                Center(
                  child: CustomButton(
                      text: 'Try again',
                      backgroundColor: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: ()
                      {
                        AppCubit.get(context).getImages();
                      }),
                ),
              ],
            );
          } else if (state is GetImagesLoadingState) {
            return Column(
              children:const [
                SizedBox(height: 50,),

                 Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          } else {
            print(AppCubit.get(context).images.length);
            return GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: 1 / 1,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: (width/150).round(),
              children: List.generate(
             AppCubit.get(context).images.length,
                    (index) => InkWell(
                      onTap: ()
                      {
                        Get.to(() => ShowSingleImage(url: AppCubit.get(context).images[index]),);
                      },
                      child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                      ),
                      placeholder: (context, error) => const Icon(
                        Icons.image_outlined,
                        color: Colors.grey,
                      ),
                      fit: BoxFit.fill,
                      imageUrl: AppCubit.get(context).images[index],
                      //imageUrl: "https://media-afr-cdn.oriflame.com/contentImage?externalMediaId=885528a5-42dc-4759-9016-3945a9287e43&name=mango&inputFormat=png",
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error_outline)),
                    ),
              ),
            );
          }
        },
        listener: (context, state) {});
  }
}
