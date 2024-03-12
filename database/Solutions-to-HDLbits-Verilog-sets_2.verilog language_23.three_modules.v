module top_module ( input clk, input d, output q );
    
    wire q_1;
    wire q_2;
    
    my_dff u_my_dff_1(
        .clk(clk),
        .d(d),
        .q(q_1)
    );
    my_dff u_my_dff_2(
    	.clk(clk),
        .d(q_1),
        .q(q_2)
    );
	my_dff u_my_dff_3(
        .clk(clk),
        .d(q_2),
        .q(q)
    );
endmodule
