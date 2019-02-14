
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

# DI Read:
#drvModbusAsynConfigure("$(PORT)dir", "$(IP_PORT)", 1, 4, 48, 1, 0, 200, 0)

# Relay Read/Write:
#drvModbusAsynConfigure("$(PORT)rr", "$(IP_PORT)", 1, 4, 32, 1, 0, 200, 0)
#drvModbusAsynConfigure("$(PORT)rw", "$(IP_PORT)", 1, 1, 0,  6, 0, 200, 0)

# Device Information (used to read strings once at startup using waveforms)
# Use absolute addressing for this so we are not polling
drvModbusAsynConfigure("$(PORT)info", "$(IP_PORT)", 1, 4, -1, 3, 0, 200, 0)

# Use separate asyn ports for each length of read. The device gives us a modbus error
# if we try to readout outside of the defined address space, but the information
# isn't nicely ordered in address space so we need to cherry pick different locations
# by using absolute addressing mode.

# We don't define the modbus data types here (default to 0). 
# Define these in the record INP or OUT fields instead.

# Ports used for reading
drvModbusAsynConfigure("$(PORT)2w",  "$(IP_PORT)", 1, 4, -1, 2,  0, 1000, 0) 
drvModbusAsynConfigure("$(PORT)3w",  "$(IP_PORT)", 1, 4, -1, 3,  0, 1000, 0)
drvModbusAsynConfigure("$(PORT)10w", "$(IP_PORT)", 1, 4, -1, 10, 0, 1000, 0)
drvModbusAsynConfigure("$(PORT)30w", "$(IP_PORT)", 1, 4, -1, 30, 0, 1000, 0)
