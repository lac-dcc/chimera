// This program was cloned from: https://github.com/IObundle/iob-mem
// License: MIT License

// Single-Port BRAM with Byte-wide Write Enable
// Read-First mode

`timescale 1 ns / 1 ps

module iob_ram_sp_be
  #(
    parameter HEXFILE="none",
    parameter ADDR_W = 10, // Addr Width in bits : 2*ADDR_W = RAM Depth
    parameter DATA_W = 32  // Data Width in bits
    ) 
   ( 
     input                clk,
     input                en,
     input [DATA_W/8-1:0] we,
     input [ADDR_W-1:0]   addr,
     input [DATA_W-1:0]   din,
     output [DATA_W-1:0]  dout
     );

   localparam COL_W = 8;
   localparam NUM_COL = DATA_W/COL_W;

   // Operation
`ifdef IS_CYCLONEV
   localparam file_suffix = {"7","6","5","4","3","2","1","0"};

   genvar                     i;
   generate
      for (i=0; i < NUM_COL; i=i+1) begin: ram_col
         localparam mem_init_file_int = (HEXFILE != "none")? {HEXFILE, "_", file_suffix[8*(i+1)-1 -: 8], ".hex"}: "none";

         iob_ram_sp
             #(
               .HEXFILE(mem_init_file_int),
               .ADDR_W(ADDR_W),
               .DATA_W(COL_W)
               ) ram
           (
            .clk  (clk),

            .en   (en),
            .addr (addr),
            .din  (din[i*COL_W +: COL_W]),
            .we   (we[i]),
            .dout (dout[i*COL_W +: COL_W])
            );
      end
   endgenerate
`else // !IS_CYCLONEV
   // this allows ISE 14.7 to work; do not remove
   localparam mem_init_file_int = {HEXFILE, ".hex"};

   // Core Memory
   reg [DATA_W-1:0]       ram_block[(2**ADDR_W)-1:0];

   // Initialize the RAM
   initial
     if(mem_init_file_int != "none.hex")
       $readmemh(mem_init_file_int, ram_block, 0, 2**ADDR_W - 1);

   reg [DATA_W-1:0]       dout_int;
   integer                    i;
   always @ (posedge clk) begin
      if(en) begin
         for(i=0; i < NUM_COL; i=i+1) begin
            if(we[i]) begin
               ram_block[addr][i*COL_W +: COL_W] <= din[i*COL_W +: COL_W];
            end
         end
         dout_int <= ram_block[addr]; // Send Feedback
      end
   end

   assign dout = dout_int;
`endif

endmodule
