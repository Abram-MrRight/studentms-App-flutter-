import 'package:flutter/material.dart';

class TermsServiceScreen extends StatelessWidget {
  const TermsServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms of Service',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              const Text(
                '1. Introduction',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'Welcome to Example Inc. These terms and conditions outline the rules and regulations for the use of our service.',
              ),
              const SizedBox(height: 16),
              const Text(
                '2. Acceptance of Terms',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'By accessing this website, we assume you accept these terms and conditions in full. Do not continue to use Example Inc. services if you do not accept all of the terms and conditions stated on this page.',
              ),
              const SizedBox(height: 16),
              const Text(
                '3. Modifications to Terms',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'Example Inc. reserves the right to revise these terms at any time. By using this website, you are expected to review these terms on a regular basis to ensure you understand all terms and conditions governing use of this website.',
              ),
              const SizedBox(height: 16),
              const Text(
                '4. Use of Service',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'You must be at least 18 years of age to use this website. By using this website and by agreeing to these terms and conditions, you warrant and represent that you are at least 18 years of age.',
              ),
              const SizedBox(height: 16),
              const Text(
                '5. Intellectual Property Rights',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'Other than the content you own, under these terms, Example Inc. and/or its licensors own all the intellectual property rights and materials contained in this website. You are granted a limited license only for purposes of viewing the material contained on this website.',
              ),
              const SizedBox(height: 16),
              const Text(
                '6. Restrictions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'You are specifically restricted from all of the following:'
                    '\n\nPublishing any website material in any other media'
                    '\n\nSelling, sublicensing and/or otherwise commercializing any website material'
                    '\n\nPublicly performing and/or showing any website material'
                    '\n\nUsing this website in any way that is or may be damaging to this website'
                    '\n\nUsing this website in any way that impacts user access to this website'
                    '\n\nUsing this website contrary to applicable laws and regulations, or in any way may cause harm to the website, or to any person or business entity'
                    '\n\nEngaging in any data mining, data harvesting, data extracting or any other similar activity in relation to this website'
                    '\n\nUsing this website to engage in any advertising or marketing',
              ),
              const SizedBox(height: 16),
              const Text(
                '7. Limitation of Liability',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'In no event shall Example Inc., nor any of its officers, directors and employees, be held liable for anything arising out of or in any way connected with your use of this website whether such liability is under contract. Example Inc., including its officers, directors and employees shall not be held liable for any indirect, consequential or special liability arising out of or in any way related to your use of this website.',
              ),
              const SizedBox(height: 16),
              const Text(
                '8. Indemnification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'You hereby indemnify to the fullest extent Example Inc. from and against any and/or all liabilities, costs, demands, causes of action, damages and expenses arising in any way related to your breach of any of the provisions of these terms.',
              ),
              const SizedBox(height: 16),
              const Text(
                '9. Severability',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'If any provision of these terms is found to be invalid under any applicable law, such provisions shall be deleted without affecting the remaining provisions herein.',
              ),
              const SizedBox(height: 16),
              const Text(
                '10. Variation of Terms',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'Example Inc. is permitted to revise these terms at any time as it sees fit, and by using this website you are expected to review these terms on a regular basis.',
              ),
              const SizedBox(height: 16),
              const Text(
                '11. Assignment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'Example Inc. is allowed to assign, transfer, and subcontract its rights and/or obligations under these terms without any notification. However, you are not allowed to assign, transfer, or subcontract any of your rights and/or obligations under these terms.',
              ),
              const SizedBox(height: 16),
              const Text(
                '12. Entire Agreement',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'These terms constitute the entire agreement between Example Inc. and you in relation to your use of this website, and supersede all prior agreements and understandings.',
              ),
              const SizedBox(height: 16),
              const Text(
                '13. Governing Law & Jurisdiction',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'These terms will be governed by and interpreted in accordance with the laws of the State of Country, and you submit to the non-exclusive jurisdiction of the state and federal courts located in Country for the resolution of any disputes.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}