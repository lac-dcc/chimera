// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 10ns/1ns

`default_nettype none

module tb();

    // Verilog treats a vector as a binary integer!

    // little-endian (use this unless you have a good reason not to)
    reg [3:0] v;        // a vector of 4 bits v[3] is the MSB

    // big-endian (this looks right, but is "backwards")
    reg [0:3] b;        // a vector of 4 bits v[0] is the MSB

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars;

        $display(v);        // default = decimal
        $display("%b", v);  // binary as needed based on the size of v
        #1;

        v[0] = 1;            // v[0] is the LSB
        $display("%b %h %d", v, v, v);      // note the big-X this time
        #1;
        
        v = 0;              // can set all bits in a vector at once
        $display("%b %h %d", v, v, v);
        #1;

        v[3] = 1;           // v[3] is the MSB
        $display("%b %h %d", v, v, v);
        #1;


        $display();
        b = 0;
        $display("%b %h %d", b, b, b);
        #1;
        b[0] = 1;           // b[0] is the MSB
        $display("%b %h %d", b, b, b);
        #1;
        b[2] = 1; 
        $display("%b %h %d", b, b, b);
        #1;

        $display();
        v = b;              // what will this do?
        $display("v=b:");
        $display("%b %h %d", v, v, v);
        #1;

        //v = b[3:0];       // this won't compile

        v[3:0] = { b[3], b[2], b[1], b[0] };     // {} is the concatenation operator
        $display("%b %h %d", v, v, v);
        #1;

        v = 0;
        v[3:2] = 3;         // assign a range of to two bits 'd3 = 'b11
        $display("%b %h %d", v, v, v);

        #30;
        $finish;
    end


endmodule
