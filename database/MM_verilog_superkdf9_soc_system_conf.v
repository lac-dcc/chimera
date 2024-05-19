// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense

`define LATTICE_FAMILY "EC"
`define LATTICE_FAMILY_EC
`define LATTICE_DEVICE "All"

`ifndef SYSTEM_CONF
`define SYSTEM_CONF

`define CFG_EBA_RESET 32'h0
`define CFG_PL_MULTIPLY_ENABLED
`define CFG_PL_BARREL_SHIFT_ENABLED
`define CFG_IROM_ENABLED
`define CFG_IROM_EXPOSE
`define CFG_IROM_BASE_ADDRESS 32'h0000
`define CFG_IROM_LIMIT 32'h3fff
`define CFG_IROM_INIT_FILE_FORMAT "hex"
`define CFG_IROM_INIT_FILE "none"
`define CFG_DRAM_ENABLED
`define CFG_DRAM_EXPOSE
`define CFG_DRAM_BASE_ADDRESS 32'h4000

`define CFG_DRAM_LIMIT 32'h7FFF
// Don't forget update mm.bmm file

`define CFG_DRAM_INIT_FILE_FORMAT "hex"
`define CFG_DRAM_INIT_FILE "none"
`define CFG_USER_ENABLED

`define RXRDY_ENABLE
`define TXRDY_ENABLE

`endif
