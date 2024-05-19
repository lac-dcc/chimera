// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//
//  Ultra96V2 Real-Time OS
//
//                                 Copyright (C) 2008-2021 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module jelly2_rtos_axi4l
        #(
            parameter                                   AXI4L_ADDR_WIDTH   = 29,
            parameter                                   AXI4L_DATA_WIDTH   = 32,
            parameter                                   AXI4L_STRB_WIDTH   = AXI4L_DATA_WIDTH / 8,
            parameter                                   TMAX_TSKID         = 15,
            parameter                                   TMAX_SEMID         = 7,
            parameter                                   TMAX_FLGID         = 1,
            parameter                                   TSKPRI_WIDTH       = 4,
            parameter                                   WUPCNT_WIDTH       = 1,
            parameter                                   SUSCNT_WIDTH       = 1,
            parameter                                   SEMCNT_WIDTH       = 4,
            parameter                                   FLGPTN_WIDTH       = 32,
            parameter                                   PRESCL_WIDTH       = 32,
            parameter                                   SYSTIM_WIDTH       = 64,
            parameter                                   RELTIM_WIDTH       = 32,
            parameter                                   ER_WIDTH           = 8,
            parameter                                   TTS_WIDTH          = 4,
            parameter                                   TTW_WIDTH          = 4,
            parameter   [WUPCNT_WIDTH-1:0]              TMAX_WUPCNT        = {WUPCNT_WIDTH{1'b1}},
            parameter   [SUSCNT_WIDTH-1:0]              TMAX_SUSCNT        = {SUSCNT_WIDTH{1'b1}},
            parameter                                   QUECNT_WIDTH       = $clog2(TMAX_TSKID),
            parameter                                   TSKID_WIDTH        = $clog2(TMAX_TSKID+1),
            parameter                                   SEMID_WIDTH        = $clog2(TMAX_SEMID+1),
            parameter                                   CLOCK_RATE         = 100000000,
            parameter                                   SCRATCH0_WIDTH     = AXI4L_DATA_WIDTH,
            parameter                                   SCRATCH1_WIDTH     = AXI4L_DATA_WIDTH,
            parameter                                   SCRATCH2_WIDTH     = AXI4L_DATA_WIDTH,
            parameter                                   SCRATCH3_WIDTH     = AXI4L_DATA_WIDTH,
            parameter                                   USE_CHG_PRI        = 1,
            parameter                                   USE_SLP_TSK        = 1,
            parameter                                   USE_SUS_TSK        = 1,
            parameter                                   USE_DLY_TSK        = 1,
            parameter                                   USE_REL_WAI        = 1,
            parameter                                   USE_SET_TMO        = 1,
            parameter                                   USE_SIG_SEM        = 1,
            parameter                                   USE_WAI_SEM        = 1,
            parameter                                   USE_POL_SEM        = 1,
            parameter                                   USE_SET_FLG        = 1,
            parameter                                   USE_CLR_FLG        = 1,
            parameter                                   USE_WAI_FLG        = 1,
            parameter                                   USE_EXT_FLG        = 1,
            parameter                                   USE_GET_PRI        = 1,
            parameter                                   USE_SET_PSCL       = 1,
            parameter                                   USE_SET_TIM        = 1,
            parameter                                   USE_GET_TIM        = 1,
            parameter                                   USE_REF_TSKSTAT    = 1,
            parameter                                   USE_REF_TSKWAIT    = 1,
            parameter                                   USE_REF_WUPCNT     = 1,
            parameter                                   USE_REF_SUSCNT     = 1,
            parameter                                   USE_REF_TIMCNT     = 1,
            parameter                                   USE_REF_ERCD       = 1,
            parameter                                   USE_REF_SEMCNT     = 1,
            parameter                                   USE_REF_SEMQUE     = 1,
            parameter                                   USE_REF_FLGPTN     = 1,
            parameter                                   USE_SCRATCH0       = 1,
            parameter                                   USE_SCRATCH1       = 1,
            parameter                                   USE_SCRATCH2       = 1,
            parameter                                   USE_SCRATCH3       = 1,
            parameter   [TMAX_FLGID*FLGPTN_WIDTH-1:0]   INIT_FLGPTN        = 0,
            parameter   [TMAX_FLGID*FLGPTN_WIDTH-1:0]   INIT_EXTFLG_ENABLE = 0,
            parameter   [PRESCL_WIDTH-1:0]              INIT_PRESCL        = 0,
            parameter   [SYSTIM_WIDTH-1:0]              INIT_SYSTIM        = 0,
            parameter   [SCRATCH0_WIDTH-1:0]            INIT_SCRATCH0      = 0,
            parameter   [SCRATCH1_WIDTH-1:0]            INIT_SCRATCH1      = 0,
            parameter   [SCRATCH2_WIDTH-1:0]            INIT_SCRATCH2      = 0,
            parameter   [SCRATCH3_WIDTH-1:0]            INIT_SCRATCH3      = 0
        )
        (
            input   wire                                    aresetn,
            input   wire                                    aclk,

            input   wire    [AXI4L_ADDR_WIDTH-1:0]          s_axi4l_awaddr,
            input   wire    [2:0]                           s_axi4l_awprot,
            input   wire                                    s_axi4l_awvalid,
            output  wire                                    s_axi4l_awready,
            input   wire    [AXI4L_DATA_WIDTH-1:0]          s_axi4l_wdata,
            input   wire    [AXI4L_STRB_WIDTH-1:0]          s_axi4l_wstrb,
            input   wire                                    s_axi4l_wvalid,
            output  wire                                    s_axi4l_wready,
            output  wire    [1:0]                           s_axi4l_bresp,
            output  wire                                    s_axi4l_bvalid,
            input   wire                                    s_axi4l_bready,
            input   wire    [AXI4L_ADDR_WIDTH-1:0]          s_axi4l_araddr,
            input   wire    [2:0]                           s_axi4l_arprot,
            input   wire                                    s_axi4l_arvalid,
            output  wire                                    s_axi4l_arready,
            output  wire    [AXI4L_DATA_WIDTH-1:0]          s_axi4l_rdata,
            output  wire    [1:0]                           s_axi4l_rresp,
            output  wire                                    s_axi4l_rvalid,
            input   wire                                    s_axi4l_rready,
            
            output  wire    [0:0]                           irq_n,

            input   wire    [TMAX_FLGID*FLGPTN_WIDTH-1:0]   set_flg
        );
    
    
    // -----------------------------
    //  WISHBONE
    // -----------------------------
    
    localparam  AXI4L_DATA_SIZE = $clog2(AXI4L_DATA_WIDTH / 8);

    localparam  WB_DAT_SIZE  = AXI4L_DATA_SIZE;
    localparam  WB_ADR_WIDTH = AXI4L_ADDR_WIDTH - WB_DAT_SIZE;
    localparam  WB_DAT_WIDTH = (8 << WB_DAT_SIZE);
    localparam  WB_SEL_WIDTH = (1 << WB_DAT_SIZE);
    
    wire                            reset;
    wire                            clk;
    
    wire    [WB_ADR_WIDTH-1:0]      wb_adr_i;
    wire    [WB_DAT_WIDTH-1:0]      wb_dat_i;
    wire    [WB_DAT_WIDTH-1:0]      wb_dat_o;
    wire                            wb_we_i;
    wire    [WB_SEL_WIDTH-1:0]      wb_sel_i;
    wire                            wb_stb_i;
    wire                            wb_ack_o;
    
    jelly_axi4l_to_wishbone
            #(
                .AXI4L_ADDR_WIDTH   (AXI4L_ADDR_WIDTH),
                .AXI4L_DATA_SIZE    (AXI4L_DATA_SIZE)     // 0:8bit, 1:16bit, 2:32bit, 3:64bit, ...
            )
        i_axi4l_to_wishbone
            (
                .s_axi4l_aresetn    (aresetn),
                .s_axi4l_aclk       (aclk),
                .s_axi4l_awaddr     (s_axi4l_awaddr),
                .s_axi4l_awprot     (s_axi4l_awprot),
                .s_axi4l_awvalid    (s_axi4l_awvalid),
                .s_axi4l_awready    (s_axi4l_awready),
                .s_axi4l_wstrb      (s_axi4l_wstrb),
                .s_axi4l_wdata      (s_axi4l_wdata),
                .s_axi4l_wvalid     (s_axi4l_wvalid),
                .s_axi4l_wready     (s_axi4l_wready),
                .s_axi4l_bresp      (s_axi4l_bresp),
                .s_axi4l_bvalid     (s_axi4l_bvalid),
                .s_axi4l_bready     (s_axi4l_bready),
                .s_axi4l_araddr     (s_axi4l_araddr),
                .s_axi4l_arprot     (s_axi4l_arprot),
                .s_axi4l_arvalid    (s_axi4l_arvalid),
                .s_axi4l_arready    (s_axi4l_arready),
                .s_axi4l_rdata      (s_axi4l_rdata),
                .s_axi4l_rresp      (s_axi4l_rresp),
                .s_axi4l_rvalid     (s_axi4l_rvalid),
                .s_axi4l_rready     (s_axi4l_rready),
                
                .m_wb_rst_o         (reset),
                .m_wb_clk_o         (clk),
                .m_wb_adr_o         (wb_adr_i),
                .m_wb_dat_o         (wb_dat_i),
                .m_wb_dat_i         (wb_dat_o),
                .m_wb_we_o          (wb_we_i),
                .m_wb_sel_o         (wb_sel_i),
                .m_wb_stb_o         (wb_stb_i),
                .m_wb_ack_i         (wb_ack_o)
            );
    
    
    // -----------------------------
    //  RTOS
    // -----------------------------
    
    wire    [TSKID_WIDTH-1:0]                   monitor_top_tskid;
    wire    [TSKID_WIDTH-1:0]                   monitor_run_tskid;
    wire    [TSKPRI_WIDTH-1:0]                  monitor_run_tskpri;
    wire    [TMAX_TSKID*TTS_WIDTH-1:0]          monitor_tsk_tskstat;
    wire    [TMAX_TSKID*TTW_WIDTH-1:0]          monitor_tsk_tskwait;
    wire    [TMAX_TSKID*WUPCNT_WIDTH-1:0]       monitor_tsk_wupcnt;
    wire    [TMAX_TSKID*SUSCNT_WIDTH-1:0]       monitor_tsk_suscnt;
    wire    [TMAX_SEMID*QUECNT_WIDTH-1:0]       monitor_sem_quecnt;
    wire    [TMAX_SEMID*SEMCNT_WIDTH-1:0]       monitor_sem_semcnt;
    wire    [TMAX_FLGID*FLGPTN_WIDTH-1:0]       monitor_flg_flgptn;
    wire    [WB_DAT_WIDTH-1:0]                  monitor_scratch0;
    wire    [WB_DAT_WIDTH-1:0]                  monitor_scratch1;
    wire    [WB_DAT_WIDTH-1:0]                  monitor_scratch2;
    wire    [WB_DAT_WIDTH-1:0]                  monitor_scratch3;

    jelly2_rtos
            #(
                .WB_ADR_WIDTH           (WB_ADR_WIDTH),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .TMAX_TSKID             (TMAX_TSKID),
                .TMAX_SEMID             (TMAX_SEMID),
                .TMAX_FLGID             (TMAX_FLGID),
                .TSKPRI_WIDTH           (TSKPRI_WIDTH),
                .WUPCNT_WIDTH           (WUPCNT_WIDTH),
                .SUSCNT_WIDTH           (SUSCNT_WIDTH),
                .SEMCNT_WIDTH           (SEMCNT_WIDTH),
                .FLGPTN_WIDTH           (FLGPTN_WIDTH),
                .PRESCL_WIDTH           (PRESCL_WIDTH),
                .SYSTIM_WIDTH           (SYSTIM_WIDTH),
                .RELTIM_WIDTH           (RELTIM_WIDTH),
                .ER_WIDTH               (ER_WIDTH),
                .TTS_WIDTH              (TTS_WIDTH),
                .TTW_WIDTH              (TTW_WIDTH),
                .TMAX_WUPCNT            (TMAX_WUPCNT),
                .TMAX_SUSCNT            (TMAX_SUSCNT),
                .CLOCK_RATE             (CLOCK_RATE),
                .SCRATCH0_WIDTH         (SCRATCH0_WIDTH),
                .SCRATCH1_WIDTH         (SCRATCH1_WIDTH),
                .SCRATCH2_WIDTH         (SCRATCH2_WIDTH),
                .SCRATCH3_WIDTH         (SCRATCH3_WIDTH),
                .USE_CHG_PRI            (USE_CHG_PRI),
                .USE_SLP_TSK            (USE_SLP_TSK),
                .USE_SUS_TSK            (USE_SUS_TSK),
                .USE_DLY_TSK            (USE_DLY_TSK),
                .USE_REL_WAI            (USE_REL_WAI),
                .USE_SET_TMO            (USE_SET_TMO),
                .USE_SIG_SEM            (USE_SIG_SEM),
                .USE_WAI_SEM            (USE_WAI_SEM),
                .USE_POL_SEM            (USE_POL_SEM),
                .USE_SET_FLG            (USE_SET_FLG),
                .USE_CLR_FLG            (USE_CLR_FLG),
                .USE_WAI_FLG            (USE_WAI_FLG),
                .USE_EXT_FLG            (USE_EXT_FLG),
                .USE_GET_PRI            (USE_GET_PRI),
                .USE_SET_PSCL           (USE_SET_PSCL),
                .USE_SET_TIM            (USE_SET_TIM),
                .USE_GET_TIM            (USE_GET_TIM),
                .USE_REF_TSKSTAT        (USE_REF_TSKSTAT),
                .USE_REF_TSKWAIT        (USE_REF_TSKWAIT),
                .USE_REF_WUPCNT         (USE_REF_WUPCNT),
                .USE_REF_SUSCNT         (USE_REF_SUSCNT),
                .USE_REF_TIMCNT         (USE_REF_TIMCNT),
                .USE_REF_ERCD           (USE_REF_ERCD),
                .USE_REF_SEMCNT         (USE_REF_SEMCNT),
                .USE_REF_SEMQUE         (USE_REF_SEMQUE),
                .USE_REF_FLGPTN         (USE_REF_FLGPTN),
                .USE_SCRATCH0           (USE_SCRATCH0),
                .USE_SCRATCH1           (USE_SCRATCH1),
                .USE_SCRATCH2           (USE_SCRATCH2),
                .USE_SCRATCH3           (USE_SCRATCH3),
                .INIT_FLGPTN            (INIT_FLGPTN),
                .INIT_EXTFLG_ENABLE     (INIT_EXTFLG_ENABLE),
                .INIT_PRESCL            (INIT_PRESCL),
                .INIT_SYSTIM            (INIT_SYSTIM),
                .INIT_SCRATCH0          (INIT_SCRATCH0),
                .INIT_SCRATCH1          (INIT_SCRATCH1),
                .INIT_SCRATCH2          (INIT_SCRATCH2),
                .INIT_SCRATCH3          (INIT_SCRATCH3)
            )   
        i_rtos
            (   
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (1'b1),

                .s_wb_adr_i             (wb_adr_i),
                .s_wb_dat_i             (wb_dat_i),
                .s_wb_dat_o             (wb_dat_o),
                .s_wb_we_i              (wb_we_i),
                .s_wb_sel_i             (wb_sel_i),
                .s_wb_stb_i             (wb_stb_i),
                .s_wb_ack_o             (wb_ack_o),

                .irq_n                  (irq_n),

                .ext_set_flg            (set_flg),
                
                .monitor_top_tskid      (monitor_top_tskid), 
                .monitor_run_tskid      (monitor_run_tskid),
                .monitor_run_tskpri     (monitor_run_tskpri),
                .monitor_tsk_tskstat    (monitor_tsk_tskstat),
                .monitor_tsk_tskwait    (monitor_tsk_tskwait),
                .monitor_tsk_wupcnt     (monitor_tsk_wupcnt),
                .monitor_tsk_suscnt     (monitor_tsk_suscnt),

                .monitor_sem_quecnt     (monitor_sem_quecnt),
                .monitor_sem_semcnt     (monitor_sem_semcnt),
                .monitor_flg_flgptn     (monitor_flg_flgptn),
                .monitor_scratch0       (monitor_scratch0),
                .monitor_scratch1       (monitor_scratch1),
                .monitor_scratch2       (monitor_scratch2),
                .monitor_scratch3       (monitor_scratch3)
            );
    
endmodule



`default_nettype wire


// end of file
