// This program was cloned from: https://github.com/Rohan7Gupta/pentaRV
// License: Apache License 2.0

module PC_Module(clk,rst,PC,nextPC);
    input clk,rst;
    input [31:0]nextPC;
    output [31:0]PC;
    reg [31:0] PC ;

    always @(posedge clk)
    begin
        if(rst)
            PC <= {32{1'b0}};
        else
            PC <= nextPC;
    end
endmodule