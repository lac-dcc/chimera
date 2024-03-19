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

