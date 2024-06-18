// This program was cloned from: https://github.com/Andreou-JHULabOrg/tinytapeout_06_chatgpt_rsnn
// License: Apache License 2.0

module FIPO_Memory (
    input wire clk,                      // Clock input
    input wire rst,                      // Reset input
    input wire enable,                   // Enable signal for controlling the module operation
    input wire serial_in,                // Serial input data
    output wire [311:0] parallel_out,    // Parallel output of all data, always reflects data_memory
    output reg end_writing = 1'b0,  // Output signal that indicates when writing of 312 bits is complete
    output reg data_written = 1'b0  // Output signal that indicates when a single bit is written
);

// Internal memory to store the serially input data
reg [311:0] data_memory = 0;
// Counter to keep track of the number of bits received
reg [8:0] bit_counter = 0;  // Needs to count up to 312, thus 9 bits are required

always @(posedge clk or posedge rst) begin
    data_written <= 0;
    end_writing <= 0;
    if (rst) begin
        // Reset all registers when rst is high
        data_memory <= 312'b0;
        bit_counter <= 0;
    end else if (enable) begin
        if (bit_counter < 312) begin
            data_memory[bit_counter] <= serial_in;
            bit_counter <= bit_counter + 1;
            data_written <= 1;  // Set data_written when a bit is written
        end

        // Set end_writing when all bits are loaded
        if (bit_counter >= 312) begin
            end_writing <= 1;
            bit_counter <= 0;  // Reset the counter to allow new data loading
        end
    end
end

// Assign data_memory to parallel_out outside the always block
assign parallel_out = data_memory;

endmodule
