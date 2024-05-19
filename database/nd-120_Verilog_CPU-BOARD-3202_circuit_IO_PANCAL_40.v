// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** IO/PANCAL                                                             **
** PANEL PROC & CALENDAR                                                 **
** SHEET 40 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

// Statis: Module not working.
// TODO: Implement logic for the MC68705 - 6805 Embedded CPU and the MM58274  - Real Time Clock

module IO_PANCAL_40(
   // Input signals
   input       CLEAR_n,
   input       EMP_n,
   input       EPANS,
   input       FUL_n,
   input       IONI,
   input       LEV0,
   input       LHIT,
   input       PANOSC,
   input [7:0] PA_7_0,
   input [1:0] PCR_1_0,
   input       PONI,
   input       VAL,

   // Output and Input signals
   input  [15:0] IDB_15_0_IN,
   output [15:0] IDB_15_0_OUT,

   // Output signals
   output [4:0]  DP_5_1_n,  
   output        RMM_n,
   output [1:0]  STAT_4_3               
);

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/


   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [4:0]  s_dp_5_1_n;
   wire [4:0]  s_ground_bus;
   wire [3:0]  s_bus_4_bit;
   wire [1:0]  s_stat_4_3;
   wire [1:0]  s_pcr_1_0;
   wire [15:0] s_idb_15_0_out;
   wire [7:0]  s_pa_7_0;
   wire        s_ful_n;
   wire        s_clear_n;
   wire        s_poni;
   wire        s_val;
   wire        s_epans;
   wire        s_ioni;
   wire        s_lhit;
   wire        s_lev0;
   wire        s_emp_n;
   wire        s_panos;
   wire        s_ck;
   wire        s_rmm_n;
   wire [7:0]  s_idb_7_0_chip32_out;
   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_pcr_1_0         = PCR_1_0;
   assign s_pa_7_0          = PA_7_0;
   assign s_ful_n           = FUL_n;
   assign s_clear_n         = CLEAR_n;
   assign s_poni            = PONI;
   assign s_val             = VAL;
   assign s_epans           = EPANS;
   assign s_ioni            = IONI;
   assign s_lhit            = LHIT;
   assign s_lev0            = LEV0;
   assign s_emp_n           = EMP_n;
   assign s_panos           = PANOSC;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign DP_5_1_n         = s_dp_5_1_n;
   assign IDB_15_0_OUT     = s_idb_15_0_out;
   assign RMM_n            = s_rmm_n;
   assign STAT_4_3         = s_stat_4_3;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign s_ground_bus = 5'b00000;

   // NOT Gate
   assign s_dp_5_1_n = ~s_ground_bus; // Signals coming from 68705 - add in logic later

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   wire s_wmm_n;
   assign s_wmm_n = 0;
 
   // TTL_74374 CHIP_32B
   TTL_74374 CHIP_32B(
      .CK(s_wmm_n), // from 68705
      .OE_n(s_epans),
      .D(s_pa_7_0),
      .Q(s_idb_7_0_chip32_out)
   );


   //assign s_idb_15_0_out[15:8] = s_epans ? 8'b0 : s_pres, s_ful_n, s_read, s_val, s_stat3_, s_stat2, s_stat1, s_stat0};    // Add in when 68705 is implemented
   assign s_idb_15_0_out[15:0] = s_epans ? 8'b0 : s_idb_7_0_chip32_out;



// TODO:
// ADD - MM58274  - Real Time Clock
// ADD - MC68705 - 6805 Embedded CPU

   
endmodule
