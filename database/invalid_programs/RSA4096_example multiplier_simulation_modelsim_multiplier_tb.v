`include "multiplier.v"
// ? WHY WIDTH doesn't work?
module multiplier_tb;
  reg clock;
  reg [31:0] dataa;
  reg [31:0] datab;
  wire [31:0] dataoutl;
  wire [31:0] dataouth;
  
// Initialize all variables
initial begin        
  $display ("My Multiplier");	
  $monitor ("%g\t%b\t%d\t%d\t%d\t%d\t", 
	  $time, clock, dataa, datab, dataoutl, dataouth);	
  clock = 1;       // initial value of clock
  dataa = 0;       // initial value of reset
  datab = 0;      // initial value of enable
  #5 dataa = 10;    // Assert the reset
  #10 datab = 30;   // De-assert the reset
  #50 $stop;      // Terminate simulation
end

// Clock generator
always begin
  #5 clock = ~clock; // Toggle clock every 5 ticks
end

// Connect DUT to test bench
multiplier U_counter (
clock,
dataa,
datab,
dataoutl,
dataouth
);

endmodule