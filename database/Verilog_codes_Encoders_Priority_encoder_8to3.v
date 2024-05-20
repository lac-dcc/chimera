// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module prior_enco_3to8 (
    input [7:0] input_data,
    output reg [2:0] out
);

always @(*) begin
    case(input_data)
        8'b00000001: out = 3'b000;
        8'b00000010: out = 3'b001;
        8'b00000100: out = 3'b010;
        8'b00001000: out = 3'b011;
        8'b00010000: out = 3'b100;
        8'b00100000: out = 3'b101;
        8'b01000000: out = 3'b110;
        8'b10000000: out = 3'b111;
        default: out = 3'b111; 
    endcase
end

endmodule
