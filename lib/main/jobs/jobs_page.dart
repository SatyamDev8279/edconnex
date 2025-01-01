import 'package:edconnex/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _jobsTopItems(title: "My jobs", icon: Icons.bookmark_border),
                _jobsTopItems(title: "Post a job", icon: FontAwesomeIcons.edit),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 8,
              color: liLightGrey,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Recommended Section
                  const Text(
                    "Recommended for you",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildRecommendedJobsList(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 8,
              color: liLightGrey,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * More Jobs for you Section
                  const Text(
                    "More jobs for you",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildMoreJobsForYouList(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildRecommendedJobsList() {
    return Column(
      children: [
        SizedBox(
          height: 380,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: liLightGrey.withOpacity(.6),
                      ),
                      child: const Icon(
                        Icons.home_work,
                        size: 50,
                        color: liMediumGrey,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Job Title",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.bookmark_border,
                                size: 30,
                                color: liMediumGrey,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            "Company name",
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.a,
                                size: 30,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Actively recruiting",
                                style: TextStyle(
                                    fontSize: 12, color: liMediumGrey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          RichText(
                            text: const TextSpan(
                                text: "Promoted - ",
                                style: TextStyle(
                                    fontSize: 12, color: liMediumGrey),
                                children: [
                                  TextSpan(
                                      text: "2 applicants",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.green))
                                ]),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            color: liMediumGrey,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Show all",
              style: TextStyle(
                  fontSize: 18, color: liBlue, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward,
              size: 25,
              color: liBlue,
            )
          ],
        )
      ],
    );
  }

  _buildMoreJobsForYouList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: liLightGrey.withOpacity(.6),
                ),
                child: const Icon(
                  Icons.home_work,
                  size: 50,
                  color: liMediumGrey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Job Title",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.bookmark_border,
                          size: 30,
                          color: liMediumGrey,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      "Company name",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.a,
                          size: 30,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Actively recruiting",
                          style: TextStyle(fontSize: 12, color: liMediumGrey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    RichText(
                      text: const TextSpan(
                          text: "Promoted - ",
                          style: TextStyle(fontSize: 12, color: liMediumGrey),
                          children: [
                            TextSpan(
                                text: "2 applicants",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.green))
                          ]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(color: liMediumGrey),
                  ],
                ),
              )
            ],
          );
        });
  }

  _jobsTopItems({String? title, IconData? icon}) {
    return Row(
      children: [
        Icon(icon, size: 30, color: liMediumGrey),
        const SizedBox(
          width: 10,
        ),
        Text(
          "$title",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
