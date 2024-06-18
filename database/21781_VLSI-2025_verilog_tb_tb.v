// This program was cloned from: https://github.com/silicon-vlsi/VLSI-2025
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
  wire CS;
  //
  reg [15:0] LM70_TEMP_IN;
  reg [7:0] temp_set_8b;
  reg clk;	// System clock
  reg rst_n;	// Sytem reset
  reg sel_CorF;	//0-> Celcius 1-> fahrenheit
  wire [7:0] data_7seg;	// Data for 7-seg display
  wire [1:0] sel_7seg;	// Select LSB/MSB for the two t-
  
  assign RSTN = rst_n;
  //Instiate LM70 and connect inputs
  LM70 tsense(.TEMP_SET(LM70_TEMP_IN), .RSTN(RSTN), .CS(CS), .SCK(SCK), .SIO(SIO));
 
  //Instatiate the Celcius module
  celcius celcius1(.RSTN(RSTN), .CLK(clk), .SEL_CORF(sel_CorF), .SCK(SCK), .CS(CS), .SIO(SIO), .DATA_7SEG(data_7seg), .SEL_7SEG(sel_7seg));

  //Generate test clock
  initial clk = 1'b0;
  initial forever #5 clk = ~clk;    

  //Testbench
  initial
    begin
      $dumpfile("tb.vcd");
      $dumpvars(0, tb);
      rst_n = 1'b0;
      temp_set_8b = `USER_TEMP_SET;
      LM70_TEMP_IN = {1'b0,temp_set_8b[7:1],8'd0};
      //
      #10 rst_n = 1'b1;
      //$monitor("time= %0t;data[]=,CS=%b,CLK=%b,SIO=%b,",$time,CS,CLK,SIO);
      #200
      $finish(2);   
    end
//////////////////////////////////////////////////////////////////////////////
   
endmodule
