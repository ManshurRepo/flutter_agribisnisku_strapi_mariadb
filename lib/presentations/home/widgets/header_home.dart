import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/core/assets/assets.gen.dart';
import 'package:flutter_agribisnisku/data/datasources/auth_local_datasource.dart';
import 'package:flutter_agribisnisku/data/models/responses/login_response_model.dart';




class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.all(12.0),
      padding:  const EdgeInsets.all(24.0),
      decoration:  const BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                child: Image.asset(
                  Assets.images.profilPict.path,
                  width: 60.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16.0),
               SizedBox(
                width:  208.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Halo,',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    FutureBuilder<LoginResponseModel>(
                    future: AuthLocalDatasource().getAuthData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data!.user.username,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
