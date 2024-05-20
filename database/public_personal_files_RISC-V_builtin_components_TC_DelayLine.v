// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_DelayLine (clk, rst, in, out);
    parameter UUID = 0;
    parameter NAME = "";
    parameter BIT_WIDTH = 1;
    input clk;
    input rst;
    input [BIT_WIDTH-1:0] in;
    output reg [BIT_WIDTH-1:0] out;

    reg [BIT_WIDTH-1:0] value;
    reg reset;
    
    initial begin
        out = {BIT_WIDTH{1'b0}};
        value = {BIT_WIDTH{1'b0}};
        reset = 1;
    end
    
    always @ (posedge clk) begin
        if (rst)
            out <= {BIT_WIDTH{1'b0}};
        else
            out <= value;
        reset <= rst;
    end
    always @ (negedge clk) begin
        if (reset)
            value <= {BIT_WIDTH{1'b0}};
        else
            value <= in;
    end
endmodule
