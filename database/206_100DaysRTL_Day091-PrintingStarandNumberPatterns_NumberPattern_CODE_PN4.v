// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module number_pattern_4;

integer i,j;

integer n=1;

initial begin

	for(i=0;i<=9;i=i+1)begin
	    for(j=0;j<9-i;j=j+1)begin
		$write("%0d  ",n+i);
	    end
	  $display("");
	end
    end
endmodule
