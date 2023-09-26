import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/provider/recipes_view_provider.dart';
import 'package:provider/provider.dart';

class RecipeViewScreen extends StatefulWidget {
  const RecipeViewScreen({super.key});

  @override
  State<RecipeViewScreen> createState() => _RecipeViewScreenState();
}

class _RecipeViewScreenState extends State<RecipeViewScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RecipesViewProvider>(context, listen: false).getRecipesView(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesViewProvider>(
  builder: (context, recipesViewProvider, child) {
  return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        child: Column(
          children: [
            Container(
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 7/6,
                  ),
                  itemCount: recipesViewProvider.mealsList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){},
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 15,
                        color: Colors.black.withOpacity(0.5),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(
                                  //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 50.h,
                                          width: 50.w,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(5.r)),
                                              child: Image.network('${recipesViewProvider.mealsList![index].strMealThumb.toString()}',fit: BoxFit.fill,)),
                                      ),
                                      SizedBox(height: 5.h,),
                                      Text("Meal ID: ${recipesViewProvider.mealsList![index].idMeal.toString()}", style: TextStyle(color: Colors.white),),
                                      Text("${recipesViewProvider.mealsList![index].strMeal.toString()}", textAlign: TextAlign.center,  style: TextStyle(color: Colors.white),),
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20,),
                                  height: double.infinity,
                                  width: double.infinity,
                                  alignment: Alignment.centerRight,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                                  ),
                                  child: Container(
                                    height: 22.h,
                                    width: 22.w,
                                    decoration: BoxDecoration(shape: BoxShape.circle,
                                        color: Colors.pinkAccent,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(2,3),
                                              blurRadius: 4,
                                              color: Colors.black
                                          )
                                        ]),
                                    child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15.sp,),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  },
);
  }
}
