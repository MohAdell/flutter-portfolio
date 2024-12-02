class Project {
  final String? title, description;

  Project({this.title, this.description});
}

List<Project> demoProjects = [
  Project(
    title: "E-commerce - App",
    description:
        "Tools: API, Dio, Bloc, SharedPreferences, GetIt, Firebase (Auth, Firestore, Storage), .               An E-commerce app built with Flutter that allows users to browse products, add them to the cart, and complete purchases easily.",
  ),
  Project(
    title: "News - App",
    description:
        "Tools: API, Dio, Provider / Bloc, CachedNetworkImage, Flutter_local_notifications, Google Fonts, Intl, Firebase (Firestore),.        An News app built with Flutter that fetches news from an external API. Users can browse news by category, read full article details, and share news on social media.",
  ),
  Project(
    title: "Weather App - Web App",
    description:
        "Tools: API, Dio, Cubit, Flutter_local_notifications, CachedNetworkImage.                         A Weather app built with Flutter that fetches weather data from an external API. Users can check the current weather, forecast for the next few days, and receive weather-related notifications.",
  ),
  Project(
    title: "Azkar - App",
    description:
        "Tools: Dio, Provider, SharedPreferences / SQLite, Flutter_local_notifications.                         An Azkar app built with Flutter that fetches and displays daily prayers and supplications (Azkar) from an external API or a local database.",
  ),
  Project(
    title: "Targemly - App",
    description:
        "Tools: Speech_to_Text, Provider, SharedPreferences.               An application that detects any language in the world and translates it to Arabic with the press of a button.",
  ),
  Project(
    title: "To-Do List - App",
    description:
        "Tools: Provider, SharedPreferences / SQLite, Intl.                       A To-Do List app built with Flutter that helps users manage their tasks efficiently. Users can add, edit, delete, and mark tasks as completed.",
  ),
];
