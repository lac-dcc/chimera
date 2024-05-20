// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

/**
 * This memory interface module lets our huffman encoder write words of variable bit length
 * (up to 32 bits), and it aligns and packs them into 32-bit words.
 *
 * The data coming in should be LEFT JUSTIFIED, lsbs should all be zero.
 */
module bitpacker(input         clock,
                 input         nreset,

                 input         data_in_valid,
                 input [31:0]  data_in,
                 input  [5:0]  input_length,

                 output reg         data_out_valid,
                 output reg  [31:0] data_out);
    reg [4:0] bit_counter;
    reg [4:0] bit_counter_next;
    reg       bit_counter_carry;

    // hacky solution to add 'data_in_valid' line: if data_in_valid is low, just force length to 0.
    reg [5:0] input_length_gated;
    always @* begin
        if (data_in_valid) begin
            input_length_gated = input_length;
        end else begin
            input_length_gated = 'h0;
        end
    end

    reg [31:0] output_register;
    reg [31:0] bit_accumulator_register;

    reg [63:0] shifted_input;
    always @* begin
        shifted_input = {data_in, 32'h0} >> bit_counter;
    end

    reg [31:0] bit_accumulator_with_input_added;
    always @* begin
        if (data_in_valid) begin
            bit_accumulator_with_input_added = bit_accumulator_register | shifted_input[63:32];
        end else begin
            bit_accumulator_with_input_added = bit_accumulator_register;
        end
    end

    always @(posedge clock) begin
        if (nreset) begin
            if (bit_counter_carry) begin
                bit_accumulator_register <= shifted_input[31:0];
            end else begin
                bit_accumulator_register <= bit_accumulator_with_input_added;
            end

            if (bit_counter_carry) begin
                data_out <= bit_accumulator_with_input_added;
                data_out_valid <= 1'b1;
            end else begin
                data_out <= 32'hxxxx_xxxx;
                data_out_valid <= 1'b0;
            end

            bit_counter <= bit_counter_next;
        end else begin
            bit_accumulator_register <= 32'h0000_0000;
            data_out <= 32'hxxxx_xxxx;
            data_out_valid <= 1'b0;
            bit_counter <= 5'h0;
        end
    end

    always @* begin
        { bit_counter_carry, bit_counter_next } = bit_counter + input_length_gated;
    end
endmodule
