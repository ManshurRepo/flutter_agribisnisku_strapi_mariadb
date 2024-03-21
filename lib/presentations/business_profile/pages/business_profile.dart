import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/presentations/business_profile/bloc/bloc/business_profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/business_widgets.dart';

class BusinessProfile extends StatefulWidget {
  const BusinessProfile({Key? key}) : super(key: key);

  @override
  State<BusinessProfile> createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {
  @override
  void initState() {
    super.initState();
    context
        .read<BusinessProfileBloc>()
        .add(const BusinessProfileEvent.getProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Profile',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            textAlign: TextAlign.end),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: BlocBuilder<BusinessProfileBloc, BusinessProfileState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (model) {
              if (model.data.isEmpty) {
                return const Center(
                  child: Text('No data available'),
                );
              } else {
                return ListView.builder(
                  itemCount: model.data.length,
                  itemBuilder: (context, index) {
                    return BusinessProfileWidget(data: model.data[index]);
                  },
                );
              }
            },
            orElse: () => const Center(
              child: Text('Failed to load data'),
            ),
          );
        },
      ),
    );
  }
}
