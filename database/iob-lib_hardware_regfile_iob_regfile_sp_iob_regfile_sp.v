// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1 ns / 1 ps

module iob_regfile_sp
  #(
    parameter ADDR_W = 2,
    parameter DATA_W = 32
    )
   (
    input               clk,
    input               rst,

    input               we,
    input [ADDR_W-1:0]  addr,
    input [DATA_W-1:0]  w_data,
    output [DATA_W-1:0] r_data
    );

   reg [DATA_W-1:0]     reg_file [2**ADDR_W-1:0];

   //read
   assign r_data = reg_file[addr];

   //write
   genvar               i;
   generate
      for (i=0; i < 2**ADDR_W; i=i+1) begin: register_file
         always @(posedge clk)
           if (rst)
             reg_file[i] <= {DATA_W{1'b0}};
           else if (we)
             if (addr == i)
               reg_file[i] <= w_data;
        end
   endgenerate

endmodule
