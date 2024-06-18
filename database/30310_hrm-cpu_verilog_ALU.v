// This program was cloned from: https://github.com/adumont/hrm-cpu
// License: GNU General Public License v3.0

`default_nettype none

// INSTANTIATION TEMPLATE BEGIN
//
//     ALU alu0 (
//     /*  in */  .aluCtl(  ),
//     /*  in */  .inR(  ),
//     /*  in */  .inM(  ),
//     /* out */  .aluOut(  ),
//     /* out */  .flag(  )
//     );
//
// INSTANTIATION TEMPLATE END

module ALU (
        input  wire        [2:0] aluCtl,
        input  wire signed [7:0] inR,
        input  wire signed [7:0] inM,
        output reg  signed [7:0] aluOut,
        output reg               flag
    );

    // combination logic for: aluOut
    always @(*)
    case (aluCtl[1:0])
        2'b 00: aluOut = inR + inM;
        2'b 01: aluOut = inR - inM;
        2'b 10: aluOut = inM + 8'b1;
        default: aluOut = inM - 8'b1; // 2'b 11
    endcase

    // combination logic for: flag
    always @(*)
    begin
        if( aluCtl[2] )
            flag =  inR[7] ; // R  < 0 ?
        else
            flag = ( inR == 8'b 0 ); // R == 0 ?
    end

endmodule
