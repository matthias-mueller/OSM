#osmconvert sachsen-latest.osm.pbf -b=13.5,50.9,14.0,51.2 --verbose -o=dd_clip.pbf
osmconvert sachsen-latest.osm.pbf -B=clip.poly --verbose -o=dd_clip.pbf
osmconvert dd_clip.pbf >dd_clip.osm
rm dd_clip.pbf
osmfilter dd_clip.osm --keep="building=*" --drop="building=no" -o=dd_clip_b.osm
rm dd_clip.osm
ogr2ogr --config OSM_CONFIG_FILE osmconf_buildings.ini -progress dd_clip_b.shp dd_clip_b.osm -skipfailure
rm dd_clip_b.osm
