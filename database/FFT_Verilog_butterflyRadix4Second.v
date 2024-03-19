`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:43 04/08/2016 
// Design Name: 
// Module Name:    butterflyRadix4Second 
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
module butterflyRadix4Second(
										input clk,
										
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
									 
//**************** Second Butterfly *****************
//		n=0:3
//	  	X2(n+1) 	= 	W(1,:)*[X1(4*n+1),X1(4*n+2)*exp(-1i*2*pi/N*n),X1(4*n+3)*exp(-1i*2*pi/N*2*n),X1(4*n+4)*exp(-1i*2*pi/N*3*n)].';
//    X2(n+5)	=	W(2,:)*[X1(4*n+1),X1(4*n+2)*exp(-1i*2*pi/N*n),X1(4*n+3)*exp(-1i*2*pi/N*2*n),X1(4*n+4)*exp(-1i*2*pi/N*3*n)].';
//    X2(n+9)	=	W(3,:)*[X1(4*n+1),X1(4*n+2)*exp(-1i*2*pi/N*n),X1(4*n+3)*exp(-1i*2*pi/N*2*n),X1(4*n+4)*exp(-1i*2*pi/N*3*n)].';
//    X2(n+13)	=	W(4,:)*[X1(4*n+1),X1(4*n+2)*exp(-1i*2*pi/N*n),X1(4*n+3)*exp(-1i*2*pi/N*2*n),X1(4*n+4)*exp(-1i*2*pi/N*3*n)].';

//******* followwing parameter come from exp(-1i*2*pi/N*n) above********//
	//*********** cos *******************//	
	parameter cos0 = 17'b0_1000_0000_0000_0000;				//(1*2^15)-1   origin:1   after:32767  
	parameter cos1 = 17'b0_1000_0000_0000_0000;				//1
	parameter cos2 = 17'b0_1000_0000_0000_0000;				//1
	
	parameter cos3 = 17'b0_0111_0110_0100_0001;				//0.9239 -> 30273
	parameter cos4 = 17'b0_0101_1010_1000_0010;				//0.7071 -> 23170
	parameter cos5 = 17'b0_0011_0000_1111_1100;				//0.3827 -> 12540
	
	parameter cos6 = 17'b0_0101_1010_1000_0010;				//0.7071 
	parameter cos7 = 17'b0_0000000000000000;					//0
	parameter cos8 = 17'b1_1010_0101_0111_1110;				//-0.7071-> -23170
	
	parameter cos9  = 17'b0_0011_0000_1111_1100;			//0.3827
	parameter cos10 = 17'b1_1010_0101_0111_1110;			//-0.7071
	parameter cos11 = 17'b1_1000_1001_1011_1111;			//-0.9239-> -30273
	
	//*********** sin *******************//	
	parameter sin0 = 17'b00000000000000000;				//0	
	parameter sin1 = 17'b00000000000000000;				//0
	parameter sin2 = 17'b00000000000000000;				//0
	                    
	parameter sin3 = 17'b1_1100_1111_0000_0100;				// 							-0.3827 complement 
	parameter sin4 = 17'b1_1010_0101_0111_1110;				//-0.29291					-0.7071
	parameter sin5 = 17'b1_1000_1001_1011_1111;				//-0.07614					-0.9239
	
	parameter sin6 = 17'b1_1010_0101_0111_1110;				//-0.7071
	parameter sin7 = 17'b1_1111_1111_1111_1111;				//-1
	parameter sin8 = 17'b1_1010_0101_0111_1110;				//-0.7071
		
	parameter sin9 = 17'b1_1000_1001_1011_1111;				//-0.9239
	parameter sin10 = 17'b1_1010_0101_0111_1110;			//-0.7071	
	parameter sin11 = 17'b0_0011_0000_1111_1100;			//0.3827

//		n=0:3
//	  	X2(n+1) 	= 	W(1,:)*[X1(4*n+1),X1(4*n+2)*exp(-1i*2*pi/N*n),X1(4*n+3)*exp(-1i*2*pi/N*2*n),X1(4*n+4)*exp(-1i*2*pi/N*3*n)].';
//    X2(n+5)	=	W(2,:)*[X1(4*n+1),X1(4*n+2)*exp(-1i*2*pi/N*n),X1(4*n+3)*exp(-1i*2*pi/N*2*n),X1(4*n+4)*exp(-1i*2*pi/N*3*n)].';
//    X2(n+9)	=	W(3,:)*[X1(4*n+1),X1(4*n+2)*exp(-1i*2*pi/N*n),X1(4*n+3)*exp(-1i*2*pi/N*2*n),X1(4*n+4)*exp(-1i*2*pi/N*3*n)].';
//    X2(n+13)	=	W(4,:)*[X1(4*n+1),X1(4*n+2)*exp(-1i*2*pi/N*n),X1(4*n+3)*exp(-1i*2*pi/N*2*n),X1(4*n+4)*exp(-1i*2*pi/N*3*n)].';	

//		n=0
//	  	X2(1) 	= 	W(1,:)*[X1(1),X1(2)*exp(-1i*2*pi/N*n),X1(3)*exp(-1i*2*pi/N*2*n),X1(4)*exp(-1i*2*pi/N*3*n)].';
//    X2(5)		=	W(2,:)*[X1(1),X1(2)*exp(-1i*2*pi/N*n),X1(3)*exp(-1i*2*pi/N*2*n),X1(4)*exp(-1i*2*pi/N*3*n)].';
//    X2(9)		=	W(3,:)*[X1(1),X1(2)*exp(-1i*2*pi/N*n),X1(3)*exp(-1i*2*pi/N*2*n),X1(4)*exp(-1i*2*pi/N*3*n)].';
//    X2(13)	=	W(4,:)*[X1(1),X1(2)*exp(-1i*2*pi/N*n),X1(3)*exp(-1i*2*pi/N*2*n),X1(4)*exp(-1i*2*pi/N*3*n)].';	
	butterflyUnitRadix4 butterflyRadix4Unit1(
																			.clk(clk),
																			.cos0(cos0),		//ar
																			.sin0(sin0),		//br
																			.cos1(cos1),
																			.sin1(sin1),
																			.cos2(cos2),
																			.sin2(sin2),
																			
																			.x1_re(re_0),
																			.x1_im(im_0),
																			.x2_re(re_1),
																			.x2_im(im_1),
																			.x3_re(re_2),
																			.x3_im(im_2),
																			.x4_re(re_3),
																			.x4_im(im_3),
																			
																			.p1_re(butterfly_re0),
																			.p1_im(butterfly_im0),
																			.p2_re(butterfly_re4),
																			.p2_im(butterfly_im4),
																			.p3_re(butterfly_re8),
																			.p3_im(butterfly_im8),
																			.p4_re(butterfly_re12),
																			.p4_im(butterfly_im12)
																	  );
//		n=1
//	  	X2(2) 	= 	W(1,:)*[X1(5),X1(6)*exp(-1i*2*pi/N*n),X1(7)*exp(-1i*2*pi/N*2*n),X1(8)*exp(-1i*2*pi/N*3*n)].';
//    X2(6)		=	W(2,:)*[X1(5),X1(6)*exp(-1i*2*pi/N*n),X1(7)*exp(-1i*2*pi/N*2*n),X1(8)*exp(-1i*2*pi/N*3*n)].';
//    X2(10)	=	W(3,:)*[X1(5),X1(6)*exp(-1i*2*pi/N*n),X1(7)*exp(-1i*2*pi/N*2*n),X1(8)*exp(-1i*2*pi/N*3*n)].';
//    X2(14)	=	W(4,:)*[X1(5),X1(6)*exp(-1i*2*pi/N*n),X1(7)*exp(-1i*2*pi/N*2*n),X1(8)*exp(-1i*2*pi/N*3*n)].';																	  
	butterflyUnitRadix4 butterflyRadix4Unit2(
																			.clk(clk),
																			.cos0(cos3),
																			.sin0(sin3),
																			.cos1(cos4),
																			.sin1(sin4),
																			.cos2(cos5),
																			.sin2(sin5),
																			
																			.x1_re(re_4),
																			.x1_im(im_4),
																			.x2_re(re_5),
																			.x2_im(im_5),
																			.x3_re(re_6),
																			.x3_im(im_6),
																			.x4_re(re_7),
																			.x4_im(im_7),
																			
																			.p1_re(butterfly_re1),
																			.p1_im(butterfly_im1),
																			.p2_re(butterfly_re5),
																			.p2_im(butterfly_im5),
																			.p3_re(butterfly_re9),
																			.p3_im(butterfly_im9),
																			.p4_re(butterfly_re13),
																			.p4_im(butterfly_im13)
																	  );
//		n=3
//	  	X2(3) 	= 	W(1,:)*[X1(9),X1(10)*exp(-1i*2*pi/N*n),X1(11)*exp(-1i*2*pi/N*2*n),X1(12)*exp(-1i*2*pi/N*3*n)].';
//    X2(7)		=	W(2,:)*[X1(9),X1(10)*exp(-1i*2*pi/N*n),X1(11)*exp(-1i*2*pi/N*2*n),X1(12)*exp(-1i*2*pi/N*3*n)].';
//    X2(11)	=	W(3,:)*[X1(9),X1(10)*exp(-1i*2*pi/N*n),X1(11)*exp(-1i*2*pi/N*2*n),X1(12)*exp(-1i*2*pi/N*3*n)].';
//    X2(15)	=	W(4,:)*[X1(9),X1(10)*exp(-1i*2*pi/N*n),X1(11)*exp(-1i*2*pi/N*2*n),X1(12)*exp(-1i*2*pi/N*3*n)].';	
																	  
	butterflyUnitRadix4 butterflyRadix4Unit3(					
																			.clk(clk),
																			.cos0(cos6),
																			.sin0(sin6),
																			.cos1(cos7),
																			.sin1(sin7),
																			.cos2(cos8),
																			.sin2(sin8),
																			
																			.x1_re(re_8),
																			.x1_im(im_8),
																			.x2_re(re_9),
																			.x2_im(im_9),
																			.x3_re(re_10),
																			.x3_im(im_10),
																			.x4_re(re_11),
																			.x4_im(im_11),
																			
																			.p1_re(butterfly_re2),
																			.p1_im(butterfly_im2),
																			.p2_re(butterfly_re6),
																			.p2_im(butterfly_im6),
																			.p3_re(butterfly_re10),
																			.p3_im(butterfly_im10),
																			.p4_re(butterfly_re14),
																			.p4_im(butterfly_im14)
																	  );
//		n=4
//	  	X2(4) 	= 	W(1,:)*[X1(13),X1(14)*exp(-1i*2*pi/N*n),X1(15)*exp(-1i*2*pi/N*2*n),X1(16)*exp(-1i*2*pi/N*3*n)].';
//    X2(8)		=	W(2,:)*[X1(13),X1(14)*exp(-1i*2*pi/N*n),X1(15)*exp(-1i*2*pi/N*2*n),X1(16)*exp(-1i*2*pi/N*3*n)].';
//    X2(12)	=	W(3,:)*[X1(13),X1(14)*exp(-1i*2*pi/N*n),X1(15)*exp(-1i*2*pi/N*2*n),X1(16)*exp(-1i*2*pi/N*3*n)].';
//    X2(16)	=	W(4,:)*[X1(13),X1(14)*exp(-1i*2*pi/N*n),X1(15)*exp(-1i*2*pi/N*2*n),X1(16)*exp(-1i*2*pi/N*3*n)].';	
//    X2(16)	=	W(4,:)*[X1(13),X1(14)*exp(-1i*2*pi/N*n),X1(15)*exp(-1i*2*pi/N*2*n),X1(16)*exp(-1i*2*pi/N*3*n)].';	
//    X2(16)	=	W(4,:)*[X1(13),X1(14)*exp(-1i*2*pi/N*n),X1(15)*exp(-1i*2*pi/N*2*n),X1(16)*exp(-1i*2*pi/N*3*n)].';	
//    X2(16)	=	W(4,:)*[X1(13),X1(14)*exp(-1i*2*pi/N*n),X1(15)*exp(-1i*2*pi/N*2*n),X1(16)*exp(-1i*2*pi/N*3*n)].';	

	butterflyUnitRadix4 butterflyRadix4Unit4(					
																			.clk(clk),
																			.cos0(cos9),
																			.sin0(sin9),
																			.cos1(cos10),
																			.sin1(sin10),
																			.cos2(cos11),
																			.sin2(sin11),
																			
																			.x1_re(re_12),
																			.x1_im(im_12),
																			.x2_re(re_13),
																			.x2_im(im_13),
																			.x3_re(re_14),
																			.x3_im(im_14),
																			.x4_re(re_15),
																			.x4_im(im_15),
																			
																			.p1_re(butterfly_re3),
																			.p1_im(butterfly_im3),
																			.p2_re(butterfly_re7),
																			.p2_im(butterfly_im7),
																			.p3_re(butterfly_re11),
																			.p3_im(butterfly_im11),
																			.p4_re(butterfly_re15),
																			.p4_im(butterfly_im15)
																	  );

endmodule 