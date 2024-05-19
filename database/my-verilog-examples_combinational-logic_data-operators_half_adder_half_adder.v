// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A 2-bit half adder

module half_adder_gate(
    input       a,           // Data
    input       b,           // Data
    output      sum,         // Sum of a + b
    output      cout);       // Carry out


    // GATE PRIMITIVE
    xor         xor1(sum, a, b);
    and         and1(cout, a, b);

endmodule

module half_adder_dataflow(
    input       a,           // Data
    input       b,           // Data
    output      sum,         // Sum of a + b
    output      cout);       // Carry out

    // CONTINUOUS ASSIGNMENT STATEMENT
    assign sum  = a ^ b;
    assign cout = a & b;

endmodule

module half_adder_behavioral(
    input       a,           // Data
    input       b,           // Data
    output reg  sum,         // Sum of a + b
    output reg  cout);       // Carry out

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ ( a or b) begin
        {cout, sum} <= a + b;
    end

endmodule
