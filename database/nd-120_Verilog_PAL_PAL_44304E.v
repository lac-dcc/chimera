// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// PAL16L8
// CJTC 02SEP86
// 44304E,1C,LBC3 - LOCAL DATA BUS CONTROL PAL


// Note: Verilator doesnt like signal name "EBADR" therefore its named "EBADR_b1". I dont know why.

// Note2: TEST is connectecd to signal PD3 that is always 0 on the PCB 3202D.

module PAL_44304E(
    input CGNT_n,       // I0                  
    input BGNT_n,       // I1                  
    input BGNT50_n,     // I2                  
    input MWRITE_n,     // I3                  
    input BDAP50_n,     // I4                  
    input EBUS_n,       // I5                  
    input IBAPR_n,      // I6                  
    input GNT_n,        // I7                  
    input TEST,         // I8 - PD3            
    //input I9          // I9                  
                        
    output DBAPR,       // Y0_n  
    //output Y1_n,      // Y1_n  
              
    output BACT_n,      // B0_n 
    output EBADR_b1,    // B1_n 
    output FAPR,        // B2_n 
    output SAPR,        // B3_n 
    output CLKBD,       // B4_n 
    output EBD_n        // B5_n         
);



// Inverted input signals
wire BGNT = ~BGNT_n;
wire BGNT50 = ~BGNT50_n;
wire BDAP50 = ~BDAP50_n;
wire EBUS = ~EBUS_n;	


// Output signal logic (self reference)

reg BACT_reg;
reg EBADR_reg;

always @(*) begin
      if (!TEST) begin

            // BACT - BUS ACTIVITY. LASTS FOR COMPLETE DMA TO LOCAL MEMORY
            // CYCLE (ONLY ON MEMORY READ)

            if (BGNT50 & MWRITE_n)        // Enable for data only after address
                BACT_reg = 1'b1;              
            else if (BDAP50 ==0)        // Hold after BDAP finished
                BACT_reg = 1'b0;

                
            // EBADR - ENABLE ADDRESS FROM BUS TO LOCAL MEMORY
            if ((GNT_n & BGNT_n)==1)     // TURN ON AT BAPR WITH GNT
                EBADR_reg = 1'b1;
            else if (
                    (IBAPR_n == 0) | // HOLD UNTIL BGNT AND GNT BOTH GONE                    
                    (GNT_n == 0)
            )
                EBADR_reg = 1'b0;

        end else begin
            BACT_reg = 1'b0;
            EBADR_reg = 1'b0;
        end
end


assign EBADR_b1 = EBADR_reg;

assign BACT_n = ~BACT_reg; // Output pin Y1_n (BACT_n) is not connected to anything. Sheet 12.



// EBD - ENABLE BUS DATA. ENABLE LBD TO BD TRANSCEIVER
// SHOULD BE DISABLED DURING CGNT * /BACT, IE DISABLE WHEN CPU
// IS ACCESSING LOCAL MEMORY, EXCEPT WHEN TRANSCEIVER IS BEING USED
// AS A REGISTER TO HOLD DATA FROM A PREVIOUS DMA MEMORY READ.

assign EBD_n =~(TEST ? 1'b0 :        
                            (EBUS & CGNT_n & GNT_n) |
                            (EBUS & BGNT) |
                            (EBUS & BACT_reg)
                );


// SLOW INVERSION
assign FAPR = ~(TEST ? 1'b0 : IBAPR_n);
assign SAPR = ~(TEST ? 1'b0 : ~FAPR); 
assign DBAPR = ~(TEST ? 1'b0 : ~SAPR);

    
// CLKBD - CLOCK PULSE TO 648's
assign CLKBD = TEST ? 1'b0 : 
                            
                            ~(
                                    (~SAPR & BGNT50_n) |    // Clock addresses on delayed BAPR
                                    (~SAPR & BDAP50_n) |    // Clock data 50ns after start of
                                    (~SAPR & MWRITE_n)     // BGNT * BDAP on memory writes from DMA
                            );



endmodule

/*

DESCRIPTION

; 200387 CJTC:      NEED TO SLOW DOWN APR TO AS648 BUS TCVRS. PUT IT
;                   THROUGH THIS PAL INSTEAD OF F04
; 200387 JLB:       EBADR COMES ON AT BAPR TO AVOID SPIKE ON LBD.
; NEW INPUT CGNT
; 230387 JLB:       APR DELAYED 3XPAL DELAY
; 240387 JLB:       EBD MUST NOT CHANGE WHEN DATA IS CLOCKED IN.
;
; 180587 - 3202B
; 310787 JLB:       BUFFERED DMA WRITE: CLOCK DATA IN 648'S ALSO.

; 040887 JLB:       BUFFERED DMA WRITE: NEED TO ENABLE THE REGISTER IN THE
;                   648'S FOR THE PERIOD OF BGNT.
; 060887 D JLB:     EBADR CHANGED TO MAKE BUFFERED DMA WRITE WORK.
; 090887 E JLB:     TEST MODE FOR C-PRINT.
*/