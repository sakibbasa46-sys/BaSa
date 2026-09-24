import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _otpSent = false;

  // আপনার এডমিন মোবাইল নম্বর (এখানে আপনার নম্বরটি নির্ধারণ করা হয়েছে)
  final String _adminPhoneNumber = '01571067775';

  void _sendOtp() {
    if (_phoneController.text.length >= 11) {
      setState(() {
        _otpSent = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('টেস্ট OTP: 1234 ব্যবহার করুন')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('সঠিক ১১ ডিজিটের নম্বর লিখুন')),
      );
    }
  }

  void _verifyOtp() {
    if (_otpController.text.length == 4) {
      // মোবাইল নম্বর চেক করা হচ্ছে
      String enteredPhone = _phoneController.text.trim();

      if (enteredPhone == _adminPhoneNumber) {
        // এডমিন নম্বর হলে এডমিন ড্যাশবোর্ডে পাঠাবে
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AdminHomeScreen()),
        );
      } else {
        // সাধারণ ইউজার হলে সাধারণ ইউজার পেজে পাঠাবে
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UserHomeScreen()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('সঠিক ৪ ডিজিটের OTP দিন (যেমন: 1234)')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BaSa - লগইন'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home_work_rounded, size: 80, color: Colors.teal),
            const SizedBox(height: 10),
            const Text(
              'BaSa',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'নিরাপদ প্রবেশের জন্য আপনার মোবাইল নম্বর দিন',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'মোবাইল নম্বর',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
              enabled: !_otpSent,
            ),
            if (_otpSent) ...[
              const SizedBox(height: 15),
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                maxLength: 4,
                decoration: const InputDecoration(
                  labelText: '৪ ডিজিটের OTP কোড (1234)',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _otpSent ? _verifyOtp : _sendOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(_otpSent ? 'ভেরিফাই করুন' : 'OTP পাঠান'),
            ),
          ],
        ),
      ),
    );
  }
}

// 👑 এডমিন হোম স্ক্রিন (শুধুমাত্র আপনার নম্বরে চালু হবে)
class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BaSa - Admin Panel'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.admin_panel_settings, size: 90, color: Colors.deepOrange),
            const SizedBox(height: 15),
            const Text(
              'স্বাগতম, এডমিন!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange),
            ),
            const SizedBox(height: 10),
            const Text(
              'আপনার নম্বর (01571067775) দিয়ে এক্সেস নিশ্চিত করা হয়েছে। এখান থেকে আপনি বাসা যোগ/এডিট এবং ইউজার নিয়ন্ত্রণ করতে পারবেন।',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('নতুন বাসা পোস্ট করুন'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 👤 সাধারণ ইউজার হোম স্ক্রিন
class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BaSa - হোম'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.home, size: 80, color: Colors.teal),
            SizedBox(height: 20),
            Text(
              'BaSa অ্যাপে স্বাগতম!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('এখানে আপনার জন্য উপলব্ধ ভাড়া বাসাগুলো দেখতে পাবেন।'),
          ],
        ),
      ),
    );
  }
}
