// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 **                                                                          **
 ** Component : Decoder_8                                                    **
 **                                                                          **
 *****************************************************************************/

module Decoder_8 (
    input enable,
    input [2:0] sel,
    output reg decoderOut_0,
    output reg decoderOut_1,
    output reg decoderOut_2,
    output reg decoderOut_3,
    output reg decoderOut_4,
    output reg decoderOut_5,
    output reg decoderOut_6,
    output reg decoderOut_7
);

    // Combinational logic for the 8-output decoder
    always @(*) begin
        if (enable) begin
            case (sel)
                3'b000: {decoderOut_7, decoderOut_6, decoderOut_5, decoderOut_4, decoderOut_3, decoderOut_2, decoderOut_1, decoderOut_0} = 8'b00000001;
                3'b001: {decoderOut_7, decoderOut_6, decoderOut_5, decoderOut_4, decoderOut_3, decoderOut_2, decoderOut_1, decoderOut_0} = 8'b00000010;
                3'b010: {decoderOut_7, decoderOut_6, decoderOut_5, decoderOut_4, decoderOut_3, decoderOut_2, decoderOut_1, decoderOut_0} = 8'b00000100;
                3'b011: {decoderOut_7, decoderOut_6, decoderOut_5, decoderOut_4, decoderOut_3, decoderOut_2, decoderOut_1, decoderOut_0} = 8'b00001000;
                3'b100: {decoderOut_7, decoderOut_6, decoderOut_5, decoderOut_4, decoderOut_3, decoderOut_2, decoderOut_1, decoderOut_0} = 8'b00010000;
                3'b101: {decoderOut_7, decoderOut_6, decoderOut_5, decoderOut_4, decoderOut_3, decoderOut_2, decoderOut_1, decoderOut_0} = 8'b00100000;
                3'b110: {decoderOut_7, decoderOut_6, decoderOut_5, decoderOut_4, decoderOut_3, decoderOut_2, decoderOut_1, decoderOut_0} = 8'b01000000;
                3'b111: {decoderOut_7, decoderOut_6, decoderOut_5, decoderOut_4, decoderOut_3, decoderOut_2, decoderOut_1, decoderOut_0} = 8'b10000000;
                default: {decoderOut_7, decoderOut_6, decoderOut_5, decoderOut_4, decoderOut_3, decoderOut_2, decoderOut_1, decoderOut_0} = 8'b00000000;
            endcase
        end else begin
            {decoderOut_7, decoderOut_6, decoderOut_5, decoderOut_4, decoderOut_3, decoderOut_2, decoderOut_1, decoderOut_0} = 8'b00000000;
        end
    end

endmodule
