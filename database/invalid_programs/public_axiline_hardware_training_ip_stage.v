// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

//
//      verilog template for inner product in Axiline
//
`include "config.vh"
`include "ip.v"
module ip_stage #(
    parameter bitwidth =16,
	parameter inputBitwidth=8,
    parameter size=8,
    parameter stage=0
)(
    input[inputBitwidth*size-1:0] x,
    input[bitwidth*size-1:0] w,
	input clk,
	input rst,
    input sel,
    output reg [bitwidth-1:0]sum_r
);
    
    //combinational ip
    wire [bitwidth-1:0]ip_sum;
    ip #(
        .bitwidth(bitwidth),
		.inputBitwidth(inputBitwidth),
        .size(size)
    )
    unit(
        .x(x),
        .w(w),
        .sum(ip_sum)
    );

    //pipeline registers
    wire [bitwidth-1:0]pipe_sum;
    pipeline_reg #(
        .bitwidth(bitwidth),
        .num_stage(stage)
    )
    pipe_reg_y(
        .clk(clk),
        .rst(rst),
        .data_in(ip_sum),
        .data_out(pipe_sum)
    );

    //feedback loop
    wire [bitwidth-1:0]sum_c;
    assign sum_c=sel?(pipe_sum+sum_r):(pipe_sum);
    always @(posedge clk or posedge rst) begin
        if (rst) sum_r<=0;
        else sum_r<=sum_c;
    end

endmodule
