// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

// file: counter.v
// author: @habibagamal

`timescale 1ns/1ns

module counter(clk, resetN, en, up_downN, load, initialCount, currentCount);
  
  input clk, resetN, en, up_downN, load; 
  input [4:0] initialCount;
  output reg [4:0] currentCount;
  
  always @ (posedge clk or negedge resetN) begin 
    if (!resetN) begin 
      currentCount <= 5'b0;
    end
    else begin 
      if (en && load)
        currentCount <= initialCount;
      else if (en && up_downN)
        currentCount <= currentCount + 1; 
      else if (en && !up_downN)
        currentCount <= currentCount - 1; 
      else 
        currentCount <= currentCount;
    end
  end
  
endmodule