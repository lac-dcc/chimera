// This program was cloned from: https://github.com/benhuangpf/systolic-array
// License: MIT License

//Module for calculating Res = A*B
//Where A,B and C are 2 by 2 matrices.
module MMMMIOBlackBox
#(parameter WIDTH=32,
	parameter ARRAY_SIZE = 8,
	parameter SRAM_DATA_WIDTH = 32,
	parameter DATA_WIDTH = 8,
	parameter W = 16
)(
    input                  clock,
    input                  reset,
	input in,
    output                 input_ready,
    input                  input_valid,
    input                  output_ready,
    output                 output_valid,
   
    input [SRAM_DATA_WIDTH-1:0] sram_rdata_a0,
	input [SRAM_DATA_WIDTH-1:0] sram_rdata_a1,
	
	input [SRAM_DATA_WIDTH-1:0] sram_rdata_b0,
	input [SRAM_DATA_WIDTH-1:0] sram_rdata_b1,

	input [9:0] sram_raddr,

	output [4*W-1:0] c00,
	output [4*W-1:0] c01,
	output [4*W-1:0] c10,
	output [4*W-1:0] c11,
	output [4*W-1:0] c20,
	output [4*W-1:0] c21,
	output [4*W-1:0] c30,
	output [4*W-1:0] c31,
	output [4*W-1:0] c40,
	output [4*W-1:0] c41,
	output [4*W-1:0] c50,
	output [4*W-1:0] c51,
	output [4*W-1:0] c60,
	output [4*W-1:0] c61,
	output [4*W-1:0] c70,
	output [4*W-1:0] c71	
);

reg [63:0] mem_a [0:100][0:11];
reg [63:0] mem_b [0:100][0:11];
always @(posedge clock) begin
	mem_a[sram_num][sram_raddr] <= {sram_rdata_a0, sram_rdata_a1};
	mem_b[sram_num][sram_raddr] <= {sram_rdata_b0, sram_rdata_b1};	
end

wire [9:0] data_set;
wire [9:0] tpu_raddr_a0, tpu_raddr_a1, tpu_raddr_b0, tpu_raddr_b1;
reg [31:0] tpu_rdata_a0, tpu_rdata_a1, tpu_rdata_b0, tpu_rdata_b1;
always @(posedge clock) begin
	tpu_rdata_a0 <= mem_a[data_set][tpu_raddr_a0][63:32];
	tpu_rdata_a1 <= mem_a[data_set][tpu_raddr_a1][31:0];
	tpu_rdata_b0 <= mem_b[data_set][tpu_raddr_b0][63:32];
	tpu_rdata_b1 <= mem_b[data_set][tpu_raddr_b1][31:0];
end

reg [127:0] mem_c0 [0:15];
reg [127:0] mem_c1 [0:15];
reg [127:0] mem_c2 [0:15];
wire tpu_write_enable_c0, tpu_write_enable_c1, tpu_write_enable_c2;
wire [5:0]   tpu_waddr_c0, tpu_waddr_c1, tpu_waddr_c2;
wire [127:0] tpu_wdata_c0, tpu_wdata_c1, tpu_wdata_c2;
always @(posedge clock) begin
	if(!tpu_write_enable_c0) mem_c0[tpu_waddr_c0] <= tpu_wdata_c0;
	if(!tpu_write_enable_c1) mem_c1[tpu_waddr_c1] <= tpu_wdata_c1;
	if(!tpu_write_enable_c2) mem_c2[tpu_waddr_c2] <= tpu_wdata_c2;
end

