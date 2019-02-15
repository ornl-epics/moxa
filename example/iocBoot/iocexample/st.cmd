#!../../bin/linux-x86_64/example

## You may have to change example to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/example.dbd"
example_registerRecordDeviceDriver pdbbase

epicsEnvSet("IP_ADDR","192.168.200.177:502")
epicsEnvSet("IP_PORT","m1ip")
epicsEnvSet("PORT","m1")

< $(MOXA)/st_scripts/st_common.cmd

#asynSetTraceMask("m16b1",0,0xFF)
#asynSetTraceIOMask("m16b1",0,0xFF)

#asynSetTraceMask("m1ip",0,0xFF)
#asynSetTraceIOMask("m1ip",0,0xFF)

## Load record instances
dbLoadRecords "db/example.db"

cd "${TOP}/iocBoot/${IOC}"
iocInit



