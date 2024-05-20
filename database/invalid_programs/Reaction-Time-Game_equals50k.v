// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`include "Equals15bit.v"

module equals50k(X, R);
  input [15:0] X;
  output R;
  reg [15:0] comp;
  

  initial begin
  comp = 16'b01100111010110100;
  end
  
  Equals15bit equator (
    X,
    comp, //50000
    out_e
  );

  assign R = out_e;

  endmodule
