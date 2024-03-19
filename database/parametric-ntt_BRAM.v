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

`timescale 1ns / 1ps

module BRAM #(parameter DLEN = 32, HLEN=9)
           (input                 clk,
            input                 wen,
            input      [HLEN-1:0] waddr,
            input      [DLEN-1:0] din,
            input      [HLEN-1:0] raddr,
            output reg [DLEN-1:0] dout);
// bram
(* ram_style="block" *) reg [DLEN-1:0] blockram [(1<<HLEN)-1:0];

// write operation
always @(posedge clk) begin
    if(wen)
        blockram[waddr] <= din;
end

// read operation
always @(posedge clk) begin
    dout <= blockram[raddr];
end

endmodule
