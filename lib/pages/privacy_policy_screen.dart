import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              const Text(
                'Introduction',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your privacy is important to us. This privacy policy explains how we collect, use, and protect your personal information.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Information We Collect',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'We collect information to provide better services to all our users. This may include information such as your name, email address, and phone number.',
              ),
              const SizedBox(height: 16),
              const Text(
                'How We Use Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'We use the information we collect for various purposes, including to provide and improve our services, to communicate with you, and to protect our users.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Information Sharing',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'We do not share personal information with companies, organizations, or individuals outside of our organization unless one of the following circumstances applies: with your consent, for external processing, or for legal reasons.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Information Security',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'We work hard to protect our users from unauthorized access to or unauthorized alteration, disclosure, or destruction of information we hold.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Changes to This Policy',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'We may change this privacy policy from time to time. We will post any privacy policy changes on this page and, if the changes are significant, we will provide a more prominent notice.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Contact Us',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'If you have any questions about this privacy policy, you can contact us at: iraqooh@gmail.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
