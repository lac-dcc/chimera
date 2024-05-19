// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;

reg clock;
reg [1:0] coin;
reg reset;
wire newspaper;

//instantiate the vending state machine 
vend dut(coin, clock, reset, newspaper);

//Display the output
initial begin
$display("\t\tTime Reset Newspaper"); 
$monitor("\t\t %0d \t %0d \t %0d", $time, reset, newspaper);
end

//Apply stimulus to the vending machine
initial begin

clock = 0;
coin = 0 ;
reset = 1 ;
#50 reset = 0 ;

@(negedge clock); //wait until negative edge of clock
//Put 3 nickels to get newspaper
#80 coin = 1; #40 coin = 0;
#80 coin = 1; #40 coin = 0;
#80 coin = 1; #40 coin = 0 ;

//Put one nickel and then one dime to get newspaper
#180 coin = 1; #40 coin = 0; 
#80 coin = 2; #40 coin = 0;

//Put two dimes; machine does not return a nickel to get newspaper 
#180 coin = 2 ; #40 coin = 0 ;
#80 coin = 2; #40 coin = 0;

//Put one dime and then one nickel to get newspaper 
#180 coin = 2; #40 coin = 0;
#80 coin = 1; #40 coin = 0;
end

initial #1500 $finish;

//setup clock; cycle time = 40 units
always #20 clock = ~clock;

endmodule