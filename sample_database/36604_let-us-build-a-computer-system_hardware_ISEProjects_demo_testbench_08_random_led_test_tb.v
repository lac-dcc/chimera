// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns/1ns 
module led_test_tb; 
reg clk; 
reg rst_n; 
wire[3:0] led; 
reg [7:0] a ; 
reg [7:0] b ; 
reg [7:0] c ; 
reg [7:0] d ; 
 
initial 
begin 
  $write("hello alinx\n") ; 
clk = 1'b0; 
rst_n = 1'b0; 
#100 rst_n = 1'b1; 
$write("rst_n = %d\n", rst_n) ;   
end 
 
//initial 
//$monitor("clk = %b", clk) ; 
always@(posedge clk) 
begin 
  $strobe("strobe a=%d, b= %d", a,b) ; 
  a = $random%100 ; 
  $display("display a=%d, b= %d", a,b) ;   
  b = $random%100  ;   
end 
 
always@(posedge clk) 
begin 
  $strobe("strobe c=%d, d= %d", c,d) ; 
  c = $random%100 ; 
  $display("display c=%d, d= %d", c,d) ;   
  d = $random%100  ;   
end 
 
always#10 clk = ~clk;//50Mhz 
led_test dut 
( 
  .clk           (clk), 
  .rst_n         (rst_n), 
  .led           (led) 
); 
endmodule 