`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:37:56 04/07/2016 
// Design Name: 
// Module Name:    FFT_top 
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
module FFT_top(
						input		    clk,
						input		    reset,
						input	[4:0]  address,
						output[15:0] out_re0,
						output[15:0] out_re1,
						output[15:0] out_re2,
						output[15:0] out_re3,
						output[15:0] out_re4,
						output[15:0] out_re5,
						output[15:0] out_re6,
						output[15:0] out_re7,
						output[15:0] out_re8,
						output[15:0] out_re9,
						output[15:0] out_re10,
						output[15:0] out_re11,
						output[15:0] out_re12,
						output[15:0] out_re13,
						output[15:0] out_re14,
						output[15:0] out_re15,
						
						output[15:0] out_im0,
						output[15:0] out_im1,
						output[15:0] out_im2,
						output[15:0] out_im3,
						output[15:0] out_im4,
						output[15:0] out_im5,
						output[15:0] out_im6,
						output[15:0] out_im7,
						output[15:0] out_im8,
						output[15:0] out_im9,
						output[15:0] out_im10,
						output[15:0] out_im11,
						output[15:0] out_im12,
						output[15:0] out_im13,
						output[15:0] out_im14,
						output[15:0] out_im15
					);
	 
	 

		
		wire		[15:0]	dataStream;
		wire		[15:0]	inputRe0,inputRe1,inputRe2,inputRe3,inputRe4,inputRe5,inputRe6,inputRe7,inputRe8,inputRe9,inputRe10,inputRe11,inputRe12,inputRe13,inputRe14,inputRe15,inputIm0,inputIm1,inputIm2,inputIm3,inputIm4,inputIm5,inputIm6,inputIm7,inputIm8,inputIm9,inputIm10,inputIm11,inputIm12,inputIm13,inputIm14,inputIm15;
		
		wire[15:0] butterfly_re[15:0];
		wire[15:0] butterfly_im[15:0];
//****** read data *****************		
		inputRom rom1(
						.clka(clk),
						.addra(address),
						.douta(dataStream)
						);
//**********************************	

//****** Deserializer ***************
		Deserializer dese1(
						.clk(clk),
						.reset(reset),
						.datain(dataStream),
						.dataout0(inputRe0),
						.dataout1(inputRe1),
						.dataout2(inputRe2),
						.dataout3(inputRe3),
						.dataout4(inputRe4),
						.dataout5(inputRe5),
						.dataout6(inputRe6),
						.dataout7(inputRe7),
						.dataout8(inputRe8),
						.dataout9(inputRe9),
						.dataout10(inputRe10),
						.dataout11(inputRe11),
						.dataout12(inputRe12),
						.dataout13(inputRe13),
						.dataout14(inputRe14),
						.dataout15(inputRe15),
						.dataout16(inputIm0),
						.dataout17(inputIm1),
						.dataout18(inputIm2),
						.dataout19(inputIm3),
						.dataout20(inputIm4),
						.dataout21(inputIm5),
						.dataout22(inputIm6),
						.dataout23(inputIm7),
						.dataout24(inputIm8),
						.dataout25(inputIm9),
						.dataout26(inputIm10),
						.dataout27(inputIm11),
						.dataout28(inputIm12),
						.dataout29(inputIm13),
						.dataout30(inputIm14),
						.dataout31(inputIm15),
						.finish(out)
						);
						
						
//*************** butterfuly 1 **********************			
//  n=0:3
//  	X(n+1)=W(1,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//		X(n+5)=W(2,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//    X(n+9)=W(3,:)* ([x(n+1),x(n+5),x(n+9),x(n+13)].');
//    X(n+13)=W(4,:)*([x(n+1),x(n+5),x(n+9),x(n+13)].');
//W = [ 	1 	1 	1 	1  
//		 	1 	-j	-1	j			
//			1	-1	1	-1						
//			1	j	-1	-j ]				
		butterflyRadix4First butterfly1st(
														  .clk(clk),
														  .en(out),
														  .re_0(inputRe0),
														  .re_1(inputRe1),
														  .re_2(inputRe2),
														  .re_3(inputRe3),
														  .re_4(inputRe4),
														  .re_5(inputRe5),
														  .re_6(inputRe6),
														  .re_7(inputRe7),
														  .re_8(inputRe8),
														  .re_9(inputRe9),
														  .re_10(inputRe10),
														  .re_11(inputRe11),
														  .re_12(inputRe12),
														  .re_13(inputRe13),
														  .re_14(inputRe14),
														  .re_15(inputRe15),
														  
														  .im_0(inputIm0),
														  .im_1(inputIm1),
														  .im_2(inputIm2),
														  .im_3(inputIm3),
														  .im_4(inputIm4),
														  .im_5(inputIm5),
														  .im_6(inputIm6),
														  .im_7(inputIm7),
														  .im_8(inputIm8),
														  .im_9(inputIm9),
														  .im_10(inputIm10),
														  .im_11(inputIm11),
														  .im_12(inputIm12),
														  .im_13(inputIm13),
														  .im_14(inputIm14),
														  .im_15(inputIm15),
														  
														  .butterfly_re0(butterfly_re[0]),
														  .butterfly_re1(butterfly_re[1]),
														  .butterfly_re2(butterfly_re[2]),
														  .butterfly_re3(butterfly_re[3]),
														  .butterfly_re4(butterfly_re[4]),
														  .butterfly_re5(butterfly_re[5]),
														  .butterfly_re6(butterfly_re[6]),
														  .butterfly_re7(butterfly_re[7]),
														  .butterfly_re8(butterfly_re[8]),
														  .butterfly_re9(butterfly_re[9]),
														  .butterfly_re10(butterfly_re[10]),
														  .butterfly_re11(butterfly_re[11]),
														  .butterfly_re12(butterfly_re[12]),
														  .butterfly_re13(butterfly_re[13]),
														  .butterfly_re14(butterfly_re[14]),
														  .butterfly_re15(butterfly_re[15]),
														  
														  .butterfly_im0(butterfly_im[0]),
														  .butterfly_im1(butterfly_im[1]),
														  .butterfly_im2(butterfly_im[2]),
														  .butterfly_im3(butterfly_im[3]),
														  .butterfly_im4(butterfly_im[4]),
														  .butterfly_im5(butterfly_im[5]),
														  .butterfly_im6(butterfly_im[6]),
														  .butterfly_im7(butterfly_im[7]),
														  .butterfly_im8(butterfly_im[8]),
														  .butterfly_im9(butterfly_im[9]),
														  .butterfly_im10(butterfly_im[10]),
														  .butterfly_im11(butterfly_im[11]),
														  .butterfly_im12(butterfly_im[12]),
														  .butterfly_im13(butterfly_im[13]),
														  .butterfly_im14(butterfly_im[14]),
														  .butterfly_im15(butterfly_im[15])
													  );	
			
						
			//***************************************************	

			//**************** Second Butterfly *****************
//		n=0:3
//	  	X(n+1) 	= 	W(1,:)*[X1(4*n+1),X1(4*n+2)*exp(-1i*2*pi/N*n),X1(4*n+3)*exp(-1i*2*pi/N*2*n),X1(4*n+4)*exp(-1i*2*pi/N*3*n)].';
//    X2(n+5)	=	W(2,:)*[X1(4*n+1),X1(4*n+2)*exp(-1i*2*pi/N*n),X1(4*n+3)*exp(-1i*2*pi/N*2*n),X1(4*n+4)*exp(-1i*2*pi/N*3*n)].';
//    X2(n+9)	=	W(3,:)*[X1(4*n+1),X1(4*n+2)*exp(-1i*2*pi/N*n),X1(4*n+3)*exp(-1i*2*pi/N*2*n),X1(4*n+4)*exp(-1i*2*pi/N*3*n)].';
//    X2(n+13)	=	W(4,:)*[X1(4*n+1),X1(4*n+2)*exp(-1i*2*pi/N*n),X1(4*n+3)*exp(-1i*2*pi/N*2*n),X1(4*n+4)*exp(-1i*2*pi/N*3*n)].';

			butterflyRadix4Second butterfly2nd(
														  .clk(clk),
														  
														  .re_0(butterfly_re[0]),
														  .re_1(butterfly_re[1]),
														  .re_2(butterfly_re[2]),
														  .re_3(butterfly_re[3]),
														  .re_4(butterfly_re[4]),
														  .re_5(butterfly_re[5]),
														  .re_6(butterfly_re[6]),
														  .re_7(butterfly_re[7]),
														  .re_8(butterfly_re[8]),
														  .re_9(butterfly_re[9]),
														  .re_10(butterfly_re[10]),
														  .re_11(butterfly_re[11]),
														  .re_12(butterfly_re[12]),
														  .re_13(butterfly_re[13]),
														  .re_14(butterfly_re[14]),
														  .re_15(butterfly_re[15]),
														  
														  .im_0(butterfly_im[0]),
														  .im_1(butterfly_im[1]),
														  .im_2(butterfly_im[2]),
														  .im_3(butterfly_im[3]),
														  .im_4(butterfly_im[4]),
														  .im_5(butterfly_im[5]),
														  .im_6(butterfly_im[6]),
														  .im_7(butterfly_im[7]),
														  .im_8(butterfly_im[8]),
														  .im_9(butterfly_im[9]),
														  .im_10(butterfly_im[10]),
														  .im_11(butterfly_im[11]),
														  .im_12(butterfly_im[12]),
														  .im_13(butterfly_im[13]),
														  .im_14(butterfly_im[14]),
														  .im_15(butterfly_im[15]),
														  
														  .butterfly_re0(out_re0),
														  .butterfly_re1(out_re1),
														  .butterfly_re2(out_re2),
														  .butterfly_re3(out_re3),
														  .butterfly_re4(out_re4),
														  .butterfly_re5(out_re5),
														  .butterfly_re6(out_re6),
														  .butterfly_re7(out_re7),
														  .butterfly_re8(out_re8),
														  .butterfly_re9(out_re9),
														  .butterfly_re10(out_re10),
														  .butterfly_re11(out_re11),
														  .butterfly_re12(out_re12),
														  .butterfly_re13(out_re13),
														  .butterfly_re14(out_re14),
														  .butterfly_re15(out_re15),
														  
														  .butterfly_im0(out_im0),
														  .butterfly_im1(out_im1),
														  .butterfly_im2(out_im2),
														  .butterfly_im3(out_im3),
														  .butterfly_im4(out_im4),
														  .butterfly_im5(out_im5),
														  .butterfly_im6(out_im6),
														  .butterfly_im7(out_im7),
														  .butterfly_im8(out_im8),
														  .butterfly_im9(out_im9),
														  .butterfly_im10(out_im10),
														  .butterfly_im11(out_im11),
														  .butterfly_im12(out_im12),
														  .butterfly_im13(out_im13),
														  .butterfly_im14(out_im14),
														  .butterfly_im15(out_im15)
													  );



//***************************************************
					
						
						
						
						
						
		
//***************************************************




endmodule 