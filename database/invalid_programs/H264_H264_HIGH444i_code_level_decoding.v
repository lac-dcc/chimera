`include "timescale.v"
`include "define.v"

module level_decoding (clk,reset_n,cavlc_decoder_state,heading_one_pos,i_level,
	TotalCoeff,TrailingOnes,BitStream_buffer_output,
	levelSuffixSize,BitStream_buffer_output_ex32,
	level_0,level_1,level_2, level_3, level_4, level_5, level_6, level_7,
	level_8,level_9,level_10,level_11,level_12,level_13,level_14,level_15);

input clk,reset_n;
input [3:0] cavlc_decoder_state; 
input [3:0] heading_one_pos;
input [3:0] i_level;
input [4:0] TotalCoeff;
input [1:0] TrailingOnes;
input [15:0] BitStream_buffer_output;
input [31:0] BitStream_buffer_output_ex32;
output reg [3:0] levelSuffixSize;
output reg [15:0] level_0,level_1,level_2,level_3,level_4,level_5,level_6,level_7;
output reg [15:0] level_8,level_9,level_10,level_11,level_12,level_13,level_14,level_15;
	

reg [4:0] level_prefix;
reg [3:0] suffixLength,suffixLength_reg;
reg [12:0] level_suffix;
reg [15:0] levelCode;
reg [15:0] level_tmp;
reg [15:0] levelCode_tmp;
wire [47:0] stream_buf;
wire [15:0] buf_suf;
reg [15:0] level_abs_tmp;

assign stream_buf = {BitStream_buffer_output,BitStream_buffer_output_ex32};
assign buf_suf = stream_buf[(6'd46 - {2'd0,heading_one_pos}) -: 16];



//@LevelPrefix,latch the result
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		level_prefix <= 0;
	else if (cavlc_decoder_state == `LevelPrefix || cavlc_decoder_state == `LevelSuffix)
		level_prefix <= {1'b0,heading_one_pos};

		
reg [14:0] suf_leftshift;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		suffixLength_reg  <= 0;
		suf_leftshift		<= 0;end
	else	begin
		suffixLength_reg <= suffixLength;
		suf_leftshift	  <= (15'd3 << (suffixLength - 4'd1)) - 15'd1;end 


wire [14:0] levelCode_half;
assign levelCode_half = levelCode[15:1];

