`include "timescale.v"
`include "define.v"

module nC_decoding (
input clk,reset_n,
input [3:0] cavlc_decoder_state,
input [1:0] slice_data_state,
input [4:0] TotalCoeff,TC_A_dout,TC_B_dout,
input [7:0] mb_num_h,mb_num_v,
input [5:0] intra16_pred_num, 
input [1:0] chroma_i8x8,chroma_i4x4,

input [1:0] residual_intra16_state,
input cavlc_end_r,res_0,


output reg [5:0] TC_A_rd_addr,
output reg [12:0] TC_B_rd_addr,
output reg TC_rd_n,


output reg [4:0] nC,
output reg nC_0to2,nC_2to4,nC_4to8,nC_n1
);
	
parameter nC_rst  = 2'b00;
parameter read    = 2'b10;
parameter dec_nC  = 2'b11;

reg [5:0] Aintra4x4_pred_num,Bintra4x4_pred_num;
wire [5:0] intra16_pred_num_pred;
wire currMB_availA_nc,currMB_availB_nc;

assign intra16_pred_num_pred = (residual_intra16_state == `intra16_updat && intra16_pred_num != 6'd49) ?
		(intra16_pred_num == 6'd16 ? 6'd18 : 
		 intra16_pred_num == 6'd33 ? 6'd17 :
		 intra16_pred_num == 6'd17 ? 6'd34 : intra16_pred_num + 6'd1) : intra16_pred_num;


always @ (reset_n or slice_data_state or residual_intra16_state or intra16_pred_num or 
				Aintra4x4_pred_num or Bintra4x4_pred_num or mb_num_h)
	if(reset_n == 0)begin
		TC_rd_n = 1;
		TC_A_rd_addr = 0;	TC_B_rd_addr = 0;	end
	else if((slice_data_state == `residual && residual_intra16_state == `rst_residual_intra16) || 
			(residual_intra16_state == `intra16_updat && intra16_pred_num != 6'd49))begin
		TC_rd_n = 0;
		TC_A_rd_addr = Aintra4x4_pred_num;
		TC_B_rd_addr = {mb_num_h[6:0],Bintra4x4_pred_num};end
	else begin
		TC_rd_n = 1;
		TC_A_rd_addr = 0;	TC_B_rd_addr = 0;	end


reg [4:0] nc_reg;
always @ (residual_intra16_state or cavlc_end_r or cavlc_decoder_state or res_0 or 
		currMB_availA_nc or currMB_availB_nc or TC_A_dout or TC_B_dout or nC)
		if(residual_intra16_state == `intra16_cavlc_pred && cavlc_end_r == 0 && 
			cavlc_decoder_state == `rst_cavlc_decoder && res_0 == 0)begin
			if (currMB_availA_nc == 1 && currMB_availB_nc == 1)
				nc_reg = (TC_A_dout + TC_B_dout + 5'd1) >> 1;
			else if (currMB_availA_nc == 1 && currMB_availB_nc != 1)
				nc_reg = TC_A_dout ;
			else if (currMB_availA_nc != 1 && currMB_availB_nc == 1)
				nc_reg = TC_B_dout ;
			else    
				nc_reg = 0;
		end
		else nc_reg = nC;
		
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)	begin
		nC_0to2 <= 0;
		nC_2to4 <= 0;
		nC_4to8 <= 0;
		nC_n1	  <= 0;end
	else if(residual_intra16_state == `intra16_cavlc_pred && cavlc_end_r == 0 && 
		cavlc_decoder_state == `rst_cavlc_decoder && res_0 == 0)begin
		nC_0to2 <= nc_reg == 5'd0 || nc_reg == 5'd1;
		nC_2to4 <= nc_reg == 5'd2 || nc_reg == 5'd3;
		nC_4to8 <= nc_reg == 5'd4 || nc_reg == 5'd5 || nc_reg == 5'd6 || nc_reg == 5'd7;
		nC_n1	  <= nc_reg == 5'd31;end
	else begin
		nC_0to2 <= 0;
		nC_2to4 <= 0;
		nC_4to8 <= 0;
		nC_n1	  <= 0;end
		
		
	
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		nC <= 0;
	else if(residual_intra16_state == `intra16_cavlc_pred && cavlc_end_r == 0 && 
		cavlc_decoder_state == `rst_cavlc_decoder && res_0 == 0)begin
		if (currMB_availA_nc == 1 && currMB_availB_nc == 1)
			nC <= (TC_A_dout + TC_B_dout + 5'd1) >> 1;
		else if (currMB_availA_nc == 1 && currMB_availB_nc != 1)
			nC <= TC_A_dout ;
		else if (currMB_availA_nc != 1 && currMB_availB_nc == 1)
			nC <= TC_B_dout ;
		else    
			nC <= 0;
	end


always@(intra16_pred_num_pred or reset_n)
	if(reset_n == 0)
		Aintra4x4_pred_num = 0;
	else 
		case(intra16_pred_num_pred)
		0,2,8,10,18,20,26,28,34,36,42,44:
			Aintra4x4_pred_num = intra16_pred_num_pred + 6'd5;
		16:	Aintra4x4_pred_num = 23;
		17:	Aintra4x4_pred_num = 39;	
		4,6,12,14,22,24,30,32,38,40,46,48:
			Aintra4x4_pred_num = intra16_pred_num_pred - 6'd3;
   		6'b111111:Aintra4x4_pred_num = 5;
    		default:Aintra4x4_pred_num = intra16_pred_num_pred-6'd1;
  		endcase

always@(intra16_pred_num_pred  or reset_n)
	if(reset_n == 0)
		Bintra4x4_pred_num = 0;
	else 
		case(intra16_pred_num_pred)
		0,1,4,5,18,19,22,23,34,35,38,39:
			Bintra4x4_pred_num = intra16_pred_num_pred + 6'd10;
		8,9,12,13,26,27,30,31,42,43,46,47:
			Bintra4x4_pred_num = intra16_pred_num_pred - 6'd6;
		16:	Bintra4x4_pred_num = 28;
		17:	Bintra4x4_pred_num = 44;
    		6'b111111:Bintra4x4_pred_num = 10;
    		default:Bintra4x4_pred_num = intra16_pred_num_pred-6'd2;
  		endcase

assign currMB_availA_nc = ~(mb_num_h == 0 && 
	(intra16_pred_num_pred == 0 || intra16_pred_num_pred == 2 || intra16_pred_num_pred == 8 || intra16_pred_num_pred == 10 ||
	 intra16_pred_num_pred == 18|| intra16_pred_num_pred == 20|| intra16_pred_num_pred == 26|| intra16_pred_num_pred == 28 ||
	 intra16_pred_num_pred == 34|| intra16_pred_num_pred == 36|| intra16_pred_num_pred == 42|| intra16_pred_num_pred == 44 ||
	 intra16_pred_num_pred == 16|| intra16_pred_num_pred == 17||
	 intra16_pred_num_pred == 6'b111111));
	 
assign currMB_availB_nc = ~(mb_num_v == 0 && 
	(intra16_pred_num_pred == 0 || intra16_pred_num_pred == 1 || intra16_pred_num_pred == 4 || intra16_pred_num_pred == 5  ||
	 intra16_pred_num_pred == 18|| intra16_pred_num_pred == 19|| intra16_pred_num_pred == 22|| intra16_pred_num_pred == 23 ||
	 intra16_pred_num_pred == 34|| intra16_pred_num_pred == 35|| intra16_pred_num_pred == 38|| intra16_pred_num_pred == 39 ||
	 intra16_pred_num_pred == 16|| intra16_pred_num_pred == 17||
	 intra16_pred_num_pred == 6'b111111));

endmodule
