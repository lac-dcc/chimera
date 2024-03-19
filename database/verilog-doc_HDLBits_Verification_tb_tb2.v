module top_module();
	reg clk,in,out;
    reg	[2:0]	s;
    
    initial begin
       	#0	clk=0;in=0;s=3'd2;
        #10	s=3'd6;
        #10	s=3'd2;in=1;
        #10	s=3'd7;in=0;
        #10	s=3'd0;in=1;
        #30	in=0;
    end
    
    always begin
       	#5	clk=~clk; 
    end
    
    q7 q(clk,in,s,out);
    
endmodule

