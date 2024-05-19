// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License


`include "dma_defines.v"

module dma_prog_rom #(
  parameter ROM_SIZE    = 6
) (
  input               clk,
  input               rst,

  input       [7:0]   i_rom_addr,
  input               i_rom_wr_strobe,
  input       [31:0]  i_rom_data,
  output  reg         o_rom_data_valid,
  output      [31:0]  o_rom_data,

  output              o_src_address,
  output              o_dest_address,
  output              o_count,
  output              o_flags,
  output              o_cross_src_port
);

//Local Parameter
//Registers/Wires
//Submodules
//Asynchronous Logic
//Synchronous Logic

endmodule
