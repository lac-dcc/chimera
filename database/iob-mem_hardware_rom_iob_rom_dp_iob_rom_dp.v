// This program was cloned from: https://github.com/IObundle/iob-mem
// License: MIT License

`timescale 1 ns / 1 ps

module iob_rom_dp
  #(
    parameter HEXFILE="none",
    parameter DATA_W=32,
    parameter ADDR_W=11
    )
   (
    input                     clk,

    input [(ADDR_W-1):0]      addr_a,
    input                     r_en_a,
    output reg [(DATA_W-1):0] r_data_a,
    
    input [(ADDR_W-1):0]      addr_b,
    input                     r_en_b,
    output reg [(DATA_W-1):0] r_data_b
    );

   //this allows ISE 14.7 to work; do not remove
   localparam mem_init_file_int = HEXFILE;

   
   // Declare the ROM
   reg [DATA_W-1:0] 			       rom[2**ADDR_W-1:0];

   // Initialize the ROM
   initial 
     if(mem_init_file_int != "none")
       $readmemh(mem_init_file_int, rom, 0, 2**ADDR_W - 1);

   always @ (posedge clk) // Port A
     if (r_en_a)
       r_data_a <= rom[addr_a];

   always @ (posedge clk) // Port B
     if (r_en_b)
       r_data_b <= rom[addr_b];

 endmodule
