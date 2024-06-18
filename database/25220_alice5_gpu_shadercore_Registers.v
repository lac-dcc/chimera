// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0


// Simple triple-ported registers (one write, two reads).
module Registers
    #(parameter WORD_WIDTH=32, ADDRESS_WIDTH=5) 
(
    input wire clock,

    // For writing:
    input wire [ADDRESS_WIDTH-1:0] write_address,
    input wire write,
    input wire [WORD_WIDTH-1:0] write_data,

    // For reading parameter 1:
    input wire [ADDRESS_WIDTH-1:0] read1_address,
    output wire [WORD_WIDTH-1:0] read1_data,

    // For reading parameter 2:
    input wire [ADDRESS_WIDTH-1:0] read2_address,
    output wire [WORD_WIDTH-1:0] read2_data
);

    RegisterFile #(.WORD_WIDTH(WORD_WIDTH), .ADDRESS_WIDTH(ADDRESS_WIDTH))
        bank1(
            .clock(clock),
            .write_address(write_address),
            .write(write),
            .write_data(write_data),
            .read_address(read1_address),
            .read_data(read1_data));

    RegisterFile #(.WORD_WIDTH(WORD_WIDTH), .ADDRESS_WIDTH(ADDRESS_WIDTH))
        bank2(
            .clock(clock),
            .write_address(write_address),
            .write(write),
            .write_data(write_data),
            .read_address(read2_address),
            .read_data(read2_data));

endmodule

