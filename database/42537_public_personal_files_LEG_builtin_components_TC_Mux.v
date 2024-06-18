// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_Mux(sel, in0, in1, out);
    parameter UUID = 0;
    parameter NAME = "";
    parameter BIT_WIDTH = 1;
    input sel;
    input [BIT_WIDTH-1:0] in0;
    input [BIT_WIDTH-1:0] in1;
    output reg [BIT_WIDTH-1:0] out;
    
    always @ (sel or in0 or in1) begin
        case(sel)
        1'b0 : out = in0;
        1'b1 : out = in1;
        endcase
    end
endmodule
