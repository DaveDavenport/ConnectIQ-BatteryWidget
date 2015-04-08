NAME=BatteryWidget
SOURCES=$(wildcard source/*.mc)
DEVICE=vivoactive
RESOURCES=$(wildcard resources/*.xml resources/layouts/*.xml)
MANIFEST=manifest.xml


##
# Create command list for resources
##
empty:=
space:=$(empty) $(empty)
RESOURCES_CMD=$(subst $(space),:,${RESOURCES})

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
