import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:submission/presentation/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Assignment'),
          backgroundColor: Colors.blue.shade700,
        ),
        body: Obx(() => controller.isLoading.value
            ? SkeletonListView()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 5,
                            child: GridView.builder(
                                physics: PageScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    controller.datumList.last.items.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: GestureDetector(
                                      onTap: () async =>
                                          controller.launchBrowser(controller
                                              .datumList
                                              .last
                                              .items[index]
                                              .link),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Image.network(controller.datumList
                                                .last.items[index].productImage
                                                .toString()),
                                            Text(
                                              controller.datumList.last
                                                  .items[index].productName
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        controller.datumList.first.sectionTitle.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                          physics: PageScrollPhysics(),
                          itemCount: controller.datumList.first.items.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async => controller.launchBrowser(
                                  controller.datumList.first.items[index].link),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15))),
                                        child: Image.network(
                                          controller.datumList.first
                                              .items[index].articleImage
                                              .toString(),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15)),
                                        ),
                                        child: Text(
                                          controller.datumList.first
                                              .items[index].articleTitle!,
                                          textAlign: TextAlign.start,
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.blue.shade600,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              )));
  }
}
