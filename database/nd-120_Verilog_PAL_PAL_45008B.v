// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL16L8
// ADGD 18/8/86
// 45008B, 2F, DATA


// PCB 3202D sheet 46:
//

// PAL 16L8
// 10 INPUT only pins (I0-I9)
// 2 OUT only pins (Y0-Y1) and 6 IN or OUT pins (B0-B5)
//
// PAL16RL8 (https://rocelec.widen.net/view/pdf/c6dwcslffz/VANTS00080-1.pdf)


module PAL_45008B(

    input MWRITE_n,           // I0 - MWRITE_n
    input SWDIS_n,            // I1 - SWDIS_n
    input LBD0,               // I2 - LBD0
    input LBD1,               // I3 - LBD1
    input LBD3,               // I4 - LBD3
    input LBD4,               // I5 - LBD4
    input BIOXL_n,            // I6 - BIOXL_n
    input ECCR,               // I7 - ECCR
    input BCGNT50R_n,         // I8 - BCGNT50R_n
    // input HIEN_n,             // I9 - EPEA_n  (NOT USED!)


    output DIS_n,             // Y0_n (OUT Only)
    output OER_n,             // Y1_n (OUT ONLY)
    
    output OET_n,             // B0_n - OET_n
    output CLRERR_n,          // B1_n - CLRERR_n
    output DISB_n,            // B2_n - DISB_n (n.c.)
    output TST_n,             // B3_n - TST_n (n.c)
    input  QD_n,              // B4_n - PD3
    input  MR_n               // B5_n - MR_n
);                        


// Creating non-negated wires for active-low inputs
 wire MWRITE = ~MWRITE_n;
 wire SWDIS = ~SWDIS_n;
 //wire LBD0_n = ~LBD0;
 //wire LBD1_n = ~LBD1;
 //wire LBD3_n = ~LBD3;
 //wire LBD4_n = ~LBD4;
 wire BIOXL = ~BIOXL_n;
 wire ECCR_n = ~ECCR;
 wire BCGNT50R = ~BCGNT50R_n;
 //wire HIEN = ~HIEN_n;
 wire QD = ~QD_n;
 wire MR = ~MR_n;


// ON WRITE TO MEMORY
assign OET_n = ~(MWRITE);

// ON READ FROM MEMORY AFTER THE ADDRESS PE
// ON WRITE IN TEST MODE BOTH OER AND OET S
assign OER_n = ~(
                   (BCGNT50R)
                 | (TST & MWRITE) 
);


// CLEAR PARITY ERROR ON MR, READING EPESL
assign CLRERR_n = ~(  
                      MR 
                    | BCGNT50R_n 
                    | DISB 
                    | QD
);


// DIS logic
assign DIS_n = ~(
                    DISB 
                  | SWDIS
);

reg DISB_reg;
reg TST_reg;
wire TST = TST_reg;
wire DISB = DISB_reg;


always @(*) begin

    // SET IF LDB3=1 AND IOX=ECCR    
    if ((LBD3 & BIOXL & ECCR)==1)
        DISB_reg = 1'b1;
    else if (((MR_n & BIOXL_n)==0) | ((MR_n & ECCR_n)) == 0) // HOLD UNTIL NEXT IOX=ECCR
        DISB_reg = 1'b0;

    // SET IF ANY OF LBD0,1,4 AND IOX=ECCR    
    if ( ((LBD0 & BIOXL & ECCR)==1) | ((LBD1 & BIOXL & ECCR)== 1) | ((LBD4 & BIOXL & ECCR)==1) )
        TST_reg = 1'b1;
    else if ( ((MR_n & BIOXL)==0) | ((MR_n & ECCR_n)==0) ) // HOLD UNTIL NEXT IOX=ECCR
        TST_reg = 1'b0;

end


assign DISB_n = ~DISB_reg;
assign TST_n = ~TST_reg;

endmodule



/*


DESCRIPTION

; 200387 CJTC: LOGICAL ERRORS IN EQUATIONS FOR DISB AND TST
; 260387 CJTC: CHANGED PIN 2 /EPESL TO /EPEAL - CIRCUIT CHANGE ONLY!!!
; 260387 JLB: CLRERR COMES IMMEDIATELY TO MAKE PERR0&1 PULSES ONLY!!!

; 180587 M3202B
; 091087 B CJTC: AM29833 ARE GIVING ERROR OUTPUT EVEN BEFORE CLOCKED.
;                QD GOES INACTIVE ON 6, JUST BEFORE RDATA THUS STOPPING
;   

*/