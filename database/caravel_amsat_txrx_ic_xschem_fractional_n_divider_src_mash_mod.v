// This program was cloned from: https://github.com/yrrapt/caravel_amsat_txrx_ic
// License: Apache License 2.0

// Copyright 2020 Thomas Parry
//
// SOME LICENSE
//
// MASH Modulator
//   A MASH (Multi-Stage Noise Shaping) delta sigma modulator.
//   
//   The 'data_in' value divided by the modulus will be created
//   in a quantisesd number stream with high passed noise shaping
//   characteristic.
//

module mash_mod
    # (
        parameter WIDTH_MODULUS     = 16,
        parameter ORDER             = 3
    ) (
        input                       clk,
        input                       rst,
        input [WIDTH_MODULUS-1:0]   data_in,
        output [ORDER-1:0]          data_out
    );

    // internal registers
    reg [WIDTH_MODULUS-1:0]         accumulator_output[ORDER-1:0];
    reg [WIDTH_MODULUS-1:0]         accumulator_delay[ORDER-1:0];
    reg [4*(ORDER-1)-1:0]           accumulator_carry[ORDER-1:0];
    reg signed [ORDER-1:0]          sum_output[ORDER-2:0];
    reg signed [ORDER-1:0]          sum_minus[ORDER-2:0];
    reg signed [ORDER-1:0]          sum_delay[ORDER-2:0];


    genvar i;
    generate
        for (i = 0; i < ORDER; i = i + 1) begin

            // form the accumulators
            if (i == 0) begin
                always @(posedge rst, posedge clk) begin
                    if (rst) begin
                        accumulator_carry[i][0] <= 0;
                        accumulator_output[i] <= 0;
                        accumulator_delay[i] <= 0;
                    end
                    else begin
                        {accumulator_carry[i][0], accumulator_output[i]} <= data_in + accumulator_output[i];
                        accumulator_delay[i] <= accumulator_output[i];
                    end
                end
            end
            else begin
                always @(posedge rst, posedge clk) begin
                    if (rst) begin
                        accumulator_carry[i][0] <= 0;
                        accumulator_output[i] <= 0;
                        accumulator_delay[i] <= 0;
                    end
                    else begin
                        {accumulator_carry[i][0], accumulator_output[i]} <= accumulator_delay[i-1] + accumulator_output[i];
                        accumulator_delay[i] <= accumulator_output[i];
                    end
                end
            end

            // pipeline the carrys
            always @(posedge rst, posedge clk) begin
                if (rst) begin
                    accumulator_carry[i][4*(ORDER-1)-1:1] <= 0;
                end
                else begin
                    accumulator_carry[i][4*(ORDER-1)-1:1] <= accumulator_carry[i][4*(ORDER-1)-2:0];
                end
            end

            // form the summers
            if (i < ORDER-2) begin
                always @(posedge rst, posedge clk) begin
                    if (rst) begin
                        sum_delay[i] <= 0;
                        sum_minus[i] <= 0;
                        sum_output[i] <= 0;
                    end
                    else begin
                        sum_delay[i] <= sum_output[i+1];
                        sum_minus[i] <= sum_output[i+1] - sum_delay[i];
                        sum_output[i] <= sum_minus[i] + {2'b00, accumulator_carry[i][4*(ORDER-1-i)-1]};
                    end
                end
            end
            else if (i == ORDER-2) begin
                always @(posedge rst, posedge clk) begin
                    if (rst) begin
                        sum_delay[i] <= 0;
                        sum_minus[i] <= 0;
                        sum_output[i] <= 0;
                    end
                    else begin
                        sum_delay[i] <= {2'b00, accumulator_carry[ORDER-1][0]};
                        sum_minus[i] <= {2'b00, accumulator_carry[ORDER-1][0]} - sum_delay[i];
                        sum_output[i] <= sum_minus[i] + {2'b00, accumulator_carry[i][4*(ORDER-1-i)-1]};
                    end
                end
            end
        end
    endgenerate

    // pass the output
    assign data_out = sum_output[0];

endmodule