// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

/**
 * 32-bit Fractional Clock Divider
 */

module clk_div(
    input  wire reset_n,                    // Reset Flag
    input  wire clk_i,                      // Input Clock
    output wire clk_o                       // Output Clock
);

    parameter FREQ_I;                       // Input Clock Frequency (Hz)
    parameter FREQ_O;                       // Output Clock Frequency (Hz)

    reg [31:0] div = FREQ_I / (FREQ_O * 2); // Divisor Value
    reg [31:0] step = 32'hFFFFFFFF / div;   // Increment Value
    reg [32:0] count;                       // Counter Register
    reg out = 1'h1;                         // Output Clock Buffer

    always @(posedge clk_i) begin
        if (reset_n) begin
            // Increment counter on incoming clock edge
            count <= count + step;

            // Toggle output clock and reset when counter overflows
            if (count[32]) begin
                out <= ~out;
                count <= 33'h0;
            end
        end
    end

    assign clk_o = out && reset_n;

endmodule;
