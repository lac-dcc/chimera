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

module ModRed_sub #(parameter CURR_DATA = 0, NEXT_DATA = 0)
                  (input                                     clk,reset,
				   input     [(`DATA_SIZE_ARB-`W_SIZE)-1:0]  qH,
				   input     [CURR_DATA-1:0]                 T1,
				   output reg[NEXT_DATA-1:0]                 C);

// connections
reg [(`W_SIZE)-1:0]             T2L;
reg [(`W_SIZE)-1:0]             T2;

reg [(CURR_DATA - `W_SIZE)-1:0] T2H;
reg                             CARRY;

(* use_dsp = "yes" *) reg [`DATA_SIZE_ARB - 1:0]      MULT;

// --------------------------------------------------------------- multiplication of qH and T2 (and registers)
always @(*) begin
	T2L = T1[(`W_SIZE)-1:0];
    T2  = (-T2L);
end

always @(posedge clk or posedge reset) begin
    if(reset) begin
        T2H   <= 0;
        CARRY <= 0;
        MULT  <= 0;
    end
    else begin
        T2H   <= (T1 >> (`W_SIZE));
        CARRY <= (T2L[`W_SIZE-1] | T2[`W_SIZE-1]);
        MULT  <= qH * T2;
    end
end

// --------------------------------------------------------------- final addition operation
always @(posedge clk or posedge reset) begin
    if(reset) begin
        C <= 0;
    end
    else begin
        C <= (MULT+T2H)+CARRY;
    end
end

endmodule
