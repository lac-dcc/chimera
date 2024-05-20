// This program was cloned from: https://github.com/Prateek38137/VLSI2025
// License: MIT License

`timescale 1ns/1ns
//
`default_nettype none
// SET YOUR USER TEMPERATURE
`define USER_TEMP_SET 8'd24

module tb ();

  wire SIO;
  wire SCK;
  wire RSTN;
  reg  CS;
  reg [15:0] LM70_TEMP_IN;
  reg [7:0] temp_set_8b;
  reg clk;
  reg rst_n;
 
  
  assign SCK = clk;
  assign RSTN = rst_n;
  //Instiate LM70 and connect inputs
  LM70 tsense(.TEMP_SET(LM70_TEMP_IN), .RSTN(RSTN), .CS(CS), .SCK(SCK), .SIO(SIO));
 
  //Generate test clock
  initial clk = 1'b0;
  initial forever #10 clk = ~clk;    

  //Testbench
  initial
    begin
      $dumpfile("tb.vcd");
      $dumpvars(0, tb);
      rst_n = 1'b0;
      CS = 1'b1;
      temp_set_8b = `USER_TEMP_SET;
      LM70_TEMP_IN = {1'b0,temp_set_8b[7:1],8'd0};
      //
      //$monitor("time= %0t;data[]=,CS=%b,CLK=%b,SIO=%b,",$time,CS,CLK,SIO);
      $finish(2);   
    end
//////////////////////////////////////////////////////////////////////////////
   
endmodule
