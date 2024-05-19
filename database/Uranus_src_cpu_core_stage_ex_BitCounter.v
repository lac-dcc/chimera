// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../../define/bus.v"
`include "../../define/funct.v"

module  BitCounter(
    input   wire[`FUNCT_BUS]    funct,
    input   wire[`DATA_BUS]     operand_1,
    output  reg [`DATA_BUS]     result_count
);

    wire[`DATA_BUS] operand_1_not = ~operand_1;

    always @ (*)    begin
        case (funct)
            `FUNCT2_CLZ:    
                result_count <= operand_1[31] ?  0 : operand_1[30] ?  1 : operand_1[29] ? 2 :
								operand_1[28] ?  3 : operand_1[27] ?  4 : operand_1[26] ? 5 :
								operand_1[25] ?  6 : operand_1[24] ?  7 : operand_1[23] ? 8 : 
								operand_1[22] ?  9 : operand_1[21] ? 10 : operand_1[20] ? 11 :
								operand_1[19] ? 12 : operand_1[18] ? 13 : operand_1[17] ? 14 : 
								operand_1[16] ? 15 : operand_1[15] ? 16 : operand_1[14] ? 17 : 
								operand_1[13] ? 18 : operand_1[12] ? 19 : operand_1[11] ? 20 :
								operand_1[10] ? 21 : operand_1[ 9] ? 22 : operand_1[8] ? 23 : 
								operand_1[ 7] ? 24 : operand_1[ 6] ? 25 : operand_1[5] ? 26 : 
								operand_1[ 4] ? 27 : operand_1[ 3] ? 28 : operand_1[2] ? 29 : 
								operand_1[ 1] ? 30 : operand_1[ 0] ? 31 : 32 ;
			`FUNCT2_CLO:    
                result_count <= operand_1_not[31] ?  0 : operand_1_not[30] ?  1 : operand_1_not[29] ?  2 :
								operand_1_not[28] ?  3 : operand_1_not[27] ?  4 : operand_1_not[26] ?  5 :
								operand_1_not[25] ?  6 : operand_1_not[24] ?  7 : operand_1_not[23] ?  8 : 
								operand_1_not[22] ?  9 : operand_1_not[21] ? 10 : operand_1_not[20] ? 11 :
								operand_1_not[19] ? 12 : operand_1_not[18] ? 13 : operand_1_not[17] ? 14 : 
								operand_1_not[16] ? 15 : operand_1_not[15] ? 16 : operand_1_not[14] ? 17 : 
								operand_1_not[13] ? 18 : operand_1_not[12] ? 19 : operand_1_not[11] ? 20 :
								operand_1_not[10] ? 21 : operand_1_not[ 9] ? 22 : operand_1_not[ 8] ? 23 : 
								operand_1_not[ 7] ? 24 : operand_1_not[ 6] ? 25 : operand_1_not[ 5] ? 26 : 
								operand_1_not[ 4] ? 27 : operand_1_not[ 3] ? 28 : operand_1_not[ 2] ? 29 : 
								operand_1_not[ 1] ? 30 : operand_1_not[ 0] ? 31 : 32 ;
            default:    result_count    <= 32'h0;
        endcase
    end

endmodule
