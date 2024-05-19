// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * 1 Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * 2 Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * 
 * 3 Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/

/*+
 * Dual port RAM
 * This is behavioral description, for simulation only.
 * Replace it with real element according to technology used.
-*/

module dpram #(
    parameter 		DATA_WIDTH = 32,
    parameter 		ADDR_WIDTH = 5,
    parameter 		DEPTH = 2**ADDR_WIDTH	   
)
(
    input   [DATA_WIDTH -1:0]   data_a,
    input                       wren_a,
    input   [ADDR_WIDTH -1:0]   address_a,
    input                       clock_a,
    output  [DATA_WIDTH -1:0]   q_a,

    input   [DATA_WIDTH -1:0]   data_b,
    input                       wren_b,
    input   [ADDR_WIDTH -1:0]   address_b,
    input                       clock_b,
    output  [DATA_WIDTH -1:0]   q_b 
);   

`ifdef VENDOR_TECH
    VENDOR_DPRAM u_dpram 
    (
        .wren_a         (wren_a),
        .wren_b         (wren_b),
        .data_a         (data_a),
        .data_b         (data_b),
        .address_a      (address_a),
        .address_b      (address_b),
        .clock0         (clock_a),
        .clock1         (clock_b),
        .q_a            (q_a),
        .q_b            (q_b),
    );
`else //behavioral description for simulation
    reg [DATA_WIDTH-1:0]    ram_data [DEPTH-1:0];  
    integer i;

    //initialize memory
    initial begin
        for(i = 0; i < DEPTH; i = i+1)
            ram_data[i] = 0;
    end

    always @(posedge clock_a) begin //port-a writing
        if(wren_a)
            ram_data[address_a] <= data_a;
    end

    always @(posedge clock_b) begin //port-b writing
        if(wren_b)
            ram_data[address_b] <= data_b;
    end

    reg [DATA_WIDTH -1:0]  a_out;

    always @(posedge clock_a) begin //port-a reading
        a_out <= ram_data[address_a];
    end

    assign q_a = a_out;

    reg [DATA_WIDTH -1:0]  b_out;

    always @(posedge clock_b) begin //port-b reading
        b_out <= ram_data[address_b];
    end

    assign q_b = b_out;
`endif
 
endmodule 



