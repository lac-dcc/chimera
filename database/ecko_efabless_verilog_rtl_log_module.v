// This program was cloned from: https://github.com/Lefteris-B/ecko_efabless
// License: Apache License 2.0

module log_module #(
    parameter Q_M = 15, // Number of fractional bits for Mel filter coefficients
    parameter Q_L = 11 // Number of fractional bits for logarithm output
) (
    input wire clk,
    input wire rst,
    input wire signed [31:0] data_in, // INT32 Q30
    input wire data_valid,
    output reg signed [15:0] log_out, // INT16 Q11
    output reg log_valid
);

localparam INT_BITS = 32 - Q_M;
localparam FRAC_BITS = Q_M;

reg signed [INT_BITS-1:0] int_part; // INT20 Q0
reg signed [FRAC_BITS-1:0] frac_part; // INT15 Q15
reg signed [FRAC_BITS-1:0] frac_part_shifted; // INT15 Q15
reg [$clog2(FRAC_BITS)-1:0] shift_count;
reg [1:0] state;

always @(posedge clk) begin
    if (rst) begin
        int_part <= 0;
        frac_part <= 0;
        frac_part_shifted <= 0;
        shift_count <= 0;
        log_out <= 0;
        log_valid <= 0;
        state <= 0;
    end else begin
        case (state)
            0: begin
                if (data_valid) begin
                    int_part <= data_in[31:FRAC_BITS];
                    frac_part <= data_in[FRAC_BITS-1:0];
                    state <= 1;
                end
            end
            1: begin
                if (int_part > 0) begin
                    int_part <= int_part >> 1;
                    frac_part_shifted <= frac_part;
                    shift_count <= 0;
                    state <= 2;
                end else begin
                    log_out <= {{1{frac_part[FRAC_BITS-1]}}, frac_part} >> (FRAC_BITS - Q_L);
                    log_valid <= 1;
                    state <= 0;
                end
            end
            2: begin
                if (shift_count < FRAC_BITS) begin
                    if (frac_part_shifted >= (1 << (FRAC_BITS - 1))) begin
                        frac_part_shifted <= (frac_part_shifted << 1) - (1 << FRAC_BITS);
                        log_out <= (log_out << 1) + 1;
                    end else begin
                        frac_part_shifted <= frac_part_shifted << 1;
                        log_out <= log_out << 1;
                    end
                    shift_count <= shift_count + 1;
                end else begin
                    log_out <= log_out[15:0] + (int_part << (Q_L - $clog2(INT_BITS)));
                    log_valid <= 1;
                    state <= 0;
                end
            end
        endcase
    end
end

endmodule
