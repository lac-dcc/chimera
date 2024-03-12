`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:34:34 07/08/2017 
// Design Name: 
// Module Name:    conv2d 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module conv2d(
			input cnn_clk,
			
			input [44:0] matrix_row1,
			input [44:0] matrix_row2,
			input [44:0] matrix_row3,
			input [44:0] matrix_row4,
			input [44:0] matrix_row5,
			
			input weight_en,
			input [15:0] weight,
			input [15:0] bias,
			
			output reg [11:0] norm_result
			
    );


reg [8:0] weight_reg[24:0];    
reg [8:0] bias_reg;

reg [6:0] addr;


always @ ( posedge cnn_clk )           //参数缓存
begin
	if(weight_en) begin
		addr <= addr+1'b1;
		weight_reg[addr-1] <= weight[15:7];
		bias_reg <= bias[15:7];	
	end
	else begin
		addr <= 7'd0;
	end
end

wire [18:0] mul_adder_reg1;
wire [18:0] mul_adder_reg2;
wire [18:0] mul_adder_reg3;
wire [18:0] mul_adder_reg4;
wire [18:0] mul_adder_reg5;
wire [18:0] mul_adder_reg6;
wire [18:0] mul_adder_reg7;
wire [18:0] mul_adder_reg8;
wire [18:0] mul_adder_reg9;
wire [18:0] mul_adder_reg10;
wire [18:0] mul_adder_reg11;
wire [18:0] mul_adder_reg12;
wire [18:0] mul_adder_reg13;
wire [18:0] mul_adder_reg14;
wire [18:0] mul_adder_reg15;
wire [18:0] mul_adder_reg16;
wire [18:0] mul_adder_reg17;
wire [18:0] mul_adder_reg18;
wire [18:0] mul_adder_reg19;
wire [18:0] mul_adder_reg20;
wire [18:0] mul_adder_reg21;
wire [18:0] mul_adder_reg22;
wire [18:0] mul_adder_reg23;
wire [18:0] mul_adder_reg24;
wire [18:0] mul_adder_reg25;

//*********************************************************** 流水结构 乘累加  ****************************************//

// clk1
multiply mul_inst1(.cnn_clk (cnn_clk), .dina (matrix_row1[44:36]), .dinb (weight_reg[0]), .dout (mul_adder_reg1));
multiply mul_inst2(.cnn_clk (cnn_clk), .dina (matrix_row1[35:27]), .dinb (weight_reg[1]), .dout (mul_adder_reg2));
multiply mul_inst3(.cnn_clk (cnn_clk), .dina (matrix_row1[26:18]), .dinb (weight_reg[2]), .dout (mul_adder_reg3));
multiply mul_inst4(.cnn_clk (cnn_clk), .dina (matrix_row1[17:9]), .dinb (weight_reg[3]), .dout (mul_adder_reg4));
multiply mul_inst5(.cnn_clk (cnn_clk), .dina (matrix_row1[8:0]), .dinb (weight_reg[4]), .dout (mul_adder_reg5));
multiply mul_inst6(.cnn_clk (cnn_clk), .dina (matrix_row2[44:36]), .dinb (weight_reg[5]), .dout (mul_adder_reg6));
multiply mul_inst7(.cnn_clk (cnn_clk), .dina (matrix_row2[35:27]), .dinb (weight_reg[6]), .dout (mul_adder_reg7));
multiply mul_inst8(.cnn_clk (cnn_clk), .dina (matrix_row2[26:18]), .dinb (weight_reg[7]), .dout (mul_adder_reg8));
multiply mul_inst9(.cnn_clk (cnn_clk), .dina (matrix_row2[17:9]), .dinb (weight_reg[8]), .dout (mul_adder_reg9));
multiply mul_inst10(.cnn_clk (cnn_clk), .dina (matrix_row2[8:0]), .dinb (weight_reg[9]), .dout (mul_adder_reg10));
multiply mul_inst11(.cnn_clk (cnn_clk), .dina (matrix_row3[44:36]), .dinb (weight_reg[10]), .dout (mul_adder_reg11));
multiply mul_inst12(.cnn_clk (cnn_clk), .dina (matrix_row3[35:27]), .dinb (weight_reg[11]), .dout (mul_adder_reg12));
multiply mul_inst13(.cnn_clk (cnn_clk), .dina (matrix_row3[26:18]), .dinb (weight_reg[12]), .dout (mul_adder_reg13));
multiply mul_inst14(.cnn_clk (cnn_clk), .dina (matrix_row3[17:9]), .dinb (weight_reg[13]), .dout (mul_adder_reg14));
multiply mul_inst15(.cnn_clk (cnn_clk), .dina (matrix_row3[8:0]), .dinb (weight_reg[14]), .dout (mul_adder_reg15));
multiply mul_inst16(.cnn_clk (cnn_clk), .dina (matrix_row4[44:36]), .dinb (weight_reg[15]), .dout (mul_adder_reg16));
multiply mul_inst17(.cnn_clk (cnn_clk), .dina (matrix_row4[35:27]), .dinb (weight_reg[16]), .dout (mul_adder_reg17));
multiply mul_inst18(.cnn_clk (cnn_clk), .dina (matrix_row4[26:18]), .dinb (weight_reg[17]), .dout (mul_adder_reg18));
multiply mul_inst19(.cnn_clk (cnn_clk), .dina (matrix_row4[17:9]), .dinb (weight_reg[18]), .dout (mul_adder_reg19));
multiply mul_inst20(.cnn_clk (cnn_clk), .dina (matrix_row4[8:0]), .dinb (weight_reg[19]), .dout (mul_adder_reg20));
multiply mul_inst21(.cnn_clk (cnn_clk), .dina (matrix_row5[44:36]), .dinb (weight_reg[20]), .dout (mul_adder_reg21));
multiply mul_inst22(.cnn_clk (cnn_clk), .dina (matrix_row5[35:27]), .dinb (weight_reg[21]), .dout (mul_adder_reg22));
multiply mul_inst23(.cnn_clk (cnn_clk), .dina (matrix_row5[26:18]), .dinb (weight_reg[22]), .dout (mul_adder_reg23));
multiply mul_inst24(.cnn_clk (cnn_clk), .dina (matrix_row5[17:9]), .dinb (weight_reg[23]), .dout (mul_adder_reg24));
multiply mul_inst25(.cnn_clk (cnn_clk), .dina (matrix_row5[8:0]), .dinb (weight_reg[24]), .dout (mul_adder_reg25));


reg [18:0] add0_0,add0_1,add0_2,add0_3,add0_4,add0_5,add0_6,add0_7,add0_8,add0_9,add0_10,add0_11,add0_12;


//clk2
always @ ( posedge cnn_clk )
begin

	add0_0 <= mul_adder_reg1+mul_adder_reg2;
	add0_1 <= mul_adder_reg3+mul_adder_reg4;
	add0_2 <= mul_adder_reg5+mul_adder_reg6;
	add0_3 <= mul_adder_reg7+mul_adder_reg8;
	add0_4 <= mul_adder_reg9+mul_adder_reg10;
	add0_5 <= mul_adder_reg11+mul_adder_reg12;
	add0_6 <= mul_adder_reg13+mul_adder_reg14;
	add0_7 <= mul_adder_reg15+mul_adder_reg16;
	add0_8 <= mul_adder_reg17+mul_adder_reg18;
	add0_9 <= mul_adder_reg19+mul_adder_reg20;
	add0_10 <= mul_adder_reg21+mul_adder_reg22;
	add0_11 <= mul_adder_reg23+mul_adder_reg24;
	add0_12 <= mul_adder_reg25+(bias_reg<<8);
	
end

reg [18:0] add1_0,add1_1,add1_2,add1_3,add1_4,add1_5,add1_6;


//clk3	
always @ ( posedge cnn_clk )
begin

	add1_0 <= add0_0+add0_1;
	add1_1 <= add0_2+add0_3;
	add1_2 <= add0_4+add0_5;
	add1_3 <= add0_6+add0_7;
	add1_4 <= add0_8+add0_9;
	add1_5 <= add0_10+add0_11;
	add1_6 <= add0_12;
	
end

reg [18:0] add2_0,add2_1,add2_2,add2_3;


//clk4
always @ ( posedge cnn_clk )
begin

	add2_0 <= add1_0+add1_1;
	add2_1 <= add1_2+add1_3;
	add2_2 <= add1_4+add1_5;
	add2_3 <= add1_6;

end

reg [18:0] add3_0,add3_1;


//clk5
always @ ( posedge cnn_clk )
begin

	add3_0 <= add2_0+add2_1;
	add3_1 <= add2_2+add2_3;

end

reg [18:0] add4_0;

//clk6
always @ ( posedge cnn_clk )
begin

	add4_0 <= add3_0+add3_1;

end

//clk7
always @ ( posedge cnn_clk )
begin

	//relu_result <= add4_0[17] ? 9'd0 : add4_0[15:7];
	norm_result <= add4_0[18:7];        //数据规整，不做relu

end


endmodule
