// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`ifndef __DMA_DEFINES__
`define __DMA_DEFINES__

//These don't do anything yet but in the future this could be used in
// Generate statements to procedurally generate the number of ports
`define SOURCE_COUNT                 4
`define SINK_COUNT                   4
`define INST_COUNT                   8

//Source (Channel) Configuration
`define BIT_CFG_DMA_ENABLE           0
`define BIT_CFG_SRC_ADDR_DEC         1
`define BIT_CFG_SRC_ADDR_INC         2

`define BIT_CFG_SRC_SINK_ADDR_BOT    8
`define BIT_CFG_SRC_SINK_ADDR_TOP    9

`define BIT_CFG_IP_ADDR_BOT          16
`define BIT_CFG_IP_ADDR_TOP          18


//Sink Port Configuration
`define BIT_CFG_DEST_ADDR_DEC        1
`define BIT_CFG_DEST_ADDR_INC        2
`define BIT_CFG_DEST_DATA_QUANTUM    3



//Wishbone Parses out this data for us
//Setup address
`define BIT_CMD_FLAG_TOP             15
`define BIT_CMD_FLAG_BOT             0

`define BIT_CMD_NEXT_TOP             19
`define BIT_CMD_NEXT_BOT             16

//Command Bits
`define BIT_BOND_ADDR_INGRESS_TOP    27
`define BIT_BOND_ADDR_INGRESS_BOT    24

`define BIT_BOND_ADDR_EGRESS_TOP     31
`define BIT_BOND_ADDR_EGRESS_BOT     28

//When Set, resets the address to the address in the instruction, otherwise the address is not changed
`define BIT_CMD_BOND_ADDR_TOP        15
`define BIT_CMD_BOND_ADDR_BOT        13

`define BIT_CMD_CONTINUE             11

`define BIT_CMD_EGRESS_BOND          9
`define BIT_CMD_INGRESS_BOND         8

`define BIT_CMD_DEST_ADDR_RST_ON_CMD 7
`define BIT_CMD_SRC_ADDR_RST_ON_CMD  2


//Status Bits
`define BIT_STS_SRC_STATE3           13
`define BIT_STS_SRC_STATE0           10
`define BIT_STS_SRC_READY            9
`define BIT_STS_SRC_ACTIVATE         8
`define BIT_STS_SNK_READY_HIGH       7
`define BIT_STS_SNK_READY_LOW        6
`define BIT_STS_SNK_ACTIVATE_HIGH    5
`define BIT_STS_SNK_ACTIVATE_LOW     4
`define BIT_STS_ERR_CONFLICT_SINK    3
`define BIT_STS_FIN                  2
`define BIT_STS_BUSY                 1

`endif
