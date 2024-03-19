`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:26:23 04/07/2016
// Design Name:   FFT_top
// Module Name:   C:/Users/SUTD/codes/ISE_FFT_16Radix4/FFT_top_tb.v
// Project Name:  ISE_FFT_16Radix4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FFT_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FFT_top_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [4:0] address;
	reg	[15:0] data_tmp11,data_tmp21,data_tmp31,data_tmp41,data_tmp51,data_tmp61,data_tmp71,data_tmp81,data_tmp91,data_tmp101,data_tmp111,data_tmp121,data_tmp131,data_tmp141,data_tmp151,data_tmp161;
	reg	[15:0] data_tmp12,data_tmp22,data_tmp32,data_tmp42,data_tmp52,data_tmp62,data_tmp72,data_tmp82,data_tmp92,data_tmp102,data_tmp112,data_tmp122,data_tmp132,data_tmp142,data_tmp152,data_tmp162;
	// Outputs
	wire [15:0] 		out_r1,out_r2,out_r3,out_r4,out_r5,out_r6,out_r7,out_r8,out_r9,out_r10,out_r11,out_r12,out_r13,out_r14,out_r15,out_r16;
	wire [15:0] 		out_i1,out_i2,out_i3,out_i4,out_i5,out_i6,out_i7,out_i8,out_i9,out_i10,out_i11,out_i12,out_i13,out_i14,out_i15,out_i16;


	// Instantiate the Unit Under Test (UUT)
	FFT_top uut (
		.clk(clk), 
		.reset(reset), 
		.address(address), 
		.out_re0(out_r1),
		.out_re1(out_r2),
		.out_re2(out_r3),
		.out_re3(out_r4),
		.out_re4(out_r5),
		.out_re5(out_r6),
		.out_re6(out_r7),
		.out_re7(out_r8),
		.out_re8(out_r9),
		.out_re9(out_r10),
		.out_re10(out_r11),
		.out_re11(out_r12),
		.out_re12(out_r13),
		.out_re13(out_r14),
		.out_re14(out_r15),
		.out_re15(out_r16),
		.out_im0(out_i1),
		.out_im1(out_i2),
		.out_im2(out_i3),
		.out_im3(out_i4),
		.out_im4(out_i5),
		.out_im5(out_i6),
		.out_im6(out_i7),
		.out_im7(out_i8),
		.out_im8(out_i9),
		.out_im9(out_i10),
		.out_im10(out_i11),
		.out_im11(out_i12),
		.out_im12(out_i13),
		.out_im13(out_i14),
		.out_im14(out_i15),
		.out_im15(out_i16)
		
				
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1'b1;
		address = 5'd0;

		// Wait 100 ns for global reset to finish
		#25;
      reset = 1'b0;
			
		// Add stimulus here

	end
	
	always
	begin	
		#10 clk =~clk;
	end
	
	always @ (negedge clk or negedge reset)
	begin
		if(!reset)
			begin
			if(address==5'd31)
			begin
				address = 5'd0;
				//$finish;
			end
			else
				address = address+5'd1;
			end
		else
			address = 5'd0;
	end

//******* display *********************//	
	always @ (posedge clk)
	begin
	//*********** 1 **************//
	   if(out_r1[15] == 1'b1)
		begin
			data_tmp11=~out_r1+1'b1;
			$display("-%d + ",data_tmp11);
		end
		else
		begin
			data_tmp11=out_r1;
			$display("%d + ",data_tmp11);
		end
		
		if(out_i1[15] == 1'b1)
		begin
			data_tmp12=~out_i1+1'b1;
			$display("-%d i \n",data_tmp12);
		end
		else
		begin
			data_tmp12=out_i1;
			$display("%d i \n",data_tmp12);
		end
	//*********** 2 **************//
	   if(out_r2[15] == 1'b1)
		begin
			data_tmp21=~out_r2+1'b1;
			$display("-%d + ",data_tmp21);
		end
		else
		begin
			data_tmp21=out_r2;
			$display("%d + ",data_tmp21);
		end
		
		if(out_i2[15] == 1'b1)
		begin
			data_tmp22=~out_i2+1'b1;
			$display("-%d i \n",data_tmp22);
		end
		else
		begin
			data_tmp22=out_i2;
			$display("%d i \n",data_tmp22);
		end
		//*********** 3 **************//
	   if(out_r3[15] == 1'b1)
		begin
			data_tmp31=~out_r3+1'b1;
			$display("-%d + ",data_tmp31);
		end
		else
		begin
			data_tmp31=out_r3;
			$display("%d + ",data_tmp31);
		end
		
		if(out_i3[15] == 1'b1)
		begin
			data_tmp32=~out_i3+1'b1;
			$display("-%d i \n",data_tmp32);
		end
		else
		begin
			data_tmp32=out_i3;
			$display("%d i \n",data_tmp32);
		end
		//*********** 4 **************//
	   if(out_r4[15] == 1'b1)
		begin
			data_tmp41=~out_r4+1'b1;
			$display("-%d + ",data_tmp41);
		end
		else
		begin
			data_tmp41=out_r4;
			$display("%d + ",data_tmp41);
		end
		
		if(out_i4[15] == 1'b1)
		begin
			data_tmp42=~out_i4+1'b1;
			$display("-%d i \n",data_tmp42);
		end
		else
		begin
			data_tmp42=out_i4;
			$display("%d i \n",data_tmp42);
		end
		
		//*********** 5 **************//
	   if(out_r5[15] == 1'b1)
		begin
			data_tmp51=~out_r5+1'b1;
			$display("-%d + ",data_tmp51);
		end
		else
		begin
			data_tmp51=out_r5;
			$display("%d + ",data_tmp51);
		end
		
		if(out_i5[15] == 1'b1)
		begin
			data_tmp52=~out_i5+1'b1;
			$display("-%d i \n",data_tmp52);
		end
		else
		begin
			data_tmp52=out_i5;
			$display("%d i \n",data_tmp52);
		end
		
		//*********** 6 **************//
	   if(out_r6[15] == 1'b1)
		begin
			data_tmp61=~out_r6+1'b1;
			$display("-%d + ",data_tmp11);
		end
		else
		begin
			data_tmp61=out_r6;
			$display("%d + ",data_tmp61);
		end
		
		if(out_i6[15] == 1'b1)
		begin
			data_tmp62=~out_i6+1'b1;
			$display("-%d i \n",data_tmp62);
		end
		else
		begin
			data_tmp62=out_i6;
			$display("%d i \n",data_tmp62);
		end
		//*********** 7 **************//
	   if(out_r7[15] == 1'b1)
		begin
			data_tmp71=~out_r7+1'b1;
			$display("-%d + ",data_tmp71);
		end
		else
		begin
			data_tmp71=out_r7;
			$display("%d + ",data_tmp71);
		end
		
		if(out_i7[15] == 1'b1)
		begin
			data_tmp72=~out_i7+1'b1;
			$display("-%d i \n",data_tmp72);
		end
		else
		begin
			data_tmp72=out_i7;
			$display("%d i \n",data_tmp72);
		end//*********** 8 **************//
	   if(out_r8[15] == 1'b1)
		begin
			data_tmp81=~out_r8+1'b1;
			$display("-%d + ",data_tmp81);
		end
		else
		begin
			data_tmp81=out_r8;
			$display("%d + ",data_tmp81);
		end
		
		if(out_i8[15] == 1'b1)
		begin
			data_tmp82=~out_i8+1'b1;
			$display("-%d i \n",data_tmp82);
		end
		else
		begin
			data_tmp82=out_i8;
			$display("%d i \n",data_tmp82);
		end//*********** 9 **************//
	   if(out_r9[15] == 1'b1)
		begin
			data_tmp91=~out_r9+1'b1;
			$display("-%d + ",data_tmp91);
		end
		else
		begin
			data_tmp91=out_r9;
			$display("%d + ",data_tmp91);
		end
		
		if(out_i9[15] == 1'b1)
		begin
			data_tmp92=~out_i9+1'b1;
			$display("-%d i \n",data_tmp92);
		end
		else
		begin
			data_tmp92=out_i9;
			$display("%d i \n",data_tmp92);
		end//*********** 10 **************//
	   if(out_r10[15] == 1'b1)
		begin
			data_tmp101=~out_r10+1'b1;
			$display("-%d + ",data_tmp101);
		end
		else
		begin
			data_tmp101=out_r10;
			$display("%d + ",data_tmp101);
		end
		
		if(out_i10[15] == 1'b1)
		begin
			data_tmp102=~out_i10+1'b1;
			$display("-%d i \n",data_tmp102);
		end
		else
		begin
			data_tmp102=out_i10;
			$display("%d i \n",data_tmp102);
		end//*********** 11**************//
	   if(out_r11[15] == 1'b1)
		begin
			data_tmp111=~out_r11+1'b1;
			$display("-%d + ",data_tmp111);
		end
		else
		begin
			data_tmp111=out_r11;
			$display("%d + ",data_tmp111);
		end
		
		if(out_i11[15] == 1'b1)
		begin
			data_tmp112=~out_i11+1'b1;
			$display("-%d i \n",data_tmp112);
		end
		else
		begin
			data_tmp112=out_i11;
			$display("%d i \n",data_tmp112);
		end//*********** 12 **************//
	   if(out_r12[15] == 1'b1)
		begin
			data_tmp121=~out_r12+1'b1;
			$display("-%d + ",data_tmp121);
		end
		else
		begin
			data_tmp121=out_r12;
			$display("%d + ",data_tmp121);
		end
		
		if(out_i12[15] == 1'b1)
		begin
			data_tmp122=~out_i12+1'b1;
			$display("-%d i \n",data_tmp122);
		end
		else
		begin
			data_tmp122=out_i12;
			$display("%d i \n",data_tmp122);
		end//*********** 13 **************//
	   if(out_r13[15] == 1'b1)
		begin
			data_tmp131=~out_r13+1'b1;
			$display("-%d + ",data_tmp131);
		end
		else
		begin
			data_tmp131=out_r13;
			$display("%d + ",data_tmp131);
		end
		
		if(out_i13[15] == 1'b1)
		begin
			data_tmp132=~out_i13+1'b1;
			$display("-%d i \n",data_tmp132);
		end
		else
		begin
			data_tmp132=out_i13;
			$display("%d i \n",data_tmp132);
		end//*********** 14 **************//
	   if(out_r14[15] == 1'b1)
		begin
			data_tmp141=~out_r14+1'b1;
			$display("-%d + ",data_tmp141);
		end
		else
		begin
			data_tmp141=out_r14;
			$display("%d + ",data_tmp141);
		end
		
		if(out_i14[15] == 1'b1)
		begin
			data_tmp142=~out_i14+1'b1;
			$display("-%d i \n",data_tmp142);
		end
		else
		begin
			data_tmp142=out_i14;
			$display("%d i \n",data_tmp142);
		end//*********** 15 **************//
	   if(out_r15[15] == 1'b1)
		begin
			data_tmp151=~out_r15+1'b1;
			$display("-%d + ",data_tmp151);
		end
		else
		begin
			data_tmp151=out_r15;
			$display("%d + ",data_tmp151);
		end
		
		if(out_i15[15] == 1'b1)
		begin
			data_tmp152=~out_i15+1'b1;
			$display("-%d i \n",data_tmp152);
		end
		else
		begin
			data_tmp152=out_i15;
			$display("%d i \n",data_tmp152);
		end//*********** 16 **************//
	   if(out_r16[15] == 1'b1)
		begin
			data_tmp161=~out_r16+1'b1;
			$display("-%d + ",data_tmp161);
		end
		else
		begin
			data_tmp161=out_r16;
			$display("%d + ",data_tmp161);
		end
		
		if(out_i16[15] == 1'b1)
		begin
			data_tmp162=~out_i16+1'b1;
			$display("-%d i \n",data_tmp162);
		end
		else
		begin
			data_tmp162=out_i16;
			$display("%d i \n",data_tmp162);
		end
	end

      
endmodule

