// This program was cloned from: https://github.com/Lefteris-B/ecko_efabless
// License: Apache License 2.0

module mel_filterbank #(
  parameter Q = 15,             // Number of fractional bits in the input data
  parameter NUM_FILTERS = 40,   // Number of Mel filters
  parameter FILTER_SIZE = 23,   // Size of each Mel filter
  parameter Q_M = 15            // Number of fractional bits for Mel filter coefficients
) (
    input wire clk,
    input wire rst,
    input wire signed [31:0] data_in, // INT32 Q30
    input wire data_valid,
    output reg signed [31:0] mel_out, // INT32 Q30
    output reg mel_valid
);

  localparam NUM_COEFFS = NUM_FILTERS * FILTER_SIZE;
  localparam COEFF_WIDTH = 16;

  reg signed [31:0] periodogram [0:FILTER_SIZE-1]; // INT32 Q30
  reg signed [15:0] coeff; // INT16 Q15
  reg signed [47:0] accumulator; // INT48 Q45
  reg [$clog2(NUM_FILTERS)-1:0] filter_counter;
  reg [$clog2(FILTER_SIZE)-1:0] coeff_counter;
  reg [1:0] state;

  // Mel filter coefficients
  function signed [COEFF_WIDTH-1:0] mel_coeff;
    input [$clog2(NUM_FILTERS)-1:0] filter_idx;
    input [$clog2(FILTER_SIZE)-1:0] coeff_idx;
    reg signed [COEFF_WIDTH-1:0] result;
    begin
      // Implement the Mel filter coefficient calculation here
      // based on the filter index and coefficient index
      if (filter_idx < 10) begin
        if (coeff_idx < 10)
          result = 16'h7FFF;
        else if (coeff_idx < 20)
          result = 16'h4000;
        else
          result = 16'h1000;
      end else if (filter_idx < 30) begin
        if (coeff_idx < 5)
          result = 16'h7FFF;
        else if (coeff_idx < 15)
          result = 16'h6000;
        else
          result = 16'h2000;
      end else begin
        if (coeff_idx < 3)
          result = 16'h7FFF;
        else if (coeff_idx < 8)
          result = 16'h5000;
        else
          result = 16'h3000;
      end
      mel_coeff = result;
    end
  endfunction

  always @(posedge clk) begin
    if (rst) begin
      filter_counter <= 0;
      coeff_counter <= 0;
      accumulator <= 0;
      mel_out <= 0;
      mel_valid <= 0;
      state <= 0;
    end else begin
      case (state)
        0: begin
          if (data_valid) begin
            periodogram[filter_counter[4:0]] <= data_in;
            filter_counter <= filter_counter + 1;
            if (filter_counter == FILTER_SIZE - 1) begin
              filter_counter <= 0;
              state <= 1;
            end
          end
        end

        1: begin
          coeff <= mel_coeff(filter_counter, coeff_counter);
          accumulator <= accumulator + {{16{periodogram[coeff_counter][15]}}, periodogram[coeff_counter]} * {{16{coeff[15]}}, coeff};
          coeff_counter <= coeff_counter + 1;

          if (coeff_counter == FILTER_SIZE - 1) begin
            mel_out <= accumulator[31:0] >>> (Q + Q_M);
            mel_valid <= 1;
            accumulator <= 0;
            coeff_counter <= 0;
            filter_counter <= filter_counter + 1;

            if (filter_counter == NUM_FILTERS) begin
              filter_counter <= 0;
              state <= 0;
            end
          end
        end
      endcase
    end
  end

endmodule
