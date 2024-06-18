// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** IO/DCD                                                                **
** IO DECODING                                                           **
** SHEET 38 of 50                                                        **
**                                                                       ** 
** Last reviewed: 21-APRIL-2024                                          **
** Ronny Hansen                                                          **               
***************************************************************************/

module IO_DCD_38( 
   input sysclk,      // System clock in FPGA
   input sys_rst_n,   // System reset in FPGA

   input       BDRY50_n,
   input       BRK_n,
   input       CLK,
   input [4:0] CSCOMM_4_0,
   input [4:0] CSIDBS_4_0,
   input [1:0] CSMIS_1_0,
   input       DAP_n,
   input       EORF_n,
   input       HIT,
   input       ICONTIN_n,
   

   input       ILOAD_n,
   input       ISTOP_n,
   input       LCS_n,
   input       LSHADOW,
   input [1:0] OC_1_0,
   input       OPCLCS,
   input       OSCCL_n,
   input       PONI,
   input       POWSENSE_n,
   input       REF_n,
   input       RMM_n,
   input       SEL5MS_n,
   input [1:0] STAT_4_3,
   input       SWMCL_n,
   input       UCLK,
   input       XTAL1,
   input       XTAL2,

   input  [7:0] IDB_7_0_IN,
   output [7:0] IDB_7_0_OUT,


   output       CA10,
   output       CCLR_n,
   output       CEUART_n,
   output       CLEAR_n,
   output       DT_n,
   output       DVACC_n,
   output       ECREQ,
   output       ECSR_n,
   output       EDO_n,
   output       EIOR_n,
   output       EMPID_n,
   output       EMP_n,
   output       EPANS_n,
   output       ESTOF_n,
   output       FETCH,
   output       FMISS,
   output       FORM_n,
   output       FUL_n,
   output       IORQ_n,
   output       LHIT,
   output       MCL,
   output       MREQ_n,
   output       OSC,
   output       PANOSC,
   output       PAN_n,
   output [7:0] PA_7_0,
   output       PA_n,
   output       POWFAIL_n,
   output       PPOSC,
   output       PS_n,
   output       REFRQ_n,
   output       RINR_n,
   output       RT_n,
   output       RUART_n,
   output       RWCS_n,  // (NOT CONNECTED IN SHEET 39) - find signal from one of the PAL's ??
   output       SHORT_n,
   output       SIOC_n,
   output       SLOW_n,
   output       SSEMA_n,
   output       STOC_n,
   output       STP,
   output       TOUT,
   output       TRAALD_n,
   output       VAL,
   output       WCHIM_n,
   output       WRITE,
   output       EPAN_n // Signal on the DGA chip (not connected in sheet 39). Maybe replaced by a PAL signal ?                  
);

   
   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [1:0] s_csmis_1_0;
   wire [1:0] s_oc_1_0;
   wire [1:0] s_stat_4_3;
   wire [3:0] s_dga_idb_3_0_out;
   wire [4:0] s_cscomm_4_0;
   wire [4:0] s_csidbs_4_0;
   wire [7:0] s_IDB_7_0_in;
   wire [7:0] s_IDB_7_0_out;
   wire [7:0] s_pa_7_0;

   wire       s_bdry50_n;
   wire       s_brk_n;
   wire       s_ca10;
   wire       s_cclr_n;
   wire       s_ceuart_n;
   wire       s_clear_n;
   wire       s_clk; // bus IOTIM B
   wire       s_closc;
   wire       s_dap_n;
   wire       s_div_16;
   wire       s_dt_n;
   wire       s_dvacc_n;
   wire       s_ecreq;
   wire       s_ecsr_n;
   wire       s_edo_n;
   wire       s_eior_n;
   wire       s_emp_n;   
   wire       s_empid_n;
   wire       s_eorf_n;
   wire       s_epan_n;
   wire       s_epans_n;
   wire       s_estof_n;
   wire       s_fetch;
   wire       s_fmiss;
   wire       s_form_n;
   wire       s_ful_n;
   wire       s_gated_swmcl_n;
   wire       s_hit;
   wire       s_icontin_n;
   wire       s_iload_n;
   wire       s_ioreq_n;
   wire       s_istop_n;   
   wire       s_lcs_n;
   wire       s_lhit;
   wire       s_lshadow;
   wire       s_mcl;
   wire       s_mreq_n;
   wire       s_oc0_n;
   wire       s_oc0;
   wire       s_oc1_and_xtal2_n;
   wire       s_oc1;
   wire       s_opclcs;
   wire       s_osc_inp1;
   wire       s_osc_inp2;
   wire       s_osc;
   wire       s_oscccl_n;
   wire       s_pa_n;
   wire       s_pan_n;
   wire       s_panosc;
   wire       s_poni;
   wire       s_power_on_zener;
   wire       s_powfail_n;
   wire       s_powsense_n;
   wire       s_powsense;
   wire       s_pposc;
   wire       s_ps_n;
   wire       s_pwcl;
   wire       s_ref_n;
   wire       s_refrq_n;
   wire       s_rinr_n;
   wire       s_rmm_n;
   wire       s_rt_n;
   wire       s_ruart_n;
   wire       s_rwcs_n;
   wire       s_sel5ms_n;
   wire       s_short_n;
   wire       s_sioc_n;
   wire       s_slow_n;
   wire       s_ssema_n;
   wire       s_stoc_n;
   wire       s_stp;
   wire       s_swmcl_n;
   wire       s_tout;
   wire       s_traald_n;
   wire       s_uclk;
   wire       s_val;
   wire       s_wchim_n;
   wire       s_write;
   wire       s_XRTOSC;
   wire       s_XTAL1;
   wire       s_XTAL2;
   


   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/

   // BUS signals
   assign s_csmis_1_0[1:0]    = CSMIS_1_0;
   assign s_stat_4_3[1:0]     = STAT_4_3;
   assign s_csidbs_4_0[4:0]   = CSIDBS_4_0;
   assign s_cscomm_4_0[4:0]   = CSCOMM_4_0;      
   assign s_oc_1_0[1:0]       = OC_1_0;
   assign s_IDB_7_0_in[7:0]   = IDB_7_0_IN[7:0];

   // Signals
   assign s_bdry50_n          = BDRY50_n;
   assign s_brk_n             = BRK_n;
   assign s_clk               = CLK;
   assign s_dap_n             = DAP_n;
   assign s_eorf_n            = EORF_n;
   assign s_hit               = HIT;
   assign s_icontin_n         = ICONTIN_n;
   assign s_iload_n           = ILOAD_n;
   assign s_istop_n           = ISTOP_n;
   assign s_lcs_n             = LCS_n;
   assign s_lshadow           = LSHADOW;
   assign s_opclcs            = OPCLCS;
   assign s_oscccl_n          = OSCCL_n;
   assign s_poni              = PONI;
   assign s_powsense_n        = POWSENSE_n;
   assign s_ref_n             = REF_n;
   assign s_rmm_n             = RMM_n;
   assign s_sel5ms_n          = SEL5MS_n;
   assign s_swmcl_n           = SWMCL_n; // Software Master Clear (MCL) negated
   assign s_uclk              = UCLK;
   assign s_XTAL1             = XTAL1;
   assign s_XTAL2             = XTAL2;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign CA10      = s_ca10;
   assign CCLR_n    = s_cclr_n;
   assign CEUART_n  = s_ceuart_n;
   assign CLEAR_n   = s_clear_n;
   assign DT_n      = s_dt_n;
   assign DVACC_n   = s_dvacc_n;
   assign ECREQ     = s_ecreq;
   assign ECSR_n    = s_ecsr_n;
   assign EDO_n     = s_edo_n;
   assign EIOR_n    = s_eior_n;
   assign EMP_n     = s_emp_n;
   assign EMPID_n   = s_empid_n;
   assign EPAN_n    = s_epan_n;
   assign EPANS_n   = s_epans_n;
   assign ESTOF_n   = s_estof_n;
   assign FETCH     = s_fetch;
   assign FMISS     = s_fmiss;
   assign FORM_n    = s_form_n;
   assign FUL_n     = s_ful_n;
   assign IORQ_n    = s_ioreq_n;
   assign LHIT      = s_lhit;
   assign MCL       = s_mcl;
   assign MREQ_n    = s_mreq_n;
   assign OSC       = s_osc;
   assign PA_7_0    = s_pa_7_0[7:0];
   assign PA_n      = s_pa_n;
   assign PAN_n     = s_pan_n;
   assign PANOSC    = s_panosc;
   assign POWFAIL_n = s_powfail_n;
   assign PPOSC     = s_pposc;
   assign PS_n      = s_ps_n;
   assign REFRQ_n   = s_refrq_n;
   assign RINR_n    = s_rinr_n;
   assign RT_n      = s_rt_n;
   assign RUART_n   = s_ruart_n;
   assign RWCS_n    = s_rwcs_n;
   assign SHORT_n   = s_short_n;
   assign SIOC_n    = s_sioc_n;
   assign SLOW_n    = s_slow_n;
   assign SSEMA_n   = s_ssema_n;
   assign STOC_n    = s_stoc_n;
   assign STP       = s_stp;
   assign TOUT      = s_tout;
   assign TRAALD_n  = s_traald_n;
   assign VAL       = s_val;
   assign WCHIM_n   = s_wchim_n;
   assign WRITE     = s_write;
   

   // IDB[7:0] out = IDB[7:0] in (Except if EPAN_n is low, then IDB out is the IDB 3-0 from the DGA chip)

   // Assign the upper 4 bits directly from the input to the output
   assign s_IDB_7_0_out[7:4] = s_IDB_7_0_in[7:4];

   // Conditionally assign the lower 4 bits based on the state of EPAN_n
   assign s_IDB_7_0_out[3:0] = s_epan_n ? s_IDB_7_0_in[3:0] : s_dga_idb_3_0_out[3:0];

   // Connect the intermediate signal to the final output
   assign IDB_7_0_OUT = s_IDB_7_0_out;


   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Power-on-zener  (schematic shows a zener diode circuit, that after anlysis needs 10ms to go from 0V to 3.3V - based on the 10nF capacitor and 1k resistor)
   // Needs 10ms to go from 0V to 3.3V - or ~400 clock cyles at 40MHz
   
   assign  s_power_on_zener  =  regPowerOnClear;


   // NOT Gate
   assign s_powsense = ~s_powsense_n;

   // OC 0 and 1
   assign s_oc0   = s_oc_1_0[0];
   assign s_oc0_n = ~s_oc0;
   assign s_oc1   = s_oc_1_0[1];
   
   
   // Power On Clear - 10ms delay
   reg regPowerOnClear;
   reg [10:0] regPowerOnDelay;

   always @(posedge sysclk)                           
   begin
      if (sys_rst_n == 1'b0) begin
         regPowerOnClear <= 0; // Start with 0, and then set to 1 after 10ms delay
         regPowerOnDelay <= 0;
      end else begin
         if (regPowerOnClear == 0) begin
            if (regPowerOnDelay> 400) begin // 400 clock cycles at 40MHz = 1000 at 100 Mhz
               regPowerOnClear <= 1;
            end else begin
               regPowerOnDelay <= regPowerOnDelay + 1;
            end
         end
      end
   end

   
   // Test signals
   wire TESTE;
   assign TESTE = 1'b1;  // <=== TEST ENABLE (?) Must be 1 for normal operation

   //wire XTESTO;  



   /***************
   ** Components **
   ****************/

   
   
   // Calculate OSC signal
   assign s_osc_inp1          = ~(s_XTAL1 & s_oc1 & s_oc0); // Chip 10F
   assign s_osc_inp2          = ~(s_oc0_n & s_oc1_and_xtal2_n);
   assign s_osc               = ~(s_osc_inp1 & s_osc_inp2);
   assign s_oc1_and_xtal2_n   = ~(s_oc1 & s_XTAL2);  // The AND is done in a 74321 chip (Positive NAND Schmitt Trigger)

   // Calculate CLOSC signal   
   assign s_closc             = ~(s_oscccl_n & s_power_on_zener);
   
   // Calculate PWCL signal
   assign s_gated_swmcl_n     = ~(s_power_on_zener & s_swmcl_n);   
   assign s_pwcl              = s_gated_swmcl_n | s_opclcs;

   

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   TTL_74393   CHIP_13C_1 (.CLK_n(s_XTAL1),
                           .RESET(s_closc),
                           .QA(),
                           .QB(),
                           .QC(s_pposc),  // Signal PPOSC leaving DCD (4.9152 Mhz clock for UART) (Div8)
                           .QD(s_div_16));

   TTL_74393   CHIP_13C_2 (.CLK_n(s_div_16),
                           .RESET(s_closc),
                           .QA(),
                           .QB(),
                           .QC(),
                           .QD(s_XRTOSC)  // Signal RTOSC going to DGA (153.6Khz)
                           );



   


   DECODE_DGA  DGA(
            /** INPUT **/

            .XBDN(s_bdry50_n),  
            .XBRN(s_brk_n),
            .XCLK(s_clk),
            .XCLO(s_closc),  
            .XCON(s_icontin_n),
            .XCO_4_0(s_cscomm_4_0),
            .XDAN(s_dap_n),
            .XEFN(s_ref_n),
            .XEON(s_eorf_n),
            .XHIN(~s_hit),  // XHIT_n (negated)
            .XID_4_0(s_csidbs_4_0),
            
            .XLCN(s_lcs_n),
            .XLON(s_iload_n),
            .XLSH(s_lshadow),
            .XMI_1_0(s_csmis_1_0),
            .XPOI(s_poni),   
            .XPOW(s_powsense), 
            .XPWC(s_pwcl),
            .XRMN(s_rmm_n),
            .XRTO(s_XRTOSC),    // XRTOSC 
            .XS5N(s_sel5ms_n),
            .XST_4_3(s_stat_4_3),
            .XTES(TESTE),                     
            .XTON(s_istop_n),
            .XUCK(s_uclk),

            // IDB IN and OUT
            .XIDB_7_0_IN(s_IDB_7_0_in),
            .XIDB_3_0_OUT(s_dga_idb_3_0_out),            
 
            /** OUTPUT **/
            .XA_7_0(s_pa_7_0),            
            .XC10(s_ca10),
            .XCLN(s_clear_n),
            .XCRN(s_cclr_n),
            .XCSN(s_ecsr_n),
            .XDON(s_edo_n),
            .XDTN(s_dt_n),
            .XDVN(s_dvacc_n),
            .XECR(s_ecreq),
            .XEMN(s_emp_n),
            .XEPN(s_epan_n),
            .XESN(s_estof_n),
            .XEUN(s_ceuart_n),
            .XFEC(s_fetch),
            .XFMI(s_fmiss),
            .XFON(s_form_n),
            .XFUN(s_ful_n),
            .XION(s_eior_n),
//            .XI_3_0_C(),
//            .XI_3_0_O(),
            .XLHN(s_lhit),  
            .XMCL(s_mcl),
            .XMRN(s_mreq_n),
            .XOCN(s_sioc_n),
            .XPAN(s_pa_n),
            .XPEN(s_ps_n),
            .XPFN(s_powfail_n),
            .XPIN(s_empid_n),
            .XPNN(s_pan_n),
            .XPSC(s_panosc),
            .XPSN(s_epans_n),
            .XRFN(s_refrq_n),
            .XRIN(s_rinr_n),
            .XRQN(s_ioreq_n),
            .XRTN(s_rt_n),
            .XRUN(s_ruart_n),
            .XRWN(s_rwcs_n), // (NOT CONNECTED IN SHEET 39)
            .XSCN(s_stoc_n),
            .XSHN(s_short_n),
            .XSSN(s_ssema_n),
            .XSTP(s_stp),
            .XSWN(s_slow_n),
            //.XTEO(XTESTO),  
            .XTEO(), // TEST OUTPUT (NOT CONNECTED IN SHEET 39)
            .XTOT(s_tout),
            .XTRN(s_traald_n),
            .XVAL(s_val),
            .XWHN(s_wchim_n),
            .XWRI(s_write)                  

   );
   
endmodule
