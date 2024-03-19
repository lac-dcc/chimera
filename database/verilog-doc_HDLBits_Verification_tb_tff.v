`timescale 1ps/1ps
module top_module ();
    reg clk, reset, t, q;
    initial begin
        #0	clk=1;
       	#0 	reset=1;
        #10 reset=0;t=1;
    end
    always begin
        #2 clk = ~clk; 
    end
    tff t0(clk, reset, t, q);
endmodule

