//
//      verilog template for combinational design in Axiline
//

`include "ip.v"
`include "comb.v"
`include "sgd.v"
`include "pipeline_reg.v"
`include "controller.v"

module accelerator#(
    parameter bitwidth=8,
    parameter selBitwidth=1,
    parameter logNumCycle=2,
    parameter NumCycle=3,
    parameter size= 18
)(
    input [bitwidth*size-1:0]data_in_w,
    input [bitwidth*size-1:0]data_in_x,
    input [bitwidth-1:0]bias,
    input clk,
    input start,
    input rst,
	input [bitwidth-1:0]mu,
    output reg [bitwidth*size-1:0] data_out_r
);


    //********************************//
    // ip
    //********************************//
    wire [bitwidth-1:0]sum;
    //block 1
    ip #(
        .bitwidth(bitwidth),
        .size(size)
    )
    ip1(
        .x(data_in_x),
        .w(data_in_w),
        .psum(sum),
        .sel(sel[0]),
        .sum(sum)
    );


    //********************************//
    // comb
    //********************************//
    wire [bitwidth-1:0]grad;
    comb #(
        .bitwidth(bitwidth)
    )
    comb1(
        .data_in(sum),
        .bias(bias),
        .data_out(grad)
    );


    //********************************//
    // sgd
    //********************************//
    wire [bitwidth-1:0]data_out[size-1:0];
    genvar i;
    generate
        for (i=0;i<size;i=i+1)begin
            sgd #(
                .bitwidth(bitwidth)
            )
            sgd1(
                .x(data_x[bitwidth*i+bitwidth-1:bitwidth*i]),
                .w(data_w[bitwidth*i+bitwidth-1:bitwidth*i]),
                .data_in(grad),
                .mu(mu),
                .data_out(data_out[i])
            );
        end
    endgenerate


    genvar i;
    generate
        for (i=0;i<size;i=i+1)begin
            always @(posedge clk) begin
                if(~rst)begin
                 	data_out_r[i*bitwidth+bitwidth-1:i*bitwidth]<=data_out[i];
                end else begin
            		data_out_r[i*bitwidth+bitwidth-1:i*bitwidth]<=0;
        		end
            end
        end
    endgenerate

endmodule : accelerator



