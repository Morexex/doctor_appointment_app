import 'package:doctor_appointment_app/components/button.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components//custom_appbar.dart';

class DoctoreDetails extends StatefulWidget {
  const DoctoreDetails({super.key});

  @override
  State<DoctoreDetails> createState() => _DoctoreDetailsState();
}

class _DoctoreDetailsState extends State<DoctoreDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Details',
        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
            icon: FaIcon(
              isFav ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
              color: Colors.red,
              size: 20,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          const AboutDoctor(),
          const DetailBoby(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Button(
              width: double.infinity,
              title: 'Book Appointment',
              onPressed: () {
                Navigator.of(context).pushNamed('/booking_page');
              },
              disable: false,
            ),
          ),
        ],
      )),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage('assets/001.jpg'),
              backgroundColor: Colors.white,
            ),
            Config.spaceMedium,
            const Text(
              'Dr Nyanaro',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Config.spaceSmall,
            SizedBox(
              width: Config.widthSize * 0.75,
              child: const Text(
                'MBBS (International Medical University), M.Med (Family Medicine) (National University of Singapore)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            Config.spaceSmall,
            SizedBox(
              width: Config.widthSize * 0.75,
              child: const Text(
                'Kenyatta National Hospital, Nairobi, Kenya',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}

class DetailBoby extends StatelessWidget {
  const DetailBoby({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Config.spaceSmall,
            DoctorInfo(),
            Config.spaceSmall,
            Text(
              'About Doctor',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Config.spaceSmall,
            Text(
              'Dr Nyanaro is an intelligent physisian who has been in session since 2000 and with an experience is dental for 10 years. He has a good reputation and has been awarded severally for his good work.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
              softWrap: true,
              textAlign: TextAlign.justify,
            )
          ]),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        InfoCard(
          label: 'Patients',
          value: '1000',
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Experience',
          value: '10 Years',
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Rating',
          value: '4.6',
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.label, required this.value});

  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Config.primaryColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 1),
                blurRadius: 10,
              )
            ]),
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
