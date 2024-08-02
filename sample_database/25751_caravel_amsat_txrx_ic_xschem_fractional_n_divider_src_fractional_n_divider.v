// This program was cloned from: https://github.com/yrrapt/caravel_amsat_txrx_ic
// License: Apache License 2.0

// Copyright 2020 Thomas Parry
//
// SOME LICENSE
//
// Fractional N Divider
//   A fractional N divider using MASH modulation.
//   
//   The 'data_in' value divided by the modulus will be created
//   in a quantisesd number stream with high passed noise shaping
//   characteristic.
//

module fractional_n_divider
    # (
        parameter WIDTH_INTEGER         = 10,
        parameter WIDTH_MODULUS         = 16,
        parameter ORDER                 = 3,
        parameter DATA_WIDTH            = WIDTH_INTEGER+WIDTH_MODULUS
    ) (
        input                       rst,

        // input and output frequencies
        input                       input_frequency,
        output                      output_frequency,

        // a manual interface for data
        input [DATA_WIDTH-1:0]      divide_value,
        input [1:0]                 dither_select,

        // test outputs
        output                      dither_output
    );

    // internal signals
    wire [WIDTH_INTEGER-1:0]        integer_value;
    wire [WIDTH_MODULUS-1:0]        fractional_value;
    wire signed [ORDER-1:0]         mash_output;
    wire [WIDTH_INTEGER-1:0]        count_target;
    reg [WIDTH_INTEGER-1:0]         count;
    reg                             output_state;
    reg                             dither;
    reg                             dither_en_lfsr;
    reg                             dither_in_lfsr;
    reg                             dither_en_trng;
    wire                            dither_out_lfsr;
    wire                            dither_out_trng;


    // split the divider values
    assign integer_value = divide_value[DATA_WIDTH-1:WIDTH_MODULUS];
    assign fractional_value = divide_value[WIDTH_MODULUS-1:0] + dither;

    // instantiate the MASH modulator
    mash_mod # (
        .WIDTH_MODULUS(WIDTH_MODULUS),
        .ORDER(ORDER)
    ) mash_mod_inst (
        .clk(output_frequency),
        .rst(rst),
        .data_in(fractional_value),
        .data_out(mash_output)
    );

    // combine the integer and fractional components
    assign count_target = $unsigned($signed(integer_value) + {{(WIDTH_INTEGER-ORDER){mash_output[ORDER-1]}}, mash_output});

    // count until the target is met and then output a pulse
    always @(posedge rst, posedge input_frequency) begin
        if (rst) begin
            count = 0;
            output_state = 0;
        end
        else begin
            if (count == count_target) begin
                count = 0;
                output_state = 1;
            end
            else begin
                count = count + 1;
                output_state = 0;
            end
        end
    end
    assign output_frequency = output_state;

    // LFSR based dither
    lfsr_fib lfsr_fib_inst (
        .i_clk(output_frequency),
        .i_reset(rst),
        .i_ce(dither_en_lfsr),
        .i_in(dither_in_lfsr),
        .o_bit(dither_out_lfsr)
    );

    // TRNG based dither
    trng trng_inst (
        .clk(output_frequency), 
        .rst(rst), 
        .stop(!dither_en_trng),
        .random(dither_out_trng)
    );

    // select the dither source
    always @(posedge output_frequency) begin
        case(dither_select)
            2'b00  :begin
                dither <= 0;
                dither_en_lfsr <= 0;
                dither_in_lfsr <= 0;
                dither_en_trng <= 0;
            end

            2'b01  : begin
                dither <= dither_out_trng;
                dither_en_lfsr <= 0;
                dither_in_lfsr <= 0;
                dither_en_trng <= 1;
            end

            2'b10  : begin
                dither <= dither_out_lfsr;
                dither_en_lfsr <= 1;
                dither_in_lfsr <= 0;
                dither_en_trng <= 0;
            end

            2'b11  : begin
                dither <= dither_out_lfsr;
                dither_en_lfsr <= 1;
                dither_in_lfsr <= 1;
                dither_en_trng <= 0;
            end

            default : begin
                dither <= 0;
                dither_en_lfsr <= 0;
                dither_in_lfsr <= 0;
                dither_en_trng <= 0;
            end
        endcase
    end

    assign dither_output = dither;

endmodule