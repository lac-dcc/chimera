`include "timescale.v"
`include "define.v"

module Bitstream_buffer(

input clk,reset_n,
input [15:0] BitStream_buffer_input,
input we,
input [6:0] pc,pc_reg,
input [4:0] pc_delta,
input [1:0] remove_03_flag,


output reg next,
output reg [15:0] BitStream_buffer_output,
output [31:0] BitStream_buffer_output_ex32,
output reg [15:0] removed_03

);
reg [127:0]BS_buffer;

reg  [2:0] we_count,reset_counter;


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		we_count <= 3'd3;
	else if(we&&next)
		we_count <= we_count+3'd1;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		reset_counter <= 3'd3;
	else if (reset_counter < 6&&we&&next)
		reset_counter <= reset_counter + 3'd1;	



always@(reset_n or pc_reg or we_count or reset_counter)
	if(reset_n == 1'b0)
		next = 1;
	else if(reset_counter < 5)
		next = 1;
	else case(pc_reg[6:4])
		3'b000:next = we_count==3||we_count==4||we_count==5||we_count==6;
		3'b001:next = we_count==4||we_count==5||we_count==6||we_count==7;
		3'b010:next = we_count==0||we_count==5||we_count==6||we_count==7;
		3'b011:next = we_count==0||we_count==1||we_count==6||we_count==7;
		3'b100:next = we_count==0||we_count==1||we_count==2||we_count==7;
		3'b101:next = we_count==0||we_count==1||we_count==2||we_count==3;
		3'b110:next = we_count==1||we_count==2||we_count==3||we_count==4;
		3'b111:next = we_count==2||we_count==3||we_count==4||we_count==5;
	    endcase


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		BS_buffer <= 0;
	else case(we_count)
		0:BS_buffer[127:112]<=BitStream_buffer_input;
		1:BS_buffer[111:96]<=BitStream_buffer_input;
		2:BS_buffer[95:80]<=BitStream_buffer_input;
		3:BS_buffer[79:64]<=BitStream_buffer_input;
		4:BS_buffer[63:48]<=BitStream_buffer_input;
		5:BS_buffer[47:32]<=BitStream_buffer_input;
		6:BS_buffer[31:16]<=BitStream_buffer_input;
		7:BS_buffer[15:0]<=BitStream_buffer_input;
		endcase



wire [1:0] removed_03_a;
assign removed_03_a = remove_03_flag == 1 ? 2'b10 : remove_03_flag == 2 ? 2'b01 : 2'b00;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		removed_03 <= 0;
	else case(we_count)
		0:removed_03[15:14] <= removed_03_a;
		1:removed_03[13:12] <= removed_03_a;
		2:removed_03[11:10] <= removed_03_a;
		3:removed_03[9 :8 ] <= removed_03_a;
		4:removed_03[7 :6 ] <= removed_03_a;
		5:removed_03[5 :4 ] <= removed_03_a;
		6:removed_03[3 :2 ] <= removed_03_a;
		7:removed_03[1 :0 ] <= removed_03_a;
		endcase


wire [47:0] buf_tmp;
assign buf_tmp = ({BitStream_buffer_output,BitStream_buffer_output_ex32})/*<<pc_delta*/;
	
always@(posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		BitStream_buffer_output <= 0;	
		end
	else 
		BitStream_buffer_output <= buf_tmp[(47-pc_delta) -: 16];

wire BitStream_buffer_output_ex32_31,BitStream_buffer_output_ex32_30;
wire BitStream_buffer_output_ex32_29,BitStream_buffer_output_ex32_28;
wire BitStream_buffer_output_ex32_27,BitStream_buffer_output_ex32_26;
wire BitStream_buffer_output_ex32_25,BitStream_buffer_output_ex32_24;
wire BitStream_buffer_output_ex32_23,BitStream_buffer_output_ex32_22;
wire BitStream_buffer_output_ex32_21,BitStream_buffer_output_ex32_20;
wire BitStream_buffer_output_ex32_19,BitStream_buffer_output_ex32_18;
wire BitStream_buffer_output_ex32_17,BitStream_buffer_output_ex32_16;
wire BitStream_buffer_output_ex32_15,BitStream_buffer_output_ex32_14;
wire BitStream_buffer_output_ex32_13,BitStream_buffer_output_ex32_12;
wire BitStream_buffer_output_ex32_11,BitStream_buffer_output_ex32_10;
wire BitStream_buffer_output_ex32_9,BitStream_buffer_output_ex32_8;
wire BitStream_buffer_output_ex32_7,BitStream_buffer_output_ex32_6;
wire BitStream_buffer_output_ex32_5,BitStream_buffer_output_ex32_4;
wire BitStream_buffer_output_ex32_3,BitStream_buffer_output_ex32_2;
wire BitStream_buffer_output_ex32_1,BitStream_buffer_output_ex32_0;	

assign BitStream_buffer_output_ex32_31 = BS_buffer[(7'd111 - pc_reg)];
assign BitStream_buffer_output_ex32_30 = BS_buffer[(7'd110 - pc_reg)];
assign BitStream_buffer_output_ex32_29 = BS_buffer[(7'd109 - pc_reg)];
assign BitStream_buffer_output_ex32_28 = BS_buffer[(7'd108 - pc_reg)];
assign BitStream_buffer_output_ex32_27 = BS_buffer[(7'd107 - pc_reg)];
assign BitStream_buffer_output_ex32_26 = BS_buffer[(7'd106 - pc_reg)];
assign BitStream_buffer_output_ex32_25 = BS_buffer[(7'd105 - pc_reg)];
assign BitStream_buffer_output_ex32_24 = BS_buffer[(7'd104 - pc_reg)];
assign BitStream_buffer_output_ex32_23 = BS_buffer[(7'd103 - pc_reg)];
assign BitStream_buffer_output_ex32_22 = BS_buffer[(7'd102 - pc_reg)];
assign BitStream_buffer_output_ex32_21 = BS_buffer[(7'd101 - pc_reg)];
assign BitStream_buffer_output_ex32_20 = BS_buffer[(7'd100 - pc_reg)];
assign BitStream_buffer_output_ex32_19 = BS_buffer[(7'd99 - pc_reg)];
assign BitStream_buffer_output_ex32_18 = BS_buffer[(7'd98 - pc_reg)];
assign BitStream_buffer_output_ex32_17 = BS_buffer[(7'd97 - pc_reg)];
assign BitStream_buffer_output_ex32_16 = BS_buffer[(7'd96 - pc_reg)];
assign BitStream_buffer_output_ex32_15 = BS_buffer[(7'd95 - pc_reg)];
assign BitStream_buffer_output_ex32_14 = BS_buffer[(7'd94 - pc_reg)];
assign BitStream_buffer_output_ex32_13 = BS_buffer[(7'd93 - pc_reg)];
assign BitStream_buffer_output_ex32_12 = BS_buffer[(7'd92 - pc_reg)];
assign BitStream_buffer_output_ex32_11 = BS_buffer[(7'd91 - pc_reg)];
assign BitStream_buffer_output_ex32_10 = BS_buffer[(7'd90 - pc_reg)];
assign BitStream_buffer_output_ex32_9 = BS_buffer[(7'd89 - pc_reg)];
assign BitStream_buffer_output_ex32_8 = BS_buffer[(7'd88 - pc_reg)];
assign BitStream_buffer_output_ex32_7 = BS_buffer[(7'd87 - pc_reg)];
assign BitStream_buffer_output_ex32_6 = BS_buffer[(7'd86 - pc_reg)];
assign BitStream_buffer_output_ex32_5 = BS_buffer[(7'd85 - pc_reg)];
assign BitStream_buffer_output_ex32_4 = BS_buffer[(7'd84 - pc_reg)];
assign BitStream_buffer_output_ex32_3 = BS_buffer[(7'd83 - pc_reg)];
assign BitStream_buffer_output_ex32_2 = BS_buffer[(7'd82 - pc_reg)];
assign BitStream_buffer_output_ex32_1 = BS_buffer[(7'd81 - pc_reg)];
assign BitStream_buffer_output_ex32_0 = BS_buffer[(7'd80 - pc_reg)];
		
assign BitStream_buffer_output_ex32 = {
		BitStream_buffer_output_ex32_31,BitStream_buffer_output_ex32_30,
		BitStream_buffer_output_ex32_29,BitStream_buffer_output_ex32_28,
      BitStream_buffer_output_ex32_27,BitStream_buffer_output_ex32_26,
      BitStream_buffer_output_ex32_25,BitStream_buffer_output_ex32_24,
      BitStream_buffer_output_ex32_23,BitStream_buffer_output_ex32_22,
      BitStream_buffer_output_ex32_21,BitStream_buffer_output_ex32_20,
      BitStream_buffer_output_ex32_19,BitStream_buffer_output_ex32_18,
      BitStream_buffer_output_ex32_17,BitStream_buffer_output_ex32_16,
      BitStream_buffer_output_ex32_15,BitStream_buffer_output_ex32_14,
      BitStream_buffer_output_ex32_13,BitStream_buffer_output_ex32_12,
      BitStream_buffer_output_ex32_11,BitStream_buffer_output_ex32_10,
      BitStream_buffer_output_ex32_9,BitStream_buffer_output_ex32_8,
      BitStream_buffer_output_ex32_7,BitStream_buffer_output_ex32_6,
      BitStream_buffer_output_ex32_5,BitStream_buffer_output_ex32_4,
      BitStream_buffer_output_ex32_3,BitStream_buffer_output_ex32_2,
      BitStream_buffer_output_ex32_1,BitStream_buffer_output_ex32_0};		
		
		
/*
		
reg [6:0] pc_reg ;	
reg pc_flag;	
reg [1:0] pc_flag_32;
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		pc_reg <= 0;	pc_flag <= 0;
		pc_flag_32 <= 0;end
	else begin
		pc_reg <= pc;
		pc_flag <= pc < 7'd113 ? 1'd0 : 1'd1;
		pc_flag_32 <= pc < 7'd81 ? 2'd0 : pc > 7'd111 ? 2'd1 : 2'd2;
		end
		
wire [29:0] BitStream_buffer_output_cy;
wire [15:0] BitStream_buffer_output_f0,BitStream_buffer_output_f1;

assign BitStream_buffer_output_cy = {BS_buffer[14:0],BS_buffer[127:113]};
assign BitStream_buffer_output_f0 = BS_buffer[(127-pc_reg) -: 16];
assign BitStream_buffer_output_f1 = BitStream_buffer_output_cy[(142 - pc_reg)  -: 16];
assign BitStream_buffer_output = pc_flag ? BitStream_buffer_output_f1 : BitStream_buffer_output_f0;


wire [61:0] BitStream_buffer_output_cy32;
wire [31:0] BitStream_buffer_output_f0_32,BitStream_buffer_output_f1_32,BitStream_buffer_output_f2_32;
assign BitStream_buffer_output_cy32 = {BS_buffer[30:0],BS_buffer[127:97]};
assign BitStream_buffer_output_f0_32 = BS_buffer[(111-pc_reg) -: 32];
assign BitStream_buffer_output_f1_32 = BS_buffer[(239-pc_reg) -: 32];
assign BitStream_buffer_output_f2_32 = BitStream_buffer_output_cy32[(142 - pc_reg)  -: 32];
assign BitStream_buffer_output_ex32 = pc_flag_32 == 0 ? BitStream_buffer_output_f0_32 :
					pc_flag_32 == 2'd1 ? BitStream_buffer_output_f1_32 : BitStream_buffer_output_f2_32;
					

*/		
/*
always@(reset_n or pc_reg or BS_buffer)
	if (reset_n == 0)
		BitStream_buffer_output = 0;
	else if(pc_reg < 113)
		BitStream_buffer_output = BS_buffer[(127-pc_reg) -: 16];
	else case(pc_reg)
		113:BitStream_buffer_output = {BS_buffer[14:0],BS_buffer[127]};
		114:BitStream_buffer_output = {BS_buffer[13:0],BS_buffer[127:126]};
		115:BitStream_buffer_output = {BS_buffer[12:0],BS_buffer[127:125]}; 
		116:BitStream_buffer_output = {BS_buffer[11:0],BS_buffer[127:124]};
		117:BitStream_buffer_output = {BS_buffer[10:0],BS_buffer[127:123]};
		118:BitStream_buffer_output = {BS_buffer[9:0],BS_buffer[127:122]};
		119:BitStream_buffer_output = {BS_buffer[8:0],BS_buffer[127:121]};
		120:BitStream_buffer_output = {BS_buffer[7:0],BS_buffer[127:120]};
		121:BitStream_buffer_output = {BS_buffer[6:0],BS_buffer[127:119]};
		122:BitStream_buffer_output = {BS_buffer[5:0],BS_buffer[127:118]};
		123:BitStream_buffer_output = {BS_buffer[4:0],BS_buffer[127:117]};
		124:BitStream_buffer_output = {BS_buffer[3:0],BS_buffer[127:116]};
		125:BitStream_buffer_output = {BS_buffer[2:0],BS_buffer[127:115]}; 
		126:BitStream_buffer_output = {BS_buffer[1:0],BS_buffer[127:114]};
		127:BitStream_buffer_output = {BS_buffer[0],BS_buffer[127:113]};
		default:BitStream_buffer_output = 0;
	endcase
*/

/*always@(reset_n or pc_reg or BS_buffer)
	if (reset_n == 0)
		BitStream_buffer_output_ex32 = 0;
	else if(pc_reg < 81)
		BitStream_buffer_output_ex32 = BS_buffer[(111-pc_reg) -: 32];
	else if(pc_reg > 111)
		BitStream_buffer_output_ex32 = BS_buffer[(239-pc_reg) -: 32];
	else case(pc_reg)
		81:BitStream_buffer_output_ex32 = {BS_buffer[30:0],BS_buffer[127]};
		82:BitStream_buffer_output_ex32 = {BS_buffer[29:0],BS_buffer[127:126]};
		83:BitStream_buffer_output_ex32 = {BS_buffer[28:0],BS_buffer[127:125]};
		84:BitStream_buffer_output_ex32 = {BS_buffer[27:0],BS_buffer[127:124]};
		85:BitStream_buffer_output_ex32 = {BS_buffer[26:0],BS_buffer[127:123]};
		86:BitStream_buffer_output_ex32 = {BS_buffer[25:0],BS_buffer[127:122]};
		87:BitStream_buffer_output_ex32 = {BS_buffer[24:0],BS_buffer[127:121]};
		88:BitStream_buffer_output_ex32 = {BS_buffer[23:0],BS_buffer[127:120]};
		89:BitStream_buffer_output_ex32 = {BS_buffer[22:0],BS_buffer[127:119]};
		90:BitStream_buffer_output_ex32 = {BS_buffer[21:0],BS_buffer[127:118]};
		91:BitStream_buffer_output_ex32 = {BS_buffer[20:0],BS_buffer[127:117]};
		92:BitStream_buffer_output_ex32 = {BS_buffer[19:0],BS_buffer[127:116]};
		93:BitStream_buffer_output_ex32 = {BS_buffer[18:0],BS_buffer[127:115]};
		94:BitStream_buffer_output_ex32 = {BS_buffer[17:0],BS_buffer[127:114]};
		95:BitStream_buffer_output_ex32 = {BS_buffer[16:0],BS_buffer[127:113]};
		96:BitStream_buffer_output_ex32 = {BS_buffer[15:0],BS_buffer[127:112]};
		97:BitStream_buffer_output_ex32 = {BS_buffer[14:0],BS_buffer[127:111]};
		98:BitStream_buffer_output_ex32 = {BS_buffer[13:0],BS_buffer[127:110]};
		99:BitStream_buffer_output_ex32 = {BS_buffer[12:0],BS_buffer[127:109]};
		100:BitStream_buffer_output_ex32 = {BS_buffer[11:0],BS_buffer[127:108]};
		101:BitStream_buffer_output_ex32 = {BS_buffer[10:0],BS_buffer[127:107]};
		102:BitStream_buffer_output_ex32 = {BS_buffer[9:0],BS_buffer[127:106]};
		103:BitStream_buffer_output_ex32 = {BS_buffer[8:0],BS_buffer[127:105]};
		104:BitStream_buffer_output_ex32 = {BS_buffer[7:0],BS_buffer[127:104]};
		105:BitStream_buffer_output_ex32 = {BS_buffer[6:0],BS_buffer[127:103]};
		106:BitStream_buffer_output_ex32 = {BS_buffer[5:0],BS_buffer[127:102]};
		107:BitStream_buffer_output_ex32 = {BS_buffer[4:0],BS_buffer[127:101]};
		108:BitStream_buffer_output_ex32 = {BS_buffer[3:0],BS_buffer[127:100]};
		109:BitStream_buffer_output_ex32 = {BS_buffer[2:0],BS_buffer[127:99]};
		110:BitStream_buffer_output_ex32 = {BS_buffer[1:0],BS_buffer[127:98]};
		111:BitStream_buffer_output_ex32 = {BS_buffer[0],BS_buffer[127:97]};
		default:BitStream_buffer_output_ex32 = 0;
	endcase
*/
endmodule


