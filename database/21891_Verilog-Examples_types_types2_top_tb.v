// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 10ns/1ns

`default_nettype none

module tb();

    // Verilog treats a vector as a binary integer!
    reg [15:0] v;       // a vector of 16 bits v[15] is the MSB
    reg [31:0] v32;     // a vector of 32 bits v32[32] is the MSB

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars;

        $display(v);
        #1;

        v = 0;
        $display(v);
        #1;

        v = -1;         // unsized, unbased integer is a decimal value
                        // verilog uses 2's complement integers
        $display(v);    // display treats v as an integer without sign-extension
        $display("%d %x %b %o", v, v, v, v);
        #1;

        $display();

        v = -'d2;       // unsized, based (decimal)
        $display("%d %x %b %o", v, v, v, v);
        $display("%d %x %b %o", $signed(v), $signed(v), $signed(v), $signed(v));
        #1;

        $display();

        v = 'hfc0;       // unsized, based (hex)
        $display("%d %x %b %o", v, v, v, v);
        $display("%d %x %b %o", $signed(v), $signed(v), $signed(v), $signed(v));
        #1;

        v = 'h8000;
        $display("%d %x %b %o", v, v, v, v);
        $display("%d %x %b %o", $signed(v), $signed(v), $signed(v), $signed(v));
        #1;


        v32 = v;            // zero-extended
        $display("%d %x %b %o", v32, v32, v32, v32);
        #1;

        $display();

        v32 = { {16{ v[15] }}, v };       // extend the sign bit using replication
        $display("%d %x %b %o", v32, v32, v32, v32);
        $display("%d %x %b %o", $signed(v32), v32, v32, v32);
        #1;

        $display();

        v32 = $signed(v);   // sign-extended
        $display("%d %x %b %o", v32, v32, v32, v32);
        $display("%d %x %b %o", $signed(v32), v32, v32, v32);   // note extra width
        #1;

        $display();

        v32 = v32 + 12;     // verilog knows how to synthesize an adder
        v32 += 12;          // we can use this notation too
        $display("%d %x %b %o", $signed(v32), v32, v32, v32);
        #1;
        
        v32 = v32 - 200000;
        $display("%d %x %b %o", $signed(v32), v32, v32, v32);
        #1;
        
        v32 = -v32 ;
        $display("%d %x %b %o", $signed(v32), v32, v32, v32);   // still extra width sans -
        #1;
        


        #30;
        $finish;
    end


endmodule
