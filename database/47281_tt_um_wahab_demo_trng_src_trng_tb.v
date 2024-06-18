// This program was cloned from: https://github.com/abbdulwahab86/tt_um_wahab_demo_trng
// License: Apache License 2.0

`timescale 1ns/1ps

module trng_tb;

reg clk;
reg n_reset;
wire [7:0] rand_out;

// Instantiate TRNG module
trng uut (
    .clk(clk),
    .n_reset(n_reset),
    .rand_out(rand_out)
);

// Clock generation
always #5 clk = ~clk;

// Reset generation
initial begin
    clk = 0;
    n_reset = 0;
    #10 n_reset = 1;
end

// Dumping data to VCD file
initial begin
    $dumpfile("trng_tb.vcd"); // Define VCD file name
    $dumpvars(0, trng_tb); // Dump all signals
end

// Stimulus
initial begin
    #1000;
    $display("Random Number: %h", rand_out);
    $finish;
end

endmodule

