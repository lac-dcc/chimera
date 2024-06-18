// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module number_pattern_1;

integer i,j;

initial begin
    for(i=0; i<10; i=i+1) begin
	  for(j=0; j<=i; j=j+1) begin
	      $write("%0d  ",j+1);
	  end
      $display("");
    end
  end
endmodule
