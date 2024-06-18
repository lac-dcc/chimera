// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module dectobcd (
    input [3:0] dec_in,
    output reg [3:0] bcd_out
);

always @(*) begin
    case(dec_in)
        4'd0: bcd_out = 4'b0000;
        4'd1: bcd_out = 4'b0001;
        4'd2: bcd_out = 4'b0010;
        4'd3: bcd_out = 4'b0011;
        4'd4: bcd_out = 4'b0100;
        4'd5: bcd_out = 4'b0101;
        4'd6: bcd_out = 4'b0110;
        4'd7: bcd_out = 4'b0111;
        4'd8: bcd_out = 4'b1000;
        4'd9: bcd_out = 4'b1001;
        default: bcd_out = 4'b0000; 
    endcase
end

endmodule
