// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module bcdtosev (
    input [3:0] bcd_in,
    output reg [6:0] sev_out
);
    
    always @(*) begin
        case(bcd_in)
            4'b0000: sev_out = 7'b0000001;
            4'b0001: sev_out = 7'b1001111;
            4'b0010: sev_out = 7'b0010010;
            4'b0011: sev_out = 7'b0000110;
            4'b0100: sev_out = 7'b1001100;
            4'b0101: sev_out = 7'b0100100;
            4'b0110: sev_out = 7'b0100000;
            4'b0111: sev_out = 7'b0001111;
            4'b1000: sev_out = 7'b0000000;
            4'b1001: sev_out = 7'b0001100;
            default: sev_out = 7'b1111111; 
        endcase
    end
endmodule