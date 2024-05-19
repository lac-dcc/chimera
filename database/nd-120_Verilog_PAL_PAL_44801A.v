// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL16R8
// JLB/CJTC 11AUG86
// 44801A,10D, BARB

//  CYCLE CONTROL STATE COUNTER. FAST VERSION (ND-120/CX).

// PAL16R8 FAMILY
// PAL16R6 has 6 flip-flips, 8 inputs, and 2 input OR output (B0 and B1)

// https://rocelec.widen.net/view/pdf/c6dwcslffz/VANTS00080-1.pdf



// PCB 3202D sheet 6:
//
// PAL input signal PD3 is connected to PAL OE_n pin
//     input signal OSC is connectec to PAL CK pin


module PAL_44801A(
    input CK,           // Clock signal                         
    input OE_n,         // OUTPUT ENABLE (active-low) for Q0-Q5 

    input CRQ_n,        // I0 - CRQ_n      
    input IORQ_n,       // I1 - IORQ_n     
    input MR_n,         // I2 - MR_n       
    input BRQ50_n,      // I3 - BRQ50_n    
    input REFRQ50_n,    // I4 - REFRQ50_n  
    input BDRY25_n,     // I5 - BDRY25_n   
    input SEMRQ50_n,    // I6 - SEMRQ50_n  
    input MOFF_n,       // I7 - MOFF_n  (not used)                     
                        
    output SEM_n,       // Q0_n - SEM_n          
    output ACT_n,       // Q1_n - ACT_n (n.c.)   
    output DOREF_n,     // Q2_n - DOREF_n (n.c.) 
    output MEM_n,       // Q3_n - MEM_n (n.c.)   
    output REF_n,       // Q4_n - REF_n          
    output IOD_n,       // Q5_n - IOD_n          
    output GNT_n,       // Q6_n - GNT_n          
    output CACT_n       // Q7_n - CACT_n         

);

// negated input signals
wire CRQ = ~CRQ_n;
wire IORQ = ~IORQ_n;
wire MR = ~MR_n;
wire BRQ50 = ~BRQ50_n;
wire REFRQ50 = ~REFRQ50_n;
wire BDRY25 = ~BDRY25_n;
wire SEMRQ50 = ~SEMRQ50_n;

// Negated reg signals as wires

wire SEM = SEM_reg;
wire DOREF = DOREF_reg;
wire MEM   = MEM_reg;
wire REF  = REF_reg;
wire IOD = IOD_reg;
wire GNT = GNT_reg;
wire CACT = CACT_reg;



// Internal registers
reg SEM_reg;
reg ACT_reg;
reg DOREF_reg;
reg MEM_reg;
reg REF_reg;
reg IOD_reg;
reg GNT_reg;
reg CACT_reg;



//**** Sequential logic triggered on the rising edge of CLK ****
always @(posedge CK) begin       

    // CACT - CPU IS ACTIVE ON THE ND100 BUS
    CACT_reg <=   (CRQ & REFRQ50_n & BRQ50_n & REF_n & GNT_n & SEM_n & BDRY25_n & MR_n)    // 4
                | (CRQ & REFRQ50_n & DOREF_n & REF_n & GNT_n & SEM_n & BDRY25_n & MR_n)    // 2
                | (CACT & BDRY25_n & MR_n)                                                 // HOLD
                | (CRQ & SEM & GNT_n & BDRY25_n & MR_n);                                   // SEMAPHORE

    // REF - REFRESH GRANT ON ND100 BUS
    REF_reg <=   (REFRQ50 & CACT_n & GNT_n & SEM_n & BDRY25_n)                            // 1
               | (REF & BDRY25_n)                                                         // HOLD
               | (REFRQ50 & MR);                                                          // ALWAYS GRANT REFRESH DURING MR

    // GNT - GRANT ND100 BUS TO A DMA DEVICE OR EXTERNAL BUS CONTROLLER
    GNT_reg <=   (BRQ50 & REFRQ50_n & CRQ_n   & REF_n & CACT_n & SEM_n & BDRY25_n & MR_n)  // 3
               | (BRQ50 & REFRQ50_n & DOREF_n & REF_n & CACT_n & SEM_n & BDRY25_n & MR_n)  // 3
               | (GNT & BDRY25_n & MR_n)                                                   // HOLD
               | (BRQ50 & SEM & GNT & MR_n);                                               // SEMAPHORE

    // IOD - IO SIGNAL TO LAST FOR THE ENTIRE BUS CYCLE
    IOD_reg <= (IORQ & CRQ & REFRQ50_n & BRQ50_n & REF_n & GNT_n & SEM_n & BDRY25_n & MR_n)  // 4
             | (IORQ & CRQ & REFRQ50_n & DOREF_n & REF_n & GNT_n & SEM_n & BDRY25_n & ~MR_n) // 2
             | (IOD & BDRY25_n & MR_n)                                                       // HOLD
             | (IORQ & CRQ & SEM & GNT_n & BDRY25_n & MR_n);                                 // SEMAPHORE

    // MEM - MEM SIGNAL TO LAST FOR ENTIRE BUS CYCLE
    // GENERATES BMEM WHICH IS PRESENT ON REFRESH, CPU MEMORY AND DMA CYCLES
    MEM_reg <= (BRQ50 & IORQ_n   & IOD_n & BDRY25_n & MR_n)
             | (BRQ50 & CRQ_n    & IOD_n & BDRY25_n & MR_n)
             | (BRQ50 & DOREF_n  & IOD_n & BDRY25_n & MR_n)
             | (CRQ   & IORQ_n   & IOD_n & BDRY25_n & MR_n)
             | (REFRQ50          & IOD_n & BDRY25_n)
             | (REFRQ50 & MR)
             | (MEM & BDRY25_n & MR_n);

    // SEM - SEMAPHORE GRANT SIGNAL
    SEM_reg <= (SEMRQ50 & MR_n & BDRY25)
             | (SEM & MR_n & ACT_n);

    // ACT - BUS IS ACTIVE
    ACT_reg <= (CACT & BDRY25_n & MR_n)
             | (GNT  & BDRY25_n & MR_n)
             | (REF  & BDRY25_n & MR_n);

    // DOREF - INDICATES THAT LAST BUS CYCLE WAS A REFRESH
    DOREF_reg <= (REF & ~MR & BDRY25)
               | (DOREF & ~MR & ~CACT_n & ~GNT_n & ~REF_n);

end

// Tri-state control for Q outputs
// Assigning outputs with three-state logic controlled by OE_n
assign SEM_n = OE_n ? 1'b0 : ~SEM_reg;
assign ACT_n = OE_n ? 1'b0 : ~ACT_reg;
assign DOREF_n = OE_n ? 1'b0 : ~DOREF_reg;
assign MEM_n = OE_n ? 1'b0 : ~MEM_reg;
assign REF_n = OE_n ? 1'b0 : ~REF_reg;
assign IOD_n = OE_n ? 1'b0 : ~IOD_reg;
assign GNT_n = OE_n ? 1'b0 : ~GNT_reg;
assign CACT_n = OE_n ? 1'b0 : ~CACT_reg;


endmodule

/*

DESCRIPTION

; PRIORITY:
;           1. REFRESH
:           2. CPU REQUEST AFTER A REFRESH
;           3. BUS REQUEST
;           4. CPU REQUEST

; 26/2-87JLB: WRONG HOLD TERM IN IOD.
;
; 180587 M3202B

*/

