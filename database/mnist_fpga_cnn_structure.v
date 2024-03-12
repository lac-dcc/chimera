`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:31:38 07/08/2017 
// Design Name: 
// Module Name:    cnn_structure 
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
module cnn_structure(
		input cnn_clk,
		
		output reg [22:0] result1,
		output reg [22:0] result2,
		output reg [22:0] result3,
		output reg [22:0] result4,
		output reg [22:0] result5,
		output reg [22:0] result6,	
		output reg [22:0] result7,
		output reg [22:0] result8,
		output reg [22:0] result9,
		output reg [22:0] result10


    );



//******************************************  产生5x5图像阵列 & 参数缓存  ***************************************************//
//*******************************************   数据准备     ************************************************//

reg [8:0] matrix1_1_1,matrix1_1_2,matrix1_1_3,matrix1_1_4,matrix1_1_5;
reg [8:0] matrix1_2_1,matrix1_2_2,matrix1_2_3,matrix1_2_4,matrix1_2_5;
reg [8:0] matrix1_3_1,matrix1_3_2,matrix1_3_3,matrix1_3_4,matrix1_3_5;
reg [8:0] matrix1_4_1,matrix1_4_2,matrix1_4_3,matrix1_4_4,matrix1_4_5;
reg [8:0] matrix1_5_1,matrix1_5_2,matrix1_5_3,matrix1_5_4,matrix1_5_5;

reg [8:0] matrix2_1_1,matrix2_1_2,matrix2_1_3,matrix2_1_4,matrix2_1_5;
reg [8:0] matrix2_2_1,matrix2_2_2,matrix2_2_3,matrix2_2_4,matrix2_2_5;
reg [8:0] matrix2_3_1,matrix2_3_2,matrix2_3_3,matrix2_3_4,matrix2_3_5;
reg [8:0] matrix2_4_1,matrix2_4_2,matrix2_4_3,matrix2_4_4,matrix2_4_5;
reg [8:0] matrix2_5_1,matrix2_5_2,matrix2_5_3,matrix2_5_4,matrix2_5_5;

reg [9:0] image_addr;              //图片地址


reg [1:0] bias_addr;               //参数地址
reg [6:0] weight_addr;
reg [3:0] bias_addr2;
reg [9:0] weight_addr2;

wire [15:0] bias1,bias2;           //参数输出
wire [15:0] weight1,weight2;
wire [15:0] bias3;
wire [15:0] weight3,weight4;

conv_weight1 weight1_inst(.clka (cnn_clk), .addra (weight_addr), .douta (weight1));           //第一层参数
conv_weight2 weight2_inst(.clka (cnn_clk), .addra (weight_addr), .douta (weight2));
conv_bias1 bias1_inst(.clka (cnn_clk), .addra (bias_addr), .douta (bias1));
conv_bias2 bias2_inst(.clka (cnn_clk), .addra (bias_addr), .douta (bias2));


conv_weight2_1 weight2_1_inst(.clka (cnn_clk), .addra (weight_addr2), .douta (weight3));      //第二层参数
conv_weight2_2 weight2_2_inst(.clka (cnn_clk), .addra (weight_addr2), .douta (weight4));


wire [15:0] bias_switch1,bias_switch2;
wire [15:0] weight_switch1,weight_switch2;
assign bias_switch1 = conv1_done ? 16'd0 : bias1;
assign bias_switch2 = conv1_done ? 16'd0 : bias2;
assign weight_switch1 = conv1_done ? weight3 : weight1;
assign weight_switch2 = conv1_done ? weight4 : weight2;
     

wire [8:0] taps_0,taps_1,taps_2,taps_3,taps_4;     //阵列缓存
wire [8:0] taps1_5,taps1_6,taps1_7,taps1_8,taps1_9;
wire [8:0] taps2_5,taps2_6,taps2_7,taps2_8,taps2_9;

image_24x24  image_inst(.clka (cnn_clk), .addra (image_addr), .douta (taps_4)); 

reg [1:0] feature_map_counter1_1;  //0-2
reg [1:0] feature_map_counter1_2;  //0-2

reg weight_en1;



always @ ( posedge cnn_clk ) 
begin
	if(feature_map_counter1_1 < 2'd3) begin            //循环三次                   卷积层1
		if(image_addr < 10'd588) begin
			image_addr <= image_addr+1'b1;               //图片地址（ROM)
			weight_en1 <= 1'b1;
		end
		else begin
			image_addr <= 10'd0;
			feature_map_counter1_1 <= feature_map_counter1_1+1'b1;
		end
		if(weight_en1) begin                             //参数地址（ROM)
			if(feature_map_counter1_1 == 2'd0) begin
				if(weight_addr < 7'd25) begin               
					weight_addr <= weight_addr+1'b1;
					bias_addr <= 2'd0;
				end
				else begin
					weight_en1 <= 1'b0;
				end
			end
			else if(feature_map_counter1_1 == 2'd1) begin
				if(weight_addr >= 7'd25 && weight_addr < 7'd50) begin               
					weight_addr <= weight_addr+1'b1;
					bias_addr <= 2'd1;
				end
				else begin
					weight_en1 <= 1'b0;
				end
			end
			else if(feature_map_counter1_1 == 2'd2) begin
				if(weight_addr >= 7'd50 && weight_addr < 7'd75) begin               
					weight_addr <= weight_addr+1'b1;
					bias_addr <= 2'd2;
				end
				else begin
					weight_en1 <= 1'b0;
				end
			end
		end
	end
end

reg [6:0] conv1_layer_addr;  //0-99
reg [8:0] conv1_layer_reg1,conv1_layer_reg2;
reg [1:0] counter1;        //0-2
reg [5:0] counter2;        //0-35

reg weight_en2;

wire weight_en;
assign weight_en = weight_en1 || weight_en2;

always @ ( posedge cnn_clk )
begin
	if(conv1_done) begin
		if(counter2 < 6'd36) begin                                                  //卷积层2
			if(conv1_layer_addr < 7'd112) begin
				conv1_layer_addr <= conv1_layer_addr+1'b1;
				weight_en2 <= 1'b1;
			end
			else begin
				conv1_layer_addr <= 7'd0;
				counter2 <= counter2+1'b1;
				if(counter1 < 2'd2) begin
					counter1 <= counter1+1'b1;
				end
				else begin
					counter1 <= 2'd0;
				end
			end
			if(weight_en2) begin			
				if(counter2 == 6'd0) begin
					if(weight_addr2 < 10'd25) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd1) begin
					if(weight_addr2 >= 10'd25 && weight_addr2 < 10'd50) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd2) begin
					if(weight_addr2 >= 10'd50 && weight_addr2 < 10'd75) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd3) begin
					if(weight_addr2 >= 10'd75 && weight_addr2 < 10'd100) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd4) begin
					if(weight_addr2 >= 10'd100 && weight_addr2 < 10'd125) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd5) begin
					if(weight_addr2 >= 10'd125 && weight_addr2 < 10'd150) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd6) begin
					if(weight_addr2 >= 10'd150 && weight_addr2 < 10'd175) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd7) begin
					if(weight_addr2 >= 10'd175 && weight_addr2 < 10'd200) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd8) begin
					if(weight_addr2 >= 10'd200 && weight_addr2 < 10'd225) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd9) begin
					if(weight_addr2 >= 10'd225 && weight_addr2 < 10'd250) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd10) begin
					if(weight_addr2 >= 10'd250 && weight_addr2 < 10'd275) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd11) begin
					if(weight_addr2 >= 10'd275 && weight_addr2 < 10'd300) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd12) begin
					if(weight_addr2 >= 10'd300 && weight_addr2 < 10'd325) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd13) begin
					if(weight_addr2 >= 10'd325 && weight_addr2 < 10'd350) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd14) begin
					if(weight_addr2 >= 10'd350 && weight_addr2 < 10'd375) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd15) begin
					if(weight_addr2 >= 10'd375 && weight_addr2 < 10'd400) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd16) begin
					if(weight_addr2 >= 10'd400 && weight_addr2 < 10'd425) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd17) begin
					if(weight_addr2 >= 10'd425 && weight_addr2 < 10'd450) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd18) begin
					if(weight_addr2 >= 10'd450 && weight_addr2 < 10'd475) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd19) begin
					if(weight_addr2 >= 10'd475 && weight_addr2 < 10'd500) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd20) begin
					if(weight_addr2 >= 10'd500 && weight_addr2 < 10'd525) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd21) begin
					if(weight_addr2 >= 10'd525 && weight_addr2 < 10'd550) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd22) begin
					if(weight_addr2 >= 10'd550 && weight_addr2 < 10'd575) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd23) begin
					if(weight_addr2 >= 10'd575 && weight_addr2 < 10'd600) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd24) begin
					if(weight_addr2 >= 10'd600 && weight_addr2 < 10'd625) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd25) begin
					if(weight_addr2 >= 10'd625 && weight_addr2 < 10'd650) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd26) begin
					if(weight_addr2 >= 10'd650 && weight_addr2 < 10'd675) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd27) begin
					if(weight_addr2 >= 10'd675 && weight_addr2 < 10'd700) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd28) begin
					if(weight_addr2 >= 10'd700 && weight_addr2 < 10'd725) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd29) begin
					if(weight_addr2 >= 10'd725 && weight_addr2 < 10'd750) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd30) begin
					if(weight_addr2 >= 10'd750 && weight_addr2 < 10'd775) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd31) begin
					if(weight_addr2 >= 10'd775 && weight_addr2 < 10'd800) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd32) begin
					if(weight_addr2 >= 10'd800 && weight_addr2 < 10'd825) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd33) begin
					if(weight_addr2 >= 10'd825 && weight_addr2 < 10'd850) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd34) begin
					if(weight_addr2 >= 10'd850 && weight_addr2 < 10'd875) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
				else if(counter2 == 6'd35) begin
					if(weight_addr2 >= 10'd875 && weight_addr2 < 10'd900) begin
						weight_addr2 <= weight_addr2+1'b1;
					end
					else begin
						weight_en2 <= 1'b0;
					end
				end
			end
		end
	end
end



always @ ( posedge cnn_clk )
begin
	if(conv1_done) begin
		if(counter1 == 2'd0) begin
			conv1_layer_reg1 <= buffer1_10x10[conv1_layer_addr];
			conv1_layer_reg2 <= buffer4_10x10[conv1_layer_addr];
		end
		else if(counter1 == 2'd1) begin
			conv1_layer_reg1 <= buffer2_10x10[conv1_layer_addr];
			conv1_layer_reg2 <= buffer5_10x10[conv1_layer_addr];
		end
		else if(counter1 == 2'd2) begin
			conv1_layer_reg1 <= buffer3_10x10[conv1_layer_addr];
			conv1_layer_reg2 <= buffer6_10x10[conv1_layer_addr];
		end
	end
end



reg wr_en;

always @ (posedge cnn_clk )               
begin
	if(!conv1_done) begin                      //第一层有效数据
		if(image_addr == 10'd108) begin        //第一个数从108开始	
			wr_en <= 1'b1;
		end
		else if(image_addr == 10'd588) begin
			wr_en <= 1'b0;
		end
	end
	else begin                                //第二层有效数据
		if(conv1_layer_addr == 7'd52) begin
			wr_en <= 1'b1;
		end
		else if(conv1_layer_addr == 7'd112) begin
			wr_en <= 1'b0;
		end
	end
end 


  

shift_ram_24 taps0x(.clk (cnn_clk), .d (taps_4), .q (taps_3));      //卷积核为5x5，产生5x5的阵列
shift_ram_24 taps1x(.clk (cnn_clk), .d (taps_3), .q (taps_2));
shift_ram_24 taps2x(.clk (cnn_clk), .d (taps_2), .q (taps_1));
shift_ram_24 taps3x(.clk (cnn_clk), .d (taps_1), .q (taps_0));

assign taps1_9 = conv1_layer_reg1;
assign taps2_9 = conv1_layer_reg2;

shift_ram_10 taps1_0y(.clk (cnn_clk), .d (taps1_9), .q (taps1_8));  //卷积核为5x5，产生5x5的阵列
shift_ram_10 taps1_1y(.clk (cnn_clk), .d (taps1_8), .q (taps1_7));
shift_ram_10 taps1_2y(.clk (cnn_clk), .d (taps1_7), .q (taps1_6));
shift_ram_10 taps1_3y(.clk (cnn_clk), .d (taps1_6), .q (taps1_5));

shift_ram_10 taps2_0y(.clk (cnn_clk), .d (taps2_9), .q (taps2_8));  //卷积核为5x5，产生5x5的阵列
shift_ram_10 taps2_1y(.clk (cnn_clk), .d (taps2_8), .q (taps2_7));
shift_ram_10 taps2_2y(.clk (cnn_clk), .d (taps2_7), .q (taps2_6));
shift_ram_10 taps2_3y(.clk (cnn_clk), .d (taps2_6), .q (taps2_5));


wire [44:0] matrix1_row1 = {matrix1_1_1,matrix1_1_2,matrix1_1_3,matrix1_1_4,matrix1_1_5};
wire [44:0] matrix1_row2 = {matrix1_2_1,matrix1_2_2,matrix1_2_3,matrix1_2_4,matrix1_2_5};
wire [44:0] matrix1_row3 = {matrix1_3_1,matrix1_3_2,matrix1_3_3,matrix1_3_4,matrix1_3_5};
wire [44:0] matrix1_row4 = {matrix1_4_1,matrix1_4_2,matrix1_4_3,matrix1_4_4,matrix1_4_5};
wire [44:0] matrix1_row5 = {matrix1_5_1,matrix1_5_2,matrix1_5_3,matrix1_5_4,matrix1_5_5};

wire [44:0] matrix2_row1 = {matrix2_1_1,matrix2_1_2,matrix2_1_3,matrix2_1_4,matrix2_1_5};
wire [44:0] matrix2_row2 = {matrix2_2_1,matrix2_2_2,matrix2_2_3,matrix2_2_4,matrix2_2_5};
wire [44:0] matrix2_row3 = {matrix2_3_1,matrix2_3_2,matrix2_3_3,matrix2_3_4,matrix2_3_5};
wire [44:0] matrix2_row4 = {matrix2_4_1,matrix2_4_2,matrix2_4_3,matrix2_4_4,matrix2_4_5};
wire [44:0] matrix2_row5 = {matrix2_5_1,matrix2_5_2,matrix2_5_3,matrix2_5_4,matrix2_5_5};



always @ ( posedge cnn_clk ) 
begin
	if(!conv1_done) begin
		{matrix1_1_1,matrix1_1_2,matrix1_1_3,matrix1_1_4,matrix1_1_5} <= {matrix1_1_2,matrix1_1_3,matrix1_1_4,matrix1_1_5,taps_0};
		{matrix1_2_1,matrix1_2_2,matrix1_2_3,matrix1_2_4,matrix1_2_5} <= {matrix1_2_2,matrix1_2_3,matrix1_2_4,matrix1_2_5,taps_1};
		{matrix1_3_1,matrix1_3_2,matrix1_3_3,matrix1_3_4,matrix1_3_5} <= {matrix1_3_2,matrix1_3_3,matrix1_3_4,matrix1_3_5,taps_2};
		{matrix1_4_1,matrix1_4_2,matrix1_4_3,matrix1_4_4,matrix1_4_5} <= {matrix1_4_2,matrix1_4_3,matrix1_4_4,matrix1_4_5,taps_3};
		{matrix1_5_1,matrix1_5_2,matrix1_5_3,matrix1_5_4,matrix1_5_5} <= {matrix1_5_2,matrix1_5_3,matrix1_5_4,matrix1_5_5,taps_4};	
		
		{matrix2_1_1,matrix2_1_2,matrix2_1_3,matrix2_1_4,matrix2_1_5} <= {matrix2_1_2,matrix2_1_3,matrix2_1_4,matrix2_1_5,taps_0};
		{matrix2_2_1,matrix2_2_2,matrix2_2_3,matrix2_2_4,matrix2_2_5} <= {matrix2_2_2,matrix2_2_3,matrix2_2_4,matrix2_2_5,taps_1};
		{matrix2_3_1,matrix2_3_2,matrix2_3_3,matrix2_3_4,matrix2_3_5} <= {matrix2_3_2,matrix2_3_3,matrix2_3_4,matrix2_3_5,taps_2};
		{matrix2_4_1,matrix2_4_2,matrix2_4_3,matrix2_4_4,matrix2_4_5} <= {matrix2_4_2,matrix2_4_3,matrix2_4_4,matrix2_4_5,taps_3};
		{matrix2_5_1,matrix2_5_2,matrix2_5_3,matrix2_5_4,matrix2_5_5} <= {matrix2_5_2,matrix2_5_3,matrix2_5_4,matrix2_5_5,taps_4};			
	end
	else begin
		{matrix1_1_1,matrix1_1_2,matrix1_1_3,matrix1_1_4,matrix1_1_5} <= {matrix1_1_2,matrix1_1_3,matrix1_1_4,matrix1_1_5,taps1_5};
		{matrix1_2_1,matrix1_2_2,matrix1_2_3,matrix1_2_4,matrix1_2_5} <= {matrix1_2_2,matrix1_2_3,matrix1_2_4,matrix1_2_5,taps1_6};
		{matrix1_3_1,matrix1_3_2,matrix1_3_3,matrix1_3_4,matrix1_3_5} <= {matrix1_3_2,matrix1_3_3,matrix1_3_4,matrix1_3_5,taps1_7};
		{matrix1_4_1,matrix1_4_2,matrix1_4_3,matrix1_4_4,matrix1_4_5} <= {matrix1_4_2,matrix1_4_3,matrix1_4_4,matrix1_4_5,taps1_8};
		{matrix1_5_1,matrix1_5_2,matrix1_5_3,matrix1_5_4,matrix1_5_5} <= {matrix1_5_2,matrix1_5_3,matrix1_5_4,matrix1_5_5,taps1_9};

		{matrix2_1_1,matrix2_1_2,matrix2_1_3,matrix2_1_4,matrix2_1_5} <= {matrix2_1_2,matrix2_1_3,matrix2_1_4,matrix2_1_5,taps2_5};
		{matrix2_2_1,matrix2_2_2,matrix2_2_3,matrix2_2_4,matrix2_2_5} <= {matrix2_2_2,matrix2_2_3,matrix2_2_4,matrix2_2_5,taps2_6};
		{matrix2_3_1,matrix2_3_2,matrix2_3_3,matrix2_3_4,matrix2_3_5} <= {matrix2_3_2,matrix2_3_3,matrix2_3_4,matrix2_3_5,taps2_7};
		{matrix2_4_1,matrix2_4_2,matrix2_4_3,matrix2_4_4,matrix2_4_5} <= {matrix2_4_2,matrix2_4_3,matrix2_4_4,matrix2_4_5,taps2_8};
		{matrix2_5_1,matrix2_5_2,matrix2_5_3,matrix2_5_4,matrix2_5_5} <= {matrix2_5_2,matrix2_5_3,matrix2_5_4,matrix2_5_5,taps2_9};		
	end
end




//****************************************** 卷积层1,2共用卷积操作 ***************************************************//



reg [5:0] feature_map_counter;   //卷积层计数 0-2是conv layer1 3-38是conv layer2




wire [11:0] norm_result1;
wire [11:0] norm_result2;

conv2d feature_map_inst1(
	.cnn_clk             (cnn_clk),
	
	.matrix_row1         (matrix1_row1),
	.matrix_row2         (matrix1_row2),
	.matrix_row3         (matrix1_row3),
	.matrix_row4         (matrix1_row4),
	.matrix_row5         (matrix1_row5),
	
	.weight_en           (weight_en),
	.weight              (weight_switch1),
	.bias                (bias_switch1),
	
	.norm_result         (norm_result1)

);

wire buffer_en1;
wire [11:0] max1_1;

maxpooling1 subsampling1_inst1(
	.cnn_clk             (cnn_clk),
	
	.wr_en               (wr_en),
	.norm_result         (norm_result1),
	
	.buffer_en           (buffer_en1),
	.max                 (max1_1)


);



conv2d feature_map_inst2(
	.cnn_clk             (cnn_clk),
	
	.matrix_row1         (matrix2_row1),
	.matrix_row2         (matrix2_row2),
	.matrix_row3         (matrix2_row3),
	.matrix_row4         (matrix2_row4),
	.matrix_row5         (matrix2_row5),
	
	.weight_en           (weight_en),
	.weight              (weight_switch2),
	.bias                (bias_switch2),
	
	.norm_result         (norm_result2)


);

wire [11:0] max1_2;

maxpooling1 subsampling1_inst2(
	.cnn_clk             (cnn_clk),
	
	.wr_en               (wr_en),
	.norm_result         (norm_result2),
	
	.max                 (max1_2)

);

wire [8:0] relu_result1_1,relu_result1_2;

assign relu_result1_1 = max1_1[11] ? 9'd0 : max1_1[8:0];
assign relu_result1_2 = max1_2[11] ? 9'd0 : max1_2[8:0];


reg [6:0] buffer_addr1;   //0-99
reg conv1_done = 1'b0;          //卷积层1结束

always @ ( posedge cnn_clk )
begin
	if(buffer_en1 && !conv1_done) begin
		buffer_addr1 <= buffer_addr1+1'b1;
		if(feature_map_counter1_2 == 2'd0) begin
			buffer1_10x10[buffer_addr1] <= relu_result1_1;
			buffer4_10x10[buffer_addr1] <= relu_result1_2;
		end
		else if(feature_map_counter1_2 == 2'd1) begin
			buffer2_10x10[buffer_addr1] <= relu_result1_1;
			buffer5_10x10[buffer_addr1] <= relu_result1_2;
		end
		else if(feature_map_counter1_2 == 2'd2) begin
			buffer3_10x10[buffer_addr1] <= relu_result1_1;
			buffer6_10x10[buffer_addr1] <= relu_result1_2;
		end
		if(buffer_addr1 == 7'd100) begin
			buffer_addr1 <= 7'd0;
			if(feature_map_counter1_2 < 2'd2) begin
				feature_map_counter1_2 <= feature_map_counter1_2+1'b1; 
			end
			else begin
				conv1_done <= 1'b1;
			end
		end
	end
end






//always @ ( posedge cnn_clk )
//begin
//	if(conv1_done) begin
//		result1 <= buffer1_10x10[54];    //maxpooling1测试 第6行第5个
//		result2 <= buffer2_10x10[54];
//		result3 <= buffer3_10x10[54];
//		result4 <= buffer4_10x10[54];
//		result5 <= buffer5_10x10[54];
//		result6 <= buffer6_10x10[54];
//	end
//end



reg [8:0] buffer1_10x10 [99:0];    //conv1 layer feature_map 1
reg [8:0] buffer2_10x10 [99:0];    //conv1 layer feature_map 2
reg [8:0] buffer3_10x10 [99:0];    //conv1 layer feature_map 3
reg [8:0] buffer4_10x10 [99:0];    //conv1 layer feature_map 4
reg [8:0] buffer5_10x10 [99:0];    //conv1 layer feature_map 5
reg [8:0] buffer6_10x10 [99:0];    //conv1 layer feature_map 6



wire [11:0] max2;
reg conv2_done = 1'b0;          //卷积层2结束
wire buffer_en2;
reg [3:0] counter;

maxpooling2 subsampling2_inst(
	.cnn_clk             (cnn_clk),
	
	.wr_en               (wr_en),
	.conv1_done          (conv1_done),
	.norm_result1        (norm_result1),
	.norm_result2        (norm_result2),

	.feature_map_counter (counter),
	.buffer_en           (buffer_en2),
	.max                 (max2)

);


wire [11:0] relu_result2;

assign relu_result2 = max2[11] ? 12'd0 : max2;



reg [3:0] buffer_addr2;   //0-8


always @ ( posedge cnn_clk )
begin
	if(buffer_en2) begin
		buffer_addr2 <= buffer_addr2+1'b1;		
		if(buffer_addr2 == 4'd8) begin
			if(counter == 4'd11) begin
				conv2_done <= 1'b1;
			end
			buffer_addr2 <= 4'd0;
			counter <= counter+1'b1;
		end
	end
end

always @ ( posedge cnn_clk )
begin
	if(buffer_en2) begin
		if(counter == 4'd0) begin
			buffer1_3x3[buffer_addr2] <= relu_result2;
		end
		else if(counter == 4'd1) begin
			buffer2_3x3[buffer_addr2] <= relu_result2;
		end
		else if(counter == 4'd2) begin
			buffer3_3x3[buffer_addr2] <= relu_result2;
		end
		else if(counter == 4'd3) begin
			buffer4_3x3[buffer_addr2] <= relu_result2;
		end
		else if(counter == 4'd4) begin
			buffer5_3x3[buffer_addr2] <= relu_result2;
		end
		else if(counter == 4'd5) begin
			buffer6_3x3[buffer_addr2] <= relu_result2;
		end
		else if(counter == 4'd6) begin
			buffer7_3x3[buffer_addr2] <= relu_result2;
		end
		else if(counter == 4'd7) begin
			buffer8_3x3[buffer_addr2] <= relu_result2;
		end
		else if(counter == 4'd8) begin
			buffer9_3x3[buffer_addr2] <= relu_result2;
		end
		else if(counter == 4'd9) begin
			buffer10_3x3[buffer_addr2] <= relu_result2;
		end
		else if(counter == 4'd10) begin
			buffer11_3x3[buffer_addr2] <= relu_result2;
		end
		else if(counter == 4'd11) begin
			buffer12_3x3[buffer_addr2] <= relu_result2;
		end
	end
end



//always @ ( posedge cnn_clk )
//begin
//	if(conv2_done) begin
//		result1 <= buffer1_3x3[8];			//maxpooling2测试 第1行第1个
//		result2 <= buffer2_3x3[8];
//		result3 <= buffer3_3x3[8];
//		result4 <= buffer4_3x3[8];
//		result5 <= buffer5_3x3[8];
//		result6 <= buffer6_3x3[8];
//		result7 <= buffer7_3x3[8];    
//		result8 <= buffer8_3x3[8];
//		result9 <= buffer9_3x3[8];
//		result10 <= buffer10_3x3[8];
//		result11 <= buffer11_3x3[8];
//		result12 <= buffer12_3x3[8];
//	end
//end


reg [11:0] buffer1_3x3 [8:0];     //conv2 layer feature_map 1
reg [11:0] buffer2_3x3 [8:0];     //conv2 layer feature_map 2
reg [11:0] buffer3_3x3 [8:0];     //conv2 layer feature_map 3
reg [11:0] buffer4_3x3 [8:0];     //conv2 layer feature_map 4
reg [11:0] buffer5_3x3 [8:0];     //conv2 layer feature_map 5
reg [11:0] buffer6_3x3 [8:0];     //conv2 layer feature_map 6
reg [11:0] buffer7_3x3 [8:0];     //conv2 layer feature_map 7
reg [11:0] buffer8_3x3 [8:0];     //conv2 layer feature_map 8
reg [11:0] buffer9_3x3 [8:0];     //conv2 layer feature_map 9
reg [11:0] buffer10_3x3 [8:0];    //conv2 layer feature_map 10
reg [11:0] buffer11_3x3 [8:0];    //conv2 layer feature_map 11
reg [11:0] buffer12_3x3 [8:0];    //conv2 layer feature_map 12





//******************************************** 全连接层计算 ***************************************************//

reg [11:0] buffer_fc [107:0];      //fc layer
reg [6:0] flat_addr;
reg flat_done = 1'b0;       //数据拉长结束
reg [3:0] flat_counter1;          //0-11
reg [3:0] flat_counter2;          //0-8
wire [3:0] flat_counter3 [8:0];    //0-8 查表法

assign flat_counter3[0] = 4'd0;
assign flat_counter3[1] = 4'd3;
assign flat_counter3[2] = 4'd6;
assign flat_counter3[3] = 4'd1;
assign flat_counter3[4] = 4'd4;
assign flat_counter3[5] = 4'd7;
assign flat_counter3[6] = 4'd2;
assign flat_counter3[7] = 4'd5;
assign flat_counter3[8] = 4'd8;


always @ ( posedge cnn_clk )     //数据拉长(flat)
begin
	if(conv2_done) begin
		if(flat_addr < 7'd108) begin 
			flat_addr <= flat_addr+1'b1;
		end
		else begin
			flat_done <= 1'b1;
		end
		if(flat_counter1 < 4'd11) begin 
			flat_counter1 <= flat_counter1+1'b1;
		end
		else begin
			flat_counter1 <= 4'd0;
			if(flat_counter2 < 4'd8) begin
				flat_counter2 <= flat_counter2+1'b1;
			end
		end
	end
end


always @ ( posedge cnn_clk )
begin
	if(conv2_done) begin
		if(flat_counter1 == 4'd0) begin
			buffer_fc[flat_addr] <= buffer1_3x3[flat_counter3[flat_counter2]];
		end
		else if(flat_counter1 == 4'd1) begin
			buffer_fc[flat_addr] <= buffer2_3x3[flat_counter3[flat_counter2]];
		end
		else if(flat_counter1 == 4'd2) begin
			buffer_fc[flat_addr] <= buffer3_3x3[flat_counter3[flat_counter2]];
		end
		else if(flat_counter1 == 4'd3) begin
			buffer_fc[flat_addr] <= buffer4_3x3[flat_counter3[flat_counter2]];
		end
		else if(flat_counter1 == 4'd4) begin
			buffer_fc[flat_addr] <= buffer5_3x3[flat_counter3[flat_counter2]];
		end
		else if(flat_counter1 == 4'd5) begin
			buffer_fc[flat_addr] <= buffer6_3x3[flat_counter3[flat_counter2]];
		end
		else if(flat_counter1 == 4'd6) begin
			buffer_fc[flat_addr] <= buffer7_3x3[flat_counter3[flat_counter2]];
		end
		else if(flat_counter1 == 4'd7) begin
			buffer_fc[flat_addr] <= buffer8_3x3[flat_counter3[flat_counter2]];
		end
		else if(flat_counter1 == 4'd8) begin
			buffer_fc[flat_addr] <= buffer9_3x3[flat_counter3[flat_counter2]];
		end
		else if(flat_counter1 == 4'd9) begin
			buffer_fc[flat_addr] <= buffer10_3x3[flat_counter3[flat_counter2]];
		end
		else if(flat_counter1 == 4'd10) begin
			buffer_fc[flat_addr] <= buffer11_3x3[flat_counter3[flat_counter2]];
		end
		else if(flat_counter1 == 4'd11) begin
			buffer_fc[flat_addr] <= buffer12_3x3[flat_counter3[flat_counter2]];
		end
	end
end


//always @ ( posedge cnn_clk )
//begin
//	if(flat_done) begin
//		result1 <= buffer_fc[96];              //flat测试
//		result2 <= buffer_fc[97];
//		result3 <= buffer_fc[98];
//		result4 <= buffer_fc[99];
//		result5 <= buffer_fc[100];
//		result6 <= buffer_fc[101];
//		result7 <= buffer_fc[102];
//		result8 <= buffer_fc[103];
//		result9 <= buffer_fc[104];
//		result10 <= buffer_fc[105];
//		result11 <= buffer_fc[106];
//		result12 <= buffer_fc[107];
//	end
//end



wire [15:0] bias_10 [9:0];

assign bias_10[0] = 16'h04c0;
assign bias_10[1] = 16'h0881;
assign bias_10[2] = 16'h0150;
assign bias_10[3] = 16'h0024;
assign bias_10[4] = 16'h04df;
assign bias_10[5] = 16'h047b;
assign bias_10[6] = 16'h0504;
assign bias_10[7] = 16'h050c;
assign bias_10[8] = 16'h01f7;
assign bias_10[9] = 16'h043f;


reg [10:0] weight_108x10_addr;
reg [6:0] fc_addr;
wire [15:0] weight;

weight_108x10  weight_inst(.clka (cnn_clk), .addra (weight_108x10_addr), .douta (weight)); 




reg [11:0] dina;
wire [22:0] dout;
multiplier mul_inst(.cnn_clk (cnn_clk), .dina (dina), .dinb (weight[15:4]), .dout (dout));

reg [11:0] result_10;
reg cnn_done = 1'b0;   //卷积网络结束

reg [22:0] result1_reg;
reg [22:0] result2_reg;
reg [22:0] result3_reg;
reg [22:0] result4_reg;
reg [22:0] result5_reg;
reg [22:0] result6_reg;
reg [22:0] result7_reg;
reg [22:0] result8_reg;
reg [22:0] result9_reg;
reg [22:0] result10_reg;

wire [22:0] dout_amend;

assign dout_amend = {{3{dout[22]}},dout[22:3]};

always @ ( posedge cnn_clk )
begin
	if(flat_done) begin
		if(weight_108x10_addr < 11'd2) begin                      //别忘了延迟2个周期
			weight_108x10_addr <= weight_108x10_addr+1'b1;
		end
		else if(weight_108x10_addr >= 11'd2 && weight_108x10_addr < 11'd110) begin
			weight_108x10_addr <= weight_108x10_addr+1'b1;
			result1_reg <= result1_reg+dout_amend;
		end
		else if(weight_108x10_addr >= 11'd110 && weight_108x10_addr < 11'd218) begin
			weight_108x10_addr <= weight_108x10_addr+1'b1;		
			result2_reg <= result2_reg+dout_amend;
		end
		else if(weight_108x10_addr >= 11'd218 && weight_108x10_addr < 11'd326) begin
			weight_108x10_addr <= weight_108x10_addr+1'b1;
			result3_reg <= result3_reg+dout_amend;
		end
		else if(weight_108x10_addr >= 11'd326 && weight_108x10_addr < 11'd434) begin
			weight_108x10_addr <= weight_108x10_addr+1'b1;
			result4_reg <= result4_reg+dout_amend;
		end
		else if(weight_108x10_addr >= 11'd434 && weight_108x10_addr < 11'd542) begin
			weight_108x10_addr <= weight_108x10_addr+1'b1;
			result5_reg <= result5_reg+dout_amend;
		end
		else if(weight_108x10_addr >= 11'd542 && weight_108x10_addr < 11'd650) begin
			weight_108x10_addr <= weight_108x10_addr+1'b1;
			result6_reg <= result6_reg+dout_amend;
		end
		else if(weight_108x10_addr >= 11'd650 && weight_108x10_addr < 11'd758) begin
			weight_108x10_addr <= weight_108x10_addr+1'b1;
			result7_reg <= result7_reg+dout_amend;
		end
		else if(weight_108x10_addr >= 11'd758 && weight_108x10_addr < 11'd866) begin
			weight_108x10_addr <= weight_108x10_addr+1'b1;
			result8_reg <= result8_reg+dout_amend;
		end
		else if(weight_108x10_addr >= 11'd866 && weight_108x10_addr < 11'd974) begin
			weight_108x10_addr <= weight_108x10_addr+1'b1;
			result9_reg <= result9_reg+dout_amend;
		end
		else if(weight_108x10_addr >= 11'd974 && weight_108x10_addr < 11'd1082) begin
			weight_108x10_addr <= weight_108x10_addr+1'b1;
			result10_reg <= result10_reg+dout_amend;
		end
		else begin
			cnn_done <= 1'b1;
			result1 <= result1_reg+bias_10[0];
			result2 <= result2_reg+bias_10[1];
			result3 <= result3_reg+bias_10[2];
			result4 <= result4_reg+bias_10[3];
			result5 <= result5_reg+bias_10[4];
			result6 <= result6_reg+bias_10[5];
			result7 <= result7_reg+bias_10[6];
			result8 <= result8_reg+bias_10[7];
			result9 <= result9_reg+bias_10[8];
			result10 <= result10_reg+bias_10[9];
		end
	end
end

always @ ( posedge cnn_clk )
begin
	if(flat_done) begin
		if(fc_addr < 7'd107) begin
			fc_addr <= fc_addr+1'b1;
		end
		else begin
			fc_addr <= 7'd0;
		end	
		dina <= buffer_fc[fc_addr];
	end
end



endmodule
