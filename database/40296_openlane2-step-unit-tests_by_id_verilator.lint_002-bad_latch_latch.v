// This program was cloned from: https://github.com/efabless/openlane2-step-unit-tests
// License: Apache License 2.0

module latch_bad(input clk, input a, input en, output b);

reg v;

always @ *
    if (en)
        v <= a;

assign b = v;

endmodule