// This program was cloned from: https://github.com/efabless/openlane2-step-unit-tests
// License: Apache License 2.0

module nr_ff(
    input clk,
    input a,
    output reg b
);
    always_ff @(posedge clk) begin
        b <= a;
    end

endmodule