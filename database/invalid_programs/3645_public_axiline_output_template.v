// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

//
//      verilog template for pipeline stages in Axiline
//

`include "ip.v"
`include "comb.v"
`include "sgd.v"
`include "pipeline_reg.v"
`include "controller.v"

module accelerator#(
    parameter bitwidth=16,
    parameter selBitwidth=1,
    parameter logNumCycle=3,
    parameter NumCycle=8,

    parameter size= 4

)(
    input [bitwidth-1:0]data_in_w_0,
    input [bitwidth-1:0]data_in_w_1,
    input [bitwidth-1:0]data_in_w_2,
    input [bitwidth-1:0]data_in_w_3,

    input [bitwidth-1:0]data_in_x_0,
    input [bitwidth-1:0]data_in_x_1,
    input [bitwidth-1:0]data_in_x_2,
    input [bitwidth-1:0]data_in_x_3,

    input [bitwidth-1:0]bias,
    input clk,
    input start,
    input rst,
    output reg [bitwidth-1:0] grad_r
);
    // controller
    wire [selBitwidth-1:0]sel;

    controller #(
        .logNumCycle(logNumCycle),
        .NumCycle(NumCycle)
    )
    bm_controller(
        .clk(clk),
        .start(start),
        .rst(rst),
        .sel(sel)
    );

    //********************************//
    // pipeline stage #1
    //********************************//
    wire [bitwidth-1:0]sum_r;
    reg [bitwidth-1:0]sum;
    //block 1
    ip #(
        .bitwidth(bitwidth)
    )
    ip1(
        .x_0(data_in_x_0),
        .x_1(data_in_x_1),
        .x_2(data_in_x_2),
        .x_3(data_in_x_3),

        .w_0(data_in_w_0),
        .w_1(data_in_w_1),
        .w_2(data_in_w_2),
        .w_3(data_in_w_3),

        .psum(sum_r),
        .sel(sel[0]),
        .sum(sum)
    );
    always @(posedge clk) begin
        if (rst) sum_r<=0;
        else sum_r<=sum;
    end

    // pipeline registers for stage # 2

    // pipeline reg for bias
    wire [bitwidth-1:0] bias_r;
    pipe_reg #(
        .bitwidth(bitwidth),
        .pipe(NumCycle)
    )
    pipe_reg_y(
        .clk(clk),
        .rst(rst),
        .data_in(bias),
        .data_out(bias_r)
    );


    //********************************//
    // pipeline stage #2
    //********************************//
    wire valid;
    wire [bitwidth-1:0]grad;
    reg [bitwidth-1:0]grad_r;
    assign valid=~sel[0];
    comb #(
        .bitwidth(bitwidth)
    )
    comb1(
        .data_in(sum),
        .bias(bias_r),
        .valid(valid),
        .data_out(grad)
    );
    always @(posedge clk) begin
        if (rst) grad_r<=0;
        else if (valid)grad_r<=grad;
        else grad_r<=grad_r;
    end

    // pipeline registers for stage 3

    // pipeline reg for weight
    wire [bitwidth*size-1:0]data_w,data_w_r;
    assign data_w[bitwidth*0+bitwidth-1:bitwidth*0]=data_in_w_0;
    assign data_w[bitwidth*1+bitwidth-1:bitwidth*1]=data_in_w_1;
    assign data_w[bitwidth*2+bitwidth-1:bitwidth*2]=data_in_w_2;
    assign data_w[bitwidth*3+bitwidth-1:bitwidth*3]=data_in_w_3;


    pipe_reg #(
        .bitwidth(bitwidth*size),
        .pipe(NumCycle+1)
    )
    pipe_reg_w(
        .clk(clk),
        .rst(rst),
        .data_in(data_w),
        .data_out(data_w_r)
    );

    // pipeline reg for activation
    wire [bitwidth*size-1:0]data_x,data_x_r;
    assign data_x[bitwidth*0+bitwidth-1:bitwidth*0]=data_in_x_0;
    assign data_x[bitwidth*1+bitwidth-1:bitwidth*1]=data_in_x_1;
    assign data_x[bitwidth*2+bitwidth-1:bitwidth*2]=data_in_x_2;
    assign data_x[bitwidth*3+bitwidth-1:bitwidth*3]=data_in_x_3;


    pipe_reg #(
        .bitwidth(bitwidth*size),
        .pipe(NumCycle+1)
    )
    pipe_reg_x(
        .clk(clk),
        .rst(rst),
        .data_in(data_x),
        .data_out(data_x_r)
    );


    //********************************//
    // pipeline stage #3
    //********************************//
    wire [bitwidth-1:0]data_out[size-1:0];
    genvar i;
    generate
        for (i=0;i<size;i=i+1)begin
            sgd #(
                .bitwidth(bitwidth)
            )
            sgd1(
                .x_(data_x_r[bitwidth*i+bitwidth-1:bitwidth*i]),
                .w_(data_w_r[bitwidth*i+bitwidth-1:bitwidth*i]),
                .data_in(grad_r),
                .mu(mu),
                .data_out(data_out[i])
            );
        end
    endgenerate

    always @(posedge clk) begin
        if (rst) begin
            data_out_r_0<=0;
            data_out_r_1<=0;
            data_out_r_2<=0;
            data_out_r_3<=0;

        end
        else begin
        data_out_r_0<=data_out[0];
        data_out_r_1<=data_out[1];
        data_out_r_2<=data_out[2];
        data_out_r_3<=data_out[3];

        end
    end

endmodule




