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

// inputs are divided into 16-bit chunks
// multiplications are performed using DSP on 1 cc
// partial products are added using CSA in 1 cc
// final output (c, s) will be added in 1 cc

module intMult(input clk,reset,
			   // input reset,
			   input [`DATA_SIZE_ARB-1:0] A,B,
			   output reg[(2*`DATA_SIZE_ARB)-1:0] C);

// connections
(* use_dsp = "yes" *) reg [(2*`DATA_SIZE)-1:0] output_dsp [`GENERIC*`GENERIC-1:0];
wire[(2*`DATA_SIZE)-1:0] op_reg     [(`CSA_LEVEL*3+2)-1:0];

reg [15:0] first_index_dsp  [`GENERIC-1:0];
reg [15:0] second_index_dsp [`GENERIC-1:0];

wire[(2*`DATA_SIZE)-1:0] csa_out_c;
wire[(2*`DATA_SIZE)-1:0] csa_out_s;

reg [(2*`DATA_SIZE)-1:0] C_out;
reg [(2*`DATA_SIZE)-1:0] S_out;

// --------------------------------------------------------------- divide inputs into 16-bit chunks
genvar i_gen_loop,m_gen_loop;

generate
  for(i_gen_loop=0; i_gen_loop < `GENERIC; i_gen_loop=i_gen_loop+1)
  begin
	always @(*) begin
	   first_index_dsp [i_gen_loop] = (A >> (i_gen_loop*16));
	   second_index_dsp[i_gen_loop] = (B >> (i_gen_loop*16));
	end
  end
endgenerate

// --------------------------------------------------------------- multiply 16-bit chunks
integer i_loop=0;
integer m_loop=0;

always @(posedge clk or posedge reset)
begin
  for(i_loop=0; i_loop < `GENERIC; i_loop=i_loop+1)
  begin
		for(m_loop=0; m_loop < `GENERIC; m_loop=m_loop+1)
		begin
			if(reset)
				output_dsp[(i_loop*`GENERIC)+m_loop][(2*`DATA_SIZE)-1:0] <= 0;
			else
				output_dsp[(i_loop*`GENERIC)+m_loop][(2*`DATA_SIZE)-1:0] <= (first_index_dsp[i_loop][15:0] * second_index_dsp[m_loop][15:0])<<((i_loop+m_loop)*16);
		end
  end
end

// --------------------------------------------------------------- Carry-Save Adder for adder tree
// data initialization
generate
	genvar m;

	for(m=0; m<(`GENERIC*`GENERIC); m=m+1) begin: DUMMY
        assign op_reg[m] = output_dsp[m];
    end
endgenerate

// operation
generate
	genvar k;

	for(k=0; k<(`CSA_LEVEL); k=k+1) begin: CSA_LOOP
		CSA csau(op_reg[3*k+0],op_reg[3*k+1],op_reg[3*k+2],op_reg[(`GENERIC*`GENERIC)+2*k+0],op_reg[(`GENERIC*`GENERIC)+2*k+1]);
	end
endgenerate

// DFF value
always @(posedge clk or posedge reset) begin
	if(reset) begin
		C_out <= 0;
		S_out <= 0;
	end
	else begin
		C_out <= (`DATA_SIZE > 16) ? op_reg[(`CSA_LEVEL*3+2)-1] : op_reg[0];
		S_out <= (`DATA_SIZE > 16) ? op_reg[(`CSA_LEVEL*3+2)-2] : op_reg[0];
	end
end

// --------------------------------------------------------------- c + s operation
always @(posedge clk or posedge reset) begin
	if(reset)
		C <= 0;
	else
		C <= (`DATA_SIZE > 16) ? (C_out + S_out) : S_out;
end

endmodule
