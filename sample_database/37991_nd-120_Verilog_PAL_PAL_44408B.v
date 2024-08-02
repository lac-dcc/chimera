// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL16R4 
// JLB/CJTC 17MAR87 
// 44408B,22F,VEXFIX 


// PCB 3202D sheet 34:
//
// PAL input signal PD1 is connected to PAL OE_n (and PD1 to PD4 is ALWAYS 0/FALSE in the 3202 circuit board)
//     input signal CLK is connectec to PAL CK pin


/*
; TO FIX VIRTUAL EXAMINE BUG IN CGA 
; + MISC. OTHER BUGS. 

PAL 44608A (VXFIX) replaces this PAL. The new PAL 44608A is an PAL16R6 that has a pin RT_n output. Use RT_n signal from DGA until we find out what the 44608A does with this signal.
*/

module PAL_44408B(
    input CK,       // Clock signal
    input OE_n,     // OUTPUT ENABLE (active-low) for Q0-Q3

    input C4,       // I0 - CSCOMM4
    input C3,       // I1 - CSCOMM3
    input C2,       // I2 - CSCOMM2 
    input C1,       // I3 - CSCOMM1 
    input C0,       // I4 - CSCOMM0 
    input M1,       // I5 - CSMIS1
    input M0,       // I6 - CSMIS0  
                    // I7 - (not connected)
    input LCS_n,    
                    // B0_n - (not connected)
    input IDB2,     // B1_n - IDB2

    // These signals may have wrong Q pin description, as this is taken from the description of the PAL 444608 (VXFIX) which is a PAL16R6

                     // Q0_n - (not connected)
    output LDEXM_n,  // Q1_n 
    output VEX,      // Q2_n
    output OPCLCS,   // Q3_n
    output RWCS_n,    // Q4_n

    // Pin in 444608 (VXFIX) but not in 44408B
    output RT_n      // Q5_n     
    
    
);

// Inverted input signals
wire LCS = ~LCS_n;

// Internal signals for outputs
reg RWCS_int, OPCLCS_n_int, VEX_n_int, LDEXM_int;

// Sequential logic triggered on the rising edge of CLK
always @(posedge CK) begin
    // Logic for LDEXM
    LDEXM_int <= C4 & ~C3 & ~C2 & ~C1 & C0 & M1 & M0 & LCS_n; // COMMAND 21.3 (validated RH)

    // Logic for VEX
    VEX_n_int <= (LDEXM_int & ~IDB2) |       // CLEAR
                 (~LDEXM_int & VEX_n_int) |  // HOLD CLEAR
                 LCS;                        // LCS

    // Logic for OPCLCS
    OPCLCS_n_int <= ~C4 | ~C3 | ~C2 | ~C1 | C0 | ~M1 | M0 | LCS; // COMMAND 36.2 (validated RH)

    // Logic for RWCS
    RWCS_int <= C4 & C3 & C2 & C1 & ~C0 & ~M1 & M0 & LCS_n; // COMMAND 36.1 (validated RH)

end

// Tri-state control for outputs
// High-impedance state when OE_n is high (active-low)

assign RWCS_n = OE_n ? 1'b0 : ~RWCS_int;
assign OPCLCS = OE_n ? 1'b0 : ~OPCLCS_n_int;
assign VEX = OE_n ? 1'b0 : ~VEX_n_int;
assign LDEXM_n = OE_n ? 1'b0 : ~LDEXM_int;
        

// Unknown signal in this PAL, set high
assign RT_n = 1'b1;

endmodule



/*
DESCRIPTION 

; 180587 M3202B
; 150687 RWCS SIGNAL TOO SLOW FROM NEC G.A. MUST BE DONE IN A PAL.
; 010787 REGISTRATION NUMBER CHANGED FROM 44501B 

*/