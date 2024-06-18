// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module fifo_tb ();

reg clk, reset;

initial begin
    clk = 1'b0;
    reset = 1'b0;
end

always #1 clk = ~clk;

endmodule
