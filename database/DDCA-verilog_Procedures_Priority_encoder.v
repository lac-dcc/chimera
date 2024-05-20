// This program was cloned from: https://github.com/BriceLucifer/DDCA-verilog
// License: MIT License

// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always @(*) begin
        casex(in) 
        // 要么全部枚举 要么 casex一把梭
            4'b0000: pos = 1'd0;
            4'b1000: pos = 2'b11;
            4'bx100: pos = 2'b10;
            4'bxx10: pos = 2'b01;
            4'b0001: pos = 2'b00;
        default:
            pos = 2'b00;


        endcase
    end
endmodule