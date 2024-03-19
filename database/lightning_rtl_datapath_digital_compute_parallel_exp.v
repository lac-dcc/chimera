// Language: Verilog 2001

// Computes exp of each element of the input vector
// Uses one instantiation of "exp" for each element of the vector
// Nonblocking
// Latency 1

`resetall
`timescale 1ns / 1ps
`default_nettype none

 (* KEEP_HIERARCHY = "YES" *) module parallel_exp #(
    parameter VECTOR_WIDTH = 160,
    parameter DATA_WIDTH = 16
)(
    input wire clk,
    input wire rst,

    input wire [VECTOR_WIDTH-1:0] input_tdata,
    input wire input_tvalid,

    output wire [VECTOR_WIDTH-1:0] output_tdata,
    output wire output_tvalid
);

   localparam  ELEMENTS_PER_VECTOR = VECTOR_WIDTH / DATA_WIDTH;

   wire [ELEMENTS_PER_VECTOR-1:0] exp_tvalid;

   assign output_tvalid = exp_tvalid[0];

   genvar      i;
   generate
      for (i = 0; i < ELEMENTS_PER_VECTOR; i = i + 1) begin
         exp #(
         .DATA_WIDTH(DATA_WIDTH)
         ) exp_inst (
            .clk(clk),
            .rst(rst),
            .input_tdata(input_tdata[i*DATA_WIDTH +: DATA_WIDTH]),
            .input_tvalid(input_tvalid),
            .input_tlast(),

            .output_tdata(output_tdata[i*DATA_WIDTH +: DATA_WIDTH]),
            .output_tvalid(exp_tvalid[i]),
            .output_tlast()
         );
      end

   endgenerate

endmodule

`resetall
