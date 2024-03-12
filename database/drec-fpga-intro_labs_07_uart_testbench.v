`timescale 1 ns / 100 ps

module testbench;

reg clk = 1'b0;

always begin
    #1 clk = ~clk;
end

top top(.CLK(clk));

initial begin
    $dumpvars;
    #8000000 $finish;
end

endmodule
