// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL16L8
// JLB 26NOV86
// 44307C,13D,CYCLK


// 10 Bit input signals (I0-I9)
// 

//   /TERM /CC0 /CC1 /CC2 /CC3 /FORM /BRK /RWCS /TRAP GND
//   VEX /MACLK /MAP /ETRAP UCLK /EORF CYD WRFSTB /MCLK VCC

module PAL_44307C(
    input TERM_n,    // I0
    input CC0_n,     // I1
    input CC1_n,     // I2
    input CC2_n,     // I3
    input CC3_n,     // I4
    input FORM_n,    // I5
    input BRK_n,     // I6
    input RWCS_n,    // I7
    input TRAP_n,    // I8
    input VEX,       // I9

    output MCLK_n,   // Y0_n - MCLK_n
    output MACLK_n,  // Y1_n - MACLK_n
    output WRFSTB,   // B0_n - WRFSTB
    output CYD,      // B1_n - CYD_n
    output EORF_n,   // B2_n - EORF_n
    output UCLK,     // B3_n - UCLK
    output ETRAP_n,  // B4_n - MAP_n
    output MAP_n     // B5_n - MAP_n        
);


// Creating non-negated wires for active-low inputs
wire TERM = ~TERM_n;
wire CC0 = ~CC0_n;
wire CC1 = ~CC1_n;
wire CC2 = ~CC2_n;
wire CC3 = ~CC3_n;
wire FORM = ~FORM_n;
wire RWCS = ~RWCS_n;
wire TRAP = ~TRAP_n;
wire MAP = ~MAP_n;
wire VEX_n = ~VEX;

// Logic for MCLK
assign MCLK_n = ~(
                   (RWCS & CC3_n) |  // BECAUSE THE CONTROL STORE ADDRESS TO B
                   (RWCS & CC2)      // IN PRESENTED ONTO MA. THEN THE ADDRESS
);                                  // STORE LOCATION TO BE EXECUTED IS PRESE

// Logic for WRFSTB
assign WRFSTB = ~(CC3 | CC2 | CC1 | CC0_n | TERM); // b ON 75NS CYCLES TO PROVIDE A WRITE PU

// Logic for CYD_n (active-low)
assign CYD = ~( 
                  (CC3)         | // d + e + f WRITE PULSE USED IN WMAP AND WCA
                  (CC1_n)       | 
                  (CC2_n & CC0) |
                  (TERM)
); 

// Logic for EORF
assign EORF_n = ~(CC3_n & CC2_n & CC1 & CC0_n & TERM_n); // d MISC WRITE PULSE.

// Logic for UCLK_n (active-low)
assign UCLK = ~(
                 (CC3)   | // ON c ON ALL MEMORY REQUESTS.
                 (CC2)   | // USED TO UPDATE USED BITS AND CLOCK TRA
                 (CC1_n) |
                 (CC0_n) |
                 (TERM)
); 

// Logic for MAP
assign MAP_n = ~(FORM & BRK_n & CC2 & TERM_n); // MUST NOT COME BEFORE ALL SHORT CYCLES

// Logic for MACLK
assign MACLK_n = ~(
                    (MAP & CC3_n & CC2 & CC1)    |   // e+f CAPTURE CD FROM MEMORY THROUGH M
                    (TRAP & CC3_n & CC1 & CC0_n) |   // d+e CAPTURE TRAP VECTOR
                    (RWCS & CC3_n)               |   //     CAPTURE MICROADDRESS AFTER EWCA
                    (RWCS & CC2 & CC1_n)             //     TURNED OFF
);

// Logic for ETRAP_n (active-low)
assign ETRAP_n = ~(
                    (TERM_n & VEX_n & CC3)  |   // ENABLE TRAPS ONLY OUTSIDE t OR a
                    (TERM_n & VEX_n & CC2)  |   // UNSTABLE TRAP IN THIS PERIOD
                    (TERM_n & VEX_n & CC1)  |   // CAN DESTROY MA !
                    (TERM_n & VEX_n & CC0)      // DISABLE TRAPS DURING VEX
                  );

endmodule


/*

DESCRIPTION

;280287 JLB: ECREQ TO LOCAL MEMORY GIVES TWO CGNTS. A SHORTER EORF.
; I.E. ONLY ON e AND NOT ON f, WILL MAKE ECREQ GO OFF 25NS SOONER
;AND HOPEFULLY CURE THIS.
;010387 JLB: ETRAP NEW OUTPUT. WILL DISABLE TRAP ON t AND a.
;080387 JLB: REMOVED UCLK ON CACHE HIT CYCLES.
;160387 JLB: REMOVED TERM IN MCLK AND MACLK TO PROVIDE SYMMETRICAL
;            CLOCKS IN 50 NS CYCLES.
;170387 JLB/CJTC: REMOVED MREQ - NEEDED THE INPUT FOR NEW SIGNAL VEX.
;            VEX SHOULD DISABLE TRAPS.
;180387 JLB: EORF ON d ONLY. MACLK ON e + f ON MAP.
;
; 270487 : M3202B
;B 300687 JLB: CYD POSITIVE POLARITY.
;C 130787 JLB: CYD FROM d TO f.

*/
