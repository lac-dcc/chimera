// This program was cloned from: https://github.com/HVT06/Adder32
// License: Apache License 2.0

`include "wallace.v"
`include "cpa.v"

module PE(element_in, pSum_in, clk, clear, element_out, pSum_out);
  
  parameter weight = 8'b00000001;
  input[7:0] element_in;
  input[15:0] pSum_in;
  input clk;
  input clear;
  
  output[7:0] element_out;
  output[15:0] pSum_out;
  reg[7:0] element_out;
  reg[15:0] pSum_out;
  
  reg[7:0] next_element;
  reg[15:0] next_pSum;
  
  wire[15:0] wire1;
  wire[15:0] wire2;
  
  wallace tree1(element_in, weight, wire1);
  modify_cpa_16bit cpa1(wire1, pSum_in, wire2);
  
  always @(posedge clk, clear) begin
    if(!clear) begin
      next_element = 0;
  	  next_pSum = 0;
    end else begin
      next_element = element_in;
      next_pSum = wire2;
    end
    element_out = next_element;
    pSum_out = next_pSum;
    
  end
  
    
endmodule

