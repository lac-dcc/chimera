`timescale 1 ns / 100 ps

module testbench;

reg clk = 1'b0;

always begin
    #1 clk = ~clk;
end

cpu_top cpu_top(.clk(clk));

initial begin
    $dumpvars;
    #15 $finish;
end

endmodule
