import 'package:flutter/material.dart';

import './section_outline_tiles.dart';

class EntitiesShowDrawer extends StatelessWidget {
  final Map entity;
  final int currentSectionId; // may be 0, for the main(lead) section

  EntitiesShowDrawer({ Key key, this.entity, this.currentSectionId }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    // header
    widgets.add(const DrawerHeader(child: const Center(child: const Text('Wiki Flutter')))); // TODO image

    // home
    // TODO ontap
    widgets.add(
      const ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Home'),
      )
    );
    widgets.add( const Divider() );

    // sections outline
    if (entity != null && ( entity['lead']['sections'] as List ).length > 1 ){
      widgets.add(
        const ListTile(
          leading: const Icon(Icons.list),
          title: const Text('sections outline'),
        )
      );
      widgets.addAll(sectionOutlineTiles(entity, rootSectionId: 0, selectedSectionId: currentSectionId, showMainSection: true));
    }

    return new Drawer(
      child: new ListView(
        children: widgets
      )
    );
  }

}
