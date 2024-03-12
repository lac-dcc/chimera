// 
// Copyright 2013 Jeff Bush
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// 

//
// Single Ported SRAM, 1 read/write port
//

module spsram
    #(parameter SIZE=4096,
    parameter DATA_WIDTH=16,
    parameter ADDR_WIDTH=$clog2(SIZE),
    parameter ENABLE_INIT = 0,
    parameter INIT_FILE="")

    (input                          clk,
    input[ADDR_WIDTH - 1:0]         addr_a,
    output reg[DATA_WIDTH - 1:0]    q_a,
    input                           we_a,
    input[DATA_WIDTH - 1:0]         data_a);

    reg[DATA_WIDTH - 1:0] data[0:SIZE - 1];
    integer i;
    
    initial
    begin
        for (i = 0; i < SIZE; i = i + 1)
            data[i] = 0;

        q_a = 0;

        if (ENABLE_INIT)
            $readmemh(INIT_FILE, data);
    end

    // Port A
    always @(posedge clk)
    begin
        if (we_a)
        begin
            data[addr_a] <= data_a;     
            q_a <= data_a;
        end
        else
            q_a <= data[addr_a];
    end
endmodule
