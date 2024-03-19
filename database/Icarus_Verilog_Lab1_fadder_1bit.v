`ifndef FADDER_1BIT
`define FADDER_1BIT
    module fadder_1bit(
        output sum,
        output cout,
        input a,
        input b,
        input cin);

        assign sum = a ^ b ^ cin;
        assign cout = a&b | (a|b)&cin;

    endmodule
`endif