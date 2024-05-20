// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

// sevenseghexdecoder.v for EE 2390 Lab #4
`timescale 1ns / 1ps
module sevenseghexdecoder(Seg,HexVal);
    output [0:6] Seg;
    input  [3:0] HexVal;
    reg    [0:6] Seg;
    // Signal correspondence is as follows:
    // Display Segment:  a b c d e f g (all active low: 0--on, 1--off)
    // Seg output bit:   0 1 2 3 4 5 6
    // HexVal[3:0] has MSb at bit 3, LSb at bit 0
    always @(HexVal) // Do this whenever HexVal changes
    begin
    case(HexVal)
            4'h0:  Seg = 7'b000_0001;  // forms the character for 0
            // You need to add the others
            4'hF:  Seg = 7'b011_1000;  // forms the character for F
            default:  Seg = 7'b111_1111; //  specify a default (all off)
     endcase
    end
endmodule
