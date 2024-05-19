// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//    MIPS like CPU core
//
//                                  Copyright (C) 2008-2010 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale       1ns / 1ps
`default_nettype none



// CPU top
module jelly_cpu_top
        #(
            // CPU core
            parameter   CPU_USE_DBUGGER      = 1,
            parameter   CPU_USE_EXC_SYSCALL  = 1,
            parameter   CPU_USE_EXC_BREAK    = 1,
            parameter   CPU_USE_EXC_RI       = 1,
            parameter   CPU_USE_HW_BP        = 1,
            parameter   CPU_GPR_TYPE         = 0,
            parameter   CPU_MUL_CYCLE        = 0,
            parameter   CPU_DBBP_NUM         = 4,
            
            // Tightly Coupled Memory
            parameter   TCM_ENABLE           = 0,
            parameter   TCM_ADDR_WIDTH       = 8,   // 32bit word address
            parameter   TCM_MEM_SIZE         = (1 << TCM_ADDR_WIDTH),
            parameter   TCM_READMEMH         = 0,
            parameter   TCM_READMEM_FIlE     = "",
            
            // L1 Cache
            parameter   CACHE_ENABLE         = 0,
            parameter   CACHE_LINE_SIZE      = 1,   // 2^n (0:1words, 1:2words, 2:4words, ...)
            parameter   CACHE_ARRAY_SIZE     = 9,   // 2^n (1:2lines, 2:4lines, 3:8lines, ...)
            
            // bridge
            parameter   CACHE_BRIDGE         = 0,
            parameter   THROUGH_BRIDGE       = 0,
            
            // cached access port (WISHBONE)
            parameter   WB_CACHE_ADR_WIDTH   = 30 - CACHE_LINE_SIZE,
            parameter   WB_CACHE_DAT_SIZE    = 2 + CACHE_LINE_SIZE,
            parameter   WB_CACHE_DAT_WIDTH   = (8 << WB_CACHE_DAT_SIZE),
            parameter   WB_CACHE_SEL_WIDTH   = (1 << WB_CACHE_DAT_SIZE),
            
            // non-cached access port ()
            parameter   WB_THROUGH_ADR_WIDTH = 30,
            parameter   WB_THROUGH_DAT_SIZE  = 2,   // 8^n (0:8bit, 1:16bit, 3:32bit ...)
            parameter   WB_THROUGH_DAT_WIDTH = (8 << WB_THROUGH_DAT_SIZE),
            parameter   WB_THROUGH_SEL_WIDTH = (1 << WB_THROUGH_DAT_SIZE),
            
            // simulation
            parameter   SIMULATION       = 0
        )
        (
            // system
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                clk_x2,
            
            // endian
            input   wire                                endian,
            
            // vector
            input   wire    [31:0]                      vect_reset,
            input   wire    [31:0]                      vect_interrupt,
            input   wire    [31:0]                      vect_exception,
            
            // interrupt
            input   wire                                interrupt_req,
            output  wire                                interrupt_ack,
            
            // control
            input   wire                                pause,
            
            // address decode
            input   wire    [31:0]                      tcm_addr_mask,
            input   wire    [31:0]                      tcm_addr_value,
            input   wire    [31:0]                      cache_addr_mask,
            input   wire    [31:0]                      cache_addr_value,
            
            // WISHBONE memory bus (cached)
            output  wire    [WB_CACHE_ADR_WIDTH-1:0]    wb_cache_adr_o,
            input   wire    [WB_CACHE_DAT_WIDTH-1:0]    wb_cache_dat_i,
            output  wire    [WB_CACHE_DAT_WIDTH-1:0]    wb_cache_dat_o,
            output  wire                                wb_cache_we_o,
            output  wire    [WB_CACHE_SEL_WIDTH-1:0]    wb_cache_sel_o,
            output  wire                                wb_cache_stb_o,
            input   wire                                wb_cache_ack_i,
            
            // WISHBONE peripheral bus (non-cached)
            output  wire    [WB_THROUGH_ADR_WIDTH-1:0]  wb_through_adr_o,
            input   wire    [WB_THROUGH_DAT_WIDTH-1:0]  wb_through_dat_i,
            output  wire    [WB_THROUGH_DAT_WIDTH-1:0]  wb_through_dat_o,
            output  wire                                wb_through_we_o,
            output  wire    [WB_THROUGH_SEL_WIDTH-1:0]  wb_through_sel_o,
            output  wire                                wb_through_stb_o,
            input   wire                                wb_through_ack_i,
            
            // debug port (WISHBONE)
            input   wire    [5:2]                       wb_dbg_adr_i,
            input   wire    [31:0]                      wb_dbg_dat_i,
            output  wire    [31:0]                      wb_dbg_dat_o,
            input   wire                                wb_dbg_we_i,
            input   wire    [3:0]                       wb_dbg_sel_i,
            input   wire                                wb_dbg_stb_i,
            output  wire                                wb_dbg_ack_o,
            
            // pc trace
            output  wire                                trace_valid,
            output  wire    [31:0]                      trace_pc,
            output  wire    [31:0]                      trace_instruction
        );
    
    // internal cache bus width
    localparam  WB_CACHED_DAT_SIZE  = 2 + CACHE_LINE_SIZE;
    localparam  WB_CACHED_ADR_WIDTH = WB_CACHE_ADR_WIDTH + WB_CACHE_DAT_SIZE - WB_CACHED_DAT_SIZE;
    localparam  WB_CACHED_DAT_WIDTH = (8 << WB_CACHED_DAT_SIZE);
    localparam  WB_CACHED_SEL_WIDTH = (1 << WB_CACHED_DAT_SIZE);
    localparam  CACHE_ADDR_WIDTH    = WB_CACHED_ADR_WIDTH + WB_CACHED_DAT_SIZE - 2;
    
    
    // ---------------------------------
    //  CPU core
    // ---------------------------------
    
    // instruction bus
    wire                jbus_inst_en;
    wire    [31:2]      jbus_inst_addr;
    wire    [31:0]      jbus_inst_wdata;
    wire    [31:0]      jbus_inst_rdata;
    wire                jbus_inst_we;
    wire    [3:0]       jbus_inst_sel;
    wire                jbus_inst_valid;
    wire                jbus_inst_ready;
    
    // data bus
    wire                jbus_data_en;
    wire    [31:2]      jbus_data_addr;
    wire    [31:0]      jbus_data_wdata;
    wire    [31:0]      jbus_data_rdata;
    wire                jbus_data_we;
    wire    [3:0]       jbus_data_sel;
    wire                jbus_data_valid;
    wire                jbus_data_ready;
    
    // CPU core
    jelly_cpu_core
            #(
                .USE_DBUGGER        (CPU_USE_DBUGGER),
                .USE_EXC_SYSCALL    (CPU_USE_EXC_SYSCALL),
                .USE_EXC_BREAK      (CPU_USE_EXC_BREAK),
                .USE_EXC_RI         (CPU_USE_EXC_RI),
                .USE_HW_BP          (CPU_USE_HW_BP),
                .GPR_TYPE           (CPU_GPR_TYPE),
                .MUL_CYCLE          (CPU_MUL_CYCLE),
                .DBBP_NUM           (CPU_DBBP_NUM),
                .SIMULATION         (SIMULATION)
            )
        i_cpu_core
            (
                .reset              (reset),
                .clk                (clk),
                .clk_x2             (clk_x2),
                
                .endian             (endian),
                
                .vect_reset         (vect_reset),
                .vect_interrupt     (vect_interrupt),
                .vect_exception     (vect_exception),
                
                .interrupt_req      (interrupt_req),
                .interrupt_ack      (interrupt_ack),

                .pause              (pause),
                
                .jbus_inst_en       (jbus_inst_en),
                .jbus_inst_addr     (jbus_inst_addr),
                .jbus_inst_wdata    (jbus_inst_wdata),
                .jbus_inst_rdata    (jbus_inst_rdata),
                .jbus_inst_we       (jbus_inst_we),
                .jbus_inst_sel      (jbus_inst_sel),
                .jbus_inst_valid    (jbus_inst_valid),
                .jbus_inst_ready    (jbus_inst_ready),
                
                .jbus_data_en       (jbus_data_en),
                .jbus_data_addr     (jbus_data_addr),
                .jbus_data_wdata    (jbus_data_wdata),
                .jbus_data_rdata    (jbus_data_rdata),
                .jbus_data_we       (jbus_data_we),
                .jbus_data_sel      (jbus_data_sel),
                .jbus_data_valid    (jbus_data_valid),
                .jbus_data_ready    (jbus_data_ready),
                
                .wb_dbg_adr_i       (wb_dbg_adr_i),
                .wb_dbg_dat_i       (wb_dbg_dat_i),
                .wb_dbg_dat_o       (wb_dbg_dat_o),
                .wb_dbg_we_i        (wb_dbg_we_i),
                .wb_dbg_sel_i       (wb_dbg_sel_i),
                .wb_dbg_stb_i       (wb_dbg_stb_i),
                .wb_dbg_ack_o       (wb_dbg_ack_o),

                .trace_valid        (trace_valid),
                .trace_pc           (trace_pc),
                .trace_instruction  (trace_instruction)
            );                     
    
    
    
    // ---------------------------------
    //  Tightly Coupled Memory
    // ---------------------------------

    // non-TCM instruction bus
    wire                jbus_inst0_en;
    wire    [31:2]      jbus_inst0_addr;
    wire    [31:0]      jbus_inst0_wdata;
    wire    [31:0]      jbus_inst0_rdata;
    wire                jbus_inst0_we;
    wire    [3:0]       jbus_inst0_sel;
    wire                jbus_inst0_valid;
    wire                jbus_inst0_ready;
    
    // non-TCM data bus
    wire                jbus_data0_en;
    wire    [31:2]      jbus_data0_addr;
    wire    [31:0]      jbus_data0_wdata;
    wire    [31:0]      jbus_data0_rdata;
    wire                jbus_data0_we;
    wire    [3:0]       jbus_data0_sel;
    wire                jbus_data0_valid;
    wire                jbus_data0_ready;
    
    generate
    if ( TCM_ENABLE ) begin
        // TCM instruction bus
        wire                            jbus_itcm_en;
        wire    [TCM_ADDR_WIDTH-1:0]    jbus_itcm_addr;
        wire    [31:0]                  jbus_itcm_wdata;
        wire    [31:0]                  jbus_itcm_rdata;
        wire                            jbus_itcm_we;
        wire    [3:0]                   jbus_itcm_sel;
        wire                            jbus_itcm_valid;
        wire                            jbus_itcm_ready;
    
        // TCM data bus
        wire                            jbus_dtcm_en;
        wire    [TCM_ADDR_WIDTH-1:0]    jbus_dtcm_addr;
        wire    [31:0]                  jbus_dtcm_wdata;
        wire    [31:0]                  jbus_dtcm_rdata;
        wire                            jbus_dtcm_we;
        wire    [3:0]                   jbus_dtcm_sel;
        wire                            jbus_dtcm_valid;
        wire                            jbus_dtcm_ready;
        
        // instructuon address decode
        jelly_jbus_decoder
                #(
                    .SLAVE_ADDR_WIDTH       (30),
                    .SLAVE_DATA_SIZE        (2),    // 0:8bit, 1:16bit, 2:32bit ...
                    .DEC_ADDR_WIDTH         (TCM_ADDR_WIDTH)
                )
            i_jbus_decoder_tcm_inst
                (
                    .reset                  (reset),
                    .clk                    (clk),
                    
                    .addr_mask              (tcm_addr_mask[31:2]),
                    .addr_value             (tcm_addr_value[31:2]),
                    
                    .s_jbus_en              (jbus_inst_en),
                    .s_jbus_addr            (jbus_inst_addr),
                    .s_jbus_wdata           (jbus_inst_wdata),
                    .s_jbus_rdata           (jbus_inst_rdata),
                    .s_jbus_we              (jbus_inst_we),
                    .s_jbus_sel             (jbus_inst_sel),
                    .s_jbus_valid           (jbus_inst_valid),
                    .s_jbus_ready           (jbus_inst_ready),
                    
                    .m_jbus_en              (jbus_inst0_en),
                    .m_jbus_addr            (jbus_inst0_addr),
                    .m_jbus_wdata           (jbus_inst0_wdata),
                    .m_jbus_rdata           (jbus_inst0_rdata),
                    .m_jbus_we              (jbus_inst0_we),
                    .m_jbus_sel             (jbus_inst0_sel),
                    .m_jbus_valid           (jbus_inst0_valid),
                    .m_jbus_ready           (jbus_inst0_ready),
                    
                    .m_jbus_decode_en       (jbus_itcm_en),
                    .m_jbus_decode_addr     (jbus_itcm_addr),
                    .m_jbus_decode_wdata    (jbus_itcm_wdata),
                    .m_jbus_decode_rdata    (jbus_itcm_rdata),
                    .m_jbus_decode_we       (jbus_itcm_we),
                    .m_jbus_decode_sel      (jbus_itcm_sel),
                    .m_jbus_decode_valid    (jbus_itcm_valid),
                    .m_jbus_decode_ready    (jbus_itcm_ready)
                );
        
        // data address decode
        jelly_jbus_decoder
                #(
                    .SLAVE_ADDR_WIDTH       (30),
                    .SLAVE_DATA_SIZE        (2),    // 0:8bit, 1:16bit, 2:32bit ...
                    .DEC_ADDR_WIDTH         (TCM_ADDR_WIDTH)
                )
            i_jbus_decoder_tcm_data
                (
                    .reset                  (reset),
                    .clk                    (clk),

                    .addr_mask              (tcm_addr_mask[31:2]),
                    .addr_value             (tcm_addr_value[31:2]),
                    
                    .s_jbus_en              (jbus_data_en),
                    .s_jbus_addr            (jbus_data_addr),
                    .s_jbus_wdata           (jbus_data_wdata),
                    .s_jbus_rdata           (jbus_data_rdata),
                    .s_jbus_we              (jbus_data_we),
                    .s_jbus_sel             (jbus_data_sel),
                    .s_jbus_valid           (jbus_data_valid),
                    .s_jbus_ready           (jbus_data_ready),
                    
                    .m_jbus_en              (jbus_data0_en),
                    .m_jbus_addr            (jbus_data0_addr),
                    .m_jbus_wdata           (jbus_data0_wdata),
                    .m_jbus_rdata           (jbus_data0_rdata),
                    .m_jbus_we              (jbus_data0_we),
                    .m_jbus_sel             (jbus_data0_sel),
                    .m_jbus_valid           (jbus_data0_valid),
                    .m_jbus_ready           (jbus_data0_ready),
                    
                    .m_jbus_decode_en       (jbus_dtcm_en),
                    .m_jbus_decode_addr     (jbus_dtcm_addr),
                    .m_jbus_decode_wdata    (jbus_dtcm_wdata),
                    .m_jbus_decode_rdata    (jbus_dtcm_rdata),
                    .m_jbus_decode_we       (jbus_dtcm_we),
                    .m_jbus_decode_sel      (jbus_dtcm_sel),
                    .m_jbus_decode_valid    (jbus_dtcm_valid),
                    .m_jbus_decode_ready    (jbus_dtcm_ready)
                );
        
        
        wire                            ram_itcm_en;
        wire                            ram_itcm_we;
        wire    [TCM_ADDR_WIDTH-1:0]    ram_itcm_addr;
        wire    [31:0]                  ram_itcm_wdata;
        wire    [31:0]                  ram_itcm_rdata;

        wire                            ram_dtcm_en;
        wire                            ram_dtcm_we;
        wire    [TCM_ADDR_WIDTH-1:0]    ram_dtcm_addr;
        wire    [31:0]                  ram_dtcm_wdata;
        wire    [31:0]                  ram_dtcm_rdata;
        
        jelly_jbus_to_ram
                #(
                    .ADDR_WIDTH         (TCM_ADDR_WIDTH),
                    .DATA_WIDTH         (32)
                )
            i_jbus_to_ram_inst
                (
                    .reset              (reset),
                    .clk                (clk),
                    
                    .s_jbus_en          (jbus_itcm_en),
                    .s_jbus_addr        (jbus_itcm_addr),
                    .s_jbus_wdata       (jbus_itcm_wdata),
                    .s_jbus_rdata       (jbus_itcm_rdata),
                    .s_jbus_we          (jbus_itcm_we),
                    .s_jbus_sel         (jbus_itcm_sel),
                    .s_jbus_valid       (jbus_itcm_valid),
                    .s_jbus_ready       (jbus_itcm_ready),
                    
                    .m_ram_en           (ram_itcm_en),
                    .m_ram_we           (ram_itcm_we),
                    .m_ram_addr         (ram_itcm_addr),
                    .m_ram_wdata        (ram_itcm_wdata),
                    .m_ram_rdata        (ram_itcm_rdata)
                );                     

        jelly_jbus_to_ram
                #(
                    .ADDR_WIDTH         (TCM_ADDR_WIDTH),
                    .DATA_WIDTH         (32)
                )
            i_jbus_to_ram_data
                (
                    .reset              (reset),
                    .clk                (clk),
                    
                    .s_jbus_en          (jbus_dtcm_en),
                    .s_jbus_addr        (jbus_dtcm_addr),
                    .s_jbus_wdata       (jbus_dtcm_wdata),
                    .s_jbus_rdata       (jbus_dtcm_rdata),
                    .s_jbus_we          (jbus_dtcm_we),
                    .s_jbus_sel         (jbus_dtcm_sel),
                    .s_jbus_valid       (jbus_dtcm_valid),
                    .s_jbus_ready       (jbus_dtcm_ready),
                    
                    .m_ram_en           (ram_dtcm_en),
                    .m_ram_we           (ram_dtcm_we),
                    .m_ram_addr         (ram_dtcm_addr),
                    .m_ram_wdata        (ram_dtcm_wdata),
                    .m_ram_rdata        (ram_dtcm_rdata)
                );                     
        
        jelly_ram_dualport
                #(
                    .ADDR_WIDTH         (TCM_ADDR_WIDTH),
                    .DATA_WIDTH         (32),
                    .READMEMH           (TCM_READMEMH),
                    .READMEM_FIlE       (TCM_READMEM_FIlE)
                )
            i_ram_dualport_tcm
                (
                    .clk0               (clk),
                    .en0                (ram_itcm_en),
                    .we0                (ram_itcm_we),
                    .addr0              (ram_itcm_addr),
                    .din0               (ram_itcm_wdata),
                    .dout0              (ram_itcm_rdata),
                    
                    .clk1               (clk),
                    .en1                (ram_dtcm_en),
                    .we1                (ram_dtcm_we),
                    .addr1              (ram_dtcm_addr),
                    .din1               (ram_dtcm_wdata),
                    .dout1              (ram_dtcm_rdata)
                );                     
    end
    else begin
        assign jbus_inst0_en    = jbus_inst_en;
        assign jbus_inst0_addr  = jbus_inst_addr;
        assign jbus_inst0_wdata = jbus_inst_wdata;
        assign jbus_inst_rdata  = jbus_inst0_rdata;
        assign jbus_inst0_we    = jbus_inst_we;
        assign jbus_inst0_sel   = jbus_inst_sel;
        assign jbus_inst0_valid = jbus_inst_valid;
        assign jbus_inst_ready  = jbus_inst0_ready;
        
        assign jbus_data0_en    = jbus_data_en;
        assign jbus_data0_addr  = jbus_data_addr;
        assign jbus_data0_wdata = jbus_data_wdata;
        assign jbus_data_rdata  = jbus_data0_rdata;
        assign jbus_data0_we    = jbus_data_we;
        assign jbus_data0_sel   = jbus_data_sel;
        assign jbus_data0_valid = jbus_data_valid;
        assign jbus_data_ready  = jbus_data0_ready;
    end
    endgenerate
    
    
    
    // ---------------------------------
    // L1 Cache
    // ---------------------------------
    
    // non-Cacheinstruction bus
    wire                jbus_inst1_en;
    wire    [31:2]      jbus_inst1_addr;
    wire    [31:0]      jbus_inst1_wdata;
    wire    [31:0]      jbus_inst1_rdata;
    wire                jbus_inst1_we;
    wire    [3:0]       jbus_inst1_sel;
    wire                jbus_inst1_valid;
    wire                jbus_inst1_ready;
    
    // non-Cache data bus
    wire                jbus_data1_en;
    wire    [31:2]      jbus_data1_addr;
    wire    [31:0]      jbus_data1_wdata;
    wire    [31:0]      jbus_data1_rdata;
    wire                jbus_data1_we;
    wire    [3:0]       jbus_data1_sel;
    wire                jbus_data1_valid;
    wire                jbus_data1_ready;
    
    generate
    if ( CACHE_ENABLE ) begin
        // Cache instruction bus
        wire                            jbus_icache_en;
        wire    [CACHE_ADDR_WIDTH-1:0]  jbus_icache_addr;
        wire    [31:0]                  jbus_icache_wdata;
        wire    [31:0]                  jbus_icache_rdata;
        wire                            jbus_icache_we;
        wire    [3:0]                   jbus_icache_sel;
        wire                            jbus_icache_valid;
        wire                            jbus_icache_ready;
        
        // Cache data bus
        wire                            jbus_dcache_en;
        wire    [CACHE_ADDR_WIDTH-1:0]  jbus_dcache_addr;
        wire    [31:0]                  jbus_dcache_wdata;
        wire    [31:0]                  jbus_dcache_rdata;
        wire                            jbus_dcache_we;
        wire    [3:0]                   jbus_dcache_sel;
        wire                            jbus_dcache_valid;
        wire                            jbus_dcache_ready;
        
        // instructuon address decode
        jelly_jbus_decoder
                #(
                    .SLAVE_ADDR_WIDTH       (30),
                    .SLAVE_DATA_SIZE        (2),    // 0:8bit, 1:16bit, 2:32bit ...
                    .DEC_ADDR_WIDTH         (CACHE_ADDR_WIDTH)
                )
            i_jbus_decoder_cache_inst
                (
                    .reset                  (reset),
                    .clk                    (clk),

                    .addr_mask              (cache_addr_mask[31:2]),
                    .addr_value             (cache_addr_value[31:2]),
                    
                    .s_jbus_en              (jbus_inst0_en),
                    .s_jbus_addr            (jbus_inst0_addr),
                    .s_jbus_wdata           (jbus_inst0_wdata),
                    .s_jbus_rdata           (jbus_inst0_rdata),
                    .s_jbus_we              (jbus_inst0_we),
                    .s_jbus_sel             (jbus_inst0_sel),
                    .s_jbus_valid           (jbus_inst0_valid),
                    .s_jbus_ready           (jbus_inst0_ready),
                    
                    .m_jbus_en              (jbus_inst1_en),
                    .m_jbus_addr            (jbus_inst1_addr),
                    .m_jbus_wdata           (jbus_inst1_wdata),
                    .m_jbus_rdata           (jbus_inst1_rdata),
                    .m_jbus_we              (jbus_inst1_we),
                    .m_jbus_sel             (jbus_inst1_sel),
                    .m_jbus_valid           (jbus_inst1_valid),
                    .m_jbus_ready           (jbus_inst1_ready),
                    
                    .m_jbus_decode_en       (jbus_icache_en),
                    .m_jbus_decode_addr     (jbus_icache_addr),
                    .m_jbus_decode_wdata    (jbus_icache_wdata),
                    .m_jbus_decode_rdata    (jbus_icache_rdata),
                    .m_jbus_decode_we       (jbus_icache_we),
                    .m_jbus_decode_sel      (jbus_icache_sel),
                    .m_jbus_decode_valid    (jbus_icache_valid),
                    .m_jbus_decode_ready    (jbus_icache_ready)
                );
        
        // data address decode
        jelly_jbus_decoder
                #(
                    .SLAVE_ADDR_WIDTH       (30),
                    .SLAVE_DATA_SIZE        (2),    // 0:8bit, 1:16bit, 2:32bit ...
                    .DEC_ADDR_WIDTH         (CACHE_ADDR_WIDTH)
                )
            i_jbus_decoder_data
                (
                    .reset                  (reset),
                    .clk                    (clk),

                    .addr_mask              (cache_addr_mask[31:2]),
                    .addr_value             (cache_addr_value[31:2]),
                    
                    .s_jbus_en              (jbus_data0_en),
                    .s_jbus_addr            (jbus_data0_addr),
                    .s_jbus_wdata           (jbus_data0_wdata),
                    .s_jbus_rdata           (jbus_data0_rdata),
                    .s_jbus_we              (jbus_data0_we),
                    .s_jbus_sel             (jbus_data0_sel),
                    .s_jbus_valid           (jbus_data0_valid),
                    .s_jbus_ready           (jbus_data0_ready),
                                       
                    .m_jbus_en              (jbus_data1_en),
                    .m_jbus_addr            (jbus_data1_addr),
                    .m_jbus_wdata           (jbus_data1_wdata),
                    .m_jbus_rdata           (jbus_data1_rdata),
                    .m_jbus_we              (jbus_data1_we),
                    .m_jbus_sel             (jbus_data1_sel),
                    .m_jbus_valid           (jbus_data1_valid),
                    .m_jbus_ready           (jbus_data1_ready),
                                              
                    .m_jbus_decode_en       (jbus_dcache_en),
                    .m_jbus_decode_addr     (jbus_dcache_addr),
                    .m_jbus_decode_wdata    (jbus_dcache_wdata),
                    .m_jbus_decode_rdata    (jbus_dcache_rdata),
                    .m_jbus_decode_we       (jbus_dcache_we),
                    .m_jbus_decode_sel      (jbus_dcache_sel),
                    .m_jbus_decode_valid    (jbus_dcache_valid),
                    .m_jbus_decode_ready    (jbus_dcache_ready)
                );
        
        
        // Cache
        wire    [WB_CACHED_ADR_WIDTH-1:0]   wb_cached_adr_o;
        wire    [WB_CACHED_DAT_WIDTH-1:0]   wb_cached_dat_i;
        wire    [WB_CACHED_DAT_WIDTH-1:0]   wb_cached_dat_o;
        wire                                wb_cached_we_o;
        wire    [WB_CACHED_SEL_WIDTH-1:0]   wb_cached_sel_o;
        wire                                wb_cached_stb_o;
        wire                                wb_cached_ack_i;
        
        jelly_cache_unified
                #(
                    .LINE_SIZE          (CACHE_LINE_SIZE),      // 2^n (0:1words, 1:2words, 2:4words ...)
                    .ARRAY_SIZE         (CACHE_ARRAY_SIZE),     // 2^n (1:2lines, 2:4lines 3:8lines ...)
                    .SLAVE_ADDR_WIDTH   (CACHE_ADDR_WIDTH),
                    .SLAVE_DATA_SIZE    (2)                     // 2^n (0:8bit, 1:16bit, 2:32bit ...)
                )
            i_cache_unified
                (
                    .reset              (reset),
                    .clk                (clk),
                    
                    .endian             (endian),
                    
                    .s_jbus0_en         (jbus_icache_en),
                    .s_jbus0_addr       (jbus_icache_addr),
                    .s_jbus0_wdata      (jbus_icache_wdata),
                    .s_jbus0_rdata      (jbus_icache_rdata),
                    .s_jbus0_we         (jbus_icache_we),
                    .s_jbus0_sel        (jbus_icache_sel),
                    .s_jbus0_valid      (jbus_icache_valid),
                    .s_jbus0_ready      (jbus_icache_ready),
                    
                    .s_jbus1_en         (jbus_dcache_en),
                    .s_jbus1_addr       (jbus_dcache_addr),
                    .s_jbus1_wdata      (jbus_dcache_wdata),
                    .s_jbus1_rdata      (jbus_dcache_rdata),
                    .s_jbus1_we         (jbus_dcache_we),
                    .s_jbus1_sel        (jbus_dcache_sel),
                    .s_jbus1_valid      (jbus_dcache_valid),
                    .s_jbus1_ready      (jbus_dcache_ready),
                    
                    .m_wb_adr_o         (wb_cached_adr_o),
                    .m_wb_dat_i         (wb_cached_dat_i),
                    .m_wb_dat_o         (wb_cached_dat_o),
                    .m_wb_we_o          (wb_cached_we_o),
                    .m_wb_sel_o         (wb_cached_sel_o),
                    .m_wb_stb_o         (wb_cached_stb_o),
                    .m_wb_ack_i         (wb_cached_ack_i)
                );
        
        // width convert
        wire    [WB_CACHE_ADR_WIDTH-1:0]    wb_cache0_adr_o;
        wire    [WB_CACHE_DAT_WIDTH-1:0]    wb_cache0_dat_i;
        wire    [WB_CACHE_DAT_WIDTH-1:0]    wb_cache0_dat_o;
        wire                                wb_cache0_we_o;
        wire    [WB_CACHE_SEL_WIDTH-1:0]    wb_cache0_sel_o;
        wire                                wb_cache0_stb_o;
        wire                                wb_cache0_ack_i;
        
        jelly_wishbone_width_converter
                #(
                    .S_WB_ADR_WIDTH (WB_CACHED_ADR_WIDTH),
                    .S_WB_DAT_SIZE  (WB_CACHED_DAT_SIZE),
                    .M_WB_DAT_SIZE  (WB_CACHE_DAT_SIZE)
                )
            i_wishbone_width_converter_cache
                (
                    .reset              (reset),
                    .clk                (clk),
                    
                    .endian             (endian),
                    
                    .s_wb_adr_i         (wb_cached_adr_o),
                    .s_wb_dat_o         (wb_cached_dat_i),
                    .s_wb_dat_i         (wb_cached_dat_o),
                    .s_wb_we_i          (wb_cached_we_o),
                    .s_wb_sel_i         (wb_cached_sel_o),
                    .s_wb_stb_i         (wb_cached_stb_o),
                    .s_wb_ack_o         (wb_cached_ack_i),
                    
                    .m_wb_adr_o         (wb_cache0_adr_o),
                    .m_wb_dat_o         (wb_cache0_dat_o),
                    .m_wb_dat_i         (wb_cache0_dat_i),
                    .m_wb_we_o          (wb_cache0_we_o),
                    .m_wb_sel_o         (wb_cache0_sel_o),
                    .m_wb_stb_o         (wb_cache0_stb_o),
                    .m_wb_ack_i         (wb_cache0_ack_i)
                );
        
        // bridge
        jelly_wishbone_bridge
                #(
                    .WB_ADR_WIDTH       (WB_CACHE_ADR_WIDTH),
                    .WB_DAT_WIDTH       (WB_CACHE_DAT_WIDTH),
                    .THROUGH            (!CACHE_BRIDGE)
                )
            i_wishbone_bridge_cache
                (
                    .reset              (reset),
                    .clk                (clk),
                    
                    .s_wb_adr_i         (wb_cache0_adr_o),
                    .s_wb_dat_o         (wb_cache0_dat_i),
                    .s_wb_dat_i         (wb_cache0_dat_o),
                    .s_wb_we_i          (wb_cache0_we_o),
                    .s_wb_sel_i         (wb_cache0_sel_o),
                    .s_wb_stb_i         (wb_cache0_stb_o),
                    .s_wb_ack_o         (wb_cache0_ack_i),
                    
                    .m_wb_adr_o         (wb_cache_adr_o),
                    .m_wb_dat_i         (wb_cache_dat_i),
                    .m_wb_dat_o         (wb_cache_dat_o),
                    .m_wb_we_o          (wb_cache_we_o),
                    .m_wb_sel_o         (wb_cache_sel_o),
                    .m_wb_stb_o         (wb_cache_stb_o),
                    .m_wb_ack_i         (wb_cache_ack_i)
                );
    end
    else begin
        assign jbus_inst1_en    = jbus_inst0_en;
        assign jbus_inst1_addr  = jbus_inst0_addr;
        assign jbus_inst1_wdata = jbus_inst0_wdata;
        assign jbus_inst0_rdata = jbus_inst1_rdata;
        assign jbus_inst1_we    = jbus_inst0_we;
        assign jbus_inst1_sel   = jbus_inst0_sel;
        assign jbus_inst1_valid = jbus_inst0_valid;
        assign jbus_inst0_ready = jbus_inst1_ready;
        
        assign jbus_data1_en    = jbus_data0_en;
        assign jbus_data1_addr  = jbus_data0_addr;
        assign jbus_data1_wdata = jbus_data0_wdata;
        assign jbus_data0_rdata = jbus_data1_rdata;
        assign jbus_data1_we    = jbus_data0_we;
        assign jbus_data1_sel   = jbus_data0_sel;
        assign jbus_data1_valid = jbus_data0_valid;
        assign jbus_data0_ready = jbus_data1_ready;
        
        assign wb_cache_adr_o   = {WB_CACHE_ADR_WIDTH{1'b0}};
        assign wb_cache_dat_o   = {WB_CACHE_DAT_WIDTH{1'b0}}; 
        assign wb_cache_we_o    = 1'b0;
        assign wb_cache_sel_o   = {WB_CACHE_SEL_WIDTH{1'b0}};
        assign wb_cache_stb_o   = 1'b0;
    end
    endgenerate
    
    
    // ---------------------------------
    //  non-cache
    // ---------------------------------
    
    wire    [31:2]              wb_ithrough_adr_o;
    wire    [31:0]              wb_ithrough_dat_i;
    wire    [31:0]              wb_ithrough_dat_o;
    wire                        wb_ithrough_we_o;
    wire    [3:0]               wb_ithrough_sel_o;
    wire                        wb_ithrough_stb_o;
    wire                        wb_ithrough_ack_i;

    wire    [31:2]              wb_dthrough_adr_o;
    wire    [31:0]              wb_dthrough_dat_i;
    wire    [31:0]              wb_dthrough_dat_o;
    wire                        wb_dthrough_we_o;
    wire    [3:0]               wb_dthrough_sel_o;
    wire                        wb_dthrough_stb_o;
    wire                        wb_dthrough_ack_i;
    
    jelly_jbus_to_wishbone
            #(
                .ADDR_WIDTH         (30),
                .DATA_SIZE          (2)     // 0:8bit, 1:16bit, 2:32bit ...
            )
        i_jbus_to_wishbone_peri_inst
            (
                .reset              (reset),
                .clk                (clk),
                
                .s_jbus_en          (jbus_inst1_en),
                .s_jbus_addr        (jbus_inst1_addr),
                .s_jbus_wdata       (jbus_inst1_wdata),
                .s_jbus_rdata       (jbus_inst1_rdata),
                .s_jbus_we          (jbus_inst1_we),
                .s_jbus_sel         (jbus_inst1_sel),
                .s_jbus_valid       (jbus_inst1_valid),
                .s_jbus_ready       (jbus_inst1_ready),
                
                .m_wb_adr_o         (wb_ithrough_adr_o),
                .m_wb_dat_i         (wb_ithrough_dat_i),
                .m_wb_dat_o         (wb_ithrough_dat_o),
                .m_wb_we_o          (wb_ithrough_we_o),
                .m_wb_sel_o         (wb_ithrough_sel_o),
                .m_wb_stb_o         (wb_ithrough_stb_o),
                .m_wb_ack_i         (wb_ithrough_ack_i)
            );
    
    jelly_jbus_to_wishbone
            #(
                .ADDR_WIDTH         (30),
                .DATA_SIZE          (2)     // 0:8bit, 1:16bit, 2:32bit ...
            )
        i_jbus_to_wishbone_peri_data
            (
                .reset              (reset),
                .clk                (clk),
                
                .s_jbus_en          (jbus_data1_en),
                .s_jbus_addr        (jbus_data1_addr),
                .s_jbus_wdata       (jbus_data1_wdata),
                .s_jbus_rdata       (jbus_data1_rdata),
                .s_jbus_we          (jbus_data1_we),
                .s_jbus_sel         (jbus_data1_sel),
                .s_jbus_valid       (jbus_data1_valid),
                .s_jbus_ready       (jbus_data1_ready),
                
                .m_wb_adr_o         (wb_dthrough_adr_o),
                .m_wb_dat_i         (wb_dthrough_dat_i),
                .m_wb_dat_o         (wb_dthrough_dat_o),
                .m_wb_we_o          (wb_dthrough_we_o),
                .m_wb_sel_o         (wb_dthrough_sel_o),
                .m_wb_stb_o         (wb_dthrough_stb_o),
                .m_wb_ack_i         (wb_dthrough_ack_i)
            );
    
    // arbiter
    wire    [31:2]              wb_through0_adr_o;
    wire    [31:0]              wb_through0_dat_i;
    wire    [31:0]              wb_through0_dat_o;
    wire                        wb_through0_we_o;
    wire    [3:0]               wb_through0_sel_o;
    wire                        wb_through0_stb_o;
    wire                        wb_through0_ack_i;

    jelly_wishbone_arbiter
            #(
                .WB_ADR_WIDTH       (30),
                .WB_DAT_WIDTH       (32)
            )
        i_wishbone_arbiter_through
            (
                .reset              (reset),
                .clk                (clk),
                
                .s_wb0_adr_i        (wb_ithrough_adr_o),
                .s_wb0_dat_i        (wb_ithrough_dat_o),
                .s_wb0_dat_o        (wb_ithrough_dat_i),
                .s_wb0_we_i         (wb_ithrough_we_o),
                .s_wb0_sel_i        (wb_ithrough_sel_o),
                .s_wb0_stb_i        (wb_ithrough_stb_o),
                .s_wb0_ack_o        (wb_ithrough_ack_i),
                
                .s_wb1_adr_i        (wb_dthrough_adr_o),
                .s_wb1_dat_i        (wb_dthrough_dat_o),
                .s_wb1_dat_o        (wb_dthrough_dat_i),
                .s_wb1_we_i         (wb_dthrough_we_o),
                .s_wb1_sel_i        (wb_dthrough_sel_o),
                .s_wb1_stb_i        (wb_dthrough_stb_o),
                .s_wb1_ack_o        (wb_dthrough_ack_i),
                
                .m_wb_adr_o         (wb_through0_adr_o),
                .m_wb_dat_i         (wb_through0_dat_i),
                .m_wb_dat_o         (wb_through0_dat_o),
                .m_wb_we_o          (wb_through0_we_o),
                .m_wb_sel_o         (wb_through0_sel_o),
                .m_wb_stb_o         (wb_through0_stb_o),
                .m_wb_ack_i         (wb_through0_ack_i)
            );
    
    
    // width convert
    wire    [31:WB_THROUGH_DAT_SIZE]    wb_through1_adr_o;
    wire    [WB_THROUGH_DAT_WIDTH-1:0]  wb_through1_dat_o;
    wire    [WB_THROUGH_DAT_WIDTH-1:0]  wb_through1_dat_i;
    wire                                wb_through1_we_o;
    wire    [WB_THROUGH_SEL_WIDTH-1:0]  wb_through1_sel_o;
    wire                                wb_through1_stb_o;
    wire                                wb_through1_ack_i;
    
    jelly_wishbone_width_converter
            #(
                .S_WB_ADR_WIDTH (30),
                .S_WB_DAT_SIZE  (2),
                .M_WB_DAT_SIZE  (WB_THROUGH_DAT_SIZE)
            )
        i_wishbone_width_converter_through
            (
                .reset              (reset),
                .clk                (clk),
                    
                .endian             (endian),
                
                .s_wb_adr_i         (wb_through0_adr_o),
                .s_wb_dat_o         (wb_through0_dat_i),
                .s_wb_dat_i         (wb_through0_dat_o),
                .s_wb_we_i          (wb_through0_we_o),
                .s_wb_sel_i         (wb_through0_sel_o),
                .s_wb_stb_i         (wb_through0_stb_o),
                .s_wb_ack_o         (wb_through0_ack_i),
                
                .m_wb_adr_o         (wb_through1_adr_o),
                .m_wb_dat_o         (wb_through1_dat_o),
                .m_wb_dat_i         (wb_through1_dat_i),
                .m_wb_we_o          (wb_through1_we_o),
                .m_wb_sel_o         (wb_through1_sel_o),
                .m_wb_stb_o         (wb_through1_stb_o),
                .m_wb_ack_i         (wb_through1_ack_i)
            );
    
    // bridge
    jelly_wishbone_bridge
            #(
                .WB_ADR_WIDTH       (WB_THROUGH_ADR_WIDTH),
                .WB_DAT_WIDTH       (WB_THROUGH_DAT_WIDTH),
                .THROUGH            (!THROUGH_BRIDGE)
            )
        i_wishbone_bridge_through
            (
                .reset              (reset),
                .clk                (clk),
                
                .s_wb_adr_i         (wb_through1_adr_o),
                .s_wb_dat_o         (wb_through1_dat_i),
                .s_wb_dat_i         (wb_through1_dat_o),
                .s_wb_we_i          (wb_through1_we_o),
                .s_wb_sel_i         (wb_through1_sel_o),
                .s_wb_stb_i         (wb_through1_stb_o),
                .s_wb_ack_o         (wb_through1_ack_i),
                
                .m_wb_adr_o         (wb_through_adr_o),
                .m_wb_dat_i         (wb_through_dat_i),
                .m_wb_dat_o         (wb_through_dat_o),
                .m_wb_we_o          (wb_through_we_o),
                .m_wb_sel_o         (wb_through_sel_o),
                .m_wb_stb_o         (wb_through_stb_o),
                .m_wb_ack_i         (wb_through_ack_i)
            );
    
endmodule



`default_nettype wire



// end of file
