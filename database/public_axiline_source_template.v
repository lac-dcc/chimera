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
    parameter bitwidth=8,
    parameter selBitwidth=1,
    parameter logNumCycle=$logNumCycle$,
    parameter NumCycle=$NumCycle$,
    parameter size= $size$
)(
    input [bitwidth*size-1:0]data_in_w,
    input [bitwidth*size-1:0]data_in_x,
    input [bitwidth-1:0]bias,
    input clk,
    input start,
    input rst,
    output reg [bitwidth*size-1:0] data_out_r,
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
        .bitwidth(bitwidth),
        .size(size)
    )
    ip1(
        .x(data_in_x),
        .w(data_in_w),
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
    assign data_w=data_in_w;

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
    assign data_x=data_in_x;

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
            data_out_r<=0;
        end

//        else begin
//            data_out_r[i*bitwidth+bitwidth-1:i*bitwidth]<=data_out[i];
//        end

    end

<<<<<<< HEAD
    genvar i;
    generate
        for (i=0;i<size;i=i+1)begin
            always @(posedge clk) begin
                if(~rst)begin
                 data_out_r[i*bitwidth+bitwidth-1:i*bitwidth]<=data_out[i];
                end
            end
        end
    endgenerate

endmodule : benchmarks
=======
endmodule
>>>>>>> origin



