// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0


// Simple dual-ported block RAM.
module RegisterFile
    #(parameter WORD_WIDTH=32, ADDRESS_WIDTH) 
(
    input wire clock,

    // For writing:
    input wire [ADDRESS_WIDTH-1:0] write_address,
    input wire write,
    input wire [WORD_WIDTH-1:0] write_data,

    // For reading:
    input wire [ADDRESS_WIDTH-1:0] read_address,
    output wire [WORD_WIDTH-1:0] read_data
);

    reg [WORD_WIDTH-1:0] memory [2**ADDRESS_WIDTH-1:0] /* verilator public */;

    assign read_data = memory[read_address];

    always @(posedge clock) begin
        // Handle writes.
        if (write) begin
            memory[write_address] <= write_data;
        end

    end

endmodule

