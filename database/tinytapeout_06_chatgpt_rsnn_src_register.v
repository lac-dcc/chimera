// This program was cloned from: https://github.com/Andreou-JHULabOrg/tinytapeout_06_chatgpt_rsnn
// License: Apache License 2.0

module register #(
    parameter WIDTH = 3  // Default width is 3 bits, but can be set when instantiated
)(
    input wire clk,                 // Clock input
    input wire reset,               // Reset input, asynchronous and active high
    input wire enable,              // Enable input for updating data
    input wire [WIDTH-1:0] data_in, // Data input with variable width
    output reg [WIDTH-1:0] data_out // Data output with variable width
);

    // Process with asynchronous reset and enable
    always @(posedge clk or posedge reset) begin
        if (reset)
            data_out <= {WIDTH{1'b0}}; // Reset the output to all zeros
        else if (enable)
            data_out <= data_in;      // Update output only if enabled
    end

endmodule
