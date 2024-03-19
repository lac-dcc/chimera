`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:22:33 04/07/2016 
// Design Name: 
// Module Name:    Deserializer 
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
  module Deserializer(
							clk,
							reset,
							datain,
					// first 16 is real  last16 is imaginary 		
							dataout0,  
							dataout1,
							dataout2,
							dataout3,
							dataout4,
							dataout5,
							dataout6,
							dataout7,
							dataout8,
							dataout9,
							dataout10,
							dataout11,
							dataout12,
							dataout13,
							dataout14,
							dataout15,
							dataout16,
							dataout17,
							dataout18,
							dataout19,
							dataout20,
							dataout21,
							dataout22,
							dataout23,
							dataout24,
							dataout25,
							dataout26,
							dataout27,
							dataout28,
							dataout29,
							dataout30,
							dataout31,
							finish
							);
			
				input 						clk;
				input  	[15:0]			datain;
				input							reset;
				
				
				output	[15:0]			dataout0;
				output	[15:0]			dataout1;
				output	[15:0]			dataout2;
				output	[15:0]			dataout3;
				output	[15:0]			dataout4;
				output	[15:0]			dataout5;
				output	[15:0]			dataout6;
				output	[15:0]			dataout7;
				output	[15:0]			dataout8;
				output	[15:0]			dataout9;
				output	[15:0]			dataout10;
				output	[15:0]			dataout11;
				output	[15:0]			dataout12;
				output	[15:0]			dataout13;
				output	[15:0]			dataout14;
				output	[15:0]			dataout15;
				output	[15:0]			dataout16;
				output	[15:0]			dataout17;
				output	[15:0]			dataout18;
				output	[15:0]			dataout19;
				output	[15:0]			dataout20;
				output	[15:0]			dataout21;
				output	[15:0]			dataout22;
				output	[15:0]			dataout23;
				output	[15:0]			dataout24;
				output	[15:0]			dataout25;
				output	[15:0]			dataout26;
				output	[15:0]			dataout27;
				output	[15:0]			dataout28;
				output	[15:0]			dataout29;
				output	[15:0]			dataout30;
				output	[15:0]			dataout31;
				
				output						finish;
			
			reg 		signed	[15:0]	dataout0,dataout1,dataout2,dataout3,dataout4,dataout5,dataout6,dataout7,dataout8,dataout9,dataout10,dataout11,dataout12,dataout13,dataout14,dataout15,dataout16,dataout17,dataout18,dataout19,dataout20,dataout21,dataout22,dataout23,dataout24,dataout25,dataout26,dataout27,dataout28,dataout29,dataout30,dataout31;
//			reg 		signed 	[15:0]	finish;
			reg		signed	[3:0]		counter;
			reg								finish;
			reg								dataValid;
			
			always @ (posedge clk or negedge reset)
			if(!reset)
			begin
					dataout0 <= datain;
					dataout1 <= dataout0;
					dataout2 <= dataout1;
					dataout3 <= dataout2;
					dataout4 <= dataout3;
					dataout5 <= dataout4;
					dataout6 <= dataout5;
					dataout7 <= dataout6;
					dataout8 <= dataout7;
					dataout9 <= dataout8;
					dataout10 <= dataout9;
					dataout11 <= dataout10;
					dataout12 <= dataout11;
					dataout13 <= dataout12;
					dataout14 <= dataout13;
					dataout15 <= dataout14;
					dataout16 <= dataout15;
					dataout17 <= dataout16;
					dataout18 <= dataout17;
					dataout19 <= dataout18;
					dataout20 <= dataout19;
					dataout21 <= dataout20;
					dataout22 <= dataout21;
					dataout23 <= dataout22;
					dataout24 <= dataout23;
					dataout25 <= dataout24;
					dataout26 <= dataout25;
					dataout27 <= dataout26;
					dataout28 <= dataout27;
					dataout29 <= dataout28;
					dataout30 <= dataout29;
					dataout31 <= dataout30;
					if (datain != 16'd0)
					begin
						dataValid <= 1'b1;
					end
					if(dataValid == 1'b1)
					begin
						if(counter == 4'd15)
						begin
							counter	 <= 4'd0;
							finish    <= 1'b1;
						end
						else
							counter	 <= counter+4'b1	;
					end

			end
			else
			begin
					dataout0 <= 16'd0;
					dataout1 <= 16'd0;
					dataout2 <= 16'd0;
					dataout3 <= 16'd0;
					dataout4 <= 16'd0;
					dataout5 <= 16'd0;
					dataout6 <= 16'd0;
					dataout7 <= 16'd0;
					dataout8 <= 16'd0;
					dataout9 <= 16'd0;
					dataout10 <= 16'd0;
					dataout11 <= 16'd0;
					dataout12 <= 16'd0;
					dataout13 <= 16'd0;
					dataout14 <= 16'd0;
					dataout15 <= 16'd0;
					dataout16 <= 16'd0;
					dataout17 <= 16'd0;
					dataout18 <= 16'd0;
					dataout19 <= 16'd0;
					dataout20 <= 16'd0;
					dataout21 <= 16'd0;
					dataout22 <= 16'd0;
					dataout23 <= 16'd0;
					dataout24 <= 16'd0;
					dataout25 <= 16'd0;
					dataout26 <= 16'd0;
					dataout27 <= 16'd0;
					dataout28 <= 16'd0;
					dataout29 <= 16'd0;
					dataout30 <= 16'd0;
					dataout31 <= 16'd0;
					counter	 <= 4'b0	;
					finish    <= 1'b0;
					dataValid <= 1'b0;
			end
			
				



endmodule
