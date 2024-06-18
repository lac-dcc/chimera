// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

module Shifter(
    input [7:0] data_in,
    input shift_direction,
    input shifter_en,
    input load_shifter,
    output reg [7:0] data_out,
    output reg shifter_flag = 0
);


reg [7:0] internal_register;

always @(load_shifter) begin
    internal_register <= data_in;
end

always @(shifter_en) begin
    case(shift_direction)
        1'b0: begin
            shifter_flag = internal_register[0];
            internal_register = internal_register >> 1;
            data_out = internal_register;
        end
        1'b1: begin
            internal_register = internal_register << 1;
            data_out = internal_register;
        end
    endcase
end

endmodule
