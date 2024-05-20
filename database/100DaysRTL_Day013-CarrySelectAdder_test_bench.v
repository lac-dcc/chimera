// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
    reg [3:0]a,b;
    reg carry;
    wire[3:0]sum;
    wire cout ;
    carry_select dut(a,b,carry,sum,cout);

    initial begin
            carry=1'b0;a=4'b1011;b=4'b1010;
        #10 carry=1'b1;a=4'b1001;b=4'b1110;
        #10 carry=1'b0;a=4'b0001;b=4'b1010;
        #10 carry=1'b1;a=4'b1100;b=4'b0011;
    end

    initial begin 
	$monitor("a=%b b=%b carry=%b sum=%b cout=%b",a,b,carry,sum,cout);
      #40 $finish;
    end 
endmodule
