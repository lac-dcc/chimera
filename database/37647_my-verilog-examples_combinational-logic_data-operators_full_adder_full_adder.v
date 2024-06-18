// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A 2-bit full adder

module full_adder_gate(
    input       a,           // Data
    input       b,           // Data
    input       cin,         // Carry in
    output      sum,         // Sum of a + b
    output      cout);       // Carry out

    wire        w1, w2, w3;

    // GATE PRIMITIVE
    xor         xor1(w1, a, b);
    xor         xor2(sum, w1, cin);
    and         and1(w2, w1, cin);
    and         and2(w3, a, b);
    or          or1(cout, w2, w3);

endmodule

module full_adder_dataflow(
    input       a,           // Data
    input       b,           // Data
    input       cin,         // Carry in
    output      sum,         // Sum of a + b
    output      cout);       // Carry out

    // CONTINUOUS ASSIGNMENT STATEMENT
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule

module full_adder_behavioral(
    input       a,           // Data
    input       b,           // Data
    input       cin,         // Carry in
    output reg  sum,         // Sum of a + b
    output reg  cout);       // Carry out

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ ( a or b or cin) begin
        {cout, sum} <= a + b + cin;
    end

endmodule
