// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0


// Memory arbiter. Allows multiple cores to access the same SDRAM port.
// The COUNT parameter specifies how may cores to arbitrate.

module MemArb
    #(parameter COUNT)
(
    input wire clock,
    input wire reset_n,

    // Assert to request memory access. Keep asserted as you use memory.
    input wire [COUNT-1:0] request,

    // Asserted to authorize memory access. Do not access memory until this
    // is asserted for your core.
    output reg [COUNT-1:0] authorized
);

    // Arbitrary priority scheme. This picks out an arbitrary
    // bit, or leaves all bits zero if none is requesting.
    wire [COUNT-1:0] preferred = request & (~request + 1);

    always @(posedge clock) begin
        if (!reset_n) begin
            authorized <= 0;
        end else begin
            // If authorizing and still requesting, keep authorizing.
            if ((authorized & request) != 0) begin
                // Nothing, keep authorizing the same core.
            end else begin
                // If anyone requesting, give to preferred,
                // or none if no one is requesting.
                authorized <= preferred;
            end
        end
    end

endmodule
