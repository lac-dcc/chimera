// This program was cloned from: https://github.com/yukinagata3184/de0_blinkL
// License: MIT License

// 7 segment decoder blink L
// author:yukinagata3184

module seg7decL(
    input en, // blink en
    output [6:0] nSEG // DE0's 7seg led is low active(fm user manual)
);

function [6:0] segdecL;
input en;
    case(en)
        1'b0:    segdecL = 7'b111_1111;
        1'b1:    segdecL = 7'b100_0111;
        default: segdecL = 7'bxxx_xxxx;
    endcase
endfunction

assign nSEG = segdecL(en);

endmodule