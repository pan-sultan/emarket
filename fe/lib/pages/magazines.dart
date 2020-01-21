import 'package:flutter/material.dart';
import 'package:fe/drawer.dart';
import 'dart:developer';

class MagazinesPage extends StatelessWidget {
  static const String routeName = '/magazines';
  static const double RWidth = 297;
  static const double RHeight = 420;
  static const double RMargin = 5;
  static const double RPadding = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Журналы"),
      ),
      body: Scrollbar(
        child: LayoutBuilder(
          builder: _buildLayout,
        ),
      ),
    );
  }

  List<Row> _createImageList(
      int div, double maring, double padding, double height, double width) {
    var files = [
      "fe2c173cf9e04ca3fa1a4d620f9ec738151e2219ac788a2ebf9d70a0a1a7e40b.jpg",
      "fe5936aacd52cf6f7be2c6aed345c88b7dca217509db05f9fdab931421f97b8f.jpg",
      "fe70382672cd31d692cd7beb3dd8b5e5f65bf3fadcb2de23f69c754cf8ff31f5.jpeg",
      "fe728ddebe9cd70558186b4fa8a56db461aa120548e51cfe26d5b2d47708022f.jpeg",
      "fecedad2006f77143981796b352bd304ef377c70a3e72e4d08c2442ea63025d3.jpeg",
      "ff16e327e7a5b8584ddb767c2fd97a58bd6ca7bbf1855f5945c7e93503e1012c.jpeg",
      "ff2f19cd971f19b08d6d03031870f8b6b69f8306ad49910e9ca3686a85fcd104.jpeg",
      "fae6f021081e7aca7228e6c6a9fd09cc5c499905315a269d8c95f5380a06fceb.jpeg",
      "fab704770c5eca9a678aa0cbafa339772e13f36c1beffd0982b931a7d4771a77.jpg",
      "fab30932aa4ea2d6f6478f41099436f35165cbe0327645ada85cd17af0dd72e2.jpeg",
      "fe2c173cf9e04ca3fa1a4d620f9ec738151e2219ac788a2ebf9d70a0a1a7e40b.jpg",
      "fe5936aacd52cf6f7be2c6aed345c88b7dca217509db05f9fdab931421f97b8f.jpg",
      "fe70382672cd31d692cd7beb3dd8b5e5f65bf3fadcb2de23f69c754cf8ff31f5.jpeg",
      "fe728ddebe9cd70558186b4fa8a56db461aa120548e51cfe26d5b2d47708022f.jpeg",
      "fecedad2006f77143981796b352bd304ef377c70a3e72e4d08c2442ea63025d3.jpeg",
      "ff16e327e7a5b8584ddb767c2fd97a58bd6ca7bbf1855f5945c7e93503e1012c.jpeg",
      "ff2f19cd971f19b08d6d03031870f8b6b69f8306ad49910e9ca3686a85fcd104.jpeg",
      "fae6f021081e7aca7228e6c6a9fd09cc5c499905315a269d8c95f5380a06fceb.jpeg",
      "fab704770c5eca9a678aa0cbafa339772e13f36c1beffd0982b931a7d4771a77.jpg",
      "fab30932aa4ea2d6f6478f41099436f35165cbe0327645ada85cd17af0dd72e2.jpeg",
      "fe2c173cf9e04ca3fa1a4d620f9ec738151e2219ac788a2ebf9d70a0a1a7e40b.jpg",
      "fe5936aacd52cf6f7be2c6aed345c88b7dca217509db05f9fdab931421f97b8f.jpg",
      "fe70382672cd31d692cd7beb3dd8b5e5f65bf3fadcb2de23f69c754cf8ff31f5.jpeg",
      "fe728ddebe9cd70558186b4fa8a56db461aa120548e51cfe26d5b2d47708022f.jpeg",
      "fecedad2006f77143981796b352bd304ef377c70a3e72e4d08c2442ea63025d3.jpeg",
      "ff16e327e7a5b8584ddb767c2fd97a58bd6ca7bbf1855f5945c7e93503e1012c.jpeg",
      "ff2f19cd971f19b08d6d03031870f8b6b69f8306ad49910e9ca3686a85fcd104.jpeg",
      "fae6f021081e7aca7228e6c6a9fd09cc5c499905315a269d8c95f5380a06fceb.jpeg",
      "fab704770c5eca9a678aa0cbafa339772e13f36c1beffd0982b931a7d4771a77.jpg",
      "fab30932aa4ea2d6f6478f41099436f35165cbe0327645ada85cd17af0dd72e2.jpeg",
      "fe2c173cf9e04ca3fa1a4d620f9ec738151e2219ac788a2ebf9d70a0a1a7e40b.jpg",
      "fe5936aacd52cf6f7be2c6aed345c88b7dca217509db05f9fdab931421f97b8f.jpg",
      "fe70382672cd31d692cd7beb3dd8b5e5f65bf3fadcb2de23f69c754cf8ff31f5.jpeg",
      "fe728ddebe9cd70558186b4fa8a56db461aa120548e51cfe26d5b2d47708022f.jpeg",
      "fecedad2006f77143981796b352bd304ef377c70a3e72e4d08c2442ea63025d3.jpeg",
      "ff16e327e7a5b8584ddb767c2fd97a58bd6ca7bbf1855f5945c7e93503e1012c.jpeg",
      "ff2f19cd971f19b08d6d03031870f8b6b69f8306ad49910e9ca3686a85fcd104.jpeg",
      "fae6f021081e7aca7228e6c6a9fd09cc5c499905315a269d8c95f5380a06fceb.jpeg",
      "fab704770c5eca9a678aa0cbafa339772e13f36c1beffd0982b931a7d4771a77.jpg",
      "fab30932aa4ea2d6f6478f41099436f35165cbe0327645ada85cd17af0dd72e2.jpeg",
      "fe2c173cf9e04ca3fa1a4d620f9ec738151e2219ac788a2ebf9d70a0a1a7e40b.jpg",
      "fe5936aacd52cf6f7be2c6aed345c88b7dca217509db05f9fdab931421f97b8f.jpg",
      "fe70382672cd31d692cd7beb3dd8b5e5f65bf3fadcb2de23f69c754cf8ff31f5.jpeg",
      "fe728ddebe9cd70558186b4fa8a56db461aa120548e51cfe26d5b2d47708022f.jpeg",
      "fecedad2006f77143981796b352bd304ef377c70a3e72e4d08c2442ea63025d3.jpeg",
      "ff16e327e7a5b8584ddb767c2fd97a58bd6ca7bbf1855f5945c7e93503e1012c.jpeg",
      "ff2f19cd971f19b08d6d03031870f8b6b69f8306ad49910e9ca3686a85fcd104.jpeg",
      "fae6f021081e7aca7228e6c6a9fd09cc5c499905315a269d8c95f5380a06fceb.jpeg",
      "fab704770c5eca9a678aa0cbafa339772e13f36c1beffd0982b931a7d4771a77.jpg",
      "fab30932aa4ea2d6f6478f41099436f35165cbe0327645ada85cd17af0dd72e2.jpeg",
      "fe2c173cf9e04ca3fa1a4d620f9ec738151e2219ac788a2ebf9d70a0a1a7e40b.jpg",
      "fe5936aacd52cf6f7be2c6aed345c88b7dca217509db05f9fdab931421f97b8f.jpg",
      "fe70382672cd31d692cd7beb3dd8b5e5f65bf3fadcb2de23f69c754cf8ff31f5.jpeg",
      "fe728ddebe9cd70558186b4fa8a56db461aa120548e51cfe26d5b2d47708022f.jpeg",
      "fecedad2006f77143981796b352bd304ef377c70a3e72e4d08c2442ea63025d3.jpeg",
      "ff16e327e7a5b8584ddb767c2fd97a58bd6ca7bbf1855f5945c7e93503e1012c.jpeg",
      "ff2f19cd971f19b08d6d03031870f8b6b69f8306ad49910e9ca3686a85fcd104.jpeg",
      "fae6f021081e7aca7228e6c6a9fd09cc5c499905315a269d8c95f5380a06fceb.jpeg",
      "fab704770c5eca9a678aa0cbafa339772e13f36c1beffd0982b931a7d4771a77.jpg",
      "fab30932aa4ea2d6f6478f41099436f35165cbe0327645ada85cd17af0dd72e2.jpeg",
      "fe2c173cf9e04ca3fa1a4d620f9ec738151e2219ac788a2ebf9d70a0a1a7e40b.jpg",
      "fe5936aacd52cf6f7be2c6aed345c88b7dca217509db05f9fdab931421f97b8f.jpg",
      "fe70382672cd31d692cd7beb3dd8b5e5f65bf3fadcb2de23f69c754cf8ff31f5.jpeg",
      "fe728ddebe9cd70558186b4fa8a56db461aa120548e51cfe26d5b2d47708022f.jpeg",
      "fecedad2006f77143981796b352bd304ef377c70a3e72e4d08c2442ea63025d3.jpeg",
      "ff16e327e7a5b8584ddb767c2fd97a58bd6ca7bbf1855f5945c7e93503e1012c.jpeg",
      "ff2f19cd971f19b08d6d03031870f8b6b69f8306ad49910e9ca3686a85fcd104.jpeg",
      "fae6f021081e7aca7228e6c6a9fd09cc5c499905315a269d8c95f5380a06fceb.jpeg",
      "fab704770c5eca9a678aa0cbafa339772e13f36c1beffd0982b931a7d4771a77.jpg",
      "fab30932aa4ea2d6f6478f41099436f35165cbe0327645ada85cd17af0dd72e2.jpeg",
      "fe2c173cf9e04ca3fa1a4d620f9ec738151e2219ac788a2ebf9d70a0a1a7e40b.jpg",
      "fe5936aacd52cf6f7be2c6aed345c88b7dca217509db05f9fdab931421f97b8f.jpg",
      "fe70382672cd31d692cd7beb3dd8b5e5f65bf3fadcb2de23f69c754cf8ff31f5.jpeg",
      "fe728ddebe9cd70558186b4fa8a56db461aa120548e51cfe26d5b2d47708022f.jpeg",
      "fecedad2006f77143981796b352bd304ef377c70a3e72e4d08c2442ea63025d3.jpeg",
      "ff16e327e7a5b8584ddb767c2fd97a58bd6ca7bbf1855f5945c7e93503e1012c.jpeg",
      "ff2f19cd971f19b08d6d03031870f8b6b69f8306ad49910e9ca3686a85fcd104.jpeg",
      "fae6f021081e7aca7228e6c6a9fd09cc5c499905315a269d8c95f5380a06fceb.jpeg",
      "fab704770c5eca9a678aa0cbafa339772e13f36c1beffd0982b931a7d4771a77.jpg",
      "fab30932aa4ea2d6f6478f41099436f35165cbe0327645ada85cd17af0dd72e2.jpeg",
      "fe2c173cf9e04ca3fa1a4d620f9ec738151e2219ac788a2ebf9d70a0a1a7e40b.jpg",
      "fe5936aacd52cf6f7be2c6aed345c88b7dca217509db05f9fdab931421f97b8f.jpg",
      "fe70382672cd31d692cd7beb3dd8b5e5f65bf3fadcb2de23f69c754cf8ff31f5.jpeg",
      "fe728ddebe9cd70558186b4fa8a56db461aa120548e51cfe26d5b2d47708022f.jpeg",
      "fecedad2006f77143981796b352bd304ef377c70a3e72e4d08c2442ea63025d3.jpeg",
      "ff16e327e7a5b8584ddb767c2fd97a58bd6ca7bbf1855f5945c7e93503e1012c.jpeg",
      "ff2f19cd971f19b08d6d03031870f8b6b69f8306ad49910e9ca3686a85fcd104.jpeg",
      "fae6f021081e7aca7228e6c6a9fd09cc5c499905315a269d8c95f5380a06fceb.jpeg",
      "fab704770c5eca9a678aa0cbafa339772e13f36c1beffd0982b931a7d4771a77.jpg",
      "fab30932aa4ea2d6f6478f41099436f35165cbe0327645ada85cd17af0dd72e2.jpeg",
      "fe2c173cf9e04ca3fa1a4d620f9ec738151e2219ac788a2ebf9d70a0a1a7e40b.jpg",
    ];
    var images = List<Row>();
    for (var i = 0; i < files.length; i++) {
      if ((i % div) == 0) {
        images.add(Row(
          children: <Widget>[],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ));
      }
      images.last.children.add(
        Container(
          child: Card(
            child: Image.network(
              "http://localhost:8080/static/gallery/" + files[i],
              fit: BoxFit.fill,
            ),
          ),
          width: RWidth,
          height: RHeight,
          margin: const EdgeInsets.all(RMargin),
          padding: const EdgeInsets.all(RPadding),
        ),
      );
    }
    return images;
  }

  Widget _buildLayout(BuildContext context, BoxConstraints constraints) {
    int maxImages =
        (constraints.maxWidth / (2 * RMargin + 2 * RPadding + RWidth) - 0.5)
            .round();
    if (maxImages == 0) {
      maxImages = 1;
    }
    return ListView(
      children: _createImageList(maxImages, RMargin, RPadding, RHeight, RWidth),
    );
  }
}
