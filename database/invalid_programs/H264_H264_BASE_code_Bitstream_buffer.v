`include "timescale.v"
`include "define.v"

module Bitstream_buffer(

input clk,reset_n,
input [15:0] BitStream_buffer_input,
input we,
input [6:0] pc,
input [1:0] remove_03_flag,


output reg next,
output reg [15:0] BitStream_buffer_output,
output reg [31:0] BitStream_buffer_output_ex32,
output reg [15:0] removed_03

);


reg [127:0]BS_buffer;

reg  [2:0] we_count,reset_counter;


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		we_count <= 0;
	else if(we&&next)
		we_count <= we_count+1;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		reset_counter <= 0;
	else if (reset_counter < 5&&we&&next)
		reset_counter <= reset_counter + 1;	





always@(reset_counter or pc or we_count)
	if(reset_counter < 5)
		next = 1;
	else case(pc[6:4])
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


always@(posedge clk or negedge reset_n)
	if (reset_n == 0)
		BitStream_buffer_output <= 0;
	else if(pc < 113)
		BitStream_buffer_output<=BS_buffer[(127-pc) -: 16];
	else case(pc)
		113:BitStream_buffer_output <= {BS_buffer[14:0],BS_buffer[127]};
		114:BitStream_buffer_output <= {BS_buffer[13:0],BS_buffer[127:126]};
		115:BitStream_buffer_output <= {BS_buffer[12:0],BS_buffer[127:125]}; 
		116:BitStream_buffer_output <= {BS_buffer[11:0],BS_buffer[127:124]};
		117:BitStream_buffer_output <= {BS_buffer[10:0],BS_buffer[127:123]};
		118:BitStream_buffer_output <= {BS_buffer[9:0],BS_buffer[127:122]};
		119:BitStream_buffer_output <= {BS_buffer[8:0],BS_buffer[127:121]};
		120:BitStream_buffer_output <= {BS_buffer[7:0],BS_buffer[127:120]};
		121:BitStream_buffer_output <= {BS_buffer[6:0],BS_buffer[127:119]};
		122:BitStream_buffer_output <= {BS_buffer[5:0],BS_buffer[127:118]};
		123:BitStream_buffer_output <= {BS_buffer[4:0],BS_buffer[127:117]};
		124:BitStream_buffer_output <= {BS_buffer[3:0],BS_buffer[127:116]};
		125:BitStream_buffer_output <= {BS_buffer[2:0],BS_buffer[127:115]}; 
		126:BitStream_buffer_output <= {BS_buffer[1:0],BS_buffer[127:114]};
		127:BitStream_buffer_output <= {BS_buffer[0],BS_buffer[127:113]};
		default:;
	endcase

always@(posedge clk or negedge reset_n)
	if (reset_n == 0)
		BitStream_buffer_output_ex32 <= 0;
	else if(pc < 81)
		BitStream_buffer_output_ex32 <= BS_buffer[(111-pc) -: 32];
	else if(pc > 111)
		BitStream_buffer_output_ex32 <= BS_buffer[(239-pc) -: 32];
	else case(pc)
		81:BitStream_buffer_output_ex32 <= {BS_buffer[30:0],BS_buffer[127]};
		82:BitStream_buffer_output_ex32 <= {BS_buffer[29:0],BS_buffer[127:126]};
		83:BitStream_buffer_output_ex32 <= {BS_buffer[28:0],BS_buffer[127:125]};
		84:BitStream_buffer_output_ex32 <= {BS_buffer[27:0],BS_buffer[127:124]};
		85:BitStream_buffer_output_ex32 <= {BS_buffer[26:0],BS_buffer[127:123]};
		86:BitStream_buffer_output_ex32 <= {BS_buffer[25:0],BS_buffer[127:122]};
		87:BitStream_buffer_output_ex32 <= {BS_buffer[24:0],BS_buffer[127:121]};
		88:BitStream_buffer_output_ex32 <= {BS_buffer[23:0],BS_buffer[127:120]};
		89:BitStream_buffer_output_ex32 <= {BS_buffer[22:0],BS_buffer[127:119]};
		90:BitStream_buffer_output_ex32 <= {BS_buffer[21:0],BS_buffer[127:118]};
		91:BitStream_buffer_output_ex32 <= {BS_buffer[20:0],BS_buffer[127:117]};
		92:BitStream_buffer_output_ex32 <= {BS_buffer[19:0],BS_buffer[127:116]};
		93:BitStream_buffer_output_ex32 <= {BS_buffer[18:0],BS_buffer[127:115]};
		94:BitStream_buffer_output_ex32 <= {BS_buffer[17:0],BS_buffer[127:114]};
		95:BitStream_buffer_output_ex32 <= {BS_buffer[16:0],BS_buffer[127:113]};
		96:BitStream_buffer_output_ex32 <= {BS_buffer[15:0],BS_buffer[127:112]};
		97:BitStream_buffer_output_ex32 <= {BS_buffer[14:0],BS_buffer[127:111]};
		98:BitStream_buffer_output_ex32 <= {BS_buffer[13:0],BS_buffer[127:110]};
		99:BitStream_buffer_output_ex32 <= {BS_buffer[12:0],BS_buffer[127:109]};
		100:BitStream_buffer_output_ex32 <= {BS_buffer[11:0],BS_buffer[127:108]};
		101:BitStream_buffer_output_ex32 <= {BS_buffer[10:0],BS_buffer[127:107]};
		102:BitStream_buffer_output_ex32 <= {BS_buffer[9:0],BS_buffer[127:106]};
		103:BitStream_buffer_output_ex32 <= {BS_buffer[8:0],BS_buffer[127:105]};
		104:BitStream_buffer_output_ex32 <= {BS_buffer[7:0],BS_buffer[127:104]};
		105:BitStream_buffer_output_ex32 <= {BS_buffer[6:0],BS_buffer[127:103]};
		106:BitStream_buffer_output_ex32 <= {BS_buffer[5:0],BS_buffer[127:102]};
		107:BitStream_buffer_output_ex32 <= {BS_buffer[4:0],BS_buffer[127:101]};
		108:BitStream_buffer_output_ex32 <= {BS_buffer[3:0],BS_buffer[127:100]};
		109:BitStream_buffer_output_ex32 <= {BS_buffer[2:0],BS_buffer[127:99]};
		110:BitStream_buffer_output_ex32 <= {BS_buffer[1:0],BS_buffer[127:98]};
		111:BitStream_buffer_output_ex32 <= {BS_buffer[0],BS_buffer[127:97]};
		default:;
	endcase







endmodule


