// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL16R4
// ADGD 18/8/86
// 44446B, 6G, BADEC
// DMA ADDRESS DECODE FOR 4MB MEMORY

// PCB 3202D sheet 45:
//
// PAL input signal BGNT_n is connected to PAL OE_n pin
//     input signal DBAPR is connectec to PAL CK pin (AND I0)


module PAL_44446B(
    input CK,           // Clock signal (connected to DBAPR)
    input OE_n,         // OUTPUT ENABLE (active-low) for Q0-Q3 (connected to BGNT_n)

    input DBAPR,        // I0 - DBAPR
    input MOFF_n,       // I1 - MOFF_n
    input BINPUT_n,     // I2 - IBINPUT_n 
    input BMEM_n,       // I3 - BMEM_n
    input BD20_n,       // I4 - BD20_n 
    input BD21_n,       // I5 - BD21_n
    input BD22_n,       // I6 - BD22_n
    input BD23_n,       // I7 - BD23_n                       
                    
    output AOK,         // B0_n - AOK
    output DDBAPR_n,    // B1_n - DDBAPR_n 
    output MSIZE1_n,    // B2_n - MSIZE1_n (not connected?)
//  input  BD19_n,      // B3_n - BD19_n (not in use)

    output BANK2,       // Q0_n - BANK2
    output BANK1,       // Q1_n - BANK1
    output BANK0,       // Q2_n - BANK0
    output MWRITE_n     // Q3_n - MWRITE_n
);

// Inverted input signals
wire DBAPR_n = ~DBAPR;
wire BD20 = ~BD20_n;
wire BD21 = ~BD21_n;
wire BD22 = ~BD22_n;
wire BD23 = ~BD23_n;
wire MOFF = ~MOFF_n;    
wire BINPUT = ~BINPUT_n;


// Internal registers
reg BANK0_n_reg;
reg BANK1_n_reg;
reg BANK2_n_reg;
reg MWRITE_reg;


//**** Sequential logic triggered on the rising edge of CLK ****
always @(posedge CK) begin   

    // Logic for BANK0, BANK1, BANK2
    BANK0_n_reg <= BD21 | BD20;
    BANK2_n_reg <= BD21 | BD20_n;
    BANK1_n_reg <= BD21_n | BD20;

    // Logic for MWRITE
    MWRITE_reg <= BINPUT;

end

// Tri-state control for Q outputs
// High-impedance state when OE_n is high (active-low)
assign BANK2 = OE_n ? 1'b0 : ~BANK2_n_reg;
assign BANK1 = OE_n ? 1'b0 : ~BANK1_n_reg;
assign BANK0 = OE_n ? 1'b0 : ~BANK0_n_reg;
assign MWRITE_n = OE_n ? 1'b0 : ~MWRITE_reg;


//**** Syncronous logic (always running) ****

// Logic for AOK
assign AOK = ~(BMEM_n | BD23 | BD22 | BD21 | MOFF); // 4 MB

// Logic for DDBAPR_n (active-low)
assign DDBAPR_n = DBAPR_n;


// MSIZE1 is always low (GND)
assign MSIZE1_n = 1; // Active-low representation of a constant low signal



endmodule

/*
DESCRIPTION

; 2/1-860LB: BOTH SIDES OF MWRITE EQUATION INVERTED
; 8/1-87JLB: NEW INPUT /MOFF TO DISBLE THE WHOLE MEMORY, BD18 AND BD19 REMOVED.
; 300387 JLB: BLRQ ASSUMED DATA HOLD TIME AFTER TRAILING EDGF OF BAPR !
; CHANGED TO AOK

; 180587 M3202B
; 060687 JLB: SWAPPED BANK1 AND BANK2 TO PROVIDE ENOUGH SPACE FOR PACKAGES.
*/