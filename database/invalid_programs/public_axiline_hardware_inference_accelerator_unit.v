//
//      verilog template for accelerator unit in Axiline
//

//`include "../include/config.vh"
`include "./config.vh"
/*`include "ip_stage.v"
`include "comb_stage.v"
`include "comb_reco_stage.v"
`include "sgd_stage.v"
`include "pipeline_reg.v"*/

module accelerator_unit#(
    parameter inputBitwidth=16,
	parameter bitwidth=32,
    //parameter instBitwidth=2,
    parameter logNumCycle=5,
    parameter numCycle=25,
    parameter size= 10,
    parameter ip_stage=0,
    parameter sgd_stage=0
)(
    
    input [inputBitwidth*size-1:0]data_in_x,
	input [inputBitwidth*size-1:0]data_in_w,
    //input [inputBitwidth*size-1:0]sgd_x,
	//input [bitwidth*size-1:0]sgd_w,
    input [inputBitwidth-1:0]bias,
    input [inputBitwidth-1:0]rate,
    input clk,
    input sel, 
	input comb_valid,
    input rst,
	//input [inputBitwidth-1:0]mu,
    output [bitwidth-1:0] data_out_r
);

	wire [inputBitwidth*size-1:0]w;
	wire [inputBitwidth*size-1:0]x;
	assign x=data_in_x;
    assign w=data_in_w;

	//extended data in
	//wire [bitwidth*size-1:0]extended_data_in;
	//generate
	//for (i=0;i<size;i=i+1)begin: READ
	//	assign extended_data_in[bitwidth*i+bitwidth-1:bitwidth*i]={{(bitwidth-inputBitwidth){1'b0}},data_in[inputBitwidth*i+inputBitwidth-1:inputBitwidth*i]};
	//end
	//endgenerate

	//first stage control and input register
	/* always@(posedge clk or posedge rst)begin
		if(rst)begin
			w<=0;
			x<=0;
		end else begin
			// write data to input registers
			w<=data_in_w;
			x<=data_in_x;
			//tranfer 1 bit is to next stage
		end		
	end */
	

    //********************************//
    // pipeline stage #1
    //********************************//
    wire [bitwidth-1:0]sum_r;
    //block 1
    ip_stage #(
        .bitwidth(bitwidth),
		.inputBitwidth(inputBitwidth),
        .size(size),
        .stage(ip_stage)
    )
    stage_1(
		.clk(clk),
		.rst(rst),
        .x(x),
        .w(w),
        .sel(sel),
        .sum_r(sum_r)
    );

    // pipeline registers for stage # 2
    // pipeline reg for bias
   /*  wire [inputBitwidth-1:0] bias_r;
    pipeline_reg #(
        .bitwidth(inputBitwidth),
        .num_stage(numCycle)
    )
    pipe_reg_y(
        .clk(clk),
        .rst(rst),
        .data_in(bias),
        .data_out(bias_r)
    ); */

    // pipeline reg for rate
    /* `ifdef RECO
    wire [inputBitwidth-1:0] rate_r;
    pipeline_reg #(
        .bitwidth(inputBitwidth),
        .num_stage(numCycle)
    )
    pipe_reg_r(
        .clk(clk),
        .rst(rst),
        .data_in(rate),
        .data_out(rate_r)
    );
    `endif */


    //********************************//
    // pipeline stage #2
    //********************************//
    wire valid;
    wire [bitwidth-1:0]grad_r;
	//assign valid=~sel;
	assign valid=comb_valid;

    //reco
    `ifdef RECO
        comb_reco_stage #(
            .bitwidth(bitwidth),
            .inputBitwidth(inputBitwidth)
        )
        comb_stage1(
			.clk(clk),
			.rst(rst),
			//.mu(mu),
            .data_in(sum_r),
            .bias(bias),
            .rate(rate),
            //.valid(valid),
            .grad_r(data_out_r)
        );
    //SVM, linear regression and logistic regression
    `else
        comb_stage #(
            .bitwidth(bitwidth),
            .inputBitwidth(inputBitwidth)
        )
        comb_stage1(
			.clk(clk),
			.rst(rst),
			//.mu(mu),
            .data_in(sum_r),
            .bias(bias),
            //.valid(valid),
            .grad_r(data_out_r)
        );
    `endif

    // pipeline registers for stage 3

    // pipeline reg for weight
   /*  wire [inputBitwidth*size-1:0]data_w,data_w_r;
    assign data_w=w;

    pipeline_reg #(
        .bitwidth(inputBitwidth*size),
        .num_stage(numCycle+1)
    )
    pipe_reg_w(
        .clk(clk),
        .rst(rst),
        .data_in(data_w),
        .data_out(data_w_r)
    ); */

    // pipeline reg for activation
    /* wire [inputBitwidth*size-1:0]data_x,data_x_r;
    assign data_x=x;

    pipeline_reg #(
        .bitwidth(inputBitwidth*size),
        .num_stage(numCycle+1)
    )
    pipe_reg_x(
        .clk(clk),
        .rst(rst),
        .data_in(data_x),
        .data_out(data_x_r)
    ); */


    //********************************//
    // pipeline stage #3
    //********************************//
    //wire [bitwidth-1:0]data_out[size-1:0];
    /*genvar i;
    generate
        for (i=0;i<size;i=i+1)begin: SGD
            sgd_stage #(
                .bitwidth(bitwidth),
				.inputBitwidth(inputBitwidth),
				.stage(sgd_stage)
            )
            unit(
				.clk(clk),
				.rst(rst),
                .x(sgd_x[inputBitwidth*i+inputBitwidth-1:inputBitwidth*i]),
                .w(sgd_w[bitwidth*i+bitwidth-1:bitwidth*i]),
                .data_in(grad_r),
                .data_out_r(data_out_r[i*bitwidth+bitwidth-1:i*bitwidth])
            );
        end
    endgenerate*/

endmodule




