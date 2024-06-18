// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module greytobin (
    input [3:0] grey,
    output reg [3:0] binary
);

always @(*) begin
    binary[3] = grey[3];
    binary[2] = grey[3] ^ grey[2];
    binary[1] = grey[3] ^ grey[2] ^ grey[1];
    binary[0] = grey[3] ^ grey[2] ^ grey[1] ^ grey[0];
end

endmodule