`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:43 04/08/2016 
// Design Name: 
// Module Name:    butterflyRadix4First 
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



module butterflyRadix4First(
										input clk,
										input en,
										input[15:0] re_0,
										input[15:0] re_1,
										input[15:0] re_2,
										input[15:0] re_3,
										input[15:0] re_4,
										input[15:0] re_5,
										input[15:0] re_6,
										input[15:0] re_7,
										input[15:0] re_8,
										input[15:0] re_9,
										input[15:0] re_10,
										input[15:0] re_11,
										input[15:0] re_12,
										input[15:0] re_13,
										input[15:0] re_14,
										input[15:0] re_15,
										
										input[15:0] im_0,
										input[15:0] im_1,
										input[15:0] im_2,
										input[15:0] im_3,
										input[15:0] im_4,
										input[15:0] im_5,
										input[15:0] im_6,
										input[15:0] im_7,
										input[15:0] im_8,
										input[15:0] im_9,
										input[15:0] im_10,
										input[15:0] im_11,
										input[15:0] im_12,
										input[15:0] im_13,
										input[15:0] im_14,
										input[15:0] im_15,

										output[15:0] butterfly_re0,
										output[15:0] butterfly_re1,
										output[15:0] butterfly_re2,
										output[15:0] butterfly_re3,
										output[15:0] butterfly_re4,
										output[15:0] butterfly_re5,
										output[15:0] butterfly_re6,
										output[15:0] butterfly_re7,
										output[15:0] butterfly_re8,
										output[15:0] butterfly_re9,
										output[15:0] butterfly_re10,
										output[15:0] butterfly_re11,
										output[15:0] butterfly_re12,
										output[15:0] butterfly_re13,
										output[15:0] butterfly_re14,
										output[15:0] butterfly_re15,
										
										output[15:0] butterfly_im0,
										output[15:0] butterfly_im1,
										output[15:0] butterfly_im2,
										output[15:0] butterfly_im3,
										output[15:0] butterfly_im4,
										output[15:0] butterfly_im5,
										output[15:0] butterfly_im6,
										output[15:0] butterfly_im7,
										output[15:0] butterfly_im8,
										output[15:0] butterfly_im9,
										output[15:0] butterfly_im10,
										output[15:0] butterfly_im11,
										output[15:0] butterfly_im12,
										output[15:0] butterfly_im13,
										output[15:0] butterfly_im14,
										output[15:0] butterfly_im15
										
                            );
								 
//  	n=0
//  	X(n+1)=W(1,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//		X(n+5)=W(2,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//    X(n+9)=W(3,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//    X(n+13)=W(4,:)*([x(n+1),x(n+5),x(n+9),x(n+13)].');			
								 
	complexAddRadix_4 complexAdd1(
																	.clk(clk),
																	
																	.x1_re(re_0),			//1
																	.x1_im(im_0),			//0
																	.x2_re(re_4),			//3
																	.x2_im(im_4),			//0
																	.x3_re(re_8),			//0
																	.x3_im(im_8),			//0
																	.x4_re(re_12),			//1
																	.x4_im(im_12),			//0
																	
																	.re_0(butterfly_re0),
																	.im_0(butterfly_im0),
																	.re_1(butterfly_re4),
																	.im_1(butterfly_im4),
																	.re_2(butterfly_re8),
																	.im_2(butterfly_im8),
																	.re_3(butterfly_re12),
																	.im_3(butterfly_im12)
																 );
																 
//  	n=1
//  	X(n+1)=W(1,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//		X(n+5)=W(2,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//    X(n+9)=W(3,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//    X(n+13)=W(4,:)*([x(n+1),x(n+5),x(n+9),x(n+13)].');																		 
	complexAddRadix_4 complexAdd2(
																	.clk(clk),
															
																	.x1_re(re_1),
																	.x1_im(im_1),
																	.x2_re(re_5),
																	.x2_im(im_5),
																	.x3_re(re_9),
																	.x3_im(im_9),
																	.x4_re(re_13),
																	.x4_im(im_13),
																	
																	.re_0(butterfly_re1),
																	.im_0(butterfly_im1),
																	.re_1(butterfly_re5),
																	.im_1(butterfly_im5),
																	.re_2(butterfly_re9),
																	.im_2(butterfly_im9),
																	.re_3(butterfly_re13),
																	.im_3(butterfly_im13)
																 );
//  	n=2
//  	X(n+1)=W(1,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//		X(n+5)=W(2,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//    X(n+9)=W(3,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//    X(n+13)=W(4,:)*([x(n+1),x(n+5),x(n+9),x(n+13)].');		
	complexAddRadix_4 complexAdd3(
																	.clk(clk),
																	
																	.x1_re(re_2),
																	.x1_im(im_2),
																	.x2_re(re_6),
																	.x2_im(im_6),
																	.x3_re(re_10),
																	.x3_im(im_10),
																	.x4_re(re_14),
																	.x4_im(im_14),
																	
																	.re_0(butterfly_re2),
																	.im_0(butterfly_im2),
																	.re_1(butterfly_re6),
																	.im_1(butterfly_im6),
																	.re_2(butterfly_re10),
																	.im_2(butterfly_im10),
																	.re_3(butterfly_re14),
																	.im_3(butterfly_im14)
																 );
//  	n=3
//  	X(n+1)=W(1,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//		X(n+5)=W(2,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//    X(n+9)=W(3,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//    X(n+13)=W(4,:)*([x(n+1),x(n+5),x(n+9),x(n+13)].');																		 
	complexAddRadix_4 complexAdd4(
																	.clk(clk),
																	
																	.x1_re(re_3),
																	.x1_im(im_3),
																	.x2_re(re_7),
																	.x2_im(im_7),
																	.x3_re(re_11),
																	.x3_im(im_11),
																	.x4_re(re_15),
																	.x4_im(im_15),
																	
																	.re_0(butterfly_re3),
																	.im_0(butterfly_im3),
																	.re_1(butterfly_re7),
																	.im_1(butterfly_im7),
																	.re_2(butterfly_re11),
																	.im_2(butterfly_im11),
																	.re_3(butterfly_re15),
																	.im_3(butterfly_im15)
																 );
																 


endmodule
