// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos  );
always @(*) begin
    casez (in[7:0])
        8'bzzzzzzz1: begin
            pos = 3'd0;
        end
        8'bzzzzzz1z: begin
            pos = 3'd1;
        end
        8'bzzzzz1zz: begin
            pos = 3'd2;
        end
        8'bzzzz1zzz: begin
            pos = 3'd3;
        end
        8'bzzz1zzzz: begin
            pos = 3'd4;
        end
        8'bzz1zzzzz: begin
            pos = 3'd5;
        end
        8'bz1zzzzzz: begin
            pos = 3'd6;
        end
        8'b1zzzzzzz: begin
            pos = 3'd7;
        end
        default: begin
            pos = 0;
        end
    endcase
end
endmodule
