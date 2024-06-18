// This program was cloned from: https://github.com/Lefteris-B/ecko_efabless
// License: Apache License 2.0

module pow_module #(
    parameter Q = 15 // Number of fractional bits in the input data
) (
    input wire clk,
    input wire rst,
    input wire signed [31:0] data_in, // INT32 Q30
    input wire data_valid,
    output reg signed [31:0] data_out, // INT32 Q30
    output reg data_out_valid
);

reg signed [31:0] data_reg; // INT32 Q30

always @(posedge clk) begin
    if (rst) begin
        data_reg <= 0;
        data_out <= 0;
        data_out_valid <= 0;
    end else begin
        if (data_valid) begin
            data_reg <= $signed(data_in) * $signed(data_in) >>> Q;
            data_out <= data_reg;
            data_out_valid <= 1;
        end else begin
            data_out_valid <= 0;
        end
    end
end

endmodule
