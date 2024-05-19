// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/STOC                                                              **
** IDB TO CD                                                             **
** SHEET 35 of 50                                                        **
**                                                                       ** 
** Last reviewed: 13-JAN-2024                                            **
** Ronny Hansen                                                          **               
***************************************************************************/

module CPU_STOC_35( 
                  input wire [15:0] IDB_15_0,
                  output wire [15:0] CD_15_0,                  
                  input wire STOC_n );

assign CD_15_0 = STOC_n ? 16'b0 : IDB_15_0; // If STOC_n is high, output is high-impedance

endmodule
