// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL16R8
// ADGD 13/8/86
// 44902A,6F,RAMC (RAM CONTROL)

//  RAM CONTROL
//  Sheet 50 of 3202D

// PAL16R8 FAMILY
// PAL16R8 has 8 flip-flips, 8 inputs and 8 outputs (negated from flip-flops with 3-state support)

// https://rocelec.widen.net/view/pdf/c6dwcslffz/VANTS00080-1.pdf



// PCB 3202D sheet 50:
//
// PAL input signal PD3 is connected to PAL OE_n pin
//     input signal OSC is connectec to PAL CK pin

module PAL_44902A(
    input CK,           // Clock signal
    input OE_n,         // OUTPUT ENABLE (active-low) for Q0-Q5

    input RGNT_n,       // I0 - RGNT_n
    //input CGNT_n,       // I1 - CGNT_n (NOT USED!!)
    //input BGNT_n,       // I2 - BGNT_n (NOT USED!!)
    input BDAP50_n,     // I3 - BDAP50_n 
    input MR_n,         // I4 - MR_n 
    input BGNT25_n,     // I5 - BGNT25_n
    input CGNT25_n,     // I6 - CGNT25_n
    input BDRY50_n,     // I7 - BDRY50_n

    output QA_n,        // Q0_n - QA_n (n.c.)
    output QB_n,        // Q1_n - QB_n (n.c.)
    output QC_n,        // Q2_n - QC_n (n.c.)
    output QD_n,        // Q3_n - QD_n
    output RAS,         // Q4_n - RAS
    output CAS,         // Q5_n - CAS
    output LOEN_n,      // Q6_n - LOEN_n
    output HIEN_n       // Q7_n - HIEN_n

    //,output wire [3:0]  Q  // Enable to Debug to watch the value of Q change  
);

// negated input signals (not used signals are commented out)
wire RGNT = ~RGNT_n;       // I0 - RGNT_n
//wire CGNT = ~CGNT_n,       // I1 - CGNT_n
//wire BGNT = ~BGNT_n,       // I2 - BGNT_n 
//wire BDAP50 = ~BDAP50_n,   // I3 - BDAP50_n 
//wire MR = ~MR_n,           // I4 - MR_n 
wire BGNT25 = ~BGNT25_n;   // I5 - BGNT25_n
//wire CGNT25 = ~CGNT25_n,   // I6 - CGNT25_n
//wire BDRY50 = ~BDRY50_n,   // I7 - BDRY50_n


// Internal registers
reg QA_reg;    // Q0_n - QA_n (n.c.)
reg QB_reg;    // Q1_n - QB_n (n.c.)
reg QC_reg;    // Q2_n - QC_n (n.c.)
reg QD_reg;    // Q3_n - QD_n
reg RAS_n_reg; // Q4_n - RAS
reg CAS_n_reg; // Q5_n - CAS
reg LOEN_reg;  // Q6_n - LOEN_n
reg HIEN_reg;  // Q7_n - HIEN_n

// Register signals as wires (to help with the equations) (not used signals are commented out)
wire QA    = QA_reg;
wire QB    = QB_reg; 
wire QC    = QC_reg;
wire QD    = QD_reg;
//wire RAS_n = RAS_n_reg;
//wire CAS_n = CAS_n_reg;
//wire LOEN  = LOEN_reg;
//wire HIEN  = HIEN_reg;



//**** Sequential logic triggered on the rising edge of CLK ****
always @(posedge CK) begin       


