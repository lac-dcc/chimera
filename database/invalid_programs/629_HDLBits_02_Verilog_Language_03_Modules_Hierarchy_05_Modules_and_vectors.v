// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
        wire [7:0]con1,con2,con3;
    
    my_dff8 d_flop1(.clk(clk), .d(d), .q(con1));
    my_dff8 d_flop2(.clk(clk), .d(con1), .q(con2) );
    my_dff8 d_flop3(.clk(clk), .d(con2), .q(con3));
    
    always @ (*) begin
        case(sel)
            0 : q = d ;
            1 : q = con1;
            2 : q = con2;
            3 : q = con3;
        endcase
    end
endmodule