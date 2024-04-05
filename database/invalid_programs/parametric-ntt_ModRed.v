/*
Copyright 2020, Ahmet Can Mert <ahmetcanmert@sabanciuniv.edu>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

`include "defines.v"

module ModRed (input                               clk,reset,
			   input      [`DATA_SIZE_ARB-1:0]     q,
			   input      [(2*`DATA_SIZE_ARB)-1:0] P,
			   output reg [`DATA_SIZE_ARB-1:0]     C);

// connections
wire [(2*`DATA_SIZE_ARB)-1:0] C_reg [`L_SIZE:0];

assign C_reg[0][(2*`DATA_SIZE_ARB)-1:0] = P[(2*`DATA_SIZE_ARB)-1:0];

// ------------------------------------------------------------- XY+Z+Cin operations (except for the last one)
genvar i_gen_loop;
generate
  for(i_gen_loop=0; i_gen_loop < (`L_SIZE-1); i_gen_loop=i_gen_loop+1)
  begin
		ModRed_sub     #(.CURR_DATA((2*`DATA_SIZE_ARB)-(i_gen_loop  )*(`W_SIZE-1)),
						 .NEXT_DATA((2*`DATA_SIZE_ARB)-(i_gen_loop+1)*(`W_SIZE-1)))
		           mrs  (.clk(clk),
						 .reset(reset),
						 .qH(q[`DATA_SIZE_ARB-1:`W_SIZE]),
						 .T1(C_reg[i_gen_loop]  [((2*`DATA_SIZE_ARB)-(i_gen_loop)  *(`W_SIZE-1))-1:0]),
						 .C (C_reg[i_gen_loop+1][((2*`DATA_SIZE_ARB)-(i_gen_loop+1)*(`W_SIZE-1))-1:0]));

  end
endgenerate

// ------------------------------------------------------------- XY+Z+Cin operations (the last one)
ModRed_sub     #(.CURR_DATA((2*`DATA_SIZE_ARB)-(`L_SIZE-1)*(`W_SIZE-1)),
				 .NEXT_DATA(`DATA_SIZE_ARB+2))
		   mrsl (.clk(clk),
				 .reset(reset),
				 .qH(q[`DATA_SIZE_ARB-1:`W_SIZE]),
				 .T1(C_reg[`L_SIZE-1][((2*`DATA_SIZE_ARB)-(`L_SIZE-1)*(`W_SIZE-1))-1:0]),
				 .C (C_reg[`L_SIZE  ][(`DATA_SIZE_ARB+2)-1:0]));

// ------------------------------------------------------------- final subtraction
wire [`DATA_SIZE_ARB+1:0] C_ext;
wire [`DATA_SIZE_ARB+1:0] C_temp;

assign C_ext  = C_reg[`L_SIZE][(`DATA_SIZE_ARB+2)-1:0];
assign C_temp = C_ext - q;

// ------------------------------------------------------------- final comparison
always @(posedge clk or posedge reset)
begin
	if(reset) begin
		C <= 0;
	end
	else begin
		if (C_temp[`DATA_SIZE_ARB+1])
			C <= C_ext;
		else
			C <= C_temp[`DATA_SIZE_ARB-1:0];
	end
end

endmodule
