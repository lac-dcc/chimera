module CMP(D1,D2,Op,Q);
    
    input [31:0] D1,D2;
    input [2:0]  Op;
    
    output Q; 
    //1 for branch 
    //0 for no branch

    /**
     * 000(BEQ ) : D1 == D2
     * 001(BNE ) : D1 != D2
     * 010(BLEZ) : D1 <= D2 (D2=0)
     * 011(BGTZ) : D1 >  D2 (D2=0) 
     * 100(BLTZ) : D1 <  D2 (D2=0)    
     * 101(BGEZ) : D1 >= D2 (D2=0)
     */

    assign Q = (Op == 3'b000) ? ( D1 == D2 ) :
               (Op == 3'b001) ? ( D1 != D2 ) :
               (Op == 3'b010) ? ( $signed(D1) <= 0  ) :
               (Op == 3'b011) ? ( $signed(D1) >  0  ) :
               (Op == 3'b100) ? ( $signed(D1) <  0  ) :
               (Op == 3'b101) ? ( $signed(D1) >= 0  ) :
                                  3'bxxx     ;
endmodule