always@(cavlc_decoder_state or TotalCoeff or TrailingOnes or suffixLength_reg or levelCode_half
			or suf_leftshift)
	if (cavlc_decoder_state == `LevelPrefix)
		suffixLength = (TotalCoeff > 10 && TrailingOnes < 3)? 4'd1:4'd0;
	else if (cavlc_decoder_state == `LevelSuffix)begin
		if(suffixLength_reg == 0 && levelCode_half > 15'd2)
			suffixLength = 4'd2;
		else if (suffixLength_reg == 0)
			suffixLength = 4'd1;
		else if ((levelCode_half > suf_leftshift) && suffixLength_reg < 6)
			suffixLength = suffixLength_reg + 4'd1;
		else    suffixLength = suffixLength_reg;
	end
	else suffixLength = suffixLength_reg;

//@LevelSuffix,temporary result
always @ (cavlc_decoder_state  or suffixLength or heading_one_pos)
	if (cavlc_decoder_state == `LevelPrefix || cavlc_decoder_state == `LevelSuffix)begin
		if (heading_one_pos == 4'd14 && suffixLength == 0)
			levelSuffixSize = 4'd4;
		else if (heading_one_pos == 4'd15)
			levelSuffixSize = 4'd12;
		/*else if (heading_one_pos == 5'd16)
			levelSuffixSize = 4'd13;*/
		else 
			levelSuffixSize = suffixLength;
	end
	else levelSuffixSize = 0 ;

reg [12:0] level_suffix_r;

always@(reset_n or cavlc_decoder_state or levelSuffixSize or buf_suf)
	if (reset_n == 0)
		level_suffix_r = 0;
	else if(cavlc_decoder_state == `LevelPrefix || cavlc_decoder_state == `LevelSuffix)begin
		if(levelSuffixSize == 0)
			level_suffix_r = 0;
		else 
			case(levelSuffixSize)
			1 :level_suffix_r = {12'b0,buf_suf[15]};
			2 :level_suffix_r = {11'b0,buf_suf[15:14]};
			3 :level_suffix_r = {10'b0,buf_suf[15:13]};
			4 :level_suffix_r = {9'b0,buf_suf[15:12]};
			5 :level_suffix_r = {8'b0,buf_suf[15:11]};
			6 :level_suffix_r = {7'b0,buf_suf[15:10]};
			7 :level_suffix_r = {6'b0,buf_suf[15:9]};
			8 :level_suffix_r = {5'b0,buf_suf[15:8]};
			9 :level_suffix_r = {4'b0,buf_suf[15:7]};
			10:level_suffix_r = {3'b0,buf_suf[15:6]};
			11:level_suffix_r = {2'b0,buf_suf[15:5]};
			12:level_suffix_r = {1'b0,buf_suf[15:4]};
			13:level_suffix_r = buf_suf[15:3];
			default:level_suffix_r = 0;
			endcase
	end
	else level_suffix_r = 0;

//@LevelSuffix,temporay result
always	@ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		level_suffix <= 0;
	else
		level_suffix <= level_suffix_r;
	
always@ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		levelCode_tmp <= 0;
	else if(cavlc_decoder_state == `LevelSuffix || cavlc_decoder_state == `LevelPrefix)
		levelCode_tmp <= ({12'b0,heading_one_pos} << suffixLength) + {3'b0,level_suffix_r};

always @ (cavlc_decoder_state or level_prefix or suffixLength_reg or i_level or TrailingOnes or levelCode_tmp)
	if (cavlc_decoder_state == `LevelSuffix)begin
		if (level_prefix == 15 && suffixLength_reg == 0 && i_level == {2'b0,TrailingOnes} && TrailingOnes < 3)
			levelCode = levelCode_tmp + 16'd17;
		else if (level_prefix == 15 && suffixLength_reg == 0)
			levelCode = levelCode_tmp + 16'd15;
		else if (i_level == {2'b0,TrailingOnes} && TrailingOnes < 3)
			levelCode = levelCode_tmp + 16'd2;
		else 
			levelCode = levelCode_tmp;
	end
	else
		levelCode = 0;	


always @ (cavlc_decoder_state or levelCode)
	if (cavlc_decoder_state == `LevelSuffix)begin 
		if (levelCode[0] == 1'b0) //even
			level_abs_tmp = levelCode + 16'd2;
		else
			level_abs_tmp = levelCode + 16'd1;
	end
	else
		level_abs_tmp = 0;
	
			
always @ (cavlc_decoder_state or levelCode or level_abs_tmp)
	if (cavlc_decoder_state == `LevelSuffix)begin 
		if (levelCode[0] == 1'b0) //even
			level_tmp = {1'b0,level_abs_tmp[15:1]};
		else
			level_tmp = {1'b1,~levelCode[15:1]};
	end
	else
		level_tmp = 0;
	
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		level_0 <= 0;	level_1 <= 0;	level_2 <= 0;	level_3 <= 0;
		level_4 <= 0;	level_5 <= 0;	level_6 <= 0;	level_7 <= 0;
		level_8 <= 0;	level_9 <= 0;	level_10<= 0;	level_11<= 0;
		level_12<= 0;	level_13<= 0;	level_14<= 0;	level_15<= 0;end
	else if (cavlc_decoder_state == `TrailingOnesSignFlag)begin
		level_0 <= (BitStream_buffer_output[15] == 0)? 16'b1:16'b1111_1111_1111_1111;
		if (TrailingOnes > 1)
			level_1 <= (BitStream_buffer_output[14] == 0)? 16'b1:16'b1111_1111_1111_1111;
		if (TrailingOnes == 3)
			level_2 <= (BitStream_buffer_output[13] == 0)? 16'b1:16'b1111_1111_1111_1111;
	end
	else if (cavlc_decoder_state == `LevelSuffix)
		case (i_level)
		0 :level_0 <= level_tmp;
		1 :level_1 <= level_tmp;
		2 :level_2 <= level_tmp;
		3 :level_3 <= level_tmp;
		4 :level_4 <= level_tmp;
		5 :level_5 <= level_tmp;
		6 :level_6 <= level_tmp;
		7 :level_7 <= level_tmp;
		8 :level_8 <= level_tmp;
		9 :level_9 <= level_tmp;
		10:level_10<= level_tmp;
		11:level_11<= level_tmp;
		12:level_12<= level_tmp;
		13:level_13<= level_tmp;
		14:level_14<= level_tmp;
		15:level_15<= level_tmp;
		endcase

endmodule					
		

			
	
