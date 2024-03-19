`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:34:42 04/08/2016 
// Design Name: 
// Module Name:    complexAddRadix_4 
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
module complexAddRadix_4(
								 input 				clk,
								 input 	[15:0]	x1_re,
								 input 	[15:0]	x1_im,
								 input 	[15:0]	x2_re,
								 input 	[15:0]	x2_im,
								 input 	[15:0]	x3_re,
								 input 	[15:0]	x3_im,
								 input 	[15:0]	x4_re,
								 input 	[15:0]	x4_im,
								 output 	[15:0]	re_0,
								 output 	[15:0]	im_0,
								 output 	[15:0]	re_1,
								 output 	[15:0]	im_1,
								 output 	[15:0]	re_2,
								 output 	[15:0]	im_2,
								 output 	[15:0]	re_3,
								 output 	[15:0]	im_3
								 );
								 									
								/** First Add output**/
								reg[18:0] add_re_reg_0 = 19'd0;
								reg[18:0] add_im_reg_0 = 19'd0;
								
								reg[18:0] add_re_reg_1 = 19'd0;
								reg[18:0] add_im_reg_1 = 19'd0;
								
								reg[18:0] add_re_reg_2 = 19'd0;
								reg[18:0] add_im_reg_2 = 19'd0;
								
								reg[18:0] add_re_reg_3 = 19'd0;
								reg[18:0] add_im_reg_3 = 19'd0;
								/**end**/
	
								/** Second Add output**/
								reg[18:0] add_re_reg1_0 = 19'd0;
								reg[18:0] add_im_reg1_0 = 19'd0;
								
								reg[18:0] add_re_reg1_1 = 19'd0;
								reg[18:0] add_im_reg1_1 = 19'd0;
								
								reg[18:0] add_re_reg1_2 = 19'd0;
								reg[18:0] add_im_reg1_2 = 19'd0;
								
								reg[18:0] add_re_reg1_3 = 19'd0;
								reg[18:0] add_im_reg1_3 = 19'd0;
								/**end**/
		
								/** Third Add output **/
								reg[18:0] add_re_reg2_0 = 19'd0;
								reg[18:0] add_im_reg2_0 = 19'd0;
								
								reg[18:0] add_re_reg2_1 = 19'd0;
								reg[18:0] add_im_reg2_1 = 19'd0;
								
								reg[18:0] add_re_reg2_2 = 19'd0;
								reg[18:0] add_im_reg2_2 = 19'd0;
								
								reg[18:0] add_re_reg2_3 = 19'd0;
								reg[18:0] add_im_reg2_3 = 19'd0;
								/**end**/
										
										
								/** data standardize**/
								reg[15:0] x3_re_reg = 19'd0;
								reg[15:0] x3_im_reg = 19'd0;
								reg[15:0] x4_re_reg = 19'd0;
								reg[15:0] x4_im_reg = 19'd0;
								reg[15:0] x4_re_reg1 = 19'd0;
								reg[15:0] x4_im_reg1 = 19'd0;
								/**end**/
								
								
						always @(posedge clk)//  delay
						begin
							x3_re_reg <= x3_re;
							x3_im_reg <= x3_im;
							
							x4_re_reg1 <= x4_re;
							x4_im_reg1 <= x4_im;
						end
						
						always @(posedge clk)
						begin
							x4_re_reg <= x4_re_reg1;
							x4_im_reg <= x4_im_reg1;
						end
						
						
						always @(posedge clk)// first add
						begin
							add_re_reg_0 <= {{3{x1_re[15]}},x1_re} + {{3{x2_re[15]}},x2_re};
							add_im_reg_0 <= {{3{x1_im[15]}},x1_im} + {{3{x2_im[15]}},x2_im};
							
							add_re_reg_1 <= {{3{x1_re[15]}},x1_re} + {{3{x2_im[15]}},x2_im};
							add_im_reg_1 <= {{3{x1_im[15]}},x1_im} - {{3{x2_re[15]}},x2_re};
							
							add_re_reg_2 <= {{3{x1_re[15]}},x1_re} - {{3{x2_re[15]}},x2_re};
							add_im_reg_2 <= {{3{x1_im[15]}},x1_im} - {{3{x2_im[15]}},x2_im};
							
							add_re_reg_3 <= {{3{x1_re[15]}},x1_re} - {{3{x2_im[15]}},x2_im};
							add_im_reg_3 <= {{3{x1_im[15]}},x1_im} + {{3{x2_re[15]}},x2_re};		
						end
						
						always @(posedge clk)//second add
						begin
							add_re_reg1_0 <= add_re_reg_0 + {{3{x3_re_reg[15]}},x3_re_reg};
							add_im_reg1_0 <= add_im_reg_0 + {{3{x3_im_reg[15]}},x3_im_reg};
							
							add_re_reg1_1 <= add_re_reg_1 - {{3{x3_re_reg[15]}},x3_re_reg};
							add_im_reg1_1 <= add_im_reg_1 - {{3{x3_im_reg[15]}},x3_im_reg};
							
							add_re_reg1_2 <= add_re_reg_2 + {{3{x3_re_reg[15]}},x3_re_reg};
							add_im_reg1_2 <= add_im_reg_2 + {{3{x3_im_reg[15]}},x3_im_reg};
							
							add_re_reg1_3 <= add_re_reg_3 - {{3{x3_re_reg[15]}},x3_re_reg};
							add_im_reg1_3 <= add_im_reg_3 - {{3{x3_im_reg[15]}},x3_im_reg};
						end
						
						always @(posedge clk)//third add
						begin
							add_re_reg2_0 <= add_re_reg1_0 + {{3{x4_re_reg[15]}},x4_re_reg};
							add_im_reg2_0 <= add_im_reg1_0 + {{3{x4_im_reg[15]}},x4_im_reg};
							
							add_re_reg2_1 <= add_re_reg1_1 - {{3{x4_im_reg[15]}},x4_im_reg};
							add_im_reg2_1 <= add_im_reg1_1 + {{3{x4_re_reg[15]}},x4_re_reg};
							
							add_re_reg2_2 <= add_re_reg1_2 - {{3{x4_re_reg[15]}},x4_re_reg};
							add_im_reg2_2 <= add_im_reg1_2 - {{3{x4_im_reg[15]}},x4_im_reg};
							
							add_re_reg2_3 <= add_re_reg1_3 + {{3{x4_im_reg[15]}},x4_im_reg};
							add_im_reg2_3 <= add_im_reg1_3 - {{3{x4_re_reg[15]}},x4_re_reg};
						end
						
						assign re_0 = add_re_reg2_0[15:0];
						assign im_0 = add_im_reg2_0[15:0];
						assign re_1 = add_re_reg2_1[15:0];
						assign im_1 = add_im_reg2_1[15:0];
						assign re_2 = add_re_reg2_2[15:0];
						assign im_2 = add_im_reg2_2[15:0];
						assign re_3 = add_re_reg2_3[15:0];
						assign im_3 = add_im_reg2_3[15:0];
						

	 


endmodule