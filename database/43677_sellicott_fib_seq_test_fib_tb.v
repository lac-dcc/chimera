// This program was cloned from: https://github.com/sellicott/sellicott_fib_seq
// License: Apache License 2.0

/* fib_tb.v
 * Author: Samuel Ellicott
 * Date: Thu Apr 11 19:18:22 EDT 2024
 * Test of calculating the nth value of the fibbonachi sequence
 * tb for module
 */

module fib_tb;

parameter WIDTH = 32;

// global control signals
reg reset = 1;
reg clk   = 0;

// control signals
reg  stb  = 0;
wire busy;

reg  [WIDTH-1:0] n = 0;
wire [WIDTH-1:0] fib_n;

fib #(WIDTH)
fib_inst (
    .i_reset (reset),
    .i_clk   (clk),
    .i_stb   (stb),
    .o_busy  (busy),
    .i_n     (n),
    .o_fib   (fib_n)
);

always #5 clk = !clk;

initial begin
    // setup iverilog dumping
    $dumpfile("fib_tb.fst");
    $dumpvars(0, fib_tb);

    @(posedge clk);
    @(posedge clk);
    reset = 0;
    stb   = 1;

    n = 1;
    @(negedge busy);
    $strobe("At time %t, fib_n = %0d",
              $time, fib_n);
    n = 2;
    @(negedge busy);
    $strobe("At time %t, fib_n = %0d",
              $time, fib_n);
    n = 3;
    @(negedge busy);
    $strobe("At time %t, fib_n = %0d",
              $time, fib_n);
    n = 4;
    @(negedge busy);
    $strobe("At time %t, fib_n = %0d",
              $time, fib_n);
    n = 5;
    @(negedge busy);
    $strobe("At time %t, fib_n = %0d",
              $time, fib_n);

    $finish;

end

endmodule
