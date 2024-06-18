// This program was cloned from: https://github.com/efabless/EF_QSPI_XIP_CTRL
// License: Apache License 2.0

/*
	Copyright 2020 Mohamed Shalan (mshalan@aucegypt.edu)
	
	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:
	http://www.apache.org/licenses/LICENSE-2.0
	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/

`timescale          1ns/1ps
`default_nettype    none

/*
    A parameterized Read-only Direct Mapped Cache
*/
module DMC  #(  parameter   NUM_LINES   = 16, 
                            LINE_SIZE   = 16 ) 
(
    input wire                      clk,
    input wire                      rst_n,
    // 
    input wire  [23:0]              A,
    output wire [31:0]              Do,
    output wire                     hit,
    //
    input wire [(LINE_SIZE*8)-1:0]  line,
    input wire                      wr
);
    // Some local parameters for constants needed by the models
    localparam      LINE_WIDTH  = LINE_SIZE * 8;
    localparam      LINE_WORDS  = LINE_SIZE / 4;
    localparam      INDEX_WIDTH = $clog2(NUM_LINES);
    localparam      OFF_WIDTH   = $clog2(LINE_SIZE);
    localparam      TAG_WIDTH   = 24 - INDEX_WIDTH - OFF_WIDTH;
    
    // The cache storage: Data, Tag, Valid
    reg [(LINE_WIDTH - 1): 0]   LINES   [(NUM_LINES-1):0];
    reg [(TAG_WIDTH - 1) : 0]   TAGS    [(NUM_LINES-1):0];
    reg                         VALID   [(NUM_LINES-1):0];

    // The Address Fields
    wire [(OFF_WIDTH - 1) : 0]  offset      =   A[(OFF_WIDTH - 1): 0];
    wire [(OFF_WIDTH - 3) : 0]  word_offset =   offset[(OFF_WIDTH - 1) : 2];
    wire [(INDEX_WIDTH -1): 0]  index       =   A[(OFF_WIDTH+INDEX_WIDTH-1): (OFF_WIDTH)];
    wire [(TAG_WIDTH-1)   : 0]  tag         =   A[23:(OFF_WIDTH+INDEX_WIDTH)];

    // The hit signal has to do with the current 
    assign  hit =   VALID[index] & (TAGS[index] == tag);

    // output the word 
    assign Do = LINES[index][word_offset*32 +: 32];
    
    // clear the VALID flags
    integer i;
    always @ (posedge clk or negedge rst_n)
        if(rst_n == 1'b0) 
            for(i=0; i<NUM_LINES; i=i+1)
                VALID[i] <= 1'b0;
        else  
            if(wr)
                VALID[index]    <= 1'b1;

    always @(posedge clk)
        if(wr) begin
            LINES[index]    <= line;
            TAGS[index]     <= tag;
        end

endmodule