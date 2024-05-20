// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`ifndef _PIPELINED_DIVIDER_H
`define _PIPELINED_DIVIDER_H

// pipelined_divider.v
// Divides signed dividend by unsigned divisor.
// Parameterized to take inputs of variable size.
// Currently doing long division. Non restoring? Combine registers?

`timescale 1ns/100ps

//`define SIMULATE_IDEAL
`ifndef SIMULATE_IDEAL
//numerator = dividend, denominator = divisor
module pipelined_divider (input                             nreset,
                          input                             clock,

                          input                             input_valid,
                          input                       [7:0] tag,
                          input       [divisor_width - 1:0] divisor,
                          input      [dividend_width - 1:0] dividend,

                          output reg                        output_valid,
                          output reg                  [7:0] tag_out,
                          output reg [dividend_width - 1:0] quotient,
                          output reg [dividend_width - 1:0] remainder);
    parameter dividend_width = 16, divisor_width = 8;
    localparam stages = dividend_width + 1;

    reg [dividend_width + divisor_width - 1:0] divisors   [0:stages];
    reg [dividend_width + divisor_width - 1:0] remainders [0:stages];
    reg [dividend_width - 1:0]                 quotients  [0:stages];

    reg neg_flags [0:stages]; //set if dividend is negative

    reg stage_valid [0:stages];
    reg [7:0] stage_tag [0:stages];

    always @(posedge clock) begin
        if (nreset) begin
            if (dividend[dividend_width - 1] == 1'b1) begin
                neg_flags[0] <= 1'b1;
                remainders[0] <= {{divisor_width{1'b0}}, -dividend};
            end else begin
                neg_flags[0] <= 1'b0;
                remainders[0] <= {{divisor_width{1'b0}}, dividend};
            end
            divisors[0]   <= {divisor, {dividend_width{1'b0}}};
            quotients[0]  <= {dividend_width{1'b0}};

            stage_valid[0] <= input_valid;
            stage_tag[0] <= tag;
        end else begin
            stage_valid[0] <= 1'b0;
            neg_flags[0]   <= 1'bx;
            remainders[0]  <= 'hxx;
            divisors[0]    <= 'hxx;
            quotients[0]   <= 'hxx;
            stage_tag[0]   <= 'hxx;
        end
    end

    genvar i;
    generate
        for (i = 0; i < stages; i = i + 1) begin
            always @(posedge clock) begin
                if (nreset) begin
                    if (remainders[i] - divisors[i] <= remainders[i]) begin //no underflow/positive
                        remainders[i + 1] <= remainders[i] - divisors[i];
                        quotients[i + 1] <= (quotients[i] << 1) | 1;
                    end else begin //underflow/negative
                        remainders[i + 1] <= remainders[i];
                        quotients[i + 1] <= quotients[i] << 1;
                    end
                    divisors[i + 1] <= divisors[i] >> 1;
                    neg_flags[i + 1] <= neg_flags[i];

                    stage_valid[i + 1] <= stage_valid[i];
                    stage_tag[i + 1] <= stage_tag[i];
                end else begin
                    stage_valid[i + 1] <= 1'b0;
                    neg_flags[i + 1]   <= 1'bx;
                    remainders[i + 1]  <= 'hxx;
                    divisors[i + 1]    <= 'hxx;
                    quotients[i + 1]   <= 'hxx;
                    stage_tag[i + 1]   <= 'hxx;
                end
            end
        end
    endgenerate

    always @(posedge clock) begin
        if (nreset) begin
            if (neg_flags[stages]) begin
                quotient <= -quotients[stages];
                remainder <= -remainders[stages]; //different size but should be fine
            end else begin
                quotient <= quotients[stages];
                remainder <= remainders[stages];
            end

            output_valid <= stage_valid[stages];
            tag_out <= stage_tag[stages];
        end else begin
            output_valid <= 1'b0;
            tag_out   <= 'hxx;
            quotient     <= 'hxx;
            remainder    <= 'hxx;
        end
    end
endmodule

`else

module pipelined_divider(input                      nreset,
                         input                      clock,

                         input signed [dividend_width - 1:0] dividend,
                         input         [divisor_width - 1:0] divisor,
                         input         [7:0]        tag,       // for identifing pairs that go in.
                         input                      input_valid,

                         output signed [dividend_width - 1:0] quotient,
                         output                        [7:0] tag_out,       // for identifing pairs that go in.
                         output     output_valid);
    parameter dividend_width = 16, divisor_width = 8;
    localparam stages = dividend_width + 1;

    reg signed [(dividend_width - 1):0] quotient_internal [(stages - 1):0];
    reg        [7:0] tag_internal [(stages - 1):0];
    reg stages_valid [(stages - 1):0];

    assign quotient = quotient_internal[stages - 1];
    assign tag_out  = tag_internal[stages - 1];
    assign output_valid = stages_valid[stages - 1];

    integer i;

    // N.B. if both the dividend and divisor aren't signed, then the dividend is changed to
    // unsigned.
    wire signed [15:0] divisor_extend;
    assign divisor_extend = {8'h0, divisor};
    always @(posedge clock) begin
        quotient_internal[0] <= dividend / divisor_extend;

        tag_internal[0] <= tag;
        stages_valid[0] <= input_valid;
        for (i = 1; i < stages; i = i + 1) begin
            quotient_internal[i] <= quotient_internal[i - 1];
            tag_internal[i] <= tag_internal[i - 1];
            stages_valid[i] <= stages_valid[i - 1];
        end
    end
endmodule

`endif
`endif
