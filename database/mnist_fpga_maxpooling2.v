`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:37 07/14/2017 
// Design Name: 
// Module Name:    maxpooling 
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
module maxpooling2(
			
			input cnn_clk,
			
			input wr_en,
			input conv1_done,
			input [11:0] norm_result1,
			input [11:0] norm_result2,

			input [3:0] feature_map_counter,
			output reg buffer_en,
			output reg [11:0] max
			
    );


wire [15:0] bias [11:0];

assign bias[0] = 16'h067e;
assign bias[1] = 16'h01e9;
assign bias[2] = 16'h04f1;
assign bias[3] = 16'h02db;
assign bias[4] = 16'h0627;
assign bias[5] = 16'h0449;
assign bias[6] = 16'h00bc;
assign bias[7] = 16'h82d3;
assign bias[8] = 16'h060a;
assign bias[9] = 16'h0560;
assign bias[10] = 16'h0266;
assign bias[11] = 16'h0344;

wire [11:0] bias_amend;

assign bias_amend = bias[feature_map_counter][15] ? {4'b1111,~bias[feature_map_counter][14:7]}+1'b1 : bias[feature_map_counter][15:7];

reg relu_en;

reg [5:0] addra;
reg [1:0] adder_counter;

reg [11:0] buffer1_6x10 [59:0];  //»º´æ4¸ö
reg [11:0] buffer2_6x10 [59:0];
reg [11:0] buffer3_6x10 [59:0];
reg [11:0] buffer4_6x10 [59:0];

reg [11:0] buffer_6x10 [59:0];

reg [5:0] relu_row;     //0-40
reg [2:0] relu_column;  //0-5

always @ ( posedge cnn_clk )
begin
	if(wr_en && conv1_done) begin
		addra <= addra+1'b1;
		if(adder_counter == 2'd0) begin
			buffer1_6x10[addra] <= norm_result1;
			buffer3_6x10[addra] <= norm_result2;
		end
		else if(adder_counter == 2'd1) begin
			buffer2_6x10[addra] <= norm_result1;
			buffer4_6x10[addra] <= norm_result2;
		end
		else if(adder_counter == 2'd2) begin
			buffer_6x10[addra] <= norm_result1+norm_result2+buffer1_6x10[addra]+
			buffer2_6x10[addra]+buffer3_6x10[addra]+buffer4_6x10[addra]+bias_amend;		
		end
		if(addra == 6'd59) begin
			addra <= 6'd0;
			if(adder_counter < 2'd2) begin
				adder_counter <= adder_counter+1'b1;
			end
			else begin
				adder_counter <= 2'd0;
				relu_en <= 1'b1;
			end
		end
	end
	else if(relu_en) begin	
			if(relu_column < 3'd4) begin
				relu_column <= relu_column+2;
			end
			else begin
				relu_column <= 3'd0;
				if(relu_row < 6'd40) begin
					relu_row <= relu_row+20;
				end
				else begin
					relu_en <= 1'b0;
					relu_row <= 6'd0;
				end
			end
		end	
end




reg [11:0] matrix1_1,matrix1_2;
reg [11:0] matrix2_1,matrix2_2;



//clk1
always @ ( posedge cnn_clk )
begin
	if(relu_en) begin
		matrix1_1 <= buffer_6x10[relu_column+relu_row];
		matrix1_2 <= buffer_6x10[relu_column+relu_row+1];
		matrix2_1 <= buffer_6x10[relu_column+relu_row+10];
		matrix2_2 <= buffer_6x10[relu_column+relu_row+11];
	end	
end


reg [11:0] max0,max1;


//clk2
always @ ( posedge cnn_clk )
begin
	if(matrix1_1[11] && matrix1_2[11]) begin
		max0 <= (matrix1_1 > matrix1_2) ? matrix1_2 : matrix1_1;
	end
	else if(!matrix1_1[11] && matrix1_2[11]) begin
		max0 <= matrix1_1;
	end
	else if(matrix1_1[11] && !matrix1_2[11]) begin
		max0 <= matrix1_2;
	end
	else if(!matrix1_1[11] && !matrix1_2[11]) begin
		max0 <= (matrix1_1 > matrix1_2) ? matrix1_1 : matrix1_2;
	end
end

always @ ( posedge cnn_clk )
begin
	if(matrix2_1[11] && matrix2_2[11]) begin
		max1 <= (matrix2_1 > matrix2_2) ? matrix2_2 : matrix2_1;
	end
	else if(!matrix2_1[11] && matrix2_2[11]) begin
		max1 <= matrix2_1;
	end
	else if(matrix2_1[11] && !matrix2_2[11]) begin
		max1 <= matrix2_2;
	end
	else if(!matrix2_1[11] && !matrix2_2[11]) begin
		max1 <= (matrix2_1 > matrix2_2) ? matrix2_1 : matrix2_2;
	end
end


//clk3
always @ ( posedge cnn_clk )
begin
	if(max0[11] && max1[11]) begin
		max <= (max0 > max1) ? max1 : max0;
	end
	else if(!max0[11] && max1[11]) begin
		max <= max0;
	end
	else if(max0[11] && !max1[11]) begin
		max <= max1;
	end
	else if(!max0[11] && !max1[11]) begin
		max <= (max0 > max1) ? max0 : max1;
	end
end

reg relu_en1,relu_en2;

always @ ( posedge cnn_clk )     //reluÑÓ³Ù
begin
	relu_en1 <= relu_en;
	relu_en2 <= relu_en1;
	buffer_en <= relu_en2;
end



endmodule
