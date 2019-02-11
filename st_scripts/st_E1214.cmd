
###########################################
# Startup commands for E1214 module

# Asyn IP port 
drvAsynIPPortConfigure("$(IP_PORT)","$(IP_ADDR)",0,0,1)
        
# modbusInterposeConfig
# arg 1: portName
# arg 2: linkType
# arg 3: timeoutMsec
# arg 4: writeDelayMsec
modbusInterposeConfig("$(IP_PORT)", 0, 2000, 0)

# drvModbusAsynConfigure
# arg 1: portName
# arg 2: tcpPortName
# arg 3: slaveAddress 
# arg 4: modbusFunction 
# arg 5: modbusStartAddress 
# arg 6: modbusLength
# arg 7: default dataType
# arg 8: pollMsec 
# arg 9: plcType

DI_status:
drvModbusAsynConfigure("$(PORT)", "$(IP_PORT)", 1, 4, 0, 1, 0, 200, 0)



