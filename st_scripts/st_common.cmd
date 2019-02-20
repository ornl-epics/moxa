
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

# Use separate asyn ports for each length of read. The device gives us a modbus error
# if we try to readout outside of the defined address space, but the information
# isn't nicely ordered in address space so we need to cherry pick different locations
# by using absolute addressing mode.

# We don't define the modbus data types here (default to 0). 
# Define these in the record INP or OUT fields instead.

# Ports used for reading. The port names have some structure to them:
#  The number after the base PORT name is the number of bits or words
#  The following letter defines the type (w=word, b=bit)
#  The final number is the modbus function code
drvModbusAsynConfigure("$(PORT)1w4",  "$(IP_PORT)", 1, 4, -1, 1,  0, 1000, 0) 
drvModbusAsynConfigure("$(PORT)2w4",  "$(IP_PORT)", 1, 4, -1, 2,  0, 1000, 0) 
drvModbusAsynConfigure("$(PORT)3w4",  "$(IP_PORT)", 1, 4, -1, 3,  0, 1000, 0)
drvModbusAsynConfigure("$(PORT)4w4",  "$(IP_PORT)", 1, 4, -1, 4,  0, 1000, 0)
drvModbusAsynConfigure("$(PORT)10w4", "$(IP_PORT)", 1, 4, -1, 10, 0, 1000, 0)
drvModbusAsynConfigure("$(PORT)12w4", "$(IP_PORT)", 1, 4, -1, 12, 0, 1000, 0)
drvModbusAsynConfigure("$(PORT)30w4", "$(IP_PORT)", 1, 4, -1, 30, 0, 1000, 0)
drvModbusAsynConfigure("$(PORT)1w3",  "$(IP_PORT)", 1, 3, -1, 1,  0, 1000, 0) 
drvModbusAsynConfigure("$(PORT)4w3",  "$(IP_PORT)", 1, 3, -1, 4,  0, 1000, 0) 
 
drvModbusAsynConfigure("$(PORT)1b1",  "$(IP_PORT)", 1, 1, -1, 1,  0, 1000, 0) 

# Ports used for writing. Same syntax for port name.
drvModbusAsynConfigure("$(PORT)1b5",  "$(IP_PORT)", 1, 5, -1, 1,  0, 1000, 0) 
drvModbusAsynConfigure("$(PORT)1w6",  "$(IP_PORT)", 1, 6, -1, 1,  0, 1000, 0) 

epicsThreadSleep(1)
