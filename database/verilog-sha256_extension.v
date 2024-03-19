/****************************************************************************************************/
/*  Extension module - determining words 16-63              		                				*/
/*  Original Source: Aishwarya Nagarajan, UW-Madison, ERCBench Researcher 							*/	
/*	Edited and cleaned by: Sebastian Herzberg, TU Dresden											*/
/*																									*/
/*  Inputs: clk, rst, w_16,w_15,w_7,w_2 (32bits)(input words required for computation)              */
/*  Outputs: w (32 bits)       		                             			     					*/
/*								                    												*/
/*																									*/
/*	This program is free software: you can redistribute it and/or modify							*/	
/*	it under the terms of the GNU General Public License as published by							*/
/*	the Free Software Foundation, either version 3 of the License, or								*/
/*	(at your option) any later version.																*/
/*																									*/
/*	This program is distributed in the hope that it will be useful,									*/
/*	but WITHOUT ANY WARRANTY; without even the implied warranty of									*/
/*	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the									*/	
/*	GNU General Public License for more details.													*/
/*																									*/
/*	You should have received a copy of the GNU General Public License								*/
/*	along with this program.  If not, see <http://www.gnu.org/licenses/>.							*/		
/*																									*/
/****************************************************************************************************/ 

module extension (
	clk,
	rst, 
	w_16, 
	w_15, 
	w_7, 
	w_2, 
	w
); 

	input clk, rst; 
	input[31:0] w_16, w_15, w_7, w_2; 
	
	output reg [31:0] w;
	
    //synchronous behavior
	always @(posedge clk) 
		begin
			if (rst) begin //active high reset
			w <= 32'b0; 
			end
        else begin
		
	// function for assigning value of next word
	// Extend the sixteen 32-bit words into sixty-four 32-bit words:
	// for i from 16 to 63
	// s0 := (w[i-15] rightrotate 7) xor (w[i-15] rightrotate 18) xor (w[i-15] rightshift 3)
	// s1 := (w[i-2] rightrotate 17) xor (w[i-2] rightrotate 19) xor (w[i-2] rightshift 10)
	// w[i] := w[i-16] + s0 + w[i-7] + s1
       
		w <= w_16+w_7+(({w_15[6:0],w_15[31:7]})^({w_15[17:0],w_15[31:18]})^(w_15>>3))+(({w_2[16:0],w_2[31:17]})^({w_2[18:0],w_2[31:19]})^({w_2>>10}));
        end
	end
   
endmodule

