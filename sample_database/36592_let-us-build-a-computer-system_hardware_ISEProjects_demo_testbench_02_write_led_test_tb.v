// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns/1ns 
module led_test_tb; 
reg clk; 
reg rst_n; 
wire[3:0] led; 
 
initial 
begin 
  $write("hello alinx\n") ; 
  clk = 1'b0; 
  rst_n = 1'b0; 
  #100 rst_n = 1'b1; 
  $write("rst_n = %d\n", rst_n) ;   
end 
 
always#10 clk = ~clk;//50Mhz 
led_test dut 
( 
  .clk           (clk), 
  .rst_n         (rst_n), 
  .led           (led) 
); 
endmodule 