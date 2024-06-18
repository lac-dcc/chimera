// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always @(*) begin
        if (in[0] == 1'b1) begin
                pos = 2'd0;
        end
        else begin
            if(in[1] == 1'b1) begin
                pos = 2'd1;
            end
            else begin
                if(in[2] == 1'b1) begin
                    pos = 2'd2;
                end
                else begin
                    if(in[3] == 1'b1) begin
                        pos = 2'd3;
                    end
                    else begin
                        pos = 0;
                    end
                end
            end
        end
    end
endmodule
