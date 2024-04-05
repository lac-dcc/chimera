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

module CSA(input      [(2*`DATA_SIZE)-1:0] x,y,z,
           output reg [(2*`DATA_SIZE)-1:0] c,s);

wire [(2*`DATA_SIZE)-1:0] c_t,s_t;

generate
	genvar csa_idx;

	for(csa_idx=0; csa_idx<(2*`DATA_SIZE); csa_idx=csa_idx+1) begin: FA_LOOP
		FA fau(x[csa_idx],y[csa_idx],z[csa_idx],c_t[csa_idx],s_t[csa_idx]);
	end
endgenerate

always @(*) begin: SHIFT_LOOP
	integer i;

	for(i=0; i<((2*`DATA_SIZE)-1); i=i+1) begin
		c[i+1] = c_t[i];
		s[i]   = s_t[i];
	end

	c[0]                = 1'b0;
	s[(2*`DATA_SIZE)-1] = s_t[(2*`DATA_SIZE)-1];
end

endmodule
