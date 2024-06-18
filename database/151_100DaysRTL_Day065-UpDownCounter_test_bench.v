// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg clk;
reg reset;
reg upordown;
wire [3:0] count;

up_down_counter uut (clk, reset, upordown, count);

initial begin
    clk = 0;
    reset = 1;
    #50 reset =0; 
    upordown = 0;
    #220;
    upordown = 1;
    #200;
    upordown = 0;
    #100;
    reset = 0;    
end

always #10 clk=~clk;

initial 
begin
$monitor("\t\t UporDown=%b   Count=%b",upordown,count);
#550 $finish;
end
endmodule
