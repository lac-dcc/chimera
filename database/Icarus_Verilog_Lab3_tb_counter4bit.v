`include "counter4bit.v"    //q,clk

module tb_counter4bit();

    wire [3:0] q;
    reg clk, reset;

    initial
        clk = 0;
    
    always 
    #2 clk = ~clk;

    initial begin
        $monitor("q = %b ", q, " clk = %b ", clk," reset = %b ", reset);
    end
    
    counter4bit ctr(q, clk, reset);

    initial begin
        reset = 1'b1;
        #4 reset = 1'b0;
        // #10 reset = 1'b1;
        #64 $finish;
    end

endmodule