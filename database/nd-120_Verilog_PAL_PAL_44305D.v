// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL 44305D - CSCTL - CONTROL STORE CONTROL 

module PAL_44305D(
    input FORM_n, CC1_n, CC2_n, CC3_n, LCS_n, RWCS_n, WCS_n, FETCH, BRK_n, LUA12, WCA_n, TERM_n,
    output WICA_n, WCSTB_n, ECSL_n, EWCA_n, EUPP_n, ELOW_n
);

// Inverted input signals for active-high usage
wire FORM = ~FORM_n;
wire CC1 = ~CC1_n;
wire CC2 = ~CC2_n;
wire CC3 = ~CC3_n;
wire LCS = ~LCS_n;
wire RWCS = ~RWCS_n;
wire WCS = ~WCS_n;
wire BRK = ~BRK_n;
wire WCA = ~WCA_n;
wire TERM = ~TERM_n;

wire FETCH_n = ~FETCH;
wire LUA12_n =~ LUA12;

// Logic for WICA_n (active-low)
assign WICA_n = ~(WCA & FETCH & TERM_n); // WRITE PULSE TO MICROINSTRUCTION CACHE

// Logic for WCSTB_n (active-low)
assign WCSTB_n = ~((CC3_n & CC2 & CC1 & WCS & RWCS) |     // e+f WRITE PULSE TO WRITEABLE
                   (CC3 & CC2_n & CC1 & LCS));            // m+n WRITE PULSE DURING LOAD CONTROL

// Logic for ECSL_n (active-low)
assign ECSL_n = ~((RWCS & WCS_n & CC3 & TERM_n) |         // READ CONTROL STORE HOLD
                  (RWCS & WCS_n & CC1_n & CC2 & TERM_n)); // HOLD OVERLAP WITH EWCA_n

// Logic for EWCA_n (active-low)
assign EWCA_n = ~((RWCS & CC3_n & CC2 & TERM_n) |      // ENABLE WCA REG. IN MIC ONTO MA
                  (RWCS & CC3_n & CC1 & TERM_n));      // AVOID BLIP ON NEXT CYCLE

// Logic for EUPP_n (active-low)
assign EUPP_n = ~(LUA12 |                            // NORMAL ADDRESSING
                  (WCA & FETCH) |                    // WRITE INTO MICROINSTRUCTION CACHE
                  (FETCH & CC1_n & CC2_n & CC3_n & TERM_n)); // ENABLE IN THE FIRST 50NS + HOLD TIME = 7SNS

// Logic for ELOW_n (active-low)
assign ELOW_n = ~((LUA12_n & FETCH_n) |                   // NORMAL ADDRESSING. ON FETCH EITHER MI
                  (LUA12_n & TERM) |                      // ENABLE ACCORDING TO LUA12 BEFORE FETCH
                  (FORM & BRK_n & CC2 & TERM_n) |         // OR A MAP IS USED.
                  (FORM & BRK_n & CC3 & TERM_n) |         // DO A MAP
                  (LUA12_n & BRK & CC2 & TERM_n) |        // ON BRK: USE BANK SELECTED BY LUA12.
                  (LUA12_n & BRK & CC3 & TERM_n));        // 

endmodule

/*
DESCRIPTION

; 130387 JLB: ELOW ALWAYS ENABLED ON TERM IF LUA12 IS LOW.
; MAY SPEED UP NON FETCH CYCLES.

; 180587 3202B
; 090687 JLB: EWCA MUST NOT BE ENABLED DURING a AND b. WILL CREATE BLIP ON
; NEXT CYCLE.
; 090687 JLB: ECSL HOLD IN g AND h.
; 030987 JLB: WRITE IN CONTROL STORE DOES NOT WORK. WRITE PULSE STARTS TOO
; SOON. WCSTB CHANGED TO e+f IN THIS CASE, AND TO m+n DURING LCS
; TO BE ABLE TO USE 250ns PROMS.


*/