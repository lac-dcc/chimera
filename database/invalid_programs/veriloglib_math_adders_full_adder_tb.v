// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

// iverilog full_adder_tb.v; vvp a.out; gtkwave --save full_adder_tb.gtkw full_adder_tb.vcd

`include "full_adder.v"

module full_adder_tb;
    reg a, b, cin;
    wire sum, cout;

    // Instantiate the full_adder module
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Initialize inputs and monitor outputs
    initial begin
        $dumpfile("full_adder_tb.vcd" );
        $dumpvars(0, full_adder_tb);
        $monitor("At time %0t: a=%b, b=%b, cin=%b, sum=%b, cout=%b", $time, a, b, cin, sum, cout);

        // Test all 8 input combinations
        a = 0;  b = 0;  cin = 0;
        #1;
        a = 0;  b = 0;  cin = 1;
        #1;
        a = 0;  b = 1;  cin = 0;
        #1;
        a = 0;  b = 1;  cin = 1;
        #1;
        a = 1;  b = 0;  cin = 0;
        #1;
        a = 1;  b = 0;  cin = 1;
        #1;
        a = 1;  b = 1;  cin = 0;
        #1;
        a = 1;  b = 1;  cin = 1;
        #1;
        $finish; // End simulation
    end
endmodule
