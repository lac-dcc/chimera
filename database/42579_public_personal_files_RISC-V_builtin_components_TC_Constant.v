// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal


module TC_Constant(out);
    parameter UUID = 0;
    parameter NAME = "";
    parameter BIT_WIDTH = 1;
    parameter value = {BIT_WIDTH{1'b0}};
    output [BIT_WIDTH-1:0] out;
    
    assign out = value;
endmodule
