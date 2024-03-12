// v5_mig34.v
//
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: 3.4
//  \   \         Application: MIG
//  /   /         Filename: mig_v3_4.v
// /___/   /\     Date Last Modified: $Date: 2009/11/03 04:43:18 $
// \   \  /  \    Date Created: Wed Aug 16 2006
//  \___\/\___\
//
//Device: Virtex-5
//Design Name: DDR2
//Purpose:
//   Top-level  module. Simple model for what the user might use
//   Typically, the user will only instantiate MEM_INTERFACE_TOP in their
//   code, and generate all backend logic (test bench) and all the other infrastructure logic
//    separately.
//   In addition to the memory controller, the module instantiates:
//     1. Reset logic based on user clocks
//     2. IDELAY control block
//Reference:
//Revision History:
//   Rev 1.1 - Parameter USE_DM_PORT added. PK. 6/25/08
//   Rev 1.2 - Parameter HIGH_PERFORMANCE_MODE added. PK. 7/10/08
//   Rev 1.3 - Parameter IODELAY_GRP added. PK. 11/27/08
//*****************************************************************************

`timescale 1ns/1ps

(* X_CORE_INFO = "mig_v3_4_ddr2_v5, Coregen 12.1" , CORE_GENERATION_INFO = "ddr2_v5,mig_v3_4,{component_name=mig_v3_4, BANK_WIDTH=2, CKE_WIDTH=1, CLK_WIDTH=2, COL_WIDTH=10, CS_NUM=1, CS_WIDTH=2, DM_WIDTH=4, DQ_WIDTH=32, DQ_PER_DQS=8, DQS_WIDTH=4, ODT_WIDTH=2, ROW_WIDTH=13, ADDITIVE_LAT=0, BURST_LEN=8, BURST_TYPE=0, CAS_LAT=5, ECC_ENABLE=0, MULTI_BANK_EN=1, TWO_T_TIME_EN=0, ODT_TYPE=3, REDUCE_DRV=0, REG_ENABLE=0, TREFI_NS=7800, TRAS=40000, TRCD=15000, TRFC=105000, TRP=15000, TRTP=7500, TWR=15000, TWTR=7500, CLK_PERIOD=3333, RST_ACT_LOW=1, INTERFACE_TYPE=DDR2_SDRAM, LANGUAGE=Verilog, SYNTHESIS_TOOL=XST, NO_OF_CONTROLLERS=1}" *)
module v5_mig34 #
  (
   parameter BANK_WIDTH              = 2,       
                                       // # of memory bank addr bits.
   parameter CKE_WIDTH               = 2,        //SSIEGEL was 1
                                       // # of memory clock enable outputs.
   parameter CLK_WIDTH               = 2,       
                                       // # of clock outputs.
   parameter COL_WIDTH               = 10,       
                                       // # of memory column bits.
   parameter CS_NUM                  = 1,       
                                       // # of separate memory chip selects.
   parameter CS_WIDTH                = 2,       
                                       // # of total memory chip selects.
   parameter CS_BITS                 = 0,       
                                       // set to log2(CS_NUM) (rounded up).
   parameter DM_WIDTH                = 4,       
                                       // # of data mask bits.
   parameter DQ_WIDTH                = 32,       
                                       // # of data width.
   parameter DQ_PER_DQS              = 8,       
                                       // # of DQ data bits per strobe.
   parameter DQS_WIDTH               = 4,       
                                       // # of DQS strobes.
   parameter DQ_BITS                 = 5,       
                                       // set to log2(DQS_WIDTH*DQ_PER_DQS).
   parameter DQS_BITS                = 2,       
                                       // set to log2(DQS_WIDTH).
   parameter ODT_WIDTH               = 2,       
                                       // # of memory on-die term enables.
   parameter ROW_WIDTH               = 13,       
                                       // # of memory row and # of addr bits.
   parameter ADDITIVE_LAT            = 0,       
                                       // additive write latency.
   parameter BURST_LEN               = 4,       //SSIEGEL was 8
                                       // burst length (in double words).
   parameter BURST_TYPE              = 0,       
                                       // burst type (=0 seq; =1 interleaved).
   parameter CAS_LAT                 = 5,       
                                       // CAS latency.
   parameter ECC_ENABLE              = 0,       
                                       // enable ECC (=1 enable).
   parameter APPDATA_WIDTH           = 64,       
                                       // # of usr read/write data bus bits.
   parameter MULTI_BANK_EN           = 1,       
                                       // Keeps multiple banks open. (= 1 enable).
   parameter TWO_T_TIME_EN           = 0,       
                                       // 2t timing for unbuffered dimms.
   parameter ODT_TYPE                = 3,       
                                       // ODT (=0(none),=1(75),=2(150),=3(50)).
   parameter REDUCE_DRV              = 0,       
                                       // reduced strength mem I/O (=1 yes).
   parameter REG_ENABLE              = 0,       
                                       // registered addr/ctrl (=1 yes).
   parameter TREFI_NS                = 7800,       
                                       // auto refresh interval (ns).
   parameter TRAS                    = 40000,       
                                       // active->precharge delay.
   parameter TRCD                    = 15000,       
                                       // active->read/write delay.
   parameter TRFC                    = 105000,       
                                       // refresh->refresh, refresh->active delay.
   parameter TRP                     = 15000,       
                                       // precharge->command delay.
   parameter TRTP                    = 7500,       
                                       // read->precharge delay.
   parameter TWR                     = 15000,       
                                       // used to determine write->precharge.
   parameter TWTR                    = 7500,       
                                       // write->read delay.
   parameter HIGH_PERFORMANCE_MODE   = "TRUE",       
                              // # = TRUE, the IODELAY performance mode is set
                              // to high.
                              // # = FALSE, the IODELAY performance mode is set
                              // to low.
   parameter SIM_ONLY                = 0,       
                                       // = 1 to skip SDRAM power up delay.
   parameter DEBUG_EN                = 1,       
                                       // Enable debug signals/controls.
                                       // When this parameter is changed from 0 to 1,
                                       // make sure to uncomment the coregen commands
                                       // in ise_flow.bat or create_ise.bat files in
                                       // par folder.
   parameter CLK_PERIOD              = 3333,       
                                       // Core/Memory clock period (in ps).
   parameter DLL_FREQ_MODE           = "HIGH",       
                                       // DCM Frequency range.
   parameter CLK_TYPE                = "SINGLE_ENDED",       
                                       // # = "DIFFERENTIAL " ->; Differential input clocks ,
                                       // # = "SINGLE_ENDED" -> Single ended input clocks.
   parameter NOCLK200                = 0,       
                                       // clk200 enable and disable.
   parameter RST_ACT_LOW             = 1        
                                       // =1 for active low reset, =0 for active high.
   )
  (

   input                              clk_sys,    //slswas sys_clk, Typ 300 MHz
   input                              clk_ref,    //slswas: idly_clk_200,
   input                              sys_rst_n,  // active low

   inout  [DQ_WIDTH-1:0]              ddr2_dq,
   output [ROW_WIDTH-1:0]             ddr2_addr,
   output [BANK_WIDTH-1:0]            ddr2_ba,
   output                             ddr2_ras_n,
   output                             ddr2_cas_n,
   output                             ddr2_we_n,
   output [CS_WIDTH-1:0]              ddr2_cs_n,
   output [ODT_WIDTH-1:0]             ddr2_odt,
   output [CKE_WIDTH-1:0]             ddr2_cke,
   output [DM_WIDTH-1:0]              ddr2_dm,
   inout  [DQS_WIDTH-1:0]             ddr2_dqs_p,
   inout  [DQS_WIDTH-1:0]             ddr2_dqs_n,
   output [CLK_WIDTH-1:0]             ddr2_ck_p,
   output [CLK_WIDTH-1:0]             ddr2_ck_n,


   input  [2:0]                       app_cmd,
   input                              app_af_wren,
   output                             app_af_afull,
   input  [30:0]                      app_addr,
   input                              app_wf_wren,
   input  [(APPDATA_WIDTH)-1:0]       app_data,
   input  [(APPDATA_WIDTH/8)-1:0]     app_mask,
   output                             app_wf_afull,
   output [(APPDATA_WIDTH)-1:0]       app_rd_data,
   output                             app_rd_data_valid,
   output                             phy_init_done,
   output                             tb_clk,   //clk0_tb,
   output                             tb_rst_n, //rst0_tb,


   // added debug signals debug..
   output [3:0]                  dbg_calib_done,
   output [3:0]                  dbg_calib_err,
   output [6*DQS_WIDTH-1:0]      dbg_calib_dq_tap_cnt,
   output [6*DQS_WIDTH-1:0]      dbg_calib_dqs_tap_cnt,
   output [6*DQS_WIDTH-1:0]      dbg_calib_gate_tap_cnt,
   output [DQS_WIDTH-1:0]        dbg_calib_rd_data_sel,
   output [5*DQS_WIDTH-1:0]      dbg_calib_rden_delay,
   output [5*DQS_WIDTH-1:0]      dbg_calib_gate_delay,
   input                         dbg_idel_up_all,
   input                         dbg_idel_down_all,
   input                         dbg_sel_all_idel_dq,
   input  [DQ_BITS-1:0]          dbg_sel_idel_dq,
   input                         dbg_idel_up_dq,
   input                         dbg_idel_down_dq,
   input                         dbg_sel_all_idel_dqs,
   input  [DQS_BITS-1:0]         dbg_sel_idel_dqs,
   input                         dbg_idel_up_dqs,
   input                         dbg_idel_down_dqs,
   input                         dbg_sel_all_idel_gate,
   input  [DQS_BITS-1:0]         dbg_sel_idel_gate,
   input                         dbg_idel_up_gate,
   input                         dbg_idel_down_gate

   );

  //***************************************************************************
  // IODELAY Group Name: Replication and placement of IDELAYCTRLs will be
  // handled automatically by software tools if IDELAYCTRLs have same refclk,
  // reset and rdy nets. Designs with a unique RESET will commonly create a
  // unique RDY. Constraint IODELAY_GROUP is associated to a set of IODELAYs
  // with an IDELAYCTRL. The parameter IODELAY_GRP value can be any string.
  //***************************************************************************

  localparam IODELAY_GRP = "IODELAY_MIG";
  //localparam IODELAY_GRP = "ADC_IODELAY";


  wire                              sys_clk_p;
  wire                              sys_clk_n;
  wire                              clk200_p;
  wire                              clk200_n;
  wire                              rst0;
  wire                              rst90;
  wire                              rstdiv0;
  wire                              rst200;
  wire                              clk0;
  wire                              clk90;
  wire                              clkdiv0;
  wire                              clk200;
  wire                              idelay_ctrl_rdy;


  //Debug signals


  /*
  wire [3:0]                        dbg_calib_done;
  wire [3:0]                        dbg_calib_err;
  wire [(6*DQ_WIDTH)-1:0]           dbg_calib_dq_tap_cnt;
  wire [(6*DQS_WIDTH)-1:0]          dbg_calib_dqs_tap_cnt;
  wire [(6*DQS_WIDTH)-1:0]          dbg_calib_gate_tap_cnt;
  wire [DQS_WIDTH-1:0]              dbg_calib_rd_data_sel;
  wire [(5*DQS_WIDTH)-1:0]          dbg_calib_rden_dly;
  wire [(5*DQS_WIDTH)-1:0]          dbg_calib_gate_dly;
  wire                              dbg_idel_up_all;
  wire                              dbg_idel_down_all;
  wire                              dbg_idel_up_dq;
  wire                              dbg_idel_down_dq;
  wire                              dbg_idel_up_dqs;
  wire                              dbg_idel_down_dqs;
  wire                              dbg_idel_up_gate;
  wire                              dbg_idel_down_gate;
  wire [DQ_BITS-1:0]                dbg_sel_idel_dq;
  wire                              dbg_sel_all_idel_dq;
  wire [DQS_BITS:0]                 dbg_sel_idel_dqs;
  wire                              dbg_sel_all_idel_dqs;
  wire [DQS_BITS:0]                 dbg_sel_idel_gate;
  wire                              dbg_sel_all_idel_gate;
  */


    // Debug signals (optional use)

  //***********************************
  // PHY Debug Port demo
  //***********************************
  wire [35:0]                        cs_control0;
  wire [35:0]                        cs_control1;
  wire [35:0]                        cs_control2;
  wire [35:0]                        cs_control3;
  wire [191:0]                       vio0_in;
  wire [95:0]                        vio1_in;
  wire [99:0]                        vio2_in;
  wire [31:0]                        vio3_out;




  //***************************************************************************

  //assign  rst0_tb = rst0;
  assign  tb_rst_n = !rst0;
  //assign  clk0_tb = clk0;
  assign  tb_clk = clk0;
  assign sys_clk_p = 1'b1;
  assign sys_clk_n = 1'b0;
  assign clk200_p = 1'b1;
  assign clk200_n = 1'b0;

ddr2_idelay_ctrl #
   (
    .IODELAY_GRP         (IODELAY_GRP)
   )
   u_ddr2_idelay_ctrl
   (
   .rst200                 (rst200),
   .clk200                 (clk_ref),
   .idelay_ctrl_rdy        (idelay_ctrl_rdy)
   );

 ddr2_infrastructure #
 (
   .CLK_PERIOD             (CLK_PERIOD),
   .DLL_FREQ_MODE          (DLL_FREQ_MODE),
   .CLK_TYPE               (CLK_TYPE),
   .NOCLK200               (NOCLK200),
   .RST_ACT_LOW            (RST_ACT_LOW)
   )
u_ddr2_infrastructure
 (
   .sys_clk_p              (sys_clk_p),
   .sys_clk_n              (sys_clk_n),
   .sys_clk                (clk_sys),  // the memory clock, 200MHz or 300MHz
   .clk200_p               (clk200_p),
   .clk200_n               (clk200_n),
   .idly_clk_200           (clk_ref),
   .sys_rst_n              (sys_rst_n),
   .rst0                   (rst0),
   .rst90                  (rst90),
   .rstdiv0                (rstdiv0),
   .rst200                 (rst200),
   .clk0                   (clk0),
   .clk90                  (clk90),
   .clkdiv0                (clkdiv0),
   .clk200                 (clk200),
   .idelay_ctrl_rdy        (idelay_ctrl_rdy)
   );

 ddr2_top #
 (
   .BANK_WIDTH             (BANK_WIDTH),
   .CKE_WIDTH              (CKE_WIDTH),
   .CLK_WIDTH              (CLK_WIDTH),
   .COL_WIDTH              (COL_WIDTH),
   .CS_NUM                 (CS_NUM),
   .CS_WIDTH               (CS_WIDTH),
   .CS_BITS                (CS_BITS),
   .DM_WIDTH               (DM_WIDTH),
   .DQ_WIDTH               (DQ_WIDTH),
   .DQ_PER_DQS             (DQ_PER_DQS),
   .DQS_WIDTH              (DQS_WIDTH),
   .DQ_BITS                (DQ_BITS),
   .DQS_BITS               (DQS_BITS),
   .ODT_WIDTH              (ODT_WIDTH),
   .ROW_WIDTH              (ROW_WIDTH),
   .ADDITIVE_LAT           (ADDITIVE_LAT),
   .BURST_LEN              (BURST_LEN),
   .BURST_TYPE             (BURST_TYPE),
   .CAS_LAT                (CAS_LAT),
   .ECC_ENABLE             (ECC_ENABLE),
   .APPDATA_WIDTH          (APPDATA_WIDTH),
   .MULTI_BANK_EN          (MULTI_BANK_EN),
   .TWO_T_TIME_EN          (TWO_T_TIME_EN),
   .ODT_TYPE               (ODT_TYPE),
   .REDUCE_DRV             (REDUCE_DRV),
   .REG_ENABLE             (REG_ENABLE),
   .TREFI_NS               (TREFI_NS),
   .TRAS                   (TRAS),
   .TRCD                   (TRCD),
   .TRFC                   (TRFC),
   .TRP                    (TRP),
   .TRTP                   (TRTP),
   .TWR                    (TWR),
   .TWTR                   (TWTR),
   .HIGH_PERFORMANCE_MODE  (HIGH_PERFORMANCE_MODE),
   .IODELAY_GRP            (IODELAY_GRP),
   .SIM_ONLY               (SIM_ONLY),
   .DEBUG_EN               (DEBUG_EN),
   .FPGA_SPEED_GRADE       (2),
   .USE_DM_PORT            (1),
   .CLK_PERIOD             (CLK_PERIOD)
   )
u_ddr2_top_0
(
   .ddr2_dq                (ddr2_dq),
   .ddr2_a                 (ddr2_addr),  // was ddr2_a
   .ddr2_ba                (ddr2_ba),
   .ddr2_ras_n             (ddr2_ras_n),
   .ddr2_cas_n             (ddr2_cas_n),
   .ddr2_we_n              (ddr2_we_n),
   .ddr2_cs_n              (ddr2_cs_n),
   .ddr2_odt               (ddr2_odt),
   .ddr2_cke               (ddr2_cke),
   .ddr2_dm                (ddr2_dm),
   .phy_init_done          (phy_init_done),
   .rst0                   (rst0),
   .rst90                  (rst90),
   .rstdiv0                (rstdiv0),
   .clk0                   (clk0),
   .clk90                  (clk90),
   .clkdiv0                (clkdiv0),
   .app_wdf_afull          (app_wf_afull),
   .app_af_afull           (app_af_afull),
   .rd_data_valid          (app_rd_data_valid),
   .app_wdf_wren           (app_wf_wren),
   .app_af_wren            (app_af_wren),
   .app_af_addr            (app_addr),
   .app_af_cmd             (app_cmd),
   .rd_data_fifo_out       (app_rd_data),  // sswas (rd_data_fifo_out),
   .app_wdf_data           (app_data),
   .app_wdf_mask_data      (app_mask),
   .ddr2_dqs               (ddr2_dqs_p),
   .ddr2_dqs_n             (ddr2_dqs_n),
   .ddr2_ck                (ddr2_ck_p),
   .rd_ecc_error           (),
   .ddr2_ck_n              (ddr2_ck_n),

   .dbg_calib_done         (dbg_calib_done),
   .dbg_calib_err          (dbg_calib_err),
   .dbg_calib_dq_tap_cnt   (dbg_calib_dq_tap_cnt),
   .dbg_calib_dqs_tap_cnt  (dbg_calib_dqs_tap_cnt),
   .dbg_calib_gate_tap_cnt  (dbg_calib_gate_tap_cnt),
   .dbg_calib_rd_data_sel  (dbg_calib_rd_data_sel),
   .dbg_calib_rden_dly     (dbg_calib_rden_dly),
   .dbg_calib_gate_dly     (dbg_calib_gate_dly),
   .dbg_idel_up_all        (dbg_idel_up_all),
   .dbg_idel_down_all      (dbg_idel_down_all),
   .dbg_idel_up_dq         (dbg_idel_up_dq),
   .dbg_idel_down_dq       (dbg_idel_down_dq),
   .dbg_idel_up_dqs        (dbg_idel_up_dqs),
   .dbg_idel_down_dqs      (dbg_idel_down_dqs),
   .dbg_idel_up_gate       (dbg_idel_up_gate),
   .dbg_idel_down_gate     (dbg_idel_down_gate),
   .dbg_sel_idel_dq        (dbg_sel_idel_dq),
   .dbg_sel_all_idel_dq    (dbg_sel_all_idel_dq),
   .dbg_sel_idel_dqs       (dbg_sel_idel_dqs),
   .dbg_sel_all_idel_dqs   (dbg_sel_all_idel_dqs),
   .dbg_sel_idel_gate      (dbg_sel_idel_gate),
   .dbg_sel_all_idel_gate  (dbg_sel_all_idel_gate)
   );

endmodule
