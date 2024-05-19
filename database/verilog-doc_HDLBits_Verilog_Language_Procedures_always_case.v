// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

// synthesis verilog_input_version verilog_2001
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(*) begin  // This is a combinational circuit
        case(sel)
            3'b0: begin
                out = data0;
            end
            3'b001: begin
                out = data1;
            end
            3'b010: begin
                out = data2;
            end
            3'b011: begin
                out = data3;
            end
            3'b100: begin
                out = data4;
            end
            3'b101: begin
                out = data5;
            end
            default: begin
                out[3:0] = 0;
            end
        endcase
    end

endmodule
