//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//

module airi5c_sign_modifier
(
    input               clk,
    input               n_reset,
    input               kill,
    input               load,
    
    input               op_sgnj,
    input               op_sgnjn,
    input               op_sgnjx,

    input   [31:0]      a,
    input               sgn_b,
    
    output  reg [31:0]  float_out,
    
    output  reg         ready
);
    
    wire    sgn_a;
    assign  sgn_a = a[31];

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            float_out   <= 32'h00000000;
            ready       <= 1'b0;
        end
        
        else if (kill || (load && !(op_sgnj || op_sgnjn || op_sgnjx))) begin
            float_out   <= 32'h00000000;
            ready       <= 1'b0;
        end
        
        else if (load) begin
            if (op_sgnj)
                float_out <= {sgn_b, a[30:0]};
            
            else if (op_sgnjn)
                float_out <= {!sgn_b, a[30:0]};
            
            else if (op_sgnjx)
                float_out <= {sgn_a ^ sgn_b, a[30:0]};
                
            ready   <= 1'b1;
        end
        
        else
            ready   <= 1'b0;
    end

endmodule