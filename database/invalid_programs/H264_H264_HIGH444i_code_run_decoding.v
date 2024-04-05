`include "timescale.v"
`include "define.v"

module run_decoding (clk,reset_n,cavlc_decoder_state,BitStream_buffer_output,total_zeros,
	level_0,level_1,level_2,level_3,level_4,level_5,level_6,level_7,
	level_8,level_9,level_10,level_11,level_12,level_13,level_14,level_15,
	TotalCoeff,i_run,i_TotalCoeff,
	
	run_of_zeros_len,zerosLeft,
	coeffLevel_0,coeffLevel_1,coeffLevel_2, coeffLevel_3, coeffLevel_4, coeffLevel_5, coeffLevel_6, coeffLevel_7,
	coeffLevel_8,coeffLevel_9,coeffLevel_10,coeffLevel_11,coeffLevel_12,coeffLevel_13,coeffLevel_14,coeffLevel_15
);
input clk,reset_n;
input [3:0] cavlc_decoder_state;
input [15:0] BitStream_buffer_output;
input [3:0] total_zeros;
input [15:0] level_0,level_1,level_2,level_3,level_4,level_5,level_6,level_7;
input [15:0] level_8,level_9,level_10,level_11,level_12,level_13,level_14,level_15;
input [4:0] TotalCoeff;
input [3:0] i_run;
input [3:0] i_TotalCoeff;

output [3:0] run_of_zeros_len;
output [3:0] zerosLeft;
output [15:0] coeffLevel_0, coeffLevel_1, coeffLevel_2,coeffLevel_3, coeffLevel_4, coeffLevel_5, coeffLevel_6;
output [15:0] coeffLevel_7, coeffLevel_8, coeffLevel_9,coeffLevel_10,coeffLevel_11,coeffLevel_12,coeffLevel_13;
output [15:0] coeffLevel_14,coeffLevel_15;
	
reg [3:0] run_of_zeros_len;
reg [3:0] zerosLeft;
reg [3:0] run;
	
reg [3:0] run_before;
reg [3:0] zerosLeft_reg;

reg [3:0] run_0,run_1,run_2,run_3,run_4,run_5,run_6,run_7;
reg [3:0] run_8,run_9,run_10,run_11,run_12,run_13,run_14;

//reg [3:0] run_i [15:0];

reg [15:0] level_output;
	
