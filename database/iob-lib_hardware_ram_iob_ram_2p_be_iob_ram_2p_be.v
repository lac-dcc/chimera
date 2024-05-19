// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

// 2p BRAM with Byte-wide Write Enable

`timescale 1ns/1ps

module iob_ram_2p_be
  #( 
     parameter HEXFILE = "none",
     parameter DATA_W = 0,
     parameter ADDR_W = 0
     ) 
   (
    input                   clk,

    //write port
    input [DATA_W/8-1:0]    w_en,
    input [ADDR_W-1:0]      w_addr,
    input [DATA_W-1:0]      w_data,

    //read port
    input                   r_en,
    input [ADDR_W-1:0]      r_addr,
    output reg [DATA_W-1:0] r_data
    );

   localparam COL_W = 8;
   localparam NUM_COL = DATA_W/COL_W;

`ifdef IS_CYCLONEV
   localparam file_suffix = {"7","6","5","4","3","2","1","0"};

   genvar                    i;
   generate
      for (i=0; i < NUM_COL; i=i+1) begin: ram_col
         localparam mem_init_file_int = (HEXFILE != "none")? {HEXFILE, "_", file_suffix[8*(i+1)-1 -: 8], ".hex"}: "none";

         iob_ram_2p
             #(
               .HEXFILE(mem_init_file_int),
               .ADDR_W(ADDR_W),
               .DATA_W(COL_W)
               ) ram
           (
            .clk   (clk),

            .w_en   (w_en[i]),
            .w_addr (w_addr),
            .w_data (w_data[i*COL_W +: COL_W]),
            .r_en   (r_en),
            .r_addr (r_addr),
            .r_data (r_data[i*COL_W +: COL_W])
            );
      end
   endgenerate
`else // !IS_CYCLONEV
   //this allows ISE 14.7 to work; do not remove
   localparam mem_init_file_int = HEXFILE;

   // Declare the RAM
   reg [DATA_W-1:0]         mem [(2**ADDR_W)-1:0];

   // Initialize the RAM
   initial
     if(mem_init_file_int != "none")
       $readmemh(mem_init_file_int, mem, 0, (2**ADDR_W) - 1);

   //read port
   always @(posedge clk)
      if(r_en)
        r_data <= mem[r_addr];

   //write port
   integer                   i;
   always @(posedge clk) begin
      for (i=0; i < NUM_COL; i=i+1) begin
         if (w_en[i]) begin
            mem[w_addr][i*COL_W +: COL_W] <= w_data[i*COL_W +: COL_W];
         end
      end
   end
`endif

endmodule   
