// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module prior_enco_4to2(
    input [3:0] input_data,
    output reg [1:0] out
);

always @(*) begin
    case(input_data)
        4'b0001: out = 2'b00;
        4'b0010: out = 2'b01;
        4'b0100: out = 2'b10;
        4'b1000: out = 2'b11;
        default: out = 2'b11; 
    endcase
end

endmodule
