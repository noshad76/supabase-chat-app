import 'package:chat_app/core/resources/api_keys.dart';
import 'package:chat_app/core/theme/theme.dart';
import 'package:chat_app/features/authentication/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:chat_app/features/authentication/presentation/screens/signup_page.dart';
import 'package:chat_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Supabase.initialize(
    url: projectUrl,
    anonKey: projectApi,
  );

  await initializeLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => instance(),
        )
      ],
      child: ResponsiveSizer(
        builder: (p0, p1, p2) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Chat App',
            theme: ThemeClass.lightTheme,
            darkTheme: ThemeClass.darkTheme,
            themeMode: ThemeMode.system,
            home: SignupPage(),
          );
        },
      ),
    );
  }
}
