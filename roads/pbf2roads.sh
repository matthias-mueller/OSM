#osmconvert sachsen-latest.osm.pbf -b=13.5,50.9,14.0,51.2 --verbose -o=dd_clip.pbf
osmconvert sachsen-latest.osm.pbf -B=clip.poly --verbose -o=dd_clip.pbf
osmconvert dd_clip.pbf >dd_clip.osm
rm dd_clip.pbf
osmfilter dd_clip.osm --keep="highway=* sidewalk=* busway=* cycleway=*" -o=dd_clip_r.osm
rm dd_clip.osm

# https://wiki.openstreetmap.org/wiki/User:Bgirardot/How_To_Convert_osm_.pbf_files_to_Esri_Shapefiles
ogr2ogr -overwrite -f "ESRI Shapefile" -lco ENCODING=UTF-8 --config OSM_CONFIG_FILE osmconf_roads.ini roads-paths_lines.shp dd_clip_r.osm -progress -sql 'select * from lines'
rm dd_clip_r.osm
