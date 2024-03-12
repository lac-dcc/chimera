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
module maxpooling1(
			
			input cnn_clk,
			
			input wr_en,			
			input [11:0] norm_result,
			
			output reg buffer_en,
			output reg [11:0] max
			
    );


reg [8:0] addra;

reg [11:0] buffer_20x24 [479:0];


reg wr_en_reg1,wr_en_reg2;
wire wr_done;

always @ ( posedge cnn_clk )
begin
	
	wr_en_reg1 <= wr_en;
	wr_en_reg2 <= wr_en_reg1;
	
end

reg relu_en;

reg [8:0] relu_row;     //0-432
reg [4:0] relu_column;  //0-19

assign wr_done = (!wr_en) & wr_en_reg2;

always @ ( posedge cnn_clk )
begin
	if(wr_en) begin                       //卷积结果缓存
		addra <= addra+1'b1;
		buffer_20x24[addra] <= norm_result;
	end
	else if(wr_done) begin
		relu_en <= 1'b1;
		addra <= 9'd0;
	end
	else if(relu_en) begin                 //卷积结果读出		
		if(relu_column < 5'd18) begin
			relu_column <= relu_column+2;
		end
		else begin
			relu_column <= 5'd0;
			if(relu_row < 9'd432) begin
				relu_row <= relu_row+48;
			end
			else begin
				relu_en <= 1'b0;
				relu_row <= 9'd0;
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
		matrix1_1 <= buffer_20x24[relu_column+relu_row];
		matrix1_2 <= buffer_20x24[relu_column+relu_row+1];
		matrix2_1 <= buffer_20x24[relu_column+relu_row+24];
		matrix2_2 <= buffer_20x24[relu_column+relu_row+25];
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

reg relu_en1,relu_en2,relu_en3;

always @ ( posedge cnn_clk )     //relu延迟
begin
	relu_en1 <= relu_en;
	relu_en2 <= relu_en1;
	relu_en3 <= relu_en2;
	buffer_en <= relu_en3;
end


endmodule
