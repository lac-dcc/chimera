
`include "parameters.v"

module MUX_WORD_2to1(
input wire `LVT_ENTRY selector,

input wire `WORD input_0,
input wire `WORD input_1,

output reg `WORD output_0
);

always @(*) begin
    case(selector)

        `BANK_0: begin
			output_0 <= input_0;
        end

        `BANK_1: begin
			output_0 <= input_1;
        end

        default: begin
			output_0 <= input_0;
        end

    endcase
end

endmodule
