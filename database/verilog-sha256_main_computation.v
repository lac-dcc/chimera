/****************************************************************************************************/
/*  Hash computation module - determining intermediate values of a through h      	 	            */
/*  Original Source: Aishwarya Nagarajan, UW-Madison, ERCBench Researcher 							*/	
/*	Edited and cleaned by: Sebastian Herzberg, TU Dresden											*/
/*														                    			  			*/
/*  Inputs: clk, rst, k,w,a_in,b_in,c_in,d_in,e_in,f_in,g_in,h-in (32bits)	                     	*/
/*  Outputs: a_out,b_out,c_out,d_out,e_out,f_out,g_out,h_out (32 bits)              	       	    */
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

module main_loop(
	clk,
	rst,
	k,
	w,
	a_in,
	b_in,
	c_in,
	d_in,
	e_in,
	f_in,
	g_in,
	h_in,
	a_out,
	b_out,
	c_out,
	d_out,
	e_out,
	f_out,
	g_out,
	h_out
);

	input clk, rst;
	input [31:0] k, w, a_in, b_in, c_in, d_in, e_in, f_in, g_in, h_in;
	
	output reg [31:0] a_out, b_out, c_out, d_out, e_out, f_out, g_out, h_out;

	wire [31:0] s0, s1, ch, maj; 
   
	assign s0 = ({a_in[1:0],a_in[31:2]}) ^ ({a_in[12:0],a_in[31:13]}) ^ ({a_in[21:0],a_in[31:22]});
	assign maj = ((a_in & b_in) ^ (a_in & c_in) ^ (b_in & c_in));
	// assign t2 = s0+maj;
   
	assign s1 = ({e_in[5:0],e_in[31:6]}) ^ ({e_in[10:0],e_in[31:11]}) ^ ({e_in[24:0],e_in[31:25]});
	assign ch = ((e_in & f_in) ^ ((~e_in) & g_in));
	//assign t1 = h_in+s1+ch+k+w; 
   
	always @ (posedge clk) begin
		if (rst) begin
			h_out = 32'b0;
			g_out = 32'b0; 
			f_out = 32'b0;
			e_out = 32'b0;
			d_out = 32'b0;
			c_out = 32'b0;
			b_out = 32'b0;
			a_out = 32'b0;    
		end
	else begin
			h_out = g_in;
			g_out = f_in; 
			f_out = e_in;
			e_out = d_in + h_in + s1 + ch + k + w;		// t1 = h_in + s1 + ch + k + w;
			d_out = c_in;
			c_out = b_in;
			b_out = a_in;
			a_out = h_in + s1 + ch + k + w + s0 + maj; 	// t2 = s0 + maj;
		end
	end   
endmodule


