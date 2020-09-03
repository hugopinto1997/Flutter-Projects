import 'package:flutter/material.dart';
import 'Services.dart';
import './models/album.dart';
import './models/albums.dart';
import 'DBHelper.dart';
import 'GridCell.dart';
 
class GridViewDemo extends StatefulWidget {
  GridViewDemo() : super();
 
  final String title = "Photos";
 
  @override
  GridViewDemoState createState() => GridViewDemoState();
}
 
// Add two plugins
// One for Http and other for getting the Device Directories
// Go to pubspec.yaml file
 
// Let me show the service url we are going to use
// https://jsonplaceholder.typicode.com/photos
// In this service we have 5000 records or albums
// Let's create the model classes first.
// For that we need some plugins..let me show those...
 
// To Auto-generate Json Models, we need to create a folder named
// 'jsons' in the root of the project. You can have different name as well,
// in that case the folder name should be specified along with the command
// in the terminal...
 
// Let's create the folder first
// Now copy the json you want to create model for...
 
// We will run a command in the terminal to generate the model,
// the generated models will be inside a folder named 'models' inside the 'lib' folder.
// Let's see how to do it...
// I am already having the 'models' folder which I created for other tutorials...
 
// You can watch my other tutorial on generating json models by clicking the 'i' button above
// or the link is provided in the description
 
// Now we have the basic model
// But we have a list of Albums, so create another model
 
// Ok Now we have both models for this demo...
 
// Now we will add the Sqflite library to create an offline database
// Link to all libraries used is provided in the description below.
// Let's write the basic CRUD operations for saving the albums in the Offline Database...
 
// Now we will write the Service Class to get the Data from the service.
// Add the Http Plugin...
 
// We will use these Database functions now to do the DB operations
 
// Now we will add a progressbar while inserting the album records
 
// Seems like my system is running bit slow...Sorry for that
 
class GridViewDemoState extends State<GridViewDemo> {
  //
  int counter;
  static Albums albums;
  DBHelper dbHelper;
  bool albumsLoaded;
  String title; // Title for the AppBar where we will show the progress...
  double percent;
  GlobalKey<ScaffoldState> scaffoldKey; 
 
  @override
  void initState() {
    super.initState();
    counter = 0;
    percent = 0.0;
    title = widget.title;
    albumsLoaded = false;
    scaffoldKey = GlobalKey();
    dbHelper = DBHelper();
  }
 
  getPhotos() {
    setState(() {
      counter = 0;
      albumsLoaded = false;
    });
    Services.getPhotos().then((allAlbums) {
      albums = allAlbums;
      // Now we got all the albums from the Service...
      // We will insert each album one by one into the Database...
      // On Each load, we will truncate the table
      dbHelper.truncateTable().then((val) {
        // Write a recursive function to insert all the albums
        insert(albums.albums[0]);
      });
    });
  }
 
  insert(Album album) {
    dbHelper.save(album).then((val) {
      counter = counter + 1;
      // we are calculating the percent here on insert of each record
      percent = ((counter / albums.albums.length) * 100) /
          100; // percent from 0 to 1...
      // terminate condition for this recursive function
      if (counter >= albums.albums.length) {
        // when inserting is done
        setState(() {
          albumsLoaded = true;
          percent = 0.0;
          title = '${widget.title} [$counter]';
        });
        return;
      }
      setState(() {
        title = 'Inserting...$counter';
      });
      Album a = albums.albums[counter];
      insert(a);
    });
  }
 
  gridview(AsyncSnapshot<Albums> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: snapshot.data.albums.map((album) {
          return GridTile(
            child: AlbumCell(album, update, delete),
          );
        }).toList(),
      ),
    );
  }
 
  // Update Function
  update(Album album) {
    // We are updating the album title on each update
    dbHelper.update(album).then((updtVal) {
      showSnackBar('Updated ${album.id}');
      refresh();
    });
  }
 
  // Delete Function
  delete(int id) {
    dbHelper.delete(id).then((delVal) {
      showSnackBar('Deleted $id');
      refresh();
    });
  }
 
  // Method to refresh the List after the DB Operations
  refresh() {
    dbHelper.getAlbums().then((allAlbums) {
      setState(() {
        albums = allAlbums;
        counter = albums.albums.length;
        title = '${widget.title} [$counter]'; // updating the title
      });
    });
  }
 
  // Show a Snackbar
  showSnackBar(String message) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
 
  // We will create a GridView to show the Data...
  // Before that we will create the class from each Cell in the GridView
  // Add a Gridview to the UI
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(title),
        // Add action buttons in the AppBar
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () {
              getPhotos();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          albumsLoaded
              ? Flexible(
                  child: FutureBuilder<Albums>(
                    future: dbHelper.getAlbums(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error ${snapshot.error}');
                      }
                      if (snapshot.hasData) {
                        return gridview(snapshot);
                      }
                      // if still loading return an empty container
                      return Container();
                    },
                  ),
                )
              : LinearProgressIndicator(
                  value: percent,
                ),
        ],
      ),
    );
  }
}