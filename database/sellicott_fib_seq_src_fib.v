// This program was cloned from: https://github.com/sellicott/sellicott_fib_seq
// License: Apache License 2.0

/* fib.v
 * Author: Samuel Ellicott
 * Date: Thu Apr 11 18:43:53 EDT 2024
 * Test of calculating the nth value of the fibbonachi sequence
 */
module fib (
    // global control signals
    i_reset,
    i_clk,

    // control signals
    i_stb,
    o_busy,

    // module inputs/outputs
    i_n,
    o_fib
);
parameter WIDTH = 32;
localparam [WIDTH-1:0] RESET = 0;
localparam [WIDTH-1:0] ONE   = 1;

// global control signals
input wire i_reset;
input wire i_clk;

// control signals
input  wire i_stb;
output wire o_busy;

// module io
input  wire [WIDTH-1:0] i_n;
output wire [WIDTH-1:0] o_fib;

reg [WIDTH-1:0] iteration;
reg [WIDTH-1:0] prev;
reg [WIDTH-1:0] current;

assign o_busy = (iteration != RESET);
assign o_fib  = current;

always @(posedge i_clk) begin
    if (!o_busy && i_stb) begin
        iteration <= i_n;
        prev    [WIDTH-1:0] <= 1;
        current [WIDTH-1:0] <= 0;
    end
    else if (o_busy) begin
        iteration <= iteration - ONE;
        current   <= prev + current;
        prev      <= current;
    end

    if (i_reset) begin
        iteration <= RESET;
        prev    [WIDTH-1:0] <= 1;
        current [WIDTH-1:0] <= 0;
    end
end

endmodule
