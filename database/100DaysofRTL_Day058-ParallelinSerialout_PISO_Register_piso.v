// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module piso (   
    input clk, reset, load, 
    input [2:0]parallel_in,
    output serial_out
    );

  reg [2:0]q= 3'd0;
  
  always @ (posedge clk) 
  begin
    if(reset) q<= 0;
    else begin
    if (load)
      q <= parallel_in;
    else
    begin 
      q[0]=q[1];
      q[1]=q[2];
      q[2]= 1'bx;
    end
  end
  end
  assign serial_out= q[0];
endmodule
