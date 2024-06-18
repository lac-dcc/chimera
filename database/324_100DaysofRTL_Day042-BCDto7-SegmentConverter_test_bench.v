// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg [3:0]BCD;
wire [6:0]segment7;

BCD_to_7segment dut(BCD, segment7);

always begin
            BCD= 4'd0;   
        #10;
            BCD= 4'd1; 
        #10;
            BCD= 4'd2; 
        #10;
            BCD= 4'd3; 
        #10;
            BCD= 4'd4; 
        #10;
            BCD= 4'd5; 
        #10;
            BCD= 4'd6; 
        #10;
            BCD= 4'd7; 
        #10;
            BCD= 4'd8; 
        #10;
            BCD= 4'd9; 
        #10;
	end
initial begin
$monitor("\t BCD: %d : 7 segment display: %h", BCD, segment7);
#100 $finish;
end 
endmodule
