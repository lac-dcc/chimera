// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module dectobin (
    input [3:0] decimal,
    output reg [3:0] binary
);

always @(*) begin
    case(decimal)
        0: binary = 4'b0000;
        1: binary = 4'b0001;
        2: binary = 4'b0010;
        3: binary = 4'b0011;
        4: binary = 4'b0100;
        5: binary = 4'b0101;
        6: binary = 4'b0110;
        7: binary = 4'b0111;
        8: binary = 4'b1000;
        9: binary = 4'b1001;
        default: binary = 4'bxxxx; 
    endcase
end

endmodule