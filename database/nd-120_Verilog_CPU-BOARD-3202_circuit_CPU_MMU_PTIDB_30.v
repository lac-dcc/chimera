// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/MMU/PTIDB                                                         **
** PT TO IDB                                                             **
** SHEET 30 of 50                                                        **
**                                                                       ** 
** Last reviewed: 11-FEB-2024                                            **
** Ronny Hansen                                                          **
***************************************************************************/

// verilator lint_off ASSIGNDLY

module CPU_MMU_PTIDB_30( 
                        input  [15:0] IDB_15_0_IN,       // IDB in and
                        output [15:0] IDB_15_0_OUT,      //             out

                        inout  [15:0] PT_15_0_IN,         //PT data bus  (B) in and out
                        output [15:0] PT_15_0_OUT,        // 

                        input WRITE,                // Direction: 0=Read from B,1=Write to B  (DIR)
                        input EPTI_n                // Enable PTI(negated)        (OE_n)                                    
                        );

// This code replaces the original Logisim generated code with a simpler and more efficient implementation
// It replaces two 74PCT245 chips (8-bit transceiver with 3-state outputs) with one 16 bit identical implementation.

reg OE_n;
reg DIR;

reg [15:0] A_reg;
reg [15:0] B_reg;

always @* begin
   OE_n = EPTI_n;
   DIR =  WRITE;

   A_reg = IDB_15_0_IN;
   B_reg = PT_15_0_IN;
end

// Drive logic for IDB_15_0 and PT_15_0

// Set IDB to B value IF DIR=0 (read) else to 3-state
assign IDB_15_0_OUT =  OE_n ? 16'b0 : !DIR ? B_reg : 16'b0;

// Set PT to A value IF DIR=1 (write) else to 3-state
assign PT_15_0_OUT = OE_n ? 16'b0 : DIR ? A_reg : 16'b0;

endmodule
