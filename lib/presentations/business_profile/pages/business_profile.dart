import 'package:flutter/material.dart';

import '../widgets/business_widgets.dart';

class BusinessProfile extends StatelessWidget {
  const BusinessProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Profile'),
      ),
      body: ListView(
        children: const [
        BusinessProfileWidget(
            businessName: 'AGRIBISNISKU',
            logo:'assets/images/logo.png',
            businessSectors: ['Pertanian', 'Peternakan','Budidaya Ikan'],
            aboutUs: 'Agrbisnisku adalah perusahaan pertanian yang berdedikasi untuk meningkatkan produktivitas dan kesejahteraan dalam sektor pertanian. Kami menyediakan produk-produk pertanian berkualitas tinggi dan solusi teknologi inovatif untuk mendukung pertanian yang berkelanjutan. Dengan fokus pada inovasi, keberlanjutan, dan pelayanan pelanggan yang unggul, Agrbisnisku bertujuan untuk menjadi mitra terpercaya bagi petani dan pemangku kepentingan dalam mencapai kesuksesan yang berkelanjutan di sektor pertanian',
            businessValue: 'Usaha kami di bidang agribisnis menyediakan solusi holistik untuk meningkatkan produktivitas dan kesejahteraan dalam sektor pertanian, peternakan, dan perikanan. Kami menawarkan teknologi terdepan, bimbingan ahli, dan produk inovatif yang dirancang untuk meningkatkan hasil pertanian, meningkatkan kualitas dan kuantitas produksi hewan ternak, serta mendukung pengelolaan yang berkelanjutan dan efisien dalam sektor perikanan. Dengan fokus pada kualitas, keberlanjutan, dan kepuasan pelanggan, kami berkomitmen untuk menjadi mitra terpercaya bagi para petani, peternak, dan nelayan, serta menyediakan solusi yang memenuhi kebutuhan pasar yang semakin kompleks dan beragam.',
          ),
        ],
      ),
    );
  }
}
