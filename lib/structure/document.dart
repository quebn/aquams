import "package:flutter/material.dart";


enum DocState {
  draft,
  submitted,
  cancelled
}

class Document {
  final String name;
  final DateTime creationDate = DateTime.now();
  final String owner;

  DocState state;
  
  Document(this.name, this.owner, this.state);
    Widget getView(){
    return ListTile(
      title: Text(name),
      subtitle: Text("Created on: ${creationDate.toString()}"),
      leading: const Icon(Icons.feed_outlined),
    );
  }

  // Submit doc.
  // Edit doc.
  // Cancel doc.
  // Save doc.
  // Delete doc.
  // Get View doc.
}
