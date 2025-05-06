import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class UserProfileScreen extends StatelessWidget {
  final String userId;

  const UserProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    // Fetch user data when the screen is loaded
    // We're calling fetchUser() to load data when the screen opens
    Future.delayed(Duration.zero, () {
      context.read<UserProvider>().fetchUser(userId);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          //  we fetch user data, show a loading spinner
          if (userProvider.state == UserState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          // something went wrong while fetching data
          else if (userProvider.state == UserState.error) {
            return Center(
              child: Text(
                'Oops! Something went wrong: ${userProvider.errorMessage}',
              ),
            );
          }
          // we display the user's information
          else if (userProvider.state == UserState.success) {
            final user = userProvider.user;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${user?.name ?? 'N/A'}'),
                    const SizedBox(height: 8),

                    Text('Email: ${user?.email ?? 'N/A'}'),
                    const SizedBox(height: 8),

                    Text('Phone: ${user?.phone ?? 'N/A'}'),
                    const SizedBox(height: 8),

                    Text('Website: ${user?.website ?? 'N/A'}'),
                  ],
                ),
              ),
            );
          }
          // If no user data is available or not yet fetched
          else {
            return const Center(
              child: Text('No user data available! Please try again.'),
            );
          }
        },
      ),
      // Refresh button at the bottom to fetch user data again
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // We are refetching the user data on a button click (refresh)
          context.read<UserProvider>().fetchUser(userId);
        },
        tooltip: 'Refresh User Data',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
