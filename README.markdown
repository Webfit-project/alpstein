Alpstein : iOS map library (MapWF fork)
-----------------------------------------

Route-Me is an open source map library that runs natively on iOS.  It's designed to look and feel much like the built-in iOS map library, but it's entirely open, and works with any map source.

Currently, [OpenStreetMap][1], [OpenCycleMap][2], [OpenSeaMap][3], [MapQuest OSM][4], [MapQuest Open Aerial][5] and two offline, database-backed formats (DBMap and [MBTiles][6]) are supported as map sources.

Please note that you are responsible for getting permission to use the map data, and for ensuring your use adheres to the relevant terms of use.

   [1]: http://www.openstreetmap.org/index.html
   [2]: http://www.opencyclemap.org/
   [3]: http://www.openseamap.org/
   [4]: http://developer.mapquest.com/web/products/open/map
   [5]: http://developer.mapquest.com/web/products/open/map
   [6]: http://mbtiles.org
   [7]: https://github.com/mapbox/mapbox-ios-sdk


Installation
------------

As Route-Me is undergoing some significant changes, the recommended course of action is to clone a copy of the repository:

      git://github.com/Alpstein/route-me.git

Or, [download the trunk][dl].

Then, update the submodules (only FMDB at the moment):

      git submodule update --init

After this, copy or alias all the resources in the MapView/Map/Resources folder to your project.

See the 'samples' subdirectory for usage examples.

There are three subdirectories - MapView, Proj4, and samples. Proj4 is a support class used to do map projections. The MapView project contains only the route-me map library. "samples" contains some ready-to-build projects which you may use as starting points for your own applications, and also some engineering test cases. `samples/MarkerMurder` and `samples/ProgrammaticMap` are the best places to look, to see how to embed a Route-Me map in your application.

See LicenseRouteMe.txt for license details. In any app that uses the Route-Me library, include the following text on your "preferences" or "about" screen: "Uses Route-Me map library, (c) 2008-2012 Route-Me Contributors". Your data provider will have additional attribution requirements.


   [dl]: https://github.com/Alpstein/route-me/zipball/release
   


Major changes in this fork (Alpstein/route-me)
----------------------------------------------

* add infowindow with marker
