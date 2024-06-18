// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module booth_algorithm(
    input signed [3:0] Q, M,
  output reg signed [7:0] result
  );
  reg [1:0] operation;
  integer i;
  reg q0;
  reg [3:0] M_comp;

  always @(Q,M)
  begin
    result = 8'd0;
    q0 = 1'b0;
    M_comp = -M;
    
    for (i=0; i<4; i=i+1)
    begin
      operation = { Q[i], q0 };
      case(operation)
        2'b10 : result[7:4] = result[7:4] + M_comp;
        2'b01 : result[7:4] = result[7:4] + M;
      endcase
      result = result >> 1;
      result[7] = result[6];
      q0= Q[i];
      
    end
  end
endmodule
