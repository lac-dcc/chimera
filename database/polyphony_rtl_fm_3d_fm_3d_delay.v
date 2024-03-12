//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_delay.v
//
// Abstract:
//   Pipeline delay module (without reset)
//       parameters :
//                WIDTH      data width (default value is 8)
//                NUM_DELAY  number of delay cycle  (default value is 8)
//
//  Created:
//    25 August 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//
// Copyright (c) 2020, Kenji Ishimaru
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//  -Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//  -Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

module fm_3d_delay (
    clk_core,
    i_en,
    i_data,
    o_data
);

////////////////////////////
// parameter
////////////////////////////
    parameter P_WIDTH     = 8;
    parameter P_NUM_DELAY = 8;
////////////////////////////
// I/O definition
////////////////////////////
    input                clk_core;
    input                i_en;
    input  [P_WIDTH-1:0] i_data;
    output [P_WIDTH-1:0] o_data;

////////////////////////////
// reg
////////////////////////////
    reg   [P_WIDTH-1:0] r_delay[0:P_NUM_DELAY-1];

////////////////////////////
// assign
////////////////////////////
    // in/out port connection
    assign o_data = r_delay[P_NUM_DELAY-1];

////////////////////////////
// always
////////////////////////////
    always @(posedge clk_core) begin
        if (i_en) r_delay[0] <= i_data;
    end

    // delay register connection
    integer i;
    always @(posedge clk_core) begin
        if ( P_NUM_DELAY > 1 ) begin
            for ( i = 1; i < P_NUM_DELAY; i = i + 1) begin
                if (i_en) r_delay[i] <= r_delay[i-1];
            end
        end
    end

endmodule
