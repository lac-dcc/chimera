// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0


// Simple dual-ported block RAM.
module BlockRam
    #(parameter WORD_WIDTH=32, ADDRESS_WIDTH) 
(
    input wire clock,

    // For writing:
    input wire [ADDRESS_WIDTH-1:0] write_address,
    input wire write,
    input wire [WORD_WIDTH-1:0] write_data,

    // For reading:
    input wire [ADDRESS_WIDTH-1:0] read_address,
    output reg [WORD_WIDTH-1:0] read_data
);

    reg [WORD_WIDTH-1:0] memory [2**ADDRESS_WIDTH-1:0] /* verilator public */;

    always @(posedge clock) begin
        // Handle writes.
        if (write) begin
            memory[write_address] <= write_data;
        end

        // Handle reads. This is "Old data read-during-write" behavior,
        // as recommended by Altera in the "Recommended HDL Coding Style"
        // document, page 13-20.
        read_data <= memory[read_address];
    end

endmodule

