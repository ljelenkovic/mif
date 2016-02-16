#!/bin/bash

# directories
DEMOHOME=../${0%/*}
REPOROOT=$DEMOHOME/../..
TMPDIR=$DEMOHOME/__mif_cache__
TESTAPPS=$REPOROOT/testapps

# compile apps
( cd $TESTAPPS && make > /dev/null 2>&1 )

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Running: pvd_list"
$TESTAPPS/pvd_list

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Running: pvd_get_by_id f037ea62-ee4f-44e4-825c-16f2f5cc9b3f"
$TESTAPPS/pvd_get_by_id "f037ea62-ee4f-44e4-825c-16f2f5cc9b3f"

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Running: pvd_get_by_properties {\"pricing\": \"free\"}"
$TESTAPPS/pvd_get_by_properties "{\"pricing\": \"free\"}"

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Running: pvd_run f037ea62-ee4f-44e4-825c-16f2f5cc9b3f ip netns identify"
$TESTAPPS/pvd_run f037ea62-ee4f-44e4-825c-16f2f5cc9b3f ip netns identify

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo Running: pvd_run f037ea62-ee4f-44e4-825c-16f2f5cc9b3f ip a
$TESTAPPS/pvd_run f037ea62-ee4f-44e4-825c-16f2f5cc9b3f ip a

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo Running: pvd_prop_run "{\"type\": \"internet\", \"pricing\": \"free\"}" wget http://[2001:db8:10::2] -P $TMPDIR
$TESTAPPS/pvd_prop_run "{\"type\": \"internet\", \"pricing\": \"free\"}" wget http://[2001:db8:10::2] -P $TMPDIR

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo Running: pvd_prop_run "{\"type\": \"internet\", \"pricing\": \"free\"}" wget http://www.pvd1.org -P $TMPDIR
$TESTAPPS/pvd_prop_run "{\"type\": \"internet\", \"pricing\": \"free\"}" wget http://www.pvd1.org -P $TMPDIR
