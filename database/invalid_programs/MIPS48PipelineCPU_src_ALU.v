`include "marco.h"
`include "opcode.h"

module ALU(input  [`i32]    A,B,
           input  [3 :0]    Op,
           output reg[`i32] C
);
    always @(A,B,Op) begin
        case (Op)
            4'b0000: C <= A + B ;
            4'b0001: C <= A - B ;
            4'b0010: C <= A & B ;
            4'b0011: C <= A | B ;
            4'b0100: C <= A ^ B ;
            4'b0101: C <= ~(A | B) ;
            4'b0110: C <= B << A[`i5] ;
            4'b0111: C <= B >> A[`i5] ;
            4'b1000: C <= $signed(B) >>> A[`i5] ;
            4'b1001: C <= ($signed(A) < $signed(B)) ? 1 : 0 ;
            4'b1010: C <= A < B ? 1 : 0 ;
            4'b1011: C <= B << 16 ;
        endcase
    end  
endmodule
