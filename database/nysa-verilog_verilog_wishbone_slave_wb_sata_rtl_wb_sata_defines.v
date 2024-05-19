// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`ifndef __wb_sata_defines__
`define __wb_sata_defines__

`define BIT_HD_COMMAND_RESET            0
`define BIT_EN_INT_HD_INTERRUPT         2
`define BIT_EN_INT_DMA_ACTIVATE_STB     3
`define BIT_EN_INT_D2H_REG_STB          4
`define BIT_EN_INT_PIO_SETUP_STB        5
`define BIT_EN_INT_D2H_DATA_STB         6
`define BIT_EN_INT_DMA_SETUP_STB        7
`define BIT_EN_INT_SET_DEVICE_BITS_STB  9
`define BIT_HD_RESET                    10
`define BIT_EN_DMA_CONTROL              11
`define BIT_STB_WRITE_LOCAL_BUFFER      12
`define BIT_STB_WRITE                   13
`define BIT_STB_READ                    14
`define BIT_STB_SYNC_ESCAPE             15

//Status
`define BIT_PLATFORM_READY              0
`define BIT_PLATFORM_ERROR              1
`define BIT_LINKUP                      2
`define BIT_COMMAND_LAYER_READY         3
`define BIT_SATA_BUSY                   4
`define BIT_PHY_READY                   5
`define BIT_LINK_LAYER_READY            6
`define BIT_TRANSPORT_LAYER_READY       7
`define BIT_HARD_DRIVE_ERROR            8
`define BIT_PIO_DATA_READY              9
`define BIT_RESET_ACTIVE                10
`define BIT_RX_COMM_INIT_DETECT         11
`define BIT_RX_COMM_WAKE_DETECT         12
`define BIT_TX_COMM_RESET               13
`define BIT_TX_COMM_WAKE                14
`define BIT_TX_OOB_COMPLETE             15
`define BIT_DIN_FIFO_READY0             16
`define BIT_DIN_FIFO_READY1             17

//Hard Drive Status
`define BIT_D2H_INTERRUPT               0
`define BIT_D2H_NOTIFICATION            1
`define BIT_D2H_PMULT_LOW               4
`define BIT_D2H_PMULT_HIGH              7
`define BIT_D2H_FIS_LOW                 8
`define BIT_D2H_FIS_HIGH                15
`define BIT_D2H_STATUS_LOW              16
`define BIT_D2H_STATUS_HIGH             23
`define BIT_D2H_ERROR_LOW               24
`define BIT_D2H_ERROR_HIGH              31

`define BIT_OOB_STATE_HIGH              3
`define BIT_OOB_STATE_LOW               0
`define BIT_RESET_COUNT_HIGH            11
`define BIT_RESET_COUNT_LOW             4
`define BIT_D2H_INTERRUPT_EN            12
`define BIT_DMA_ACTIVATE_EN             13
`define BIT_D2H_PIO_SETUP_EN            14
`define BIT_D2H_DATA_EN                 15
`define BIT_DMA_SETUP_EN                16
`define BIT_CMD_WR_ST_HIGH              31
`define BIT_CMD_WR_ST_LOW               28
`define BIT_TRSPRT_HIGH                 27
`define BIT_TRSPRT_LOW                  24
`define BIT_LLW_ST_HIGH                 23
`define BIT_LLW_ST_LOW                  20

`define BIT_ACTIVATE_COUNT_HIGH         23
`define BIT_ACTIVATE_COUNT_LOW          16
`define BIT_ROK_COUNT_HIGH              15
`define BIT_ROK_COUNT_LOW               8
`define BIT_RERR_COUNT_HIGH             7
`define BIT_RERR_COUNT_LOW              0


//Local BUffer
`define SATA_BUFFER_OFFSET              256
`define SATA_BUFFER_WIDTH               11
`define SATA_BUFFER_SIZE                (1 << (`SATA_BUFFER_WIDTH))
//`define SATA_BUFFER_SIZE                2048


`define READ_DMA_EXT                    8'h25
`define WRITE_DMA_EXT                   8'h35

`endif
