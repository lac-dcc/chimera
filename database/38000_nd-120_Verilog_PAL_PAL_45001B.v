// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL16L8
// JLB/CJTC 11AUG86
// 45001B, 8D, BPAR

// PCB 3202D sheet 6:
//

// PAL 16L8
// 10 INPUT only pins (I0-I9)
// 2 OUT only pins (Y0-Y1) and 6 IN or OUT pins (B0-B5)
//
// PAL16RL8 (https://rocelec.widen.net/view/pdf/c6dwcslffz/VANTS00080-1.pdf)



module PAL_45001B(

    input BDRY50_n,           // I0 - BDRY50_n  
    input BDRY75_n,           // I1 - BDRY75_n  
    input BLOCK25_n,          // I2 - BLOCK25_n 
    input BPERR50_n,          // I3 - BPERR50_n 
    input DBAPR_n,            // I4 - DBAPR_n   
    input MOR25_n,            // I5 - MOR25_n   
    input LPERR_n,            // I6 - LPERR_n   
    input MR_n,               // I7 - MR_n      
    input EPES_n,             // I8 - EPES_n    
    input EPEA_n,             // I9 - EPEA_n    
                              
                              
    output SPEA,              // Y0_n (OUT Only)      
    output SPES,              // Y1_n (OUT ONLY)      
                                                      
    output BLOCK_n,           // B0_n - BLOCK_n (out) 
    output PARERR_n,          // B1_n - PARERR_n (out)
    output RERR_n,            // B2_n                 
    //inout B3_n,             // B3_n - (n.c.)        
    input  TEST,              // B4_n - PD3           
    input  LERR_n             // B5_n                 
);                        


// Creating non-negated wires for active-low inputs
wire BDRY50 = ~BDRY50_n;
wire BDRY75 = ~BDRY75_n;
wire BLOCK25 = ~BLOCK25_n;
wire BPERR50 = ~BPERR50_n;
wire MOR25 = ~MOR25_n;
wire MR = ~MR_n;
wire EPES = ~EPES_n;
wire EPEA = ~EPEA_n;
wire LERR = ~LERR_n;



// STROBE PARITY ERROR STATUS WORD
assign SPES = TEST ? 1'b0 :
            ~(
                (BDRY50_n & BDRY75_n  ) 
              | (BDRY50   & BDRY75    ) 
              | (BDRY50_n & BDRY75    )
              | ( BLOCK25_n           )
              | ( EPEA                )
              | ( EPES                )
              | ( MR                  )
);

// STROBE PARITY ERROR ADDRESS
assign SPEA = TEST ? 1'b0 :
                ~(
                     ( DBAPR_n )
                   | ( BLOCK25 )
                   | ( EPEA    )
                   | ( MR_n    )
);

// PARITY ERROR SIGNALS FROM BUS AND LOCAL MEMORY
assign PARERR_n = TEST ? 1'b1 :
                ~(
                     (BDRY50 & BDRY75_n & BPERR50 & MR_n) 
                   | (LERR                           )
);


reg BLOCK_reg;
reg RERR_reg;

always @(*) begin
    // BLOCK SIGNAL FOR PES AND PEA STROBE - BLOCK ON ERROR, RELEASE ON PEA READ
    if (TEST) 
        BLOCK_reg = 1'b0;    
    else if ( ((BDRY50 & BDRY75_n & EPEA_n & EPES_n & MOR25 & MR_n)==1)  | ((BDRY50 & BDRY75_n & EPEA_n & EPES_n & BPERR50 & MR_n) == 1) )
            BLOCK_reg = 1'b1;
    else if ((EPEA_n & MR_n)== 0);
            BLOCK_reg = 0;

    // REMOTE ERROR - LAST ERROR WAS FROM MEMORY ATTACHED TO THE ND100 BUS
    // WILL BE OVERRIDEN BY AN ERROR FROM LOCAL MEMORY (PERR1 AND PERR0)
  if (TEST) 
        RERR_reg = 1'b0;    
  else if ((
                (BPERR50 & MR_n)  // SET REMOTE ERROR ON BUS PARITY ERROR)  
              | (MOR25 & MR_n)    // LOCAL ERROR HAS PRIORITY
    ) == 1)
    RERR_reg = 1;
  else if ((LPERR_n & MR_n) == 0) // HOLD UNTIL A LOCAL MEMORY ERROR
    RERR_reg = 0;

end

assign BLOCK_n = ~BLOCK_reg;	
assign RERR_n = ~RERR_reg;


endmodule

/*
DESCRIPTION

; 260387 CJTC: NEED TO USE DELAYED BAPR (DBAPR) INSTEAD OF /BAPR IN
;       PRODUCING SPEA. POLARITY CHANGE.

; 260387 JLB: BLOCK SIGNAL MUST NOT BE PRODUCED ON LOCAL MEMORY ERROR.
; IT WILL ONLY BE UNLOCKED ON PEA READ FROM REMOTE ERROR PEA.
; 260387 JLB: PERR HANDLING CHANGED.
; 070487 JLB: RERR MUST LATCH UP ON MOR ALSO.

; 180587 M3202B
; 090887 B JLB: TEST MODE FOR C-PRINT.

*/