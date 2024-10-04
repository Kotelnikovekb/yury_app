class ProjectRoutes {
  static String MAIN = '/';
  static List<GetPage> pages=[
    GetPage(
        name: MAIN,
        page: () => const AuthScreen(),
        ),
  ]
}