// Logic for QA, QB, QC, QD

                                                                //  0)1110 IDLE UNIT NEXT GNT OF ANY TYPE
    QA_reg <=   ( QD_n & QC_n & QB_n & QA   )                   //  1)1010
              | ( QD_n & QC_n & QB_n & QA_n ) 
              | ( QD   & QC_n & QB   & QA   )                   //  2)1011 PAUSE UNTIL BDAP OCCURS (ONLY ON
              | ( QD   & QC_n & QB   & QA_n );
                                                                // NO WAIT STATE ON CPU TO MEMORY WRITE

    QB_reg <=  ( QC   & QB   & QD      )                        // 3) 1001
             | ( QC   & QB   & QD_n    )
             | ( QC   & QB_n & QD      )
             | ( QC   & QB_n & QD_n    )
             | ( QB   & QA_n & QC      )                        // 4) 1000
             | ( QB   & QA_n & QC_n    )
             | ( QD_n & QA             )                        // 5) 0000
             | ( QB   & BGNT25 & BDAP50_n & MR_n & BDRY50_n );  // 6) 0001
                                                                // 7) 0011

    QC_reg <=  ( QD_n & QC   & QB    )                          // 8) 0010
             | ( QD_n & QC   &  QB_n )
             | ( QC   & QB_n & QA    )                          // OTHER STATES WILL GO TO IDLE AFTER 1
             | ( QC   & QB_n & QA_n  )
             | ( QC   & QA   & QD    )
             | ( QC   & QA   & QD_n  )
             | ( QD_n & QB   & QA_n  )
             | ( QC   & RGNT_n & CGNT25_n & BGNT25_n );

    QD_reg <=  ( QC & QD   & QB    )
             | ( QC & QD_n & QB    )
             | ( QC & QD   & QB_n  )
             | ( QC & QD_n & QB_n  )
             | ( QB & QA_n & QC    )
             | ( QB & QA_n & QC_n  )
             | ( QD & QA   & QB    )
             | ( QD & QA   & QB_n  );

// Logic for RAS_n, CAS_n, HIEN_n, LOEN_n (active-low)
    RAS_n_reg <= ( QC   & QA   & QB   )     // RAS=1,2,3,4,5,6
               | ( QC   & QA_n & QB   ) 
               | ( QC   & QA   & QB_n )
               | ( QC   & QA_n & QB_n )
               | ( QD_n & QA   & QD   )
               | ( QD_n & QA   & QD_n )
               | ( QD_n & QB   & QC   )
               | ( QD_n & QB   & QC_n );

    LOEN_reg <= ( QC_n & QB_n & QA_n & QD_n )   // LOEN=3,4,5,6
              | ( QC_n & QB_n & QA_n & QD_n )
              | ( QD   & QC_n & QA   & QB   )
              | ( QD   & QC_n & QA   & QB_n );

    HIEN_reg <=  ( QD   & QB_n & QA_n & QC   )  // HIEN=0,1,2,8
               | ( QD   & QB_n & QA_n & QC_n )
               | ( QD_n & QC_n & QB   & QA   )
               | ( QD_n & QC_n & QB   & QA_n );

     CAS_n_reg <=  ( QB   & QA_n & RGNT_n  )     // CAS=4,5,6,7,8
                 | ( QD   & QB   & RGNT_n  )     // CAS ON REFRESH=1,2,3,4,5
                 | ( QC   & QB_n & QA      )
                 | ( QC   & QB_n & QA_n    ) 
                 | ( QC   & QA & QD        )
                 | ( QC   & QA & QD_n      )
                 | ( QD_n & RGNT           );

    

end

// Tri-state control for Q outputs
// Assigning outputs with three-state logic controlled by OE_n

assign QA_n   = OE_n ? 1'b0 : ~QA_reg;    // Q0_n 
assign QB_n   = OE_n ? 1'b0 : ~QB_reg;    // Q1_n 
assign QC_n   = OE_n ? 1'b0 : ~QC_reg;    // Q2_n 
assign QD_n   = OE_n ? 1'b0 : ~QD_reg;    // Q3_n 
assign RAS    = OE_n ? 1'b0 : ~RAS_n_reg; // Q4_n 
assign CAS    = OE_n ? 1'b0 : ~CAS_n_reg; // Q5_n 
assign LOEN_n = OE_n ? 1'b0 : ~LOEN_reg;  // Q6_n
assign HIEN_n = OE_n ? 1'b0 : ~HIEN_reg;  // Q7_n

// Debugging, if you want to se the 4-bit value of Q easier
//assign Q = {QD, QC, QB, QA};

endmodule

/*

DESCRIPTION

; 190387 JLB: RAS & CAS INVERTED.
; 190387 JLB: BGNT25 NEW INPUT. USED TO DELAY STATE MACHINE TURN ON 25NS ON
; BUS CYCLES.
; 230387 CJTC: CGNT25 NEW INPUT. USED TO DELAY STATE MACHINE TURN ON 25NS ON
; CPU CYCLES.
; 020487 JLB: BDRY50 WILL GET US OUT OF THE WAIT STATE ON TIMEOUT.
; 180587 M3202B
; 060887 JLB: MAXIMIZE EQUATIONS WITH INTERNAL FEEDBACK TO MATCH CLOCK SKEW.

*/

