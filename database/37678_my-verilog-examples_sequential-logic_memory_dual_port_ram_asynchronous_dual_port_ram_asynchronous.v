// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// Dual-port asynchronous RAM.

module dual_port_ram_asynchronous_behavioral(
    input  clk_A,                                       // Clock A
    input  clk_B,                                       // Clock B
    // PORT A
    input  we_A,                                        // Write enable
    input  [ADDR_WIDTH-1:0] addr_A,                     // Address
    input  [DATA_WIDTH-1:0] data_in_A,                  // Data to write
    output reg [DATA_WIDTH-1:0] data_out_A,             // Data to read
    // PORT B
    input  we_B,                                        // Write enable
    input  [ADDR_WIDTH-1:0] addr_B,                     // Address
    input  [DATA_WIDTH-1:0] data_in_B,                  // Data to write
    output reg [DATA_WIDTH-1:0] data_out_B);            // Data to read

    // PARAMETERS
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;
    parameter MEM_DEPTH = 16;

    // DATA TYPES
    reg [DATA_WIDTH-1:0] mem [0:MEM_DEPTH-1];           // RAM (16x8)

    // PORT A
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(posedge clk_A) begin
        // WRITE (DATA PASS)
        if (we_A) begin
            mem[addr_A] <= data_in_A;
            data_out_A <= data_in_A;
        // READ
        end else begin
            data_out_A <= mem[addr_A];
        end
    end

    // PORT B - HAS PRECEDENCE FOR WRITE
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(posedge clk_B) begin
        //WRITE (DATA PASS)
        if (we_B) begin
            mem[addr_B] <= data_in_B;
            data_out_B <= data_in_B;
        //READ
        end else begin
            data_out_B <= mem[addr_B];
        end
    end

endmodule
