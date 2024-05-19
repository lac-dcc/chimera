// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL16L8
// JLB/CJTC 14AUG86
// 44302B,11D,LBC1

module PAL_44302B(
    input Q0_n,         // I0
    input Q2_n,         // I1
    input CC2_n,        // I2
    input BDRY25_n,     // I3
    input BDRY50_n,     // I4
    input CGNT_n,       // I5
    input CGNT50_n,     // I6
    input CACT_n,       // I7
    input TERM_n,       // I8
    input BGNT_n,       // I9

    output BGNTCACT_n,  // Y0_n 
    output CGNTCACT_n,  // Y1_n 

    output EMD_n,       // B0_n 
    output DSTB_n,      // B1_n 
    //input B2_n        // B2_n 
    input TEST,         // B3_n  (PD3)
    input IORQ_n,       // B4_n 
    input RT_n          // B5_n         
);



// Inverted input signals
wire Q0 = ~Q0_n;
wire Q2 = ~Q2_n;
wire CC2 = ~CC2_n;
wire BDRY25 = ~BDRY25_n;
wire BDRY50 = ~BDRY50_n;
wire CGNT = ~CGNT_n;
wire CGNT50 = ~CGNT50_n;
wire CACT = ~CACT_n;
wire TERM = ~TERM_n;
wire IORQ = ~IORQ_n;
wire RT = ~RT_n;
wire BGNT = ~BGNT_n;


// Output signal logic (self reference)
reg EMD;

always @(*) begin
    // Logic for EMD

    /*  Orignal code that has "circular logic" and is not synthesizable
        EMD = 
                        (Q2 & Q0 & CACT)        |  // CPU CYCLE TO BUS SET 
                        (EMD & CACT)            |  //       "          HOLD
                        (CGNT & CGNT50)         |  // CPU CYCLE TO MEM SET 
                        (EMD & RT & CC2 & TERM) |  // ) HOLD TERMS FOR 
                        (EMD & IORQ & CC2 & TERM)  // ) CPU READ, FETCH AND
                        );                         // ) MAP CYCLES
    */

    // Rewritten for handling of "circular logic"        
    if (
        (Q2 & Q0 & CACT) |                       // CPU CYCLE TO BUS SET 
        (CGNT & CGNT50))                         // CPU CYCLE TO MEM SET 
            EMD = 1'b1;
        else if (
            (CACT == 0)              |           // CPU CYCLE TO BUS HOLD
            (RT & CC2 & TERM == 0)   |           // ) HOLD TERMS FOR 
            (IORQ & CC2 & TERM == 0)             // ) CPU READ, FETCH AND MAP CYCLES
        )
            EMD = 1'b0;
    
end        

// Logic for CGNTCACT
assign CGNTCACT_n = TEST ? 1'b1 : ~(CGNT | CACT);

// Logic for BGNTCACT
assign BGNTCACT_n = TEST ? 1'b1 : ~(BGNT | CACT);

// Logic for DSTB
assign DSTB_n = TEST ? 1'b1 :
                    ~(  
                        (CGNT)                          |  
                        (CACT & BDRY50 & BDRY25 & IORQ) |  
                        (CACT & IORQ & CC2)                // IOX CYCLE
                    );




assign EMD_n = TEST ? 1'b1 : ~EMD;  

endmodule


/*
  DESCRIPTION

; 060387 JLB: EMD WAS HOLDING IN ADDRESS PART OF IOX CYCLES AFTER
; BUFFERED WRITE CYCLES.
; EMD - ENABLE DATA PATH BETWEEN CD AND LBD
; 270387 CJTC: NEW SIGNAL DSTB TO SAMPLE DATA AT LBD/CD BUFFERS ON
; CPU FROM BUS READ, AT BDRY.
; 040487 JLB: DSTB MUST NOT CLOCK DATA BEFORE CACT GOES OFF IN IOXES.
;  (NEGATIVE SETUP OF DATA IN BUS SPECS.)
;
; 180587 CJTC: 3202B
; 070887 JLB: 3202C ONLY! (TEST MODE).

*/

/* IMPLEMENTATION NOTES


Recursive Definitions Caution: The recursive definitions for EMD need careful handling
 to ensure they align with the design requirements and behave correctly in hardware.

Testing and Verification: Extensive testing with appropriate testbenches is crucial to validate the module's behavior under all conditions, 
including different states of the TEST signal.

*/