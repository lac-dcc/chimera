`include "timescale.v"
`include "define.v"

module df_qp_mem_ctrl(
input clk,reset_n,
input [5:0] QPy,QPc,
input end_of_BS_DEC,
input [7:0] mb_num_h_DF,

output reg [5:0] QPy_addrA,QPc_addrA,
output [5:0] QPy_addrB,QPc_addrB



);

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		QPy_addrA <= 0;QPc_addrA <= 0;end
	else if(end_of_BS_DEC)begin
		QPy_addrA <= QPy;QPc_addrA <= QPc;end


reg QPy_addrB_wr_n,QPc_addrB_wr_n,QPy_addrB_rd_n,QPc_addrB_rd_n;
reg [6:0] QPy_addrB_wr_addr,QPc_addrB_wr_addr,QPy_addrB_rd_addr,QPc_addrB_rd_addr;
reg [5:0] QPy_addrB_data_in,QPc_addrB_data_in;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		QPy_addrB_wr_n = 1; QPy_addrB_wr_addr = 0; QPy_addrB_data_in = 0;
		QPc_addrB_wr_n = 1; QPc_addrB_wr_addr = 0; QPc_addrB_data_in = 0;end
	else if(end_of_BS_DEC)begin
		QPy_addrB_wr_n = 0; QPy_addrB_wr_addr = mb_num_h_DF[6:0]; QPy_addrB_data_in = QPy;
		QPc_addrB_wr_n = 0; QPc_addrB_wr_addr = mb_num_h_DF[6:0]; QPc_addrB_data_in = QPc;end


always@(mb_num_h_DF or reset_n)
	if (reset_n == 1'b0)begin
		QPy_addrB_rd_addr = 0; QPy_addrB_rd_n = 1;
		QPc_addrB_rd_addr = 0; QPc_addrB_rd_n = 1;end
	else begin
		QPy_addrB_rd_addr = mb_num_h_DF[6:0]; QPy_addrB_rd_n = 0;
		QPc_addrB_rd_addr = mb_num_h_DF[6:0]; QPc_addrB_rd_n = 0;end
		
	
ram_Synch # (6,7)
	 ram_QPy_addrb(
	.clk(clk),.rst_n(reset_n),
	.rd_n(QPy_addrB_rd_n),.wr_n(QPy_addrB_wr_n), 
	.rd_addr(QPy_addrB_rd_addr),.wr_addr(QPy_addrB_wr_addr),
	.data_in(QPy_addrB_data_in),.data_out(QPy_addrB)
	); 

ram_Synch # (6,7)
	 ram_QPc_addrb(
	.clk(clk),.rst_n(reset_n),
	.rd_n(QPc_addrB_rd_n),.wr_n(QPc_addrB_wr_n), 
	.rd_addr(QPc_addrB_rd_addr),.wr_addr(QPc_addrB_wr_addr),
	.data_in(QPc_addrB_data_in),.data_out(QPc_addrB)
	); endmodule
