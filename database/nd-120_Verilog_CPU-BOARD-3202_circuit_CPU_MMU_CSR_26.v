// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/MMU/CSR                                                           **
** CACHE STATUS REGISER                                                  **
** SHEET 26 of 50                                                        **
**                                                                       ** 
** Last reviewed: 19-FEB-2024                                            **
** Ronny Hansen                                                          **
***************************************************************************/
module CPU_MMU_CSR_26(
   input STP,
   input EMPID_n,
   input EDO_n,
   input LCS_n,
   input PD2, // OE1_1G_n

   input CUP,
   input CON,   
   input ECSR_n, // OE2_2G_n

   output       BSTP,
   output       BEMPID_n,
   output       BEDO_n,   
   output       BLCS_n,
   
   output [3:0] IDB_3_0
);



// This code replaces one 74244 (CHIP 27H)
// 74LS244 (NONE negated outputs)
// Octal Buffers and Line Drivers With 3-State Outputs


  assign BSTP = PD2 ? 1'b0 : STP;
  assign BEMPID_n = PD2 ? 1'b0 : EMPID_n;
  assign BEDO_n = PD2 ? 1'b0 : EDO_n;
  assign BLCS_n = PD2 ? 1'b0 : LCS_n;

  wire [3:0] idb = {1'b1, ~CON, CON, CUP};   

  assign IDB_3_0 = ECSR_n ? 4'b0 : idb;

endmodule
