// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//    MIPS like CPU core
//
//                                  Copyright (C) 2008-2010 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// CPU top
module jelly_cpu_simple_top
        #(
            // CPU core
            parameter   CPU_USE_DBUGGER     = 0,
            parameter   CPU_USE_EXC_SYSCALL = 1,
            parameter   CPU_USE_EXC_BREAK   = 1,
            parameter   CPU_USE_EXC_RI      = 1,
            parameter   CPU_GPR_TYPE        = 0,
            parameter   CPU_MUL_CYCLE       = 33,
            parameter   CPU_DBBP_NUM        = 4,
            
            // Tightly Coupled Memory
            parameter   TCM_ENABLE       = 0,
            parameter   TCM_ADDR_MASK    = 32'b1111_1111_1111_1111__1111_1100_0000_0000,
            parameter   TCM_ADDR_VALUE   = 32'b0000_0000_0000_0000__0000_0000_0000_0000,
            parameter   TCM_ADDR_WIDTH   = 8,
            parameter   TCM_MEM_SIZE     = (1 << TCM_ADDR_WIDTH),
            parameter   TCM_READMEMH     = 0,
            parameter   TCM_READMEM_FIlE = "",
            
            // simulation
            parameter   SIMULATION       = 0
        )
        (
            // system
            input   wire                reset,
            input   wire                clk,
            input   wire                clk_x2,
            
            // endian
            input   wire                endian,
            
            // vector
            input   wire    [31:0]      vect_reset,
            input   wire    [31:0]      vect_interrupt,
            input   wire    [31:0]      vect_exception,
            
            // interrupt
            input   wire                interrupt_req,
            output  wire                interrupt_ack,
            
            // control
            input   wire                pause,
            
            // bus (wishbone)
            output  wire    [31:2]      wb_adr_o,
            input   wire    [31:0]      wb_dat_i,
            output  wire    [31:0]      wb_dat_o,
            output  wire                wb_we_o,
            output  wire    [3:0]       wb_sel_o,
            output  wire                wb_stb_o,
            input   wire                wb_ack_i,
            
            // debug port (wishbone)
            input   wire    [3:0]       wb_dbg_adr_i,
            input   wire    [31:0]      wb_dbg_dat_i,
            output  wire    [31:0]      wb_dbg_dat_o,
            input   wire                wb_dbg_we_i,
            input   wire    [3:0]       wb_dbg_sel_i,
            input   wire                wb_dbg_stb_i,
            output  wire                wb_dbg_ack_o,
            
            // pc trace
            output  wire                trace_valid,
            output  wire    [31:0]      trace_pc,
            output  wire    [31:0]      trace_instruction
        );
    
    
    // ---------------------------------
    //  CPU core
    // ---------------------------------
    
    jelly_cpu_top
            #(
                .CPU_USE_DBUGGER    (CPU_USE_DBUGGER),
                .CPU_USE_EXC_SYSCALL(CPU_USE_EXC_SYSCALL),
                .CPU_USE_EXC_BREAK  (CPU_USE_EXC_BREAK),
                .CPU_USE_EXC_RI     (CPU_USE_EXC_RI),
                .CPU_GPR_TYPE       (CPU_GPR_TYPE),
                .CPU_MUL_CYCLE      (CPU_MUL_CYCLE),
                .CPU_DBBP_NUM       (CPU_DBBP_NUM),
                
                .TCM_ENABLE         (TCM_ENABLE),
                .TCM_ADDR_WIDTH     (TCM_ADDR_WIDTH),
                .TCM_MEM_SIZE       (TCM_MEM_SIZE),
                .TCM_READMEMH       (TCM_READMEMH),
                .TCM_READMEM_FIlE   (TCM_READMEM_FIlE),
                
                .CACHE_ENABLE       (0),
                
                .SIMULATION         (SIMULATION)
            )
        i_cpu_top
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
                
                .tcm_addr_mask      (TCM_ADDR_MASK),
                .tcm_addr_value     (TCM_ADDR_VALUE),
                .cache_addr_mask    (32'h00000000),
                .cache_addr_value   (32'h00000000),
                
                .wb_cache_adr_o     (),
                .wb_cache_dat_i     ({64{1'b0}}),
                .wb_cache_dat_o     (),
                .wb_cache_we_o      (),
                .wb_cache_sel_o     (),
                .wb_cache_stb_o     (),
                .wb_cache_ack_i     (1'b1),
                   
                .wb_through_adr_o   (wb_adr_o),
                .wb_through_dat_i   (wb_dat_i),
                .wb_through_dat_o   (wb_dat_o),
                .wb_through_we_o    (wb_we_o),
                .wb_through_sel_o   (wb_sel_o),
                .wb_through_stb_o   (wb_stb_o),
                .wb_through_ack_i   (wb_ack_i),
                
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
    
endmodule



`default_nettype wire


// end of file
