import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

enum ShimmerType {
  Carousel,
  Recipes,
  Categories,
  ProfileRecipes,
  Users,
  Cookbook
}

class ShimmerLoading extends StatelessWidget {
  final ShimmerType? type;
  final int? crossAxisCount;

  const ShimmerLoading({Key? key, this.type, this.crossAxisCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ShimmerType.Carousel:
        return _buildCarouselShimmer();
      case ShimmerType.Recipes:
        return _buildRecipesShimmer();
      case ShimmerType.Categories:
        return _buildCategoriesShimmer();
      case ShimmerType.ProfileRecipes:
        return _buildProfileRecipeShimmer(context, crossAxisCount!);
      case ShimmerType.Users:
        return _buildUsersShimmer(context);
      case ShimmerType.Cookbook:
        return _buildCookbookRecipeShimmer(context);
      default:
        return Container();
    }
  }

  _buildCarouselShimmer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Shimmer.fromColors(
        baseColor: (Colors.grey[300])!,
        highlightColor: (Colors.grey[100])!,
        child: _container(double.infinity, 180, radius: 15),
      ),
    );
  }

  _buildRecipesShimmer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Shimmer.fromColors(
        baseColor: (Colors.grey[300])!,
        highlightColor: (Colors.grey[100])!,
        child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  _container(
                    80,
                    80,
                    radius: 15,
                    margin: EdgeInsets.only(top: 10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _container(
                        70,
                        15,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      _container(
                        200,
                        18,
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),
                      ),
                      Row(
                        children: [
                          _container(
                            15,
                            15,
                            radius: 15,
                            margin: EdgeInsets.symmetric(horizontal: 15),
                          ),
                          _container(100, 15),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }

  _buildCategoriesShimmer() {
    return Shimmer.fromColors(
      baseColor: (Colors.grey[300])!,
      highlightColor: (Colors.grey[100])!,
      child: GridView.builder(
          itemCount: 10,
          padding: const EdgeInsets.all(15),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            return _container(200, 80);
          }),
    );
  }

  _buildProfileRecipeShimmer(BuildContext context, int crossAxisCount) {
    var queryData = MediaQuery.of(context);
    return Shimmer.fromColors(
      baseColor: (Colors.grey[300])!,
      highlightColor: (Colors.grey[100])!,
      child: GridView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio:
                queryData.size.width / queryData.size.height / 0.7,
            crossAxisSpacing: 6,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                _container(double.infinity, 100, radius: 15),
                _container(double.infinity, 20,
                    margin: EdgeInsets.only(top: 5)),
              ],
            );
          }),
    );
  }

  _buildCookbookRecipeShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: (Colors.grey[300])!,
      highlightColor: (Colors.grey[100])!,
      child: _container(double.infinity, 120, radius: 15),
    );
  }

  _container(double width, double height,
      {double radius = 0, EdgeInsetsGeometry? margin}) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  _buildUsersShimmer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Shimmer.fromColors(
        baseColor: (Colors.grey[300])!,
        highlightColor: (Colors.grey[100])!,
        child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  _container(
                    50,
                    50,
                    radius: 30,
                    margin: EdgeInsets.only(top: 10),
                  ),
                  _container(
                    150,
                    18,
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 6,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
