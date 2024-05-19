// This program was cloned from: https://github.com/IObundle/iob-mem
// License: MIT License

`timescale 1 ns / 1 ps

module iob_regfile_dp
  #(
    parameter ADDR_W = 2,
    parameter DATA_W = 32
    )
   (
    input                clk,
    input                rst,

    // Port A
    input                weA,
    input [ADDR_W-1:0]   addrA,
    input [DATA_W-1:0]   wdataA,
    output [DATA_W-1 :0] rdataA,

    // Port B
    input                weB,
    input [ADDR_W-1:0]   addrB,
    input [DATA_W-1:0]   wdataB,
    output [DATA_W-1 :0] rdataB
    );

   reg [DATA_W-1:0]      reg_file [2**ADDR_W-1:0];

   wire [ADDR_W-1:0]     addr  = weA? addrA : addrB;
   wire [DATA_W-1:0]     wdata = weA? wdataA : wdataB;
   wire                  we    = weA? weA : weB;

   //read
   assign rdataA = reg_file[addrA];
   assign rdataB = reg_file[addrB];

   //write
   genvar                i;
   generate
      for (i=0; i < 2**ADDR_W; i=i+1) begin: register_file
         always @(posedge clk)
           if (rst)
             reg_file[i] <= {DATA_W{1'b0}};
           else if (we)
             if (addr == i)
               reg_file[i] <= wdata;
        end
   endgenerate

endmodule
