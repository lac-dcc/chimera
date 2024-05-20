// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

`timescale 1 ns / 100 ps

module testbench;

reg clk = 1'b0;

always begin
    #1 clk = ~clk;
end

wire [15:0]hd_data; // To non-existing hex display
cpu_top cpu_top(
    .clk(clk),
    .data_out0(hd_data)
    /*
    * Problem 2:
    * Connect UART transmitter to CPU.
    * Don't forget about 'start' signal!
    */
);

/* Problem 2: instantiate UART transmitter. */

initial begin
    $dumpvars;
    #150 $finish;
end

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

`timescale 1 ns / 100 ps

module testbench;

reg clk = 1'b0;

always begin
    #1 clk = ~clk;
end

wire [15:0]hd_data; // To non-existing hex display
cpu_top cpu_top(
    .clk(clk),
    .data_out0(hd_data)
    /*
    * Problem 2:
    * Connect UART transmitter to CPU.
    * Don't forget about 'start' signal!
    */
);

/* Problem 2: instantiate UART transmitter. */

initial begin
    $dumpvars;
    #150 $finish;
end

endmodule
