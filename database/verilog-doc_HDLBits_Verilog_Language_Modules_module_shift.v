module top_module ( input clk, input d, output q );
    
wire out1,out2;
    my_dff ins1(clk,d,out1);
    
    my_dff ins2(clk,out1,out2);
    
    my_dff ins3(clk,out2,q);
endmodule

