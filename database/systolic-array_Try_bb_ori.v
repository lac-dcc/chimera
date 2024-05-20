// This program was cloned from: https://github.com/benhuangpf/systolic-array
// License: MIT License

//Module for calculating Res = A*B
//Where A,B and C are 2 by 2 matrices.
module MMMMIOBlackBox
#(parameter WIDTH=32,
	parameter ARRAY_SIZE = 8,
	parameter SRAM_DATA_WIDTH = 32,
	parameter DATA_WIDTH = 8,
	parameter OUTPUT_DATA_WIDTH = 16
)(
    input                  clock,
    input                  reset,
    output                 input_ready,
    input                  input_valid,
    input                  output_ready,
    output                 output_valid,
    //input and output ports.
    //The size 32 bits which is 2*2=4 elements,each of which is 8 bits wide.    
    input [SRAM_DATA_WIDTH-1:0] sram_rdata_a0,
	input [SRAM_DATA_WIDTH-1:0] sram_rdata_a1,
	
	input [SRAM_DATA_WIDTH-1:0] sram_rdata_b0,
	input [SRAM_DATA_WIDTH-1:0] sram_rdata_b1,

	//output addr for (data, weight) from eight SRAM
	output [9:0] sram_raddr_a0,
	output [9:0] sram_raddr_a1,

	output [9:0] sram_raddr_b0,
	output [9:0] sram_raddr_b1,
	
	//write to three SRAN for comparison
	output sram_write_enable_c0,
	output [ARRAY_SIZE/2*OUTPUT_DATA_WIDTH-1:0] sram_wdata_c00,
	output [ARRAY_SIZE/2*OUTPUT_DATA_WIDTH-1:0] sram_wdata_c01,
	output [5:0] sram_waddr_c0,

	output sram_write_enable_c1,
	output [ARRAY_SIZE/2*OUTPUT_DATA_WIDTH-1:0] sram_wdata_c10,
	output [ARRAY_SIZE/2*OUTPUT_DATA_WIDTH-1:0] sram_wdata_c11,
	output [5:0] sram_waddr_c1,

	output sram_write_enable_c2,
	output [ARRAY_SIZE/2*OUTPUT_DATA_WIDTH-1:0] sram_wdata_c20,
	output [ARRAY_SIZE/2*OUTPUT_DATA_WIDTH-1:0] sram_wdata_c21,
	output [5:0] sram_waddr_c2
	
);

wire [ARRAY_SIZE*OUTPUT_DATA_WIDTH-1:0] sram_wdata_c0;
wire [ARRAY_SIZE*OUTPUT_DATA_WIDTH-1:0] sram_wdata_c1;
wire [ARRAY_SIZE*OUTPUT_DATA_WIDTH-1:0] sram_wdata_c2;

assign sram_wdata_c00 = sram_wdata_c0[ARRAY_SIZE*OUTPUT_DATA_WIDTH-1:ARRAY_SIZE*OUTPUT_DATA_WIDTH/2];
assign sram_wdata_c01 = sram_wdata_c0[ARRAY_SIZE*OUTPUT_DATA_WIDTH/2-1:0];
assign sram_wdata_c10 = sram_wdata_c1[ARRAY_SIZE*OUTPUT_DATA_WIDTH-1:ARRAY_SIZE*OUTPUT_DATA_WIDTH/2];
assign sram_wdata_c11 = sram_wdata_c1[ARRAY_SIZE*OUTPUT_DATA_WIDTH/2-1:0];
assign sram_wdata_c20 = sram_wdata_c2[ARRAY_SIZE*OUTPUT_DATA_WIDTH-1:ARRAY_SIZE*OUTPUT_DATA_WIDTH/2];
assign sram_wdata_c21 = sram_wdata_c2[ARRAY_SIZE*OUTPUT_DATA_WIDTH/2-1:0];

tpu_top my_tpu_top(
	.clk(clock),
	.srstn(!reset),
	.tpu_start(tpu_start),

	//input data
	.sram_rdata_w0(sram_rdata_a0),
	.sram_rdata_w1(sram_rdata_a1),

	.sram_rdata_d0(sram_rdata_b0),
	.sram_rdata_d1(sram_rdata_b1),

	//output weight
	.sram_raddr_w0(sram_raddr_a0),
	.sram_raddr_w1(sram_raddr_a1),

	.sram_raddr_d0(sram_raddr_b0),
	.sram_raddr_d1(sram_raddr_b1),

	//write to the SRAM for comparision
	.sram_write_enable_a0(sram_write_enable_c0),
	.sram_wdata_a(sram_wdata_c0),
	.sram_waddr_a(sram_waddr_c0),

	.sram_write_enable_b0(sram_write_enable_c1),
	.sram_wdata_b(sram_wdata_c1),
	.sram_waddr_b(sram_waddr_c1),

	.sram_write_enable_c0(sram_write_enable_c2),
	.sram_wdata_c(sram_wdata_c2),
	.sram_waddr_c(sram_waddr_c2),

	.tpu_done(tpu_finish)
);
    localparam S_IDLE = 2'b00, S_RUN = 2'b01, S_DONE = 2'b10;

    reg tpu_start;

wire tpu_finish;

    reg [1:0]               state;

    assign input_ready = state == S_IDLE;
   assign output_valid = state == S_DONE;
   assign busy = state != S_IDLE;

   always @(posedge clock) begin
      if (reset) begin
		state <= S_IDLE;
        tpu_start <= 0;
	  end
        
      else if (state == S_IDLE && input_valid) begin
		state <= S_RUN;
        tpu_start <= 1;
	  end
        
      else if (state == S_RUN) begin
		if (tpu_finish) state <= S_DONE;
        tpu_start <= 0;
	  end
      else if (state == S_DONE && output_ready) begin
		state <= S_IDLE;
        tpu_start <= 0;
	  end
        
   end

endmodule