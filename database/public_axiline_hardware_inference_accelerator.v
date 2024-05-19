// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

//
//      verilog template for accelerator in Axiline
//
`include "./config.vh"
//`include "accelerator_unit.v"
//`include "controller.v"
//`include "dual_port_ram.v"

module accelerator#(
    parameter inputBitwidth=`INPUT_BITWIDTH,
	parameter bitwidth=`BITWIDTH,
    parameter instBitwidth=3,
    parameter logNumCycle=`LOG_NUM_CYCLE,
    parameter numCycle=`NUM_CYCLE,
    parameter size= `SIZE,
	parameter numUnit=`NUMBER_UNIT

)(
    input [inputBitwidth*size*numUnit-1:0]data_in_w_init,
    input [inputBitwidth*size-1:0]data_in_x,
    input [inputBitwidth*numUnit-1:0]bias,
	input [inputBitwidth*numUnit-1:0]rate,
    input clk,
    input start,done,
    input rst,
	input [inputBitwidth-1:0]mu,
    input [logNumCycle-1:0]w_addr,
    input w1_en,w2_en,

	output w_ce,
	output x_ce,
	output out_rd,
	output bmr_ce,
    output [bitwidth*numUnit-1:0]data_out
);

	wire [inputBitwidth*size*numUnit-1:0]data_in_w;
	//wire [inputBitwidth*size*numUnit-1:0]data_in_x;

    //extend input 
    /*
    wire [bitwidth*size*numUnit-1:0]data_in_extend_bw;
    genvar i,j;
    generate
        for (i=0;i<numUnit;i=i+1)begin
            for (j=0;j<size;j=j+1)begin
                assign data_in_extend_bw[(i*size+j+1)*bitwidth-1:(i*size+j)*bitwidth]={{(bitwidth-inputBitwidth){1'b0}},data_in_w_init[(i*size+j+1)*inputBitwidth-1:(i*size+j)*inputBitwidth]};
            end
        end
    endgenerate*/

	// accelerator controller
	localparam IDLE=3'd0, INIT=3'd1, INIT_IP=3'd2,IP=3'd3,COMB=3'd4,PIPE=3'd5,SGD=3'd6;
	wire sel;
	wire comb_valid;
	wire [instBitwidth-1:0]inst;
    wire [logNumCycle-1:0]xw1_addr;
	wire [logNumCycle-1:0]xw2_addr;

	controller #(
        .logNumCycle(logNumCycle),
        .numCycle(numCycle),
		.instBitwidth(instBitwidth)
    )
    bm_controller(
        .clk(clk),
        .start(start),
		.done(done),
        .rst(rst),
        .inst(inst),
		.sel(sel),
		//.w1_sel(w1_sel),
		//.w2_sel(w2_sel),

		//.w1_en(w1_en),
		//.x1_en(x1_en),
		.xw1_addr(xw1_addr),

		//.w2_en(w2_en),
		//.x2_en(x2_en),
		.xw2_addr(xw2_addr)
    );
	assign comb_valid= inst==COMB;
	//delay one cycle for memory
	/*always @(posedge clk)begin
		if (rst)begin 
			inst<=0;
			xw2_addr<=0;
			xw1_addr<=0;
		end else begin 
			inst<=inst_pre;
			xw2_addr<=xw2_addr_pre;
			xw1_addr<=xw1_addr_pre;
		end
	end*/


	wire [inputBitwidth*size*numUnit-1:0]ram_w_a;
	wire [inputBitwidth*size*numUnit-1:0]ram_w_b;
	wire [logNumCycle-1:0]ram_w_a_addr;
	wire [logNumCycle-1:0]ram_w_b_addr;
    assign ram_w_a_addr=w_addr;
    assign ram_w_b_addr=w_addr;
	wire ram_w_we;
	wire ram_w_re;
	//wire w2_en;
    //assign w2_en=~w1_en;
	true_dual_port_ram#(
		.dataLen(inputBitwidth*size*numUnit),
		.addrLen(logNumCycle),
		.memSize(numCycle)
	)ram_w(
		.data_a(data_in_w_init),
		.addr_a(ram_w_a_addr),
		.we_a(w1_en),

		.re_b(w2_en),
		.addr_b(ram_w_b_addr),
		.q_b(data_in_w),

		.clk(clk)
	);
	//assign ram_w_a_addr=xw1_addr;
	//assign ram_w_b_addr=(inst==INIT_IP)?xw1_addr:xw2_addr;
	//assign ram_w_b_addr=inst==INIT?0:((inst==INIT_IP)?xw1_addr+1:xw2_addr);
	//assign ram_w_we=w1_en;
	//assign ram_w_re=w2_en;

	//wire [inputBitwidth*size-1:0]ram_x_a;
	//wire [inputBitwidth*size-1:0]ram_x_b; 
	//wire [logNumCycle-1:0]ram_x_a_addr;
	//wire [logNumCycle-1:0]ram_x_b_addr;
	//wire ram_x_we;
	//wire ram_x_re;
	/*true_dual_port_ram#(
		.dataLen(inputBitwidth*size),
		.addrLen(2),
		.memSize(4)
	)ram_x(
		.data_a(ram_x_a),
		.addr_a(ram_x_a_addr[1:0]),
		.we_a(x1_en),

		.re_b(x2_en),
		.addr_b(ram_x_b_addr[1:0]),
		.q_b(ram_x_b),
		
		.clk(clk)
	);*/
	//assign ram_x_a_addr= xw1_addr;
	//assign ram_x_b_addr=(inst==INIT_IP)?xw1_addr:xw2_addr;
	//assign ram_w_we=x1_en;
	//assign ram_w_re=x2_en;

	//parallel accelerator unit
	//wire [bitwidth*numUnit-1:0] data_out;


	`ifdef RECO
		genvar i;
		generate
			for (i=0;i<numUnit;i=i+1)begin : NUM
				accelerator_unit #(
					.inputBitwidth(inputBitwidth),
					.bitwidth(bitwidth),
					//.instBitwidth(instBitwidth),
					.logNumCycle(logNumCycle),
					.numCycle(numCycle),
                    //.ip_stage(ip_stage),
                    //.sgd_stage(sgd_stage),
					.size(size)
				)unit(
					.data_in_x(data_in_x),
					.data_in_w(data_in_w[inputBitwidth*size*(i+1)-1:inputBitwidth*size*i]),
					.bias(bias[inputBitwidth*(i+1)-1:inputBitwidth*i]),
					.rate(rate[inputBitwidth*(i+1)-1:inputBitwidth*i]),
					.clk(clk),
					.sel(sel),
					.comb_valid(comb_valid),
					.rst(rst),
					//.mu(mu),
					//.sgd_x(sgd_x),
					//.sgd_w(sgd_w[bitwidth*size*(i+1)-1:bitwidth*size*i]),
					.data_out_r(data_out[bitwidth*(i+1)-1:bitwidth*i])		
				);    
			end
    	endgenerate

	`else
		genvar i;
		generate
			for (i=0;i<1;i=i+1)begin : NUM
				accelerator_unit #(
					.inputBitwidth(inputBitwidth),
					.bitwidth(bitwidth),
					//.instBitwidth(instBitwidth),
					.logNumCycle(logNumCycle),
					.numCycle(numCycle),
                    //.ip_stage(ip_stage),
                    //.sgd_stage(sgd_stage),
					.size(size)
				)unit(
					.data_in_x(data_in_x[inputBitwidth*size*(i+1)-1:inputBitwidth*size*i]),
					.data_in_w(data_in_w[inputBitwidth*size*(i+1)-1:inputBitwidth*size*i]),
					.bias(bias[inputBitwidth*(i+1)-1:inputBitwidth*i]),
					.rate(),
					.clk(clk),
					.sel(sel),
					.comb_valid(comb_valid),
					.rst(rst),
					.mu(mu),
					//.sgd_x(sgd_x[inputBitwidth*size*(i+1)-1:inputBitwidth*size*i]),
					//.sgd_w(sgd_w[bitwidth*size*(i+1)-1:inputBitwidth*size*i]),
					.data_out_r(data_out[bitwidth*(i+1)-1:bitwidth*i])		
				);    
			end
    	endgenerate
	`endif
	
	
	//inst
	wire in_ce;
    assign w_ce = inst==INIT;
    assign in_ce = (inst==INIT|inst==IP|inst==PIPE);
	assign x_ce = in_ce &(~w_ce);
    assign bmr_ce = (inst==COMB);
    assign out_rd = (inst==SGD|inst==PIPE);

    //assign w1_sel=inst==INIT;
    //assign w2_sel=inst==INIT_IP;

    // memory ena
    //assign x1_en=(inst==IP|inst==INIT_IP|inst==PIPE);
    //assign x2_en=(inst==SGD|inst==PIPE);

    //assign w1_en = inst==INIT|inst==IP;
	//assign w2_en=((inst==INIT_IP&xw1_addr!=numCycle-1)|inst==PIPE|(inst==INIT&xw1_addr==numCycle-1));
    //assign w2_en=(inst==INIT_IP|inst==PIPE);
	//sel

	//assign data_in_w=ram_w_b;
	//assign data_in_x=(inst==IP|inst==PIPE|inst==INIT_IP)?data_in_x:0;

	//assign ram_w_a=data_in_w_init;
	//assign ram_w_b=

	//assign ram_x_a=(inst==IP|inst==PIPE|inst==INIT_IP)?data_in_x:0;
	//assign ram_x_b=
	//assign sgd_w=ram_w_b;
	//assign sgd_x=ram_x_b;


endmodule




