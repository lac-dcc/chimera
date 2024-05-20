// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`timescale 1ns/1ns
`include "tristate_buffer.v"

module tristate_buffer_tb;

    // Parameters
    parameter WIDTH = 8;
    parameter PRIMITIVES = 1;

    // Inputs
    reg [WIDTH-1:0] a;
    reg g;

    // Outputs
    wire [WIDTH-1:0] q;

    // Instantiate the tristate buffer
    tristate_buffer #(.WIDTH(WIDTH), .PRIMITIVES(PRIMITIVES)) uut (
        .a(a),
        .g(g),
        .q(q)
    );

    // Apply test vectors
    initial begin
        $dumpfile("tristate_buffer_tb.vcd" );
        $dumpvars(0, tristate_buffer_tb);
        $monitor("Input a = %b, g = %b, Output q = %b", a, g, q);
        #10; // Wait for initial values to settle

        // Test case 1: Enable (g) is low
        a = 8'b10101010;
        g = 0;
        #10;

        // Test case 2: Enable (g) is high
        a = 8'b11001100;
        g = 1;
        #10;

        // Test case 3: Enable (g) is low
        a = 8'b00001111;
        g = 0;
        #10;

        // Test case 4: Enable (g) is high
        a = 8'b11110000;
        g = 1;
        #10;

        $finish;
    end

endmodule
