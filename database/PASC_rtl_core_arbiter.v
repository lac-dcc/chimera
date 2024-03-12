// 
// Copyright 2011-2012 Jeff Bush
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
// Round robin arbiter.
// The incoming signal 'request' indicates units that would like to access some
// shared resource.  Each cycle, the signal grant_oh (one hot) will set one
// bit to indicate the unit that should receive access.  Once a unit has
// been granted access, it will not get it again until all other units that 
// are currently requesting access receive it.
//
// Idea taken from Altera's Advanced Synthesis Cookbook.  Basically, if you 
// subtract a value with one set bit from another, each more-significant 
// zero bit will result in a borrow (changing from 0 to 1 in the difference)
// until a 1 bit is hit, which will switch from 1 to 0. The word is duplicated
// to make it wrap around.
//

module arbiter
    #(parameter NUM_ENTRIES = 4)

    (input                          clk,
    input                           reset,
    input[NUM_ENTRIES - 1:0]        request,
    output reg[NUM_ENTRIES - 1:0]   grant_oh);

    reg[NUM_ENTRIES - 1:0] base;
    wire[NUM_ENTRIES * 2 - 1:0] double_request = { request, request };
    wire[NUM_ENTRIES * 2 - 1:0] double_grant = double_request 
        & ~(double_request - base);
    wire[NUM_ENTRIES - 1:0] grant_nxt = double_grant[NUM_ENTRIES * 2 - 1:NUM_ENTRIES] 
        | double_grant[NUM_ENTRIES - 1:0];

    always @(posedge clk, posedge reset)
    begin
        if (reset)
        begin
            base <= 1;
            grant_oh <= 0;
        end
        else 
        begin
            if (grant_nxt != 0)
                base <= { grant_nxt[NUM_ENTRIES - 2:0], grant_nxt[NUM_ENTRIES - 1] }; // Rotate left

            grant_oh <= grant_nxt;
        end
    end
endmodule

