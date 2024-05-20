// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_Decoder3 (dis, sel0, sel1, sel2, out0, out1, out2, out3, out4, out5, out6, out7);
    parameter UUID = 0;
    parameter NAME = "";
    input dis;
    input sel0;
    input sel1;
    input sel2;
    output reg out0;
    output reg out1;
    output reg out2;
    output reg out3;
    output reg out4;
    output reg out5;
    output reg out6;
    output reg out7;

    always @ (dis or sel2 or sel1 or sel0)
    begin
        case({dis, sel2, sel1, sel0})
        4'b0000 : {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b0000_0001;
        4'b0001 : {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b0000_0010;
        4'b0010 : {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b0000_0100;
        4'b0011 : {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b0000_1000;
        4'b0100 : {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b0001_0000;
        4'b0101 : {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b0010_0000;
        4'b0110 : {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b0100_0000;
        4'b0111 : {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b1000_0000;
        default : {out7, out6, out5, out4, out3, out2, out1, out0} = 8'b0000_0000;
        endcase
    end 
endmodule
