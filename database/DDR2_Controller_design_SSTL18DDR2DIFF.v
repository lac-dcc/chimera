//----------------------------------------------
//  EE577b Differential SSTL18 Simulation Model 
//----------------------------------------------
module SSTL18DDR2DIFF (PAD,PADN,Z,A,RI,TS);

   inout   PAD;
   inout   PADN;
   output  Z;
   input   A;
   input   RI;
   input   TS;

   not    n1 (A_,A);
   bufif1 b1 (PAD,A,TS);
   bufif1 b2 (PADN,A_,TS);
   not    n3 (PADN_,PADN);
   and    a4 (Z,PAD,PADN_,RI);

endmodule // SSTL18DDR2DIFF

