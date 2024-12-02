import 'package:flutter/material.dart';
import 'package:flutter_profile/responsive.dart';
import '../../../constants.dart';
import 'WebBuilderPage.dart';

class ProjectDisplay extends StatelessWidget {
  const ProjectDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Digital Marketing Section
        Text(
          "Digital Marketing",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: ProjectGridView(
            crossAxisCount: 1,
            childAspectRatio: 1.7,
            projects: demoDigitalMarketingProjects,
          ),
          mobileLarge: ProjectGridView(
            crossAxisCount: 2,
            projects: demoDigitalMarketingProjects,
          ),
          tablet: ProjectGridView(
            childAspectRatio: .8,
            projects: demoDigitalMarketingProjects,
          ),
          desktop: ProjectGridView(
            projects: demoDigitalMarketingProjects,
          ),
        ),
        // Space between sections
        const SizedBox(height: defaultPadding),
        WebBuilderPage(),
      ],
    );
  }
}

class ProjectGridView extends StatelessWidget {
  const ProjectGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
    required this.projects,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) => ProjectImageCard(
        project: projects[index],
      ),
    );
  }
}

class ProjectImageCard extends StatelessWidget {
  final Project project;

  const ProjectImageCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // عند الضغط على الصورة، نعرضها في نافذة تكبير
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InteractiveViewer(
                    child: Image.asset(
                      project.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    project.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // عند الضغط على الزر، نعرض نافذة تحتوي على مجموعة من اللقطات
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: SingleChildScrollView(
                              child: Column(
                                children: project.screenshots.map((image) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(image),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text("More ScreenShots",style: TextStyle(color:Colors.white ),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            );
          },
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            project.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class Project {
  final String image;
  final String name;
  final List<String> screenshots;

  Project({
    required this.image,
    required this.name,
    required this.screenshots,
  });
}

// Sample project data for Digital Marketing
final List<Project> demoDigitalMarketingProjects = [
  Project(
    image: 'assets/screens/instagram/Screenshot 2024-12-02 174914.png',
    name: 'Instagram Analytics',
    screenshots: [
      'assets/screens/instagram/Screenshot 2024-12-02 174942.png',
      'assets/screens/instagram/Screenshot 2024-12-02 174956.png',
      'assets/screens/instagram/Screenshot 2024-12-02 175016.png',
      'assets/screens/instagram/Screenshot 2024-12-02 175258.png',
      'assets/screens/instagram/Screenshot 2024-12-02 175448.png',
    ],
  ),
  Project(
    image: 'assets/screens/Google Analytics/Screenshot 2024-12-02 181832.png',
    name: 'Google Analytics',
    screenshots: [
      'assets/screens/Google Analytics/Screenshot 2024-12-02 181832.png',
      'assets/screens/Google Analytics/Screenshot 2024-12-02 181845.png',
      'assets/screens/Google Analytics/Screenshot 2024-12-02 181858.png',
    ],
  ),
  Project(
    image: 'assets/screens/blogger/Screenshot 2024-12-02 175856.png',
    name: 'Blogger & Google Search Console',
    screenshots: [
      'assets/screens/blogger/Screenshot 2024-12-02 175910.png',
      'assets/screens/blogger/Screenshot 2024-12-02 180922.png',
      'assets/screens/blogger/Screenshot 2024-12-02 180932.png',
      'assets/screens/blogger/Screenshot 2024-12-02 181007.png',
    ],
  ),

];

// Sample project data for Web Builder
final List<Project> demoWebBuilderProjects = [
  Project(
    image: 'assets/images/web_builder1.jpg',
    name: 'E-commerce Website',
    screenshots: [
      'assets/images/web_builder1_1.jpg',
      'assets/images/web_builder1_2.jpg',
      'assets/images/web_builder1_3.jpg',
    ],
  ),
  Project(
    image: 'assets/images/web_builder2.jpg',
    name: 'Portfolio Website',
    screenshots: [
      'assets/images/web_builder2_1.jpg',
      'assets/images/web_builder2_2.jpg',
      'assets/images/web_builder2_3.jpg',
    ],
  ),
];
