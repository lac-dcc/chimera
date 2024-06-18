// This program was cloned from: https://github.com/ejfogleman/ef_smsdac
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Eric Fogleman
 * SPDX-License-Identifier: Apache-2.0
 *
 * wrapper for retiming register
 * retime all DAC outputs to posedge clk
 */

module ef_smsdac_sync ( clk, rst_b, d, q );

  input clk;
  input rst_b;
  input  [7:0] d;
  output  [7:0] q;
  
    reg [7:0] q0, q;
    
    always @( posedge clk, negedge rst_b ) begin
      if ( rst_b == 1'b0 ) begin
          q0 <= 0;
          q <= 0;
      end
      // 2 stage sync flop
      else begin
        q0 <= d;	
        q <= q0;
      end
    end

endmodule
