// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module bintoex3 (
    input [3:0] binary,
    output reg [3:0] excess3
);

always @(*) begin
    case(binary)
        4'b0000: excess3 = 4'b0011;
        4'b0001: excess3 = 4'b0100;
        4'b0010: excess3 = 4'b0101;
        4'b0011: excess3 = 4'b0110;
        4'b0100: excess3 = 4'b0111;
        4'b0101: excess3 = 4'b1000;
        4'b0110: excess3 = 4'b1001;
        4'b0111: excess3 = 4'b1010;
        4'b1000: excess3 = 4'b1011;
        4'b1001: excess3 = 4'b1100;
        4'b1010: excess3 = 4'b1101;
        4'b1011: excess3 = 4'b1110;
        4'b1100: excess3 = 4'b1111;
        4'b1101: excess3 = 4'b0000;
        4'b1110: excess3 = 4'b0001;
        4'b1111: excess3 = 4'b0010;
        default: excess3 = 4'bxxxx; 
    endcase
end

endmodule