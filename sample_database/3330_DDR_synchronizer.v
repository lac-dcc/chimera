// This program was cloned from: https://github.com/buttercutter/DDR
// License: GNU General Public License v3.0

// https://github.com/jbush001/NyuziProcessor/blob/master/hardware/core/synchronizer.sv
//
// Copyright 2011-2015 Jeff Bush
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
// Transfer a signal into a clock domain, avoiding metastability and
// race conditions due to propagation delay.
//

module synchronizer
    #(parameter WIDTH = 1,
    parameter RESET_STATE = 0)

    (input                      clk,
    input                       reset,
    output reg [WIDTH - 1:0]   data_o,
    input [WIDTH - 1:0]         data_i);

    reg [WIDTH - 1:0] sync0;
    reg [WIDTH - 1:0] sync1;

    always @(posedge clk)
    begin
        if (reset)
        begin
            sync0 <= {WIDTH{RESET_STATE[0:0]}};  // to remove lint Warning-WIDTHCONCAT
            sync1 <= {WIDTH{RESET_STATE[0:0]}};  // to remove lint Warning-WIDTHCONCAT
            data_o <= {WIDTH{RESET_STATE[0:0]}};  // to remove lint Warning-WIDTHCONCAT
        end
        else
        begin
            sync0 <= data_i;
            sync1 <= sync0;
            data_o <= sync1;
        end
    end
    
    `ifdef FORMAL
    	initial data_o = 0;
    	initial sync0 = 0;
    	initial sync1 = 0;
    `endif
endmodule
