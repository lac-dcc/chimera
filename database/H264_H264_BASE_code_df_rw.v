`include "timescale.v"
`include "define.v"

module df_rw(
input clk,
input reset_n,
input [7:0] img_4x4_00,img_4x4_01,img_4x4_02,img_4x4_03,img_4x4_10,img_4x4_11,img_4x4_12,img_4x4_13,
input [7:0] img_4x4_20,img_4x4_21,img_4x4_22,img_4x4_23,img_4x4_30,img_4x4_31,img_4x4_32,img_4x4_33,
input [4:0] intra4x4_pred_num,intra16_pred_num,
input [2:0] residual_intra4x4_state,residual_intra16_state,residual_inter_state,
input end_of_MB_DEC,
input [5:0] DF_edge_counter_MR,
input [1:0] one_edge_counter_MR,
input [127:0] rec_DF_RAM1_dout,rec_DF_RAM0_dout,


output reg [31:0] rec_out,

output reg rec_DF_RAM0_wr_n,
output reg rec_DF_RAM0_rd_n,
output reg [4:0]rec_DF_RAM0_addr,
output reg [127:0] rec_DF_RAM0_din,
output reg rec_DF_RAM1_wr_n,
output reg rec_DF_RAM1_rd_n,
output reg [4:0]rec_DF_RAM1_addr,
output reg [127:0] rec_DF_RAM1_din
);


wire df_rd_n;
reg df_wr_n;
reg [4:0] df_rd_addr;
reg [4:0] df_wr_addr;
reg [127:0]df_din;
wire [127:0] rec_DF_RAM_dout;


assign df_rd_n = ~((DF_edge_counter_MR[5] == 1'b0 && (DF_edge_counter_MR[3:0] == 4'd0 ||
	DF_edge_counter_MR[3:0] == 4'd1     ||  DF_edge_counter_MR[3:0] == 4'd2 || DF_edge_counter_MR[3:0] == 4'd3 ||
	DF_edge_counter_MR[3:0] == 4'd6     ||  DF_edge_counter_MR[3:0] == 4'd7 || DF_edge_counter_MR[3:0] == 4'd10||
	DF_edge_counter_MR[3:0] == 4'd11))  || (DF_edge_counter_MR[5] == 1'b1   && DF_edge_counter_MR[2] == 1'b0));

always@(DF_edge_counter_MR or df_rd_n)
	if(df_rd_n==0)
	case(DF_edge_counter_MR)
	6'd0 :df_rd_addr = 5'd0;
	6'd1 :df_rd_addr = 5'd1;
	6'd2 :df_rd_addr = 5'd2;
	6'd3 :df_rd_addr = 5'd3;
	6'd6 :df_rd_addr = 5'd4;
	6'd7 :df_rd_addr = 5'd6;
	6'd10:df_rd_addr = 5'd5; 
	6'd11:df_rd_addr = 5'd7; 
	6'd16:df_rd_addr = 5'd8;
	6'd17:df_rd_addr = 5'd9;
	6'd18:df_rd_addr = 5'd10;
	6'd19:df_rd_addr = 5'd11;
	6'd22:df_rd_addr = 5'd12;
	6'd23:df_rd_addr = 5'd14;
	6'd26:df_rd_addr = 5'd13;
	6'd27:df_rd_addr = 5'd15;
	6'd32:df_rd_addr = 5'd18;
	6'd33:df_rd_addr = 5'd19;
	6'd34:df_rd_addr = 5'd20;
	6'd35:df_rd_addr = 5'd21;
	6'd40:df_rd_addr = 5'd22;
	6'd41:df_rd_addr = 5'd23;
	6'd42:df_rd_addr = 5'd24;
	6'd43:df_rd_addr = 5'd25;
	default:df_rd_addr = 0;
	endcase
	else 
		df_rd_addr = 0;

always@(posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		rec_out <= 0;end
	else
	case(one_edge_counter_MR)
	0:rec_out <= rec_DF_RAM_dout[127:96];
	1:rec_out <= rec_DF_RAM_dout[95:64];
	2:rec_out <= rec_DF_RAM_dout[63:32];
	3:rec_out <= rec_DF_RAM_dout[31:0];
endcase


always@(posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		df_wr_n <= 1;
		df_wr_addr <= 0;df_din <= 0;
		end
	 else if(residual_intra4x4_state == `intra4x4_updat||residual_inter_state == `inter_updat)begin
		 df_wr_n <= 0;
		 df_wr_addr <= {intra4x4_pred_num};
		 df_din <={img_4x4_00,img_4x4_01,img_4x4_02,img_4x4_03,
		                 img_4x4_10,img_4x4_11,img_4x4_12,img_4x4_13,
		                 img_4x4_20,img_4x4_21,img_4x4_22,img_4x4_23,
		                 img_4x4_30,img_4x4_31,img_4x4_32,img_4x4_33 };
		  end
	 else if(residual_intra16_state == `intra16_updat)begin
		   df_wr_n <= 0;
		   df_wr_addr <= {intra16_pred_num};
		   df_din <={img_4x4_00,img_4x4_01,img_4x4_02,img_4x4_03,
		                 img_4x4_10,img_4x4_11,img_4x4_12,img_4x4_13,
		                 img_4x4_20,img_4x4_21,img_4x4_22,img_4x4_23,
		                 img_4x4_30,img_4x4_31,img_4x4_32,img_4x4_33 };
		     end

reg rec_DF_RAM_sel;	//0:rec_DF_RAM0 at reconstruction stage			
						//0:rec_DF_RAM1 at DF stage
						//1:rec_DF_RAM0 at DF stage			
					//1:rec_DF_RAM1 at reconstruction stage

always @ (posedge clk)
	if (reset_n == 1'b0)
		rec_DF_RAM_sel <= 1'b0;
	else if (end_of_MB_DEC)
		rec_DF_RAM_sel <= ~ rec_DF_RAM_sel;	
			
assign rec_DF_RAM_dout = (rec_DF_RAM_sel == 1'b0)? rec_DF_RAM1_dout:rec_DF_RAM0_dout;
	
always @ (rec_DF_RAM_sel or df_wr_n or df_wr_addr or df_din or df_rd_n or df_rd_addr)
	case (rec_DF_RAM_sel)
		1'b0:	//rec_DF_RAM0 at reconstruction stage,rec_DF_RAM1 at DF stage
		begin
			rec_DF_RAM0_wr_n = df_wr_n;	
			rec_DF_RAM0_rd_n = 1'b1;			  
			rec_DF_RAM0_addr = df_wr_addr;		
			rec_DF_RAM0_din  = df_din;	
				
			rec_DF_RAM1_wr_n = 1'b1;	
			rec_DF_RAM1_rd_n = df_rd_n;			  
			rec_DF_RAM1_addr = df_rd_addr;		
			rec_DF_RAM1_din  = 0;
		end
		1'b1:	//rec_DF_RAM0 at DF stage,rec_DF_RAM1 at reconstruction stage
		begin
			rec_DF_RAM0_wr_n = 1'b1;	
			rec_DF_RAM0_rd_n = df_rd_n;			  
			rec_DF_RAM0_addr = df_rd_addr;		
			rec_DF_RAM0_din  = 0;
				
			rec_DF_RAM1_wr_n = df_wr_n;	
			rec_DF_RAM1_rd_n = 1'b1;			  
			rec_DF_RAM1_addr = df_wr_addr;		
			rec_DF_RAM1_din  = df_din;	
		end
	endcase



endmodule
