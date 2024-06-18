// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_Halt (clk, rst, en);
    parameter UUID = 0;
    parameter NAME = "";
    parameter HALT_MESSAGE = "";
    input clk;
    input rst;
    input en;
    
    always @ (negedge clk) begin
        if (en) begin
            $display("%s", HALT_MESSAGE);
            $stop;
        end
    end
endmodule