assign c00 = {mem_c0[0][(8*W-1)-:W], mem_c0[1][(8*W-1)-:W], mem_c0[2][(8*W-1)-:W], mem_c0[ 3][(8*W-1)-:W]};assign c01 = {mem_c0[ 4][(8*W-1)-:W], mem_c0[ 5][(8*W-1)-:W], mem_c0[ 6][(8*W-1)-:W], mem_c0[ 7][(8*W-1)-:W]};
assign c10 = {mem_c0[1][(7*W-1)-:W], mem_c0[2][(7*W-1)-:W], mem_c0[3][(7*W-1)-:W], mem_c0[ 4][(7*W-1)-:W]};assign c11 = {mem_c0[ 5][(7*W-1)-:W], mem_c0[ 6][(7*W-1)-:W], mem_c0[ 7][(7*W-1)-:W], mem_c0[ 8][(8*W-1)-:W]};
assign c20 = {mem_c0[2][(6*W-1)-:W], mem_c0[3][(6*W-1)-:W], mem_c0[4][(6*W-1)-:W], mem_c0[ 5][(6*W-1)-:W]};assign c21 = {mem_c0[ 6][(6*W-1)-:W], mem_c0[ 7][(6*W-1)-:W], mem_c0[ 8][(7*W-1)-:W], mem_c0[ 9][(8*W-1)-:W]};
assign c30 = {mem_c0[3][(5*W-1)-:W], mem_c0[4][(5*W-1)-:W], mem_c0[5][(5*W-1)-:W], mem_c0[ 6][(5*W-1)-:W]};assign c31 = {mem_c0[ 7][(5*W-1)-:W], mem_c0[ 8][(6*W-1)-:W], mem_c0[ 9][(7*W-1)-:W], mem_c0[10][(8*W-1)-:W]};
assign c40 = {mem_c0[4][(4*W-1)-:W], mem_c0[5][(4*W-1)-:W], mem_c0[6][(4*W-1)-:W], mem_c0[ 7][(4*W-1)-:W]};assign c41 = {mem_c0[ 8][(5*W-1)-:W], mem_c0[ 9][(6*W-1)-:W], mem_c0[10][(7*W-1)-:W], mem_c0[11][(8*W-1)-:W]};
assign c50 = {mem_c0[5][(3*W-1)-:W], mem_c0[6][(3*W-1)-:W], mem_c0[7][(3*W-1)-:W], mem_c0[ 8][(4*W-1)-:W]};assign c51 = {mem_c0[ 9][(5*W-1)-:W], mem_c0[10][(6*W-1)-:W], mem_c0[11][(7*W-1)-:W], mem_c0[12][(8*W-1)-:W]};
assign c60 = {mem_c0[6][(2*W-1)-:W], mem_c0[7][(2*W-1)-:W], mem_c0[8][(3*W-1)-:W], mem_c0[ 9][(4*W-1)-:W]};assign c61 = {mem_c0[10][(5*W-1)-:W], mem_c0[11][(6*W-1)-:W], mem_c0[12][(7*W-1)-:W], mem_c0[13][(8*W-1)-:W]};
assign c70 = {mem_c0[7][(1*W-1)-:W], mem_c0[8][(2*W-1)-:W], mem_c0[9][(3*W-1)-:W], mem_c0[10][(4*W-1)-:W]};assign c71 = {mem_c0[11][(5*W-1)-:W], mem_c0[12][(6*W-1)-:W], mem_c0[13][(7*W-1)-:W], mem_c0[14][(8*W-1)-:W]};

tpu_top my_tpu_top(
	.clk(clock),
	.srstn(!reset),
	.tpu_start(tpu_start),

	//input data
	.sram_rdata_w0(tpu_rdata_a0),
	.sram_rdata_w1(tpu_rdata_a1),

	.sram_rdata_d0(tpu_rdata_b0),
	.sram_rdata_d1(tpu_rdata_b1),

	//output weight
	.sram_raddr_w0(tpu_raddr_a0),
	.sram_raddr_w1(tpu_raddr_a1),

	.sram_raddr_d0(tpu_raddr_b0),
	.sram_raddr_d1(tpu_raddr_b1),

	//write to the SRAM for comparision
	.sram_write_enable_a0(tpu_write_enable_c0),
	.sram_wdata_a(tpu_wdata_c0),
	.sram_waddr_a(tpu_waddr_c0),

	.sram_write_enable_b0(tpu_write_enable_c1),
	.sram_wdata_b(tpu_wdata_c1),
	.sram_waddr_b(tpu_waddr_c1),

	.sram_write_enable_c0(tpu_write_enable_c2),
	.sram_wdata_c(tpu_wdata_c2),
	.sram_waddr_c(tpu_waddr_c2),

	.data_set(data_set),

	.tpu_done(tpu_finish)
);
    localparam S_IDLE = 2'b00, S_RUN = 2'b01, S_DONE = 2'b10, S_WRITE = 2'b11;
    reg tpu_start;
	wire tpu_finish;
    reg [1:0] state;

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