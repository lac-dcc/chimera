// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_Counter (clk, rst, save, in, out);
    parameter UUID = 0;
    parameter NAME = "";
    parameter BIT_WIDTH = 8;
    parameter count = 1;
    input clk;
    input rst;
    input save;
    input [BIT_WIDTH-1:0] in;
    output reg [BIT_WIDTH-1:0] out;
    
    reg [BIT_WIDTH-1:0] value;
    
    initial begin
        out = {BIT_WIDTH{1'b0}};
        value = {BIT_WIDTH{1'b0}};
    end
    
    always @ (posedge clk) begin
        if (rst) begin
            out <= {BIT_WIDTH{1'b0}};
            value <= {BIT_WIDTH{1'b0}};
        end else begin
            if (save) begin
                out <= in;
                value <= in + count;
            end else begin
                out <= value;
                value <= value + count;
            end
        end
    end
endmodule
