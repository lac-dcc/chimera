// This program was cloned from: https://github.com/lnls-dig/infra-cores
// License: GNU Lesser General Public License v3.0

/*******************************
 * Wishbone definitions
 *******************************/

// Wishbone Reference Clock
`define WB_CLOCK_PERIOD 10.00
`define WB_RESET_DELAY (4*`WB_CLOCK_PERIOD)
`define WB_RESET_COUNTS 6
// Wishbone Data Width
`define WB_DATA_BUS_WIDTH 32
// Wishbone Address Width
`define WB_ADDRESS_BUS_WIDTH 32
`define WB_BWSEL_WIDTH ((`WB_DATA_BUS_WIDTH + 7) / 8)
`define WB_WORD_ACC 2

/*******************************
 * ADC (FMC516) definitions
 *******************************/
`define ADC_DATA_WIDTH 16
`define DATA_TEST_WIDTH 64

/*******************************
 * General definitions
 *******************************/

// 100 MHz clock
//`define CLK_SYS_PERIOD 10.00 //ns
`define CLK_SYS_PERIOD 10000.00 //ps
// 100 MHz clock
//`define CLK_100MHZ_PERIOD 10.00 //ns
`define CLK_100MHZ_PERIOD 10000.00 //ps
// 200 MHz clock
//`define CLK_200MHZ_PERIOD 5.00 //ns
`define CLK_200MHZ_PERIOD 5000.00 //ps
// 130 MHz clock
//`define CLK_ADC_PERIOD 8.882 //ns
`define CLK_ADC_PERIOD 8882.00 //ps

// Reset Delay, in Clock Cycles
`define RST_200MHZ_DELAY 5000
`define RST_SYS_DELAY  10000 // 5000//101000 // ??? > 500 us
`define RST_ADC_DELAY  10000 // 5000//101000 // ??? > 500 us

/*******************************
 * DDR3 definitions
 *******************************/
//`define DDR_DQ_WIDTH        64
//`define DDR_PAYLOAD_WIDTH   256
//`define DDR_DQS_WIDTH       8
//`define DDR_DM_WIDTH        8
//`define DDR_ROW_WIDTH       14
//`define DDR_BANK_WIDTH      3
//`define DDR_CK_WIDTH        1
//`define DDR_CKE_WIDTH       1
//`define DDR_ODT_WIDTH       1
