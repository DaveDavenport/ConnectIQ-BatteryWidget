## Name of output
NAME=BatteryWidget

## Input sources
SOURCES=$(wildcard source/*.mc)

## Target
DEVICE=vivoactive

## Resources file
RESOURCES=$(wildcard resources/*.xml resources/layouts/*.xml)

## Manifest
MANIFEST=manifest.xml


##
# Create command list for resources
##
empty:=
space:=$(empty) $(empty)
RESOURCES_CMD=$(subst $(space),:,${RESOURCES})

##
# Generate
##
bin/${NAME}.prg: ${SOURCES} ${RESOURCES}
	monkeyc -o $@ -d ${DEVICE} -z ${RESOURCES_CMD}  ${SOURCES}  -m ${MANIFEST}

##
# Load
##
load: bin/${NAME}.prg
	monkeydo bin/${NAME}.prg ${DEVICE} 

runsim:
	monkeysim &

clean:
	rm bin/*
