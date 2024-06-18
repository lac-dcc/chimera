// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

`timescale 1ps/1ps
module top_module();
	reg x,y,out;
    
    initial begin
       	#0	x=0;y=0;
        #10	y=1;
        #10	x=1;y=0;
        #10	y=1;
    end
    
    andgate a({x,y},out);
    
endmodule

