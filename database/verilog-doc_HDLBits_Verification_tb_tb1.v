module top_module ( output reg A, output reg B );//
    parameter CYCLE = 5;
    reg clk;
    // generate input patterns here
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial fork
        A = 0;
        B = 0;
        #10 A = 1;
        #20 A = 0;
        #15 B = 1;
        #40 B = 0;
    join 
endmodule

