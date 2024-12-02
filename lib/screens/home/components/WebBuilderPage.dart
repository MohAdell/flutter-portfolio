import 'package:flutter/material.dart';
import 'package:flutter_profile/responsive.dart';
import '../../../constants.dart';

class WebBuilderPage extends StatelessWidget {
  const WebBuilderPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Web Builder Projects",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: defaultPadding),
            // هنا سنعرض المشاريع الخاصة بـ Web Builder بشكل مشابه لصفحة Digital Marketing
            Responsive(
              mobile: WebBuilderGridView(
                crossAxisCount: 1,
                childAspectRatio: 1.7,
                projects: demoWebBuilderProjects,
              ),
              mobileLarge: WebBuilderGridView(
                crossAxisCount: 2,
                projects: demoWebBuilderProjects,
              ),
              tablet: WebBuilderGridView(
                childAspectRatio: .8,
                projects: demoWebBuilderProjects,
              ),
              desktop: WebBuilderGridView(
                projects: demoWebBuilderProjects,
              ),
            ),
          ],
    );
  }
}

class WebBuilderGridView extends StatelessWidget {
  const WebBuilderGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
    required this.projects,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final List<WebBuilderProject> projects;

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
      itemBuilder: (context, index) => WebBuilderProjectCard(
        project: projects[index],
      ),
    );
  }
}

class WebBuilderProjectCard extends StatelessWidget {
  final WebBuilderProject project;

  const WebBuilderProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // عند الضغط على الشعار، نعرض نافذة جديدة بها التفاصيل
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // اسم المشروع في الأعلى
                      Text(
                        project.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 8),
                      // الوصف أسفل اسم المشروع
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: Text(
                          project.description,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 16),
                      // لقطات الشاشة أسفل الوصف
                      Center(
                        child: InteractiveViewer(
                          child: Image.asset(
                            project.screenshot,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
            project.logo, // عرض الشعار
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class WebBuilderProject {
  final String logo; // الشعار
  final String name;
  final String screenshot; // لقطة الشاشة للموقع
  final String description; // الوصف الخاص بالمشروع

  WebBuilderProject({
    required this.logo,
    required this.name,
    required this.screenshot,
    required this.description, // تم إضافة الوصف
  });
}

// Sample project data for Web Builder with description
final List<WebBuilderProject> demoWebBuilderProjects = [
  WebBuilderProject(
    logo: 'assets/screens/WebBuilderProjects/education/education website ui.jpg',
    name: 'Education Website',
    screenshot: 'assets/screens/WebBuilderProjects/education/1.jpg',
    description: 'I specialize in designing educational websites using WordPress and ready-made templates like Echooling. This template features a modern design and unique features that make it ideal for educational websites.\nFeatures:\nUses Elementor for building websites.\nCompatible with Tutor LMS.\nPrebuilt homepages and inner pages.\nLifetime updates.\nFully responsive design.\nVarious customization options.',
  ),
  WebBuilderProject(
    logo: 'assets/screens/WebBuilderProjects/Screenshot 2024-12-02 194941.png',
    name: 'News Website',
    screenshot: 'assets/screens/WebBuilderProjects/111.jpg',
    description: 'I specialize in designing news websites using WordPress and ready-made templates. These templates offer modern design and unique features, making them perfect for news websites.\nFeatures:\nUses Elementor for building websites.\nPrebuilt homepages and inner pages.\nSections for the latest news, trending topics, and featured articles.\nIntegration with social media for sharing content.\nCustomizable layouts and themes.\nFully responsive design.\nSearch functionality and filtering options.',
  ),
  WebBuilderProject(
    logo: 'assets/screens/WebBuilderProjects/Screenshot 2024-12-02 195622.png',
    name: 'E-commerce Website',
    screenshot: 'assets/screens/WebBuilderProjects/11111.png',
    description: 'I specialize in designing e-commerce websites using WordPress and ready-made templates. These templates offer modern designs and powerful features that make them perfect for online stores.\nFeatures:\nUses Elementor for building websites.\nPrebuilt homepages and inner pages.\nIntegrated shopping cart and checkout system.\nProduct pages with customizable layouts.\nIntegration with popular payment gateways.\nFully responsive design.\nOptions for product filtering and search.\nCustomer reviews and rating features.\nInventory management and tracking.\nIntegration with social media for sharing products.',
  ),
];
