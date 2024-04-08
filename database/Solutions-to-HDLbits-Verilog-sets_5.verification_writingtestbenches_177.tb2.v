`timescale 1ps / 1ps
module top_module();
    
    reg clk;
    reg in;
    reg [2:0] s;
    wire out;
    
    initial begin
        clk = 0;
        in = 0;
        s = 2;
        #10;
        s = 6;
        #10;
        s = 2;
        in = 1;
        #10;
        s = 7;
        in = 0;
        #10;
        in = 1;
        s = 0;
        #30;
        in = 0;
    end
    
    always begin
        #5 clk = ~clk;
    end
    
    q7 u_q7(
        .clk(clk),
        .in(in),
        .s(s),
        .out(out)
    );
    

endmodule
