// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// Single-port synchronous RAM.

module single_port_ram_synchronous_behavioral(
    input  clk,                                         // Clock
    input  we,                                          // Write enable
    input  [ADDR_WIDTH-1:0] addr,                       // Address
    input  [DATA_WIDTH-1:0] data_in,                    // Data to write
    output reg [DATA_WIDTH-1:0] data_out);              // Data to read

    // PARAMETERS
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;
    parameter MEM_DEPTH = 16;

    // DATA TYPES
    reg [DATA_WIDTH-1:0] mem [0:MEM_DEPTH-1];           // RAM (16x8)

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(posedge clk) begin
        // WRITE (DATA PASS)
        if (we) begin
            mem[addr] <= data_in;
            data_out <= data_in;
        // READ
        end else begin
            data_out <= mem[addr];
        end
    end

endmodule
