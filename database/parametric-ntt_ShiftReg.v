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

`timescale 1 ns / 1 ps

module ShiftReg #(parameter SHIFT = 0, DATA=32)
   (input         clk,reset,
    input  [DATA-1:0] data_in,
    output [DATA-1:0] data_out);

reg [DATA-1:0] shift_array [SHIFT-1:0];

always @(posedge clk or posedge reset) begin
    if(reset)
        shift_array[0] <= 0;
    else
        shift_array[0] <= data_in;
end

genvar shft;

generate
    for(shft=0; shft < SHIFT-1; shft=shft+1) begin: DELAY_BLOCK
        always @(posedge clk or posedge reset) begin
            if(reset)
                shift_array[shft+1] <= 0;
            else
                shift_array[shft+1] <= shift_array[shft];
        end
    end
endgenerate

assign data_out = shift_array[SHIFT-1];

endmodule