//decoding Table 9-10
always @ (cavlc_decoder_state or zerosLeft or BitStream_buffer_output) 
	if (cavlc_decoder_state == `run_before_LUT || cavlc_decoder_state == `RunOfZeros)
		case (zerosLeft)
		0:run_of_zeros_len = 0;//special case added for "total_zeros==0"
		1:run_of_zeros_len = 1;
		2:run_of_zeros_len = (BitStream_buffer_output[15] == 1)? 4'd1:4'd2;
		3:run_of_zeros_len = 2;
		4:run_of_zeros_len = (BitStream_buffer_output[15:14] == 2'b00)? 4'd3:4'd2;
		5:run_of_zeros_len = (BitStream_buffer_output[15] == 1)? 4'd2:4'd3;
		6:run_of_zeros_len = (BitStream_buffer_output[15:14] == 2'b11)? 4'd2:4'd3;
		default:
			if (BitStream_buffer_output[15] == 1 || BitStream_buffer_output[14] == 1 || BitStream_buffer_output[13] == 1)			
                              run_of_zeros_len = 3;
			else if (BitStream_buffer_output[15:12] == 1)	run_of_zeros_len = 4;
			else if (BitStream_buffer_output[15:11] == 1)	run_of_zeros_len = 5;
			else if (BitStream_buffer_output[15:10] == 1)	run_of_zeros_len = 6;
			else if (BitStream_buffer_output[15:9]  == 1)	run_of_zeros_len = 7;
			else if (BitStream_buffer_output[15:8]  == 1)	run_of_zeros_len = 4'd8;
			else if (BitStream_buffer_output[15:7]  == 1)	run_of_zeros_len = 4'd9;
			else if (BitStream_buffer_output[15:6]  == 1)	run_of_zeros_len = 4'd10;
			else if (BitStream_buffer_output[15:5]  == 1)	run_of_zeros_len = 4'd11;
			else                                          run_of_zeros_len = 0;
		endcase
	else
		run_of_zeros_len = 0; 
			
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		run_before <= 0;
	else if (cavlc_decoder_state == `run_before_LUT || cavlc_decoder_state == `RunOfZeros)
		case (zerosLeft)
		0:run_before <= 0;
		1:run_before <= (BitStream_buffer_output[15] == 0)? 4'd1:4'd0;
		2:	if      (BitStream_buffer_output[15] == 1)        run_before <= 0;					
			else if (BitStream_buffer_output[15:14] == 2'b01)	run_before <= 1;
			else                                              run_before <= 2;	
		3:case (BitStream_buffer_output[15:14])
			2'b00:run_before <= 3;
			2'b01:run_before <= 2;
			2'b10:run_before <= 1;
			2'b11:run_before <= 0;
			endcase
		4:case (BitStream_buffer_output[15:14])
			2'b00:run_before <= (BitStream_buffer_output[13] == 1)? 4'd3:4'd4;
			2'b01:run_before <= 2;
			2'b10:run_before <= 1;
			2'b11:run_before <= 0;
			endcase
		5:case (BitStream_buffer_output[15:14])
			2'b00:run_before <= (BitStream_buffer_output[13] == 1)? 4'd4:4'd5;
			2'b01:run_before <= (BitStream_buffer_output[13] == 1)? 4'd2:4'd3;
			2'b10:run_before <= 1;
			2'b11:run_before <= 0;
			endcase
		6:case (BitStream_buffer_output[15:13])
			3'b110,3'b111:run_before <= 0;
			3'b000:run_before <= 1;
			3'b001:run_before <= 2;
			3'b011:run_before <= 3;
			3'b010:run_before <= 4;
			3'b101:run_before <= 5;
			3'b100:run_before <= 6;
			endcase
		default:
			case (BitStream_buffer_output[15:13])
			3'b000:run_before <= run_of_zeros_len + 4'd3;
			3'b111:run_before <= 0;
			3'b110:run_before <= 1;
			3'b101:run_before <= 2;
			3'b100:run_before <= 3;
			3'b011:run_before <= 4;
			3'b010:run_before <= 5;
			3'b001:run_before <= 6;
			endcase
		endcase
			
always @ (cavlc_decoder_state or total_zeros or run_before or zerosLeft_reg)
	if (cavlc_decoder_state == `run_before_LUT)
		zerosLeft = total_zeros; 
	else if (cavlc_decoder_state == `RunOfZeros)
		zerosLeft = zerosLeft_reg - run_before;
	else 
		zerosLeft = 0;
			
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		zerosLeft_reg <= 0;
	else if (cavlc_decoder_state == `run_before_LUT || cavlc_decoder_state == `RunOfZeros)
		zerosLeft_reg <= zerosLeft;
						 
	
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		run_0  <= 0;	run_1  <= 0;	run_2  <= 0;	run_3   <= 0;	
		run_4  <= 0;	run_5  <= 0;	run_6  <= 0;	run_7   <= 0;
		run_8  <= 0;	run_9  <= 0;	run_10 <= 0;	run_11  <= 0;
		run_12 <= 0;	run_13 <= 0;	run_14 <= 0;	end
	else if (cavlc_decoder_state == `NumCoeffTrailingOnes_LUT) begin
		run_0  <= 0;	run_1  <= 0;	run_2  <= 0;	run_3   <= 0;	
		run_4  <= 0;	run_5  <= 0;	run_6  <= 0;	run_7   <= 0;
		run_8  <= 0;	run_9  <= 0;	run_10 <= 0;	run_11  <= 0;
		run_12 <= 0;	run_13 <= 0;	run_14 <= 0;	end
	else if (cavlc_decoder_state == `RunOfZeros)begin
		if (TotalCoeff == 1)
			run_0  <= total_zeros;
		else if (total_zeros == 0)begin
			run_0  <= 0;	run_1  <= 0;	run_2  <= 0;	run_3   <= 0;	
			run_4  <= 0;	run_5  <= 0;	run_6  <= 0;	run_7   <= 0;
			run_8  <= 0;	run_9  <= 0;	run_10 <= 0;	run_11  <= 0;
			run_12 <= 0;	run_13 <= 0;	run_14 <= 0;	end
		else if ({1'b0,i_run} == TotalCoeff - 2)
			case (i_run)
			0 :begin	run_0 <= run_before;	run_1 <= zerosLeft;	end
			1 :begin	run_1 <= run_before;	run_2 <= zerosLeft;	end
			2 :begin	run_2 <= run_before;	run_3 <= zerosLeft;	end
			3 :begin	run_3 <= run_before;	run_4 <= zerosLeft;	end
			4 :begin	run_4 <= run_before;	run_5 <= zerosLeft;	end
			5 :begin	run_5 <= run_before;	run_6 <= zerosLeft;	end
			6 :begin	run_6 <= run_before;	run_7 <= zerosLeft;	end
			7 :begin	run_7 <= run_before;	run_8 <= zerosLeft;	end
			8 :begin	run_8 <= run_before;	run_9 <= zerosLeft;	end
			9 :begin	run_9 <= run_before;	run_10<= zerosLeft;	end
			10:begin	run_10<= run_before;	run_11<= zerosLeft;	end
			11:begin	run_11<= run_before;	run_12<= zerosLeft;	end
			12:begin	run_12<= run_before;	run_13<= zerosLeft;	end
			13:begin	run_13<= run_before;	run_14<= zerosLeft;	end
			default:;
			endcase
		else
			case (i_run)
			0 :run_0 <= run_before;
			1 :run_1 <= run_before;
			2 :run_2 <= run_before;
			3 :run_3 <= run_before;
			4 :run_4 <= run_before;
			5 :run_5 <= run_before;
			6 :run_6 <= run_before;
			7 :run_7 <= run_before;
			8 :run_8 <= run_before;
			9 :run_9 <= run_before;
			10:run_10<= run_before;
			11:run_11<= run_before;
			12:run_12<= run_before; 
			13:run_13<= run_before;
			default:;
			endcase
	end

	
	
	
wire [3:0] runadd_12to7,runadd_6to3,runadd_9to7,runadd_13to11,runadd_2to1,runadd_12to10;
wire [3:0] runadd_14to13,runadd_11to10,runadd_6to4,runadd_8to7;	
reg [3:0] coeffidx_0,coeffidx_1,coeffidx_2,coeffidx_3;
reg [3:0] coeffidx_4,coeffidx_5,coeffidx_6,coeffidx_7;	
reg [3:0] coeffidx_8,coeffidx_9,coeffidx_10,coeffidx_11;	
reg [3:0] coeffidx_12,coeffidx_13,coeffidx_14;	
	
always@(posedge clk or negedge reset_n)
	if(reset_n == 0)begin
		coeffidx_0 <= 4'd14;	coeffidx_1 <= 4'd13;	coeffidx_2 <= 4'd12;	coeffidx_3 <= 4'd11;	
		coeffidx_4 <= 4'd10;	coeffidx_5 <= 4'd9;	coeffidx_6 <= 4'd8;	coeffidx_7 <= 4'd7;	
		coeffidx_8 <= 4'd6;	coeffidx_9 <= 4'd5;	coeffidx_10 <= 4'd4;	coeffidx_11 <= 4'd3;	
		coeffidx_12 <= 4'd2;	coeffidx_13 <= 4'd1;	coeffidx_14 <= 0;	end
	else if(cavlc_decoder_state == `NumCoeffTrailingOnes_LUT)begin
			coeffidx_0 <= 4'd14;	coeffidx_1 <= 4'd13;	coeffidx_2 <= 4'd12;	coeffidx_3 <= 4'd11;	
			coeffidx_4 <= 4'd10;	coeffidx_5 <= 4'd9;	coeffidx_6 <= 4'd8;	coeffidx_7 <= 4'd7;	
			coeffidx_8 <= 4'd6;	coeffidx_9 <= 4'd5;	coeffidx_10 <= 4'd4;	coeffidx_11 <= 4'd3;	
			coeffidx_12 <= 4'd2;	coeffidx_13 <= 4'd1;	coeffidx_14 <= 0;	end
	else if(cavlc_decoder_state == `run_cal)
			case({TotalCoeff - 5'd1})
			0:begin  coeffidx_0 <= run_0;end
			1:begin  coeffidx_1 <= run_1; coeffidx_0 <= run_1 + run_0 + 4'd1;end
			2:begin  coeffidx_2 <= run_2; coeffidx_1 <= runadd_2to1 + 4'd1;
						coeffidx_0 <= runadd_2to1 + run_0 + 4'd2;end
			3:begin  coeffidx_3 <= run_3; coeffidx_2 <= run_3 + run_2 + 4'd1;
						coeffidx_1 <= run_3 + runadd_2to1 + 4'd2;
						coeffidx_0 <= run_3 + runadd_2to1 + run_0 + 4'd3;end
			4:begin  coeffidx_4 <= run_4; coeffidx_3 <= run_4 + run_3 + 4'd1;
						coeffidx_2 <= run_4 + run_3 + run_2 + 4'd2;
						coeffidx_1 <= run_4 + run_3 + runadd_2to1 + 4'd3;
						coeffidx_0 <= run_4 + run_3 + runadd_2to1 + run_0 + 4'd4;end
			5:begin  coeffidx_5 <= run_5; coeffidx_4 <= run_5 + run_4 + 4'd1;
						coeffidx_3 <= run_5 + run_4 + run_3 + 4'd2;
						coeffidx_2 <= run_5 + run_4 + run_3 + run_2 + 4'd3;
						coeffidx_1 <= run_5 + run_4 + run_3 + runadd_2to1 + 4'd4;
						coeffidx_0 <= run_5 + run_4 + run_3 + runadd_2to1 + run_0 + 4'd5;end
			6:begin  coeffidx_6 <= run_6; coeffidx_5 <= run_6 + run_5 + 4'd1;
						coeffidx_4 <= runadd_6to4 + 4'd2;
						coeffidx_3 <= runadd_6to3 + 4'd3;
						coeffidx_2 <= runadd_6to3 + run_2 + 4'd4;
						coeffidx_1 <= runadd_6to3 + runadd_2to1 + 4'd5;
						coeffidx_0 <= runadd_6to3 + runadd_2to1 + run_0 + 4'd6;end
			7:begin  coeffidx_7 <= run_7; coeffidx_6 <= run_7 + run_6 + 4'd1;
						coeffidx_5 <= run_7 + run_6 + run_5 + 4'd2;
						coeffidx_4 <= run_7 + runadd_6to4 + 4'd3;
						coeffidx_3 <= run_7 + runadd_6to3 + 4'd4;
						coeffidx_2 <= run_7 + runadd_6to3 + run_2 + 4'd5;
						coeffidx_1 <= run_7 + runadd_6to3 + runadd_2to1 + 4'd6;
						coeffidx_0 <= run_7 + runadd_6to3 + runadd_2to1 + run_0 + 4'd7;end
			8:begin  coeffidx_8 <= run_8; coeffidx_7 <= runadd_8to7 + 4'd1;
						coeffidx_6 <= runadd_8to7 + run_6 + 4'd2;
						coeffidx_5 <= runadd_8to7 + run_6 + run_5 + 4'd3;
						coeffidx_4 <= runadd_8to7 + runadd_6to4 + 4'd4;
						coeffidx_3 <= runadd_8to7 + runadd_6to3 + 4'd5;
						coeffidx_2 <= runadd_8to7 + runadd_6to3 + run_2 + 4'd6;
						coeffidx_1 <= runadd_8to7 + runadd_6to3 + runadd_2to1 + 4'd7;
						coeffidx_0 <= runadd_8to7 + runadd_6to3 + runadd_2to1 + run_0 + 4'd8;end
			9:begin  coeffidx_9 <= run_9; coeffidx_8 <= run_9 + run_8 + 4'd1;
						coeffidx_7 <= runadd_9to7 + 4'd2;
						coeffidx_6 <= runadd_9to7 + run_6 + 4'd3;
						coeffidx_5 <= runadd_9to7 + run_6 + run_5 + 4'd4;
						coeffidx_4 <= runadd_9to7 + runadd_6to4 + 4'd5;
						coeffidx_3 <= runadd_9to7 + runadd_6to3 + 4'd6;
						coeffidx_2 <= runadd_9to7 + runadd_6to3 + run_2 + 4'd7;
						coeffidx_1 <= runadd_9to7 + runadd_6to3 + runadd_2to1 + 4'd8;
						coeffidx_0 <= runadd_9to7 + runadd_6to3 + runadd_2to1 + run_0 + 4'd9;end
			10:begin coeffidx_10 <= run_10; coeffidx_9 <= run_10 + run_9 + 4'd1;
						coeffidx_8 <= run_10 + run_9 + run_8 + 4'd2;
						coeffidx_7 <= run_10 + runadd_9to7 + 4'd3;
						coeffidx_6 <= run_10 + runadd_9to7 + run_6 + 4'd4;
						coeffidx_5 <= run_10 + runadd_9to7 + run_6 + run_5 + 4'd5;
						coeffidx_4 <= run_10 + runadd_9to7 + runadd_6to4 + 4'd6;
						coeffidx_3 <= run_10 + runadd_9to7 + runadd_6to3 + 4'd7;
						coeffidx_2 <= run_10 + runadd_9to7 + runadd_6to3 + run_2 + 4'd8;
						coeffidx_1 <= run_10 + runadd_9to7 + runadd_6to3 + runadd_2to1 + 4'd9;
						coeffidx_0 <= run_10 + runadd_9to7 + runadd_6to3 + runadd_2to1 + run_0 + 4'd10;end
			11:begin coeffidx_11 <= run_11; coeffidx_10 <= runadd_11to10 + 4'd1;
						coeffidx_9 <= runadd_11to10 + run_9 + 4'd2;
						coeffidx_8 <= runadd_11to10 + run_9 + run_8 + 4'd3;
						coeffidx_7 <= runadd_11to10 + runadd_9to7 + 4'd4;
						coeffidx_6 <= runadd_11to10 + runadd_9to7 + run_6 + 4'd5;
						coeffidx_5 <= runadd_11to10 + runadd_9to7 + run_6 + run_5 + 4'd6;
						coeffidx_4 <= runadd_11to10 + runadd_9to7 + runadd_6to4 + 4'd7;
						coeffidx_3 <= runadd_11to10 + runadd_9to7 + runadd_6to3 + 4'd8;
						coeffidx_2 <= runadd_11to10 + runadd_9to7 + runadd_6to3 + run_2 + 4'd9;
						coeffidx_1 <= runadd_11to10 + runadd_9to7 + runadd_6to3 + runadd_2to1 + 4'd10;
						coeffidx_0 <= runadd_11to10 + runadd_9to7 + runadd_6to3 + runadd_2to1 + run_0 + 4'd11;end
			12:begin coeffidx_12 <= run_12; coeffidx_11 <= run_12 + run_11 + 4'd1;
						coeffidx_10<= runadd_12to10 + 4'd2;
						coeffidx_9 <= runadd_12to10 + run_9 + 4'd3;
						coeffidx_8 <= runadd_12to10 + run_9 + run_8 + 4'd4;
						coeffidx_7 <= runadd_12to7 + 4'd5;
						coeffidx_6 <= runadd_12to7 + run_6 + 4'd6;
						coeffidx_5 <= runadd_12to7 + run_6 + run_5 + 4'd7;
						coeffidx_4 <= runadd_12to7 + runadd_6to4 + 4'd8;
						coeffidx_3 <= runadd_12to7 + runadd_6to3 + 4'd9;
						coeffidx_2 <= runadd_12to7 + runadd_6to3 + run_2 + 4'd10;
						coeffidx_1 <= runadd_12to7 + runadd_6to3 + runadd_2to1 + 4'd11;
						coeffidx_0 <= runadd_12to7 + runadd_6to3 + runadd_2to1 + run_0 + 4'd12;end
			13:begin coeffidx_13 <= run_13; coeffidx_12 <= run_13 + run_12 + 4'd1;
						coeffidx_11<= runadd_13to11 + 4'd2;
						coeffidx_10<= runadd_13to11 + run_10 + 4'd3;
						coeffidx_9 <= runadd_13to11 + run_10 + run_9 + 4'd4;
						coeffidx_8 <= runadd_13to11 + run_10 + run_9 + run_8 + 4'd5;
						coeffidx_7 <= run_13 + runadd_12to7 + 4'd6;
						coeffidx_6 <= run_13 + runadd_12to7 + run_6 + 4'd7;
						coeffidx_5 <= run_13 + runadd_12to7 + run_6 + run_5 + 4'd8;
						coeffidx_4 <= run_13 + runadd_12to7 + runadd_6to4 + 4'd9;
						coeffidx_3 <= run_13 + runadd_12to7 + runadd_6to3 + 4'd10;
						coeffidx_2 <= run_13 + runadd_12to7 + runadd_6to3 + run_2 + 4'd11;
						coeffidx_1 <= run_13 + runadd_12to7 + runadd_6to3 + runadd_2to1 + 4'd12;
						coeffidx_0 <= run_13 + runadd_12to7 + runadd_6to3 + runadd_2to1 + run_0 + 4'd13;end
			14:begin coeffidx_14 <= run_14; coeffidx_13 <= runadd_14to13 + 4'd1;
						coeffidx_12<= runadd_14to13 + run_12 + 4'd2;
						coeffidx_11<= run_14 + runadd_13to11 + 4'd3;
						coeffidx_10<= runadd_14to13 + runadd_12to10 + 4'd4;
						coeffidx_9 <= runadd_14to13 + runadd_12to10 + run_9 + 4'd5;
						coeffidx_8 <= runadd_14to13 + runadd_12to10 + run_9 + run_8 + 4'd6;
						coeffidx_7 <= runadd_14to13 + runadd_12to7 + 4'd7;
						coeffidx_6 <= runadd_14to13 + runadd_12to7 + run_6 + 4'd8;
						coeffidx_5 <= runadd_14to13 + runadd_12to7 + run_6 + run_5 + 4'd9;
						coeffidx_4 <= runadd_14to13 + runadd_12to7 + runadd_6to4 + 4'd10;
						coeffidx_3 <= runadd_14to13 + runadd_12to7 + runadd_6to3 + 4'd11;
						coeffidx_2 <= runadd_14to13 + runadd_12to7 + runadd_6to3 + run_2 + 4'd12;
						coeffidx_1 <= runadd_14to13 + runadd_12to7 + runadd_6to3 + runadd_2to1 + 4'd13;
						coeffidx_0 <= runadd_14to13 + runadd_12to7 + runadd_6to3 + runadd_2to1 + run_0 + 4'd14;end
			default:;
			endcase


assign runadd_12to7 = runadd_12to10 + runadd_9to7;
assign runadd_12to10 = run_12 + run_11 + run_10;
assign runadd_8to7 = run_8 + run_7;
assign runadd_9to7 = run_9 + run_8 + run_7;
assign runadd_13to11= run_13 + run_12 + run_11;
assign runadd_14to13 = run_14 + run_13;
assign runadd_11to10 = run_11 + run_10;
assign runadd_2to1  = run_2 + run_1;
assign runadd_6to4 =  run_6 + run_5 + run_4;
assign runadd_6to3  = runadd_6to4 + run_3;

reg [15:0] coeffLevel_i [15:0] ;

always@(posedge clk or negedge reset_n)
	if(reset_n == 0)begin
		coeffLevel_i[0]  <= 0;	coeffLevel_i[1]  <= 0;	coeffLevel_i[2]  <= 0;	coeffLevel_i[3]   <= 0;	
		coeffLevel_i[4]  <= 0;	coeffLevel_i[5]  <= 0;	coeffLevel_i[6]  <= 0;	coeffLevel_i[7]   <= 0;
		coeffLevel_i[8]  <= 0;	coeffLevel_i[9]  <= 0;	coeffLevel_i[10] <= 0;	coeffLevel_i[11]  <= 0;
		coeffLevel_i[12] <= 0;	coeffLevel_i[13] <= 0;	coeffLevel_i[14] <= 0;	coeffLevel_i[15]  <= 0;end
	else if (cavlc_decoder_state == `NumCoeffTrailingOnes_LUT ||cavlc_decoder_state == `cavlc_0)begin
		coeffLevel_i[0]  <= 0;	coeffLevel_i[1]  <= 0;	coeffLevel_i[2]  <= 0;	coeffLevel_i[3]   <= 0;	
		coeffLevel_i[4]  <= 0;	coeffLevel_i[5]  <= 0;	coeffLevel_i[6]  <= 0;	coeffLevel_i[7]   <= 0;
		coeffLevel_i[8]  <= 0;	coeffLevel_i[9]  <= 0;	coeffLevel_i[10] <= 0;	coeffLevel_i[11]  <= 0;
		coeffLevel_i[12] <= 0;	coeffLevel_i[13] <= 0;	coeffLevel_i[14] <= 0;	coeffLevel_i[15]  <= 0;end
	else if (cavlc_decoder_state == `LevelRunCombination)begin
		if(i_TotalCoeff == 4'd15)begin
			coeffLevel_i[0] <= level_15;coeffLevel_i[1] <= level_14;coeffLevel_i[2] <= level_13;coeffLevel_i[3] <= level_12;	
			coeffLevel_i[4] <= level_11;coeffLevel_i[5] <= level_10;coeffLevel_i[6] <= level_9; coeffLevel_i[7] <= level_8;
			coeffLevel_i[8] <= level_7; coeffLevel_i[9] <= level_6; coeffLevel_i[10]<= level_5; coeffLevel_i[11]<= level_4;
			coeffLevel_i[12]<= level_3; coeffLevel_i[13]<= level_2; coeffLevel_i[14]<= level_1; coeffLevel_i[15]<= level_0;end
		else if(i_TotalCoeff == 4'd14)begin
			coeffLevel_i[coeffidx_14] <= level_14;	coeffLevel_i[coeffidx_13] <= level_13;
			coeffLevel_i[coeffidx_12] <= level_12;	coeffLevel_i[coeffidx_11] <= level_11;
			coeffLevel_i[coeffidx_10] <= level_10;	coeffLevel_i[coeffidx_9]  <= level_9;
			coeffLevel_i[coeffidx_8]  <= level_8;  coeffLevel_i[coeffidx_7]  <= level_7;
			coeffLevel_i[coeffidx_6]  <= level_6;	coeffLevel_i[coeffidx_5]  <= level_5;	
			coeffLevel_i[coeffidx_4]  <= level_4;	coeffLevel_i[coeffidx_3]  <= level_3;
			coeffLevel_i[coeffidx_2]  <= level_2;	coeffLevel_i[coeffidx_1]  <= level_1;	
			coeffLevel_i[coeffidx_0]  <= level_0;end
		else if(i_TotalCoeff == 4'd13)begin
			coeffLevel_i[coeffidx_13] <= level_13;
			coeffLevel_i[coeffidx_12] <= level_12;	coeffLevel_i[coeffidx_11] <= level_11;
			coeffLevel_i[coeffidx_10] <= level_10;	coeffLevel_i[coeffidx_9]  <= level_9;
			coeffLevel_i[coeffidx_8]  <= level_8;  coeffLevel_i[coeffidx_7]  <= level_7;
			coeffLevel_i[coeffidx_6]  <= level_6;	coeffLevel_i[coeffidx_5]  <= level_5;	
			coeffLevel_i[coeffidx_4]  <= level_4;	coeffLevel_i[coeffidx_3]  <= level_3;
			coeffLevel_i[coeffidx_2]  <= level_2;	coeffLevel_i[coeffidx_1]  <= level_1;	
			coeffLevel_i[coeffidx_0]  <= level_0;end
		else if(i_TotalCoeff == 4'd12)begin
			coeffLevel_i[coeffidx_12] <= level_12;	coeffLevel_i[coeffidx_11] <= level_11;
			coeffLevel_i[coeffidx_10] <= level_10;	coeffLevel_i[coeffidx_9]  <= level_9;
			coeffLevel_i[coeffidx_8]  <= level_8;  coeffLevel_i[coeffidx_7]  <= level_7;
			coeffLevel_i[coeffidx_6]  <= level_6;	coeffLevel_i[coeffidx_5]  <= level_5;	
			coeffLevel_i[coeffidx_4]  <= level_4;	coeffLevel_i[coeffidx_3]  <= level_3;
			coeffLevel_i[coeffidx_2]  <= level_2;	coeffLevel_i[coeffidx_1]  <= level_1;	
			coeffLevel_i[coeffidx_0]  <= level_0;end
		else if(i_TotalCoeff == 4'd11)begin
			coeffLevel_i[coeffidx_11] <= level_11;
			coeffLevel_i[coeffidx_10] <= level_10;	coeffLevel_i[coeffidx_9]  <= level_9;
			coeffLevel_i[coeffidx_8]  <= level_8;  coeffLevel_i[coeffidx_7]  <= level_7;
			coeffLevel_i[coeffidx_6]  <= level_6;	coeffLevel_i[coeffidx_5]  <= level_5;	
			coeffLevel_i[coeffidx_4]  <= level_4;	coeffLevel_i[coeffidx_3]  <= level_3;
			coeffLevel_i[coeffidx_2]  <= level_2;	coeffLevel_i[coeffidx_1]  <= level_1;	
			coeffLevel_i[coeffidx_0]  <= level_0;end
		else if(i_TotalCoeff == 4'd10)begin
			coeffLevel_i[coeffidx_10] <= level_10;	coeffLevel_i[coeffidx_9]  <= level_9;
			coeffLevel_i[coeffidx_8]  <= level_8;  coeffLevel_i[coeffidx_7]  <= level_7;
			coeffLevel_i[coeffidx_6]  <= level_6;	coeffLevel_i[coeffidx_5]  <= level_5;	
			coeffLevel_i[coeffidx_4]  <= level_4;	coeffLevel_i[coeffidx_3]  <= level_3;
			coeffLevel_i[coeffidx_2]  <= level_2;	coeffLevel_i[coeffidx_1]  <= level_1;	
			coeffLevel_i[coeffidx_0]  <= level_0;end
		else if(i_TotalCoeff == 4'd9)begin
			coeffLevel_i[coeffidx_9]  <= level_9;
			coeffLevel_i[coeffidx_8]  <= level_8;  coeffLevel_i[coeffidx_7]  <= level_7;
			coeffLevel_i[coeffidx_6]  <= level_6;	coeffLevel_i[coeffidx_5]  <= level_5;	
			coeffLevel_i[coeffidx_4]  <= level_4;	coeffLevel_i[coeffidx_3]  <= level_3;
			coeffLevel_i[coeffidx_2]  <= level_2;	coeffLevel_i[coeffidx_1]  <= level_1;	
			coeffLevel_i[coeffidx_0]  <= level_0;end
		else if(i_TotalCoeff == 4'd8)begin
			coeffLevel_i[coeffidx_8]  <= level_8;  coeffLevel_i[coeffidx_7]  <= level_7;
			coeffLevel_i[coeffidx_6]  <= level_6;	coeffLevel_i[coeffidx_5]  <= level_5;	
			coeffLevel_i[coeffidx_4]  <= level_4;	coeffLevel_i[coeffidx_3]  <= level_3;
			coeffLevel_i[coeffidx_2]  <= level_2;	coeffLevel_i[coeffidx_1]  <= level_1;	
			coeffLevel_i[coeffidx_0]  <= level_0;end
		else if(i_TotalCoeff == 4'd7)begin
			coeffLevel_i[coeffidx_7]  <= level_7;
			coeffLevel_i[coeffidx_6]  <= level_6;	coeffLevel_i[coeffidx_5]  <= level_5;	
			coeffLevel_i[coeffidx_4]  <= level_4;	coeffLevel_i[coeffidx_3]  <= level_3;
			coeffLevel_i[coeffidx_2]  <= level_2;	coeffLevel_i[coeffidx_1]  <= level_1;	
			coeffLevel_i[coeffidx_0]  <= level_0;end
		else if(i_TotalCoeff == 4'd6)begin
			coeffLevel_i[coeffidx_6]  <= level_6;	coeffLevel_i[coeffidx_5]  <= level_5;	
			coeffLevel_i[coeffidx_4]  <= level_4;	coeffLevel_i[coeffidx_3]  <= level_3;
			coeffLevel_i[coeffidx_2]  <= level_2;	coeffLevel_i[coeffidx_1]  <= level_1;	
			coeffLevel_i[coeffidx_0]  <= level_0;end
		else if(i_TotalCoeff == 4'd5)begin
			coeffLevel_i[coeffidx_5]  <= level_5;	
			coeffLevel_i[coeffidx_4]  <= level_4;	coeffLevel_i[coeffidx_3]  <= level_3;
			coeffLevel_i[coeffidx_2]  <= level_2;	coeffLevel_i[coeffidx_1]  <= level_1;	
			coeffLevel_i[coeffidx_0]  <= level_0;end
		else if(i_TotalCoeff == 4'd4)begin
			coeffLevel_i[coeffidx_4]  <= level_4;	coeffLevel_i[coeffidx_3]  <= level_3;
			coeffLevel_i[coeffidx_2]  <= level_2;	coeffLevel_i[coeffidx_1]  <= level_1;	
			coeffLevel_i[coeffidx_0]  <= level_0;end
		else if(i_TotalCoeff == 4'd3)begin
			coeffLevel_i[coeffidx_3]  <= level_3;
			coeffLevel_i[coeffidx_2]  <= level_2;	coeffLevel_i[coeffidx_1]  <= level_1;	
			coeffLevel_i[coeffidx_0]  <= level_0;end
		else if(i_TotalCoeff == 4'd2)begin
			coeffLevel_i[coeffidx_2]  <= level_2;	coeffLevel_i[coeffidx_1]  <= level_1;	
			coeffLevel_i[coeffidx_0]  <= level_0;end
		else if(i_TotalCoeff == 4'd1)begin
			coeffLevel_i[coeffidx_1]  <= level_1;	
			coeffLevel_i[coeffidx_0]  <= level_0;end
		else if(i_TotalCoeff == 4'd0)begin
			coeffLevel_i[coeffidx_0]  <= level_0;end
	end
				
assign coeffLevel_0 = coeffLevel_i[0];
assign coeffLevel_1 = coeffLevel_i[1];
assign coeffLevel_2 = coeffLevel_i[2];
assign coeffLevel_3 = coeffLevel_i[3];
assign coeffLevel_4 = coeffLevel_i[4];
assign coeffLevel_5 = coeffLevel_i[5];
assign coeffLevel_6 = coeffLevel_i[6];
assign coeffLevel_7 = coeffLevel_i[7];
assign coeffLevel_8 = coeffLevel_i[8];
assign coeffLevel_9 = coeffLevel_i[9];
assign coeffLevel_10 = coeffLevel_i[10];
assign coeffLevel_11 = coeffLevel_i[11];
assign coeffLevel_12 = coeffLevel_i[12];
assign coeffLevel_13 = coeffLevel_i[13];
assign coeffLevel_14 = coeffLevel_i[14];
assign coeffLevel_15 = coeffLevel_i[15];

			
endmodule

			
	