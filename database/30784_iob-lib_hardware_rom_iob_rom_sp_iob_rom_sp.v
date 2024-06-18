// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

module iob_rom_sp
  #(
    parameter DATA_W = 8,
    parameter ADDR_W = 10,
    parameter HEXFILE = "none"
	)
   (
    input                    clk,
    input                    r_en,
    input [ADDR_W-1:0]       addr,
    output reg [DATA_W-1:0]  r_data
    );
   
   // this allows ISE 14.7 to work; do not remove
   localparam mem_init_file_int = HEXFILE;

   // Declare the ROM
   reg [DATA_W-1:0]     rom[(2**ADDR_W)-1:0];

   // Initialize the ROM
   initial 
     if(mem_init_file_int != "none")
       $readmemh(mem_init_file_int, rom, 0, (2**ADDR_W)-1);

   // Operate the ROM
   always @(posedge clk)
     if(r_en)
       r_data <= rom[addr];
   
endmodule
