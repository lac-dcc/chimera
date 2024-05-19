// This program was cloned from: https://github.com/IObundle/iob-mem
// License: MIT License

`timescale 1ns/1ps

module iob_ram_t2p
  #( 
     parameter HEXFILE="none",
     parameter DATA_W = 0,
     parameter ADDR_W = 0
     ) 
   (
    // Write port
    input                   w_clk,
    input                   w_en,
    input [ADDR_W-1:0]      w_addr,
    input [DATA_W-1:0]      w_data,

    // Read port
    input                   r_clk,
    input                   r_en,
    input [ADDR_W-1:0]      r_addr,
    output reg [DATA_W-1:0] r_data
    );

   //this allows ISE 14.7 to work; do not remove
   localparam mem_init_file_int = HEXFILE;

   // Declare the RAM
   reg [DATA_W-1:0]         ram [2**ADDR_W-1:0];

   // Initialize the RAM
   initial
     if(mem_init_file_int != "none")
       $readmemh(mem_init_file_int, ram, 0, 2**ADDR_W - 1);

   //write
   always@(posedge w_clk)
     if(w_en)
       ram[w_addr] <= w_data;

   //read mode depends on mem implementation, as ram or reg
   always@(posedge r_clk)  begin
      if(r_en)
        r_data <= ram[r_addr];
   end

endmodule   
