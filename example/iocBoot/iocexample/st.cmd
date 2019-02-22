#!../../bin/linux-x86_64/example

## You may have to change example to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/example.dbd"
example_registerRecordDeviceDriver pdbbase

#E1214 Unit (6 DI and 6 Relay)
#epicsEnvSet("IP_ADDR","192.168.200.177:502")
#epicsEnvSet("IP_PORT","m1ip")
#epicsEnvSet("PORT","m1")

#E1241 Unit (4 AO)
epicsEnvSet("IP_ADDR","192.168.200.178:502")
epicsEnvSet("IP_PORT","m2ip")
epicsEnvSet("PORT","m2")

#E1241 Unit (4 DI, 4 DIO, 4 AI)
#epicsEnvSet("IP_ADDR","192.168.200.179:502")
#epicsEnvSet("IP_PORT","m3ip")
#epicsEnvSet("PORT","m3")

< $(MOXA)/st_scripts/st_common.cmd

#asynSetTraceMask("m11w4",48,0xFF)
#asynSetTraceIOMask("m11w4",48,0xFF)

#asynSetTraceMask("m1ip",0,0xFF)
#asynSetTraceIOMask("m1ip",0,0xFF)

## Load record instances
dbLoadRecords "db/example.db"

cd "${TOP}/iocBoot/${IOC}"
iocInit



