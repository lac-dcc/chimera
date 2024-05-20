// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    
    always @(*) begin
        left = 0; down = 0; right = 0; up = 0;
        case(scancode)
            16'he06b : left = 1;
            16'he072 : down = 1;
            16'he074 : right = 1;
            16'he075 : up = 1;
            default : ;
        endcase
    end

endmodule