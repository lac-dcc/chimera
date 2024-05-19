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


// CPU Core
module jelly_cpu_core
        #(
            parameter   USE_DBUGGER         = 1'b1,
            parameter   USE_INST_LSWLR      = 1'b1,
            parameter   USE_EXC_SYSCALL     = 1'b1,
            parameter   USE_EXC_BREAK       = 1'b1,
            parameter   USE_EXC_RI          = 1'b1,
            parameter   USE_HW_BP           = 1'b1,
            parameter   GPR_TYPE            = 0,
            parameter   MUL_CYCLE           = 0,
            parameter   DBBP_NUM            = 4,
            
            parameter   SIMULATION          = 0,
            parameter   SIM_TRACE_PC        = 1,
            parameter   SIM_TRACE_GPR       = 1,
            parameter   SIM_TRACE_DBUS      = 1,
            parameter   SIM_TRACE_PC_FILE   = "trace.txt",
            parameter   SIM_TRACE_GPR_FILE  = "trace.txt",
            parameter   SIM_TRACE_DBUS_FILE = "trace.txt"
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
            
            // instruction bus
            output  wire                jbus_inst_en,
            output  wire    [31:2]      jbus_inst_addr,
            output  wire    [31:0]      jbus_inst_wdata,
            input   wire    [31:0]      jbus_inst_rdata,
            output  wire                jbus_inst_we,
            output  wire    [3:0]       jbus_inst_sel,
            output  wire                jbus_inst_valid,
            input   wire                jbus_inst_ready,
            
            // data bus
            output  wire                jbus_data_en,
            output  wire    [31:2]      jbus_data_addr,
            output  wire    [31:0]      jbus_data_wdata,
            input   wire    [31:0]      jbus_data_rdata,
            output  wire                jbus_data_we,
            output  wire    [3:0]       jbus_data_sel,
            output  wire                jbus_data_valid,
            input   wire                jbus_data_ready,
            
            // debuger port (WISHBONE)
            input   wire    [5:2]       wb_dbg_adr_i,
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
    

    // -----------------------------
    //  Debugger signals
    // -----------------------------
    
    // debug status
    wire            dbg_enable;
    wire            dbg_break_req;
    wire            dbg_break;
    
    // i-bus control
    wire            dbg_jbus_inst_en;
    wire    [31:2]  dbg_jbus_inst_addr;
    wire    [31:0]  dbg_jbus_inst_wdata;
    wire    [31:0]  dbg_jbus_inst_rdata;
    wire            dbg_jbus_inst_we;
    wire    [3:0]   dbg_jbus_inst_sel;
    wire            dbg_jbus_inst_valid;
    wire            dbg_jbus_inst_ready;
    
    // d-bus control
    wire            dbg_jbus_data_en;
    wire    [31:2]  dbg_jbus_data_addr;
    wire    [31:0]  dbg_jbus_data_wdata;
    wire    [31:0]  dbg_jbus_data_rdata;
    wire            dbg_jbus_data_we;
    wire    [3:0]   dbg_jbus_data_sel;
    wire            dbg_jbus_data_valid;
    wire            dbg_jbus_data_ready;
    
    // gpr control
    wire            dbg_gpr_en;
    wire            dbg_gpr_we;
    wire    [4:0]   dbg_gpr_addr;
    wire    [31:0]  dbg_gpr_wdata;
    wire    [31:0]  dbg_gpr_rdata;
    
    // hi/lo control
    wire            dbg_hilo_en;
    wire            dbg_hilo_we;
    wire    [0:0]   dbg_hilo_addr;
    wire    [31:0]  dbg_hilo_wdata;
    wire    [31:0]  dbg_hilo_rdata;
    
    // cop0 control
    wire            dbg_cop0_en;
    wire            dbg_cop0_we;
    wire    [4:0]   dbg_cop0_addr;
    wire    [31:0]  dbg_cop0_wdata;
    wire    [31:0]  dbg_cop0_rdata;
    
    
    // hardware breakpoint
    wire    [31:0]  dbg_cop0_debug;
    wire    [31:0]  dbg_cop0_depc;

    wire    [31:0]  dbg_cop0_debp0;
    wire    [31:0]  dbg_cop0_debp1;
    wire    [31:0]  dbg_cop0_debp2;
    wire    [31:0]  dbg_cop0_debp3;
    
    
    
    // -----------------------------
    //  Instruction Fetch stage
    // -----------------------------

    wire            interlock;
    
    
    
    // -----------------------------
    //  Instruction Fetch stage
    // -----------------------------

    // IF stage input
    wire            if_in_stall;
    wire            if_in_branch_en;
    wire    [31:0]  if_in_branch_pc;
    wire    [31:0]  if_in_depc;
    
    // IF stage output
    wire            if_out_hazard;
    
    reg             if_out_stall;
    wire    [31:0]  if_out_instruction;
    reg     [31:0]  if_out_pc;
    
    
    // PC
    reg     [31:0]  if_pc;
    wire            if_branch;
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            if_pc <= vect_reset;
        end
        else begin
            if ( dbg_enable ) begin
                if_pc <= dbg_cop0_depc;
            end
            else if ( !interlock ) begin
                if_pc <= if_in_branch_en ? if_in_branch_pc : (if_pc + 4);
            end
        end
    end
    
    
    // load instruction
    assign jbus_inst_en        = dbg_jbus_inst_valid ? dbg_jbus_inst_en    : !interlock;
    assign jbus_inst_addr      = dbg_jbus_inst_valid ? dbg_jbus_inst_addr  : if_pc[31:2];
    assign jbus_inst_wdata     = dbg_jbus_inst_valid ? dbg_jbus_inst_wdata : {32{1'b0}};
    assign jbus_inst_we        = dbg_jbus_inst_valid ? dbg_jbus_inst_we    : 1'b0;
    assign jbus_inst_sel       = dbg_jbus_inst_valid ? dbg_jbus_inst_sel   : 4'b1111;
    assign jbus_inst_valid     = dbg_jbus_inst_valid ? dbg_jbus_inst_valid : !if_in_stall;
    
    assign if_out_instruction  = jbus_inst_rdata;
    assign if_out_hazard       = !jbus_inst_ready;
    
    assign dbg_jbus_inst_rdata = jbus_inst_rdata;
    assign dbg_jbus_inst_ready = jbus_inst_ready;
    
    
    // IF output
    always @ ( posedge clk ) begin
        if ( reset ) begin
            if_out_stall <= 1'b1;
            if_out_pc    <= 32'h00000000;
        end
        else begin
            if ( !interlock ) begin
                if_out_stall <= if_in_stall;
                if_out_pc    <= if_pc;
            end
        end
    end
    
    
    
    // -----------------------------
    //  Instruction Decode stage
    // -----------------------------
    
    // ID stage input
    wire            id_in_stall;
    
    wire            id_in_dst_reg_en;
    wire    [4:0]   id_in_dst_reg_addr;
    wire    [31:0]  id_in_dst_reg_data;
    
    
    // ID stage output
    reg             id_out_stall;
    reg             id_out_delay;
    reg     [31:0]  id_out_instruction;
    reg     [31:0]  id_out_pc;
    
    reg     [4:0]   id_out_rs_addr;
    reg     [4:0]   id_out_rt_addr;
    reg     [4:0]   id_out_rd_addr;
    reg     [31:0]  id_out_immediate_data;
    
    wire    [31:0]  id_out_rs_data;
    wire    [31:0]  id_out_rt_data;
    
    reg             id_out_branch_en;
    reg     [3:0]   id_out_branch_func;
    reg     [27:0]  id_out_branch_index;
    reg             id_out_branch_index_en;
    reg             id_out_branch_imm_en;
    reg             id_out_branch_rs_en;

    reg             id_out_alu_adder_en;
    reg     [1:0]   id_out_alu_adder_func;
    reg             id_out_alu_logic_en;
    reg     [1:0]   id_out_alu_logic_func;
    reg             id_out_alu_comp_en;
    reg     [1:0]   id_out_alu_comp_func;
    reg             id_out_alu_imm_en;

    reg             id_out_shifter_en;
    reg     [1:0]   id_out_shifter_func;
    reg             id_out_shifter_sa_en;
    reg     [4:0]   id_out_shifter_sa_data;

    reg             id_out_muldiv_en;
    reg             id_out_muldiv_mul;
    reg             id_out_muldiv_div;
    reg             id_out_muldiv_mthi;
    reg             id_out_muldiv_mtlo;
    reg             id_out_muldiv_mfhi;
    reg             id_out_muldiv_mflo;
    reg             id_out_muldiv_signed;

    reg             id_out_cop0_mfc0;
    reg             id_out_cop0_mtc0;
    reg             id_out_cop0_rfe;
    
    reg             id_out_exc_syscall;
    reg             id_out_exc_break;
    reg             id_out_exc_ri;

    reg             id_out_dbg_sdbbp;
    reg             id_out_dbg_break;
    
    reg             id_out_mem_en;
    reg             id_out_mem_we;
    reg     [1:0]   id_out_mem_size;
    reg             id_out_mem_unsigned;
                          
    reg             id_out_dst_reg_en;
    reg     [4:0]   id_out_dst_reg_addr;
    reg             id_out_dst_src_alu;
    reg             id_out_dst_src_shifter;
    reg             id_out_dst_src_mem;
    reg             id_out_dst_src_pc;
    reg             id_out_dst_src_hi;
    reg             id_out_dst_src_lo;
    reg             id_out_dst_src_cop0;
    
    
    // stall
    wire            id_stall;
    assign id_stall = if_out_stall | id_in_stall;


    // register file
    wire            if_gpr_write_en;
    wire    [4:0]   if_gpr_write_addr;
    wire    [31:0]  if_gpr_write_data;
    
    wire            if_gpr_read0_en;
    wire    [4:0]   if_gpr_read0_addr;
    wire    [31:0]  if_gpr_read0_data;
    
    wire            if_gpr_read1_en;
    wire    [4:0]   if_gpr_read1_addr;
    wire    [31:0]  if_gpr_read1_data;
    
    jelly_cpu_gpr
            #(
                .TYPE           (GPR_TYPE)
            )
        i_cpu_gpr
            (
                .reset          (reset),
                .clk            (clk),
                .clk_x2         (clk_x2),
                
                .write_en       (if_gpr_write_en & !interlock),
                .write_addr     (if_gpr_write_addr),
                .write_data     (if_gpr_write_data),
                
                .read0_en       (if_gpr_read0_en & !interlock),
                .read0_addr     (if_gpr_read0_addr),
                .read0_data     (if_gpr_read0_data),
                
                .read1_en       (if_gpr_read1_en & !interlock),
                .read1_addr     (if_gpr_read1_addr),
                .read1_data     (if_gpr_read1_data)
            );
    
    assign if_gpr_write_en   = dbg_gpr_en ? (dbg_gpr_en & dbg_gpr_we)  : (id_in_dst_reg_en & !interlock);
    assign if_gpr_write_addr = dbg_gpr_en ? dbg_gpr_addr               : id_in_dst_reg_addr;
    assign if_gpr_write_data = dbg_gpr_en ? dbg_gpr_wdata              : id_in_dst_reg_data;
    
    assign if_gpr_read0_en   = 1'b1;
    assign if_gpr_read0_addr = dbg_gpr_en ? dbg_gpr_addr               : if_out_instruction[25:21]; //rs
    assign id_out_rs_data    = if_gpr_read0_data;
    assign dbg_gpr_rdata     = if_gpr_read0_data;
    
    assign if_gpr_read1_en   = 1'b1;
    assign if_gpr_read1_addr = if_out_instruction[20:16];   // rt
    assign id_out_rt_data    = if_gpr_read1_data;
    
    
    // opecode decode
    wire    [4:0]   id_dec_rs_addr;
    wire    [4:0]   id_dec_rt_addr;
    wire    [4:0]   id_dec_rd_addr;
    wire    [31:0]  id_dec_immediate_data;
    
    wire            id_dec_branch_en;
    wire    [3:0]   id_dec_branch_func;
    wire    [27:0]  id_dec_branch_index;
    wire            id_dec_branch_index_en;
    wire            id_dec_branch_imm_en;
    wire            id_dec_branch_rs_en;
                
    wire            id_dec_alu_adder_en;
    wire    [1:0]   id_dec_alu_adder_func;
    wire            id_dec_alu_logic_en;
    wire    [1:0]   id_dec_alu_logic_func;
    wire            id_dec_alu_comp_en;
    wire            id_dec_alu_comp_func;
    wire            id_dec_alu_imm_en;

    wire            id_dec_shifter_en;
    wire    [1:0]   id_dec_shifter_func;
    wire            id_dec_shifter_sa_en;
    wire    [4:0]   id_dec_shifter_sa_data;
    
    wire            id_dec_muldiv_en;
    wire            id_dec_muldiv_mul;
    wire            id_dec_muldiv_div;
    wire            id_dec_muldiv_mthi;
    wire            id_dec_muldiv_mtlo;
    wire            id_dec_muldiv_mfhi;
    wire            id_dec_muldiv_mflo;
    wire            id_dec_muldiv_signed;
    
    wire            id_dec_cop0_mfc0;
    wire            id_dec_cop0_mtc0;
    wire            id_dec_cop0_rfe;
    
    wire            id_dec_exc_syscall;
    wire            id_dec_exc_break;
    wire            id_dec_exc_ri;

    wire            id_dec_dbg_sdbbp;
    
    wire            id_dec_mem_en;
    wire            id_dec_mem_we;
    wire    [1:0]   id_dec_mem_size;
    wire            id_dec_mem_unsigned;
                              
    wire            id_dec_dst_reg_en;
    wire    [4:0]   id_dec_dst_reg_addr;
    wire            id_dec_dst_src_alu;
    wire            id_dec_dst_src_shifter;
    wire            id_dec_dst_src_mem;
    wire            id_dec_dst_src_pc;
    wire            id_dec_dst_src_hi;
    wire            id_dec_dst_src_lo;
    wire            id_dec_dst_src_cop0;
    
    jelly_cpu_idu
            #(
                .USE_INST_LSWLR     (USE_INST_LSWLR),
                .USE_EXC_SYSCALL    (USE_EXC_SYSCALL),
                .USE_EXC_BREAK      (USE_EXC_BREAK),
                .USE_EXC_RI         (USE_EXC_RI)
            )
        i_cpu_idu
            (
                .instruction        (if_out_instruction),
                
                .rs_addr            (id_dec_rs_addr),
                .rt_addr            (id_dec_rt_addr),
                .rd_addr            (id_dec_rd_addr),
                .immediate_data     (id_dec_immediate_data),
                
                .branch_en          (id_dec_branch_en),
                .branch_func        (id_dec_branch_func),
                .branch_index       (id_dec_branch_index),
                .branch_index_en    (id_dec_branch_index_en),
                .branch_imm_en      (id_dec_branch_imm_en),
                .branch_rs_en       (id_dec_branch_rs_en),
                
                .alu_adder_en       (id_dec_alu_adder_en),
                .alu_adder_func     (id_dec_alu_adder_func),
                .alu_logic_en       (id_dec_alu_logic_en),
                .alu_logic_func     (id_dec_alu_logic_func),
                .alu_comp_en        (id_dec_alu_comp_en),
                .alu_comp_func      (id_dec_alu_comp_func),
                .alu_imm_en         (id_dec_alu_imm_en),
                
                .shifter_en         (id_dec_shifter_en),
                .shifter_func       (id_dec_shifter_func),
                .shifter_sa_en      (id_dec_shifter_sa_en),
                .shifter_sa_data    (id_dec_shifter_sa_data),
                
                .muldiv_en          (id_dec_muldiv_en),
                .muldiv_mul         (id_dec_muldiv_mul),
                .muldiv_div         (id_dec_muldiv_div),
                .muldiv_mthi        (id_dec_muldiv_mthi),
                .muldiv_mtlo        (id_dec_muldiv_mtlo),
                .muldiv_mfhi        (id_dec_muldiv_mfhi),
                .muldiv_mflo        (id_dec_muldiv_mflo),
                .muldiv_signed      (id_dec_muldiv_signed),
                
                .cop0_mfc0          (id_dec_cop0_mfc0),
                .cop0_mtc0          (id_dec_cop0_mtc0),
                .cop0_rfe           (id_dec_cop0_rfe),
                
                .exc_syscall        (id_dec_exc_syscall),
                .exc_break          (id_dec_exc_break),
                .exc_ri             (id_dec_exc_ri),
                
                .dbg_sdbbp          (id_dec_dbg_sdbbp),
                
                .mem_en             (id_dec_mem_en),
                .mem_we             (id_dec_mem_we),
                .mem_size           (id_dec_mem_size),
                .mem_unsigned       (id_dec_mem_unsigned),
                
                .dst_reg_en         (id_dec_dst_reg_en),
                .dst_reg_addr       (id_dec_dst_reg_addr),
                .dst_src_alu        (id_dec_dst_src_alu),
                .dst_src_shifter    (id_dec_dst_src_shifter),
                .dst_src_mem        (id_dec_dst_src_mem),
                .dst_src_pc         (id_dec_dst_src_pc),
                .dst_src_hi         (id_dec_dst_src_hi),
                .dst_src_lo         (id_dec_dst_src_lo),
                .dst_src_cop0       (id_dec_dst_src_cop0)
            );
    
    
    // ID
    always @ ( posedge clk ) begin
        if ( reset ) begin
            id_out_stall          <= 1'b1;
            id_out_delay          <= 1'b0;
            id_out_instruction    <= {32{1'bx}};
            id_out_pc             <= {32{1'bx}};

            id_out_rs_addr        <= {5{1'bx}};
            id_out_rt_addr        <= {5{1'bx}};
            id_out_rd_addr        <= {5{1'bx}};
            id_out_immediate_data <= {32{1'bx}};
            
            id_out_branch_en       <= 1'b0;
            id_out_branch_func     <= {4{1'bx}};
            id_out_branch_index    <= {27{1'bx}};
            id_out_branch_index_en <= 1'bx;
            id_out_branch_imm_en   <= 1'bx;
            id_out_branch_rs_en    <= 1'bx;

            id_out_alu_adder_en    <= 1'bx;
            id_out_alu_adder_func  <= {2{1'bx}};
            id_out_alu_logic_en    <= 1'bx;
            id_out_alu_logic_func  <= {2{1'bx}};
            id_out_alu_comp_en     <= 1'bx;
            id_out_alu_comp_func   <= {2{1'bx}};
            id_out_alu_imm_en      <= 1'bx;

            id_out_shifter_en      <= 1'bx;
            id_out_shifter_func    <= {2{1'bx}};
            id_out_shifter_sa_en   <= 1'bx;
            id_out_shifter_sa_data <= {5{1'bx}};
            
            id_out_muldiv_en       <= 1'b0;
            id_out_muldiv_mul      <= 1'bx;
            id_out_muldiv_div      <= 1'b0;
            id_out_muldiv_mthi     <= 1'b0;
            id_out_muldiv_mtlo     <= 1'bx;
            id_out_muldiv_mfhi     <= 1'bx;
            id_out_muldiv_mtlo     <= 1'b0;
            id_out_muldiv_signed   <= 1'bx;

            id_out_cop0_mfc0       <= 1'b0;
            id_out_cop0_mtc0       <= 1'b0;
            id_out_cop0_rfe        <= 1'b0;
               
            id_out_exc_syscall     <= 1'b0;
            id_out_exc_break       <= 1'b0;
            id_out_exc_ri          <= 1'b0;

            id_out_dbg_sdbbp       <= 1'b0;
            id_out_dbg_break       <= 1'b0;
            
            id_out_mem_en          <= 1'b0;
            id_out_mem_we          <= 1'bx;
            id_out_mem_size        <= {2{1'bx}};
            id_out_mem_unsigned    <= 1'bx;
        
            id_out_dst_reg_en      <= 1'b0;
            id_out_dst_reg_addr    <= {4{1'bx}};
            id_out_dst_src_alu     <= 1'bx;
            id_out_dst_src_shifter <= 1'bx;
            id_out_dst_src_mem     <= 1'bx;
            id_out_dst_src_pc      <= 1'bx;
            id_out_dst_src_hi      <= 1'bx;
            id_out_dst_src_lo      <= 1'bx;
            id_out_dst_src_cop0    <= 1'bx;
        end
        else begin
            if ( !interlock ) begin
                id_out_stall           <= id_stall;
                id_out_pc              <= if_out_pc;
                id_out_instruction     <= if_out_instruction;
                
                id_out_rs_addr         <= id_dec_rs_addr;
                id_out_rt_addr         <= id_dec_rt_addr;
                id_out_rd_addr         <= id_dec_rd_addr;
                id_out_immediate_data  <= id_dec_immediate_data;
                
                id_out_branch_en       <= id_dec_branch_en & ~id_stall;
                id_out_branch_func     <= id_dec_branch_func;  
                id_out_branch_index    <= id_dec_branch_index; 
                id_out_branch_index_en <= id_dec_branch_index_en;
                id_out_branch_imm_en   <= id_dec_branch_imm_en;
                id_out_branch_rs_en    <= id_dec_branch_rs_en;
            
                id_out_alu_adder_en    <= id_dec_alu_adder_en;
                id_out_alu_adder_func  <= id_dec_alu_adder_func;
                id_out_alu_logic_en    <= id_dec_alu_logic_en;
                id_out_alu_logic_func  <= id_dec_alu_logic_func;
                id_out_alu_comp_en     <= id_dec_alu_comp_en;
                id_out_alu_comp_func   <= id_dec_alu_comp_func;
                id_out_alu_imm_en      <= id_dec_alu_imm_en;
                
                id_out_shifter_en      <= id_dec_shifter_en;
                id_out_shifter_func    <= id_dec_shifter_func;
                id_out_shifter_sa_en   <= id_dec_shifter_sa_en;
                id_out_shifter_sa_data <= id_dec_shifter_sa_data;

                id_out_muldiv_en       <= id_dec_muldiv_en;
                id_out_muldiv_mul      <= id_dec_muldiv_mul;
                id_out_muldiv_div      <= id_dec_muldiv_div;
                id_out_muldiv_mthi     <= id_dec_muldiv_mthi;
                id_out_muldiv_mtlo     <= id_dec_muldiv_mtlo;
                id_out_muldiv_mfhi     <= id_dec_muldiv_mfhi;
                id_out_muldiv_mflo     <= id_dec_muldiv_mflo;
                id_out_muldiv_signed   <= id_dec_muldiv_signed;
                
                id_out_cop0_mfc0       <= id_dec_cop0_mfc0;
                id_out_cop0_mtc0       <= id_dec_cop0_mtc0;
                id_out_cop0_rfe        <= id_dec_cop0_rfe;
                
                id_out_exc_syscall     <= id_dec_exc_syscall;
                id_out_exc_break       <= id_dec_exc_break;
                id_out_exc_ri          <= id_dec_exc_ri;
                
                id_out_dbg_sdbbp       <= id_dec_dbg_sdbbp;
                id_out_dbg_break       <= USE_HW_BP &
                                            (
                                                (dbg_cop0_debug[0] & (dbg_cop0_debp0 == if_out_pc)) |
                                                (dbg_cop0_debug[1] & (dbg_cop0_debp1 == if_out_pc)) |
                                                (dbg_cop0_debug[2] & (dbg_cop0_debp2 == if_out_pc)) |
                                                (dbg_cop0_debug[3] & (dbg_cop0_debp3 == if_out_pc))
                                            );
                
                id_out_mem_en          <= id_dec_mem_en  & ~id_stall;
                id_out_mem_we          <= id_dec_mem_we;
                id_out_mem_size        <= id_dec_mem_size;
                id_out_mem_unsigned    <= id_dec_mem_unsigned;
                                    
                id_out_dst_reg_en      <= id_dec_dst_reg_en & ~id_stall;
                id_out_dst_reg_addr    <= id_dec_dst_reg_addr;
                id_out_dst_src_alu     <= id_dec_dst_src_alu;
                id_out_dst_src_shifter <= id_dec_dst_src_shifter;
                id_out_dst_src_mem     <= id_dec_dst_src_mem;
                id_out_dst_src_pc      <= id_dec_dst_src_pc;
                id_out_dst_src_hi      <= id_dec_dst_src_hi;
                id_out_dst_src_lo      <= id_dec_dst_src_lo;
                id_out_dst_src_cop0    <= id_dec_dst_src_cop0;
            end
        end
    end
    
    
    // -----------------------------
    //  Execution stage
    // -----------------------------
    
    // EX stage input
    wire            ex_in_stall;
    
    // EX stage output
    wire            ex_out_hazard;
    reg             ex_out_stall;
    reg     [31:0]  ex_out_instruction;
    reg     [31:0]  ex_out_pc;
    
    reg             ex_out_mem_en;
    reg             ex_out_mem_we;
    reg     [1:0]   ex_out_mem_size;
    reg             ex_out_mem_unsigned;
    reg     [3:0]   ex_out_mem_sel;
    reg     [3:0]   ex_out_mem_mask;
    reg     [1:0]   ex_out_mem_shift;
    reg     [31:0]  ex_out_mem_wdata;
    reg     [31:0]  ex_out_mem_rt_data;
    
    reg             ex_out_dst_reg_en;
    reg     [4:0]   ex_out_dst_reg_addr;
    reg     [31:0]  ex_out_dst_reg_data;
    reg             ex_out_dst_src_mem;
    
    reg             ex_out_branch_en;
    reg     [31:0]  ex_out_branch_pc;

    reg             ex_out_exception_en;
    reg     [31:0]  ex_out_exception_pc;
    

    // stall
    wire                ex_stall;
    assign ex_stall = id_out_stall | ex_in_stall;
    
    // debugger break
    wire ex_dbg_break;
    
    // interrupt;
    wire ex_interrupt;
    
    // ex_exception
    wire ex_exception;
    
    
    // fowarding
    reg     [31:0]  ex_fwd_rs_data;
    reg     [31:0]  ex_fwd_rt_data;
    
    
    // ALU
    wire    [31:0]  ex_alu_in_data0;
    wire    [31:0]  ex_alu_in_data1;
    wire    [31:0]  ex_alu_out_data;
    wire            ex_alu_out_carry;
    wire            ex_alu_out_overflow;
    wire            ex_alu_out_negative;
    wire            ex_alu_out_zero;
    
    assign ex_alu_in_data0 = ex_fwd_rs_data; 
    assign ex_alu_in_data1 = id_out_alu_imm_en ? id_out_immediate_data : ex_fwd_rt_data;
    
    jelly_cpu_alu
        i_cpu_alu
            (
                .op_adder_en        (id_out_alu_adder_en),
                .op_adder_func      (id_out_alu_adder_func),
                .op_logic_en        (id_out_alu_logic_en),
                .op_logic_func      (id_out_alu_logic_func),
                .op_comp_en         (id_out_alu_comp_en),
                .op_comp_func       (id_out_alu_comp_func),
            
                .in_data0           (ex_alu_in_data0),
                .in_data1           (ex_alu_in_data1),
                
                .out_data           (ex_alu_out_data),
                
                .out_carry          (ex_alu_out_carry),
                .out_overflow       (ex_alu_out_overflow),
                .out_negative       (ex_alu_out_negative),
                .out_zero           (ex_alu_out_zero)

            );
    
    
    // Shifter
    wire    [31:0]      ex_shifter_in_data;
    wire    [4:0]       ex_shifter_in_sa;
    wire    [31:0]      ex_shifter_out_data;
    
    assign ex_shifter_in_data = ex_fwd_rt_data;
    assign ex_shifter_in_sa   = id_out_shifter_sa_en ? id_out_shifter_sa_data : ex_fwd_rs_data[4:0];
    
    jelly_cpu_shifter
        i_cpu_shifter
            (
                .op_func        (id_out_shifter_func),
                
                .in_data        (ex_shifter_in_data),
                .in_sa          (ex_shifter_in_sa),
                
                .out_data       (ex_shifter_out_data)
            );
    
    
    
    // MULT&DIV
    wire                        ex_muldiv_op_mul;
    wire                        ex_muldiv_op_div;
    wire                        ex_muldiv_op_mthi;
    wire                        ex_muldiv_op_mtlo;
    wire                        ex_muldiv_op_signed;

    wire    [31:0]              ex_muldiv_in_data0;
    wire    [31:0]              ex_muldiv_in_data1;
    
    wire    [31:0]              ex_muldiv_out_hi;
    wire    [31:0]              ex_muldiv_out_lo;
    wire                        ex_muldiv_busy;
    
    jelly_cpu_muldiv
            #(
                .MUL_CYCLE      (MUL_CYCLE)
            )
        i_cpu_muldiv
            (
                .reset          (reset),
                .clk            (clk),
                
                .op_mul         (ex_muldiv_op_mul & !interlock),
                .op_div         (ex_muldiv_op_div & !interlock),
                .op_mthi        (ex_muldiv_op_mthi & !interlock),
                .op_mtlo        (ex_muldiv_op_mtlo & !interlock),
                .op_signed      (ex_muldiv_op_signed),
                
                .in_data0       (ex_muldiv_in_data0),
                .in_data1       (ex_muldiv_in_data1),
                
                .out_hi         (ex_muldiv_out_hi),
                .out_lo         (ex_muldiv_out_lo),
                
                .busy           (ex_muldiv_busy)
        );
    
    assign ex_muldiv_op_mul    = (id_out_muldiv_mul & ~ex_stall & ~ex_exception);
    assign ex_muldiv_op_div    = (id_out_muldiv_div & ~ex_stall & ~ex_exception);
    assign ex_muldiv_op_mthi   = (id_out_muldiv_mthi & ~ex_stall & ~ex_exception);
    assign ex_muldiv_op_mtlo   = (id_out_muldiv_mtlo & ~ex_stall & ~ex_exception);
    assign ex_muldiv_op_signed = id_out_muldiv_signed;
    
    assign ex_muldiv_in_data0  = ex_fwd_rs_data;
    assign ex_muldiv_in_data1  = ex_fwd_rt_data;
    
    // debbuger hook
    assign dbg_hilo_rdata = (dbg_hilo_addr == 0) ? ex_muldiv_out_hi : ex_muldiv_out_lo;
    
    
    // memory access encode
    wire    [3:0]       ex_mem_sel;
    wire    [31:0]      ex_mem_wdata;
    wire    [3:0]       ex_mem_mask;
    wire    [1:0]       ex_mem_shift;
    
    jelly_cpu_memenc
            #(
                .USE_INST_LSWLR (USE_INST_LSWLR)
            )
        i_cpu_memenc
            (
                .endian         (endian),
                
                .in_addr        (ex_alu_out_data),
                .in_wdata       (ex_fwd_rt_data),
                .in_size        (id_out_mem_size),
                .in_unsigned    (id_out_mem_unsigned),

                .out_sel        (ex_mem_sel),
                .out_wdata      (ex_mem_wdata),
                .out_mask       (ex_mem_mask),
                .out_shift      (ex_mem_shift)
            );                 
    
    
    // COP0
    wire            ex_cop0_in_en;
    wire    [4:0]   ex_cop0_in_addr;
    wire    [31:0]  ex_cop0_in_data;
    wire    [31:0]  ex_cop0_out_data;
    
    wire            ex_cop0_exception;
    wire            ex_cop0_rfe;
    wire            ex_cop0_dbg_break;
    
    wire    [31:0]  ex_cop0_in_cause;
    wire    [31:0]  ex_cop0_in_epc;
    wire    [31:0]  ex_cop0_in_debug;
    wire    [31:0]  ex_cop0_in_depc;
    
    wire    [31:0]  ex_cop0_out_status;
    
    jelly_cpu_cop0
            #(
                .DBBP_NUM       (DBBP_NUM)
            )
        i_cpu_cop0
            (
                .reset          (reset),
                .clk            (clk),
                
                .interlock      (interlock),
                
                .in_en          (ex_cop0_in_en),
                .in_sel         (3'b000),
                .in_addr        (ex_cop0_in_addr),
                .in_data        (ex_cop0_in_data),
                .out_data       (ex_cop0_out_data),
                
                .exception      (ex_cop0_exception),
                .rfe            (ex_cop0_rfe),
                .dbg_break      (ex_cop0_dbg_break),
                
                .in_cause       (ex_cop0_in_cause),
                .in_epc         (ex_cop0_in_epc),
                .in_debug       (ex_cop0_in_debug),
                .in_depc        (ex_cop0_in_depc),
                
                .out_status     (ex_cop0_out_status),
                .out_cause      (),
                .out_epc        (),
                .out_debug      (dbg_cop0_debug),
                .out_depc       (dbg_cop0_depc),
                
                .out_debp0      (dbg_cop0_debp0),
                .out_debp1      (dbg_cop0_debp1),
                .out_debp2      (dbg_cop0_debp2),
                .out_debp3      (dbg_cop0_debp3)
            );
    
    
    // register access (debugger hook)
    assign ex_cop0_in_en   = dbg_enable ? (dbg_cop0_en & dbg_cop0_we) : (id_out_cop0_mtc0 & ~ex_stall & ~ex_exception);
    assign ex_cop0_in_addr = dbg_enable ? dbg_cop0_addr               : id_out_rd_addr;
    assign ex_cop0_in_data = dbg_enable ? dbg_cop0_wdata              : ex_fwd_rt_data;
    assign dbg_cop0_rdata  = ex_cop0_out_data;
    
    
    // event
    assign ex_cop0_exception = ex_exception;
    assign ex_cop0_rfe       = id_out_cop0_rfe & ~ex_stall & ~ex_exception;
    assign ex_cop0_dbg_break = ex_dbg_break;
    
    // cause
    assign ex_cop0_in_cause[31]   = ex_out_branch_en;                       // Branch Delay
    assign ex_cop0_in_cause[30:7] = 0;
    assign ex_cop0_in_cause[6:2]  = (id_out_exc_ri      ? 5'd10 : 5'd0) |
                                    (id_out_exc_break   ? 5'd9  : 5'd0) |
                                    (id_out_exc_syscall ? 5'd8  : 5'd0) |
                                    (ex_interrupt       ? 5'd0  : 5'd0);    // ExcCode
    assign ex_cop0_in_cause[1:0]  = 0;
    
    // epc
    assign ex_cop0_in_epc = ex_out_branch_en ? id_out_pc - 4 : id_out_pc;
    
    // debug
    assign ex_cop0_in_debug[31]   = ex_out_branch_en;                       // Branch Delay
    assign ex_cop0_in_debug[30:0] = {30{1'b0}};
    
    // depc
    assign ex_cop0_in_depc = ex_cop0_in_epc;
    


    // step execution
    reg     [1:0]   dbg_dbbp_mask;
    always @( posedge clk ) begin
        if ( reset ) begin
            dbg_dbbp_mask <= 2'b00;
        end
        else begin
            if ( !interlock ) begin
                if ( dbg_enable ) begin
                    dbg_dbbp_mask[0] <= 1'b1;
                    dbg_dbbp_mask[1] <= dbg_cop0_debug[31];
                end
                else begin
                    if ( !(ex_stall | ex_exception) ) begin
                        dbg_dbbp_mask <= {1'b0, dbg_dbbp_mask[1]};
                    end
                end
            end
        end
    end
    
    // debugger break;
    assign ex_dbg_break = ((dbg_break_req & ~dbg_enable) | id_out_dbg_sdbbp | ((id_out_dbg_break | dbg_cop0_debug[24]) & !dbg_dbbp_mask[0])) & !(interlock | ex_stall);
    assign dbg_break    = ex_dbg_break;
    
    // interrupt
    assign ex_interrupt  = (interrupt_req & ex_cop0_out_status[0])
                                & ~(interlock | ex_stall | ex_dbg_break | id_out_exc_break | id_out_exc_syscall | id_out_exc_ri | dbg_cop0_debug[24]);
    assign interrupt_ack = ex_interrupt;
    
    // exception
    assign ex_exception = (id_out_exc_break | id_out_exc_syscall | id_out_exc_ri | ex_interrupt)
                                & ~(interlock | ex_stall | ex_dbg_break);
    
    
    
    
    // hazard
    assign ex_out_hazard = id_out_muldiv_en & ex_muldiv_busy;
    
    
    // FF
    always @ ( posedge clk ) begin
        if ( reset ) begin
            ex_out_stall        <= 1'b1;
            ex_out_instruction  <= {32{1'bx}};
            ex_out_pc           <= {32{1'bx}};
            
            ex_out_mem_en       <= 1'b0;
            ex_out_mem_we       <= 1'bx;
            ex_out_mem_size     <= {2{1'bx}};
            ex_out_mem_unsigned <= 1'bx;
            ex_out_mem_sel      <= {4{1'bx}};
            ex_out_mem_wdata    <= {32{1'bx}};
            ex_out_mem_mask     <= {4{1'bx}};
            ex_out_mem_shift    <= {2{1'bx}};
            
            ex_out_mem_rt_data  <= {32{1'bx}};

            ex_out_dst_reg_en   <= 1'b0;
            ex_out_dst_reg_addr <= 0;
            ex_out_dst_reg_data <= {32{1'bx}};
            ex_out_dst_src_mem  <= 1'b0;
            
            ex_out_branch_en    <= 1'b0;
            ex_out_branch_pc    <= {32{1'bx}};
            
            ex_out_exception_en <= 1'b0;
            ex_out_exception_pc <= {32{1'bx}};
        end
        else begin
            if ( !interlock ) begin
                // control
                ex_out_stall       <= ex_stall | ex_exception | ex_dbg_break;
                ex_out_instruction <= id_out_instruction;
                ex_out_pc          <= id_out_pc;
                
                // MEM
                ex_out_mem_en       <= id_out_mem_en & ~ex_stall;
                ex_out_mem_we       <= id_out_mem_we;
                ex_out_mem_size     <= id_out_mem_size;
                ex_out_mem_unsigned <= id_out_mem_unsigned;
                ex_out_mem_sel      <= ex_mem_sel;
                ex_out_mem_wdata    <= ex_mem_wdata;
                ex_out_mem_mask     <= ex_mem_mask;
                ex_out_mem_shift    <= ex_mem_shift;
                ex_out_mem_rt_data  <= ex_fwd_rt_data;
                    
                // branch
                ex_out_branch_en <= id_out_branch_en & ~ex_stall & 
                                    (
                                        (id_out_branch_func[2:0]  ==  3'b000) |                                                 // JALR
                                        (id_out_branch_func[2:0]  ==  3'b010) |                                                 // J
                                        (id_out_branch_func[2:0]  ==  3'b011) |                                                 // JAL
                                        ((id_out_branch_func[2:0] ==  3'b100) & ( ex_alu_out_zero)) |                           // BEQ
                                        ((id_out_branch_func[2:0] ==  3'b101) & (!ex_alu_out_zero)) |                           // BNE
                                        ((id_out_branch_func[2:0] ==  3'b110) & ( ex_alu_out_negative |  ex_alu_out_zero)) |    // BLEZ (rs <= 0)
                                        ((id_out_branch_func[2:0] ==  3'b111) & (!ex_alu_out_negative & !ex_alu_out_zero)) |    // BGTZ (rs > 0)
                                        ((id_out_branch_func[3:0] == 4'b0001) & ( ex_alu_out_negative & !ex_alu_out_zero)) |    // BLTZ, BLTZAL (rs < 0)
                                        ((id_out_branch_func[3:0] == 4'b1001) & (!ex_alu_out_negative |  ex_alu_out_zero))      // BGEZ, BGEZAL (rs >= 0)
                                    );
                ex_out_branch_pc <= (id_out_branch_index_en ? {id_out_pc[31:28], id_out_branch_index}  : 0) |
                                    (id_out_branch_imm_en   ? if_out_pc + (id_out_immediate_data << 2) : 0) |
                                    (id_out_branch_rs_en    ? ex_fwd_rs_data                           : 0);
                
                // exception
                ex_out_exception_en <= ex_exception;
                ex_out_exception_pc <= interrupt_req ? vect_interrupt : vect_exception;
                
                // destination
                ex_out_dst_reg_en   <= id_out_dst_reg_en;
                ex_out_dst_reg_addr <= id_out_dst_reg_addr;
                ex_out_dst_reg_data <=  (id_out_dst_src_alu     ? ex_alu_out_data     : 32'h00000000) |
                                        (id_out_dst_src_shifter ? ex_shifter_out_data : 32'h00000000) | 
                                        (id_out_dst_src_pc      ? if_out_pc + 4       : 32'h00000000) | 
                                        (id_out_dst_src_hi      ? ex_muldiv_out_hi    : 32'h00000000) |
                                        (id_out_dst_src_lo      ? ex_muldiv_out_lo    : 32'h00000000) |
                                        (id_out_dst_src_cop0    ? ex_cop0_out_data    : 32'h00000000);
                ex_out_dst_src_mem  <= id_out_dst_src_mem;
            end
        end
    end
    
    // brench
    assign if_in_branch_en = ex_out_exception_en | ex_out_branch_en;
    assign if_in_branch_pc = ex_out_exception_en ? ex_out_exception_pc : ex_out_branch_pc;
    
    
    
    // -----------------------------
    //  Memory stage
    // -----------------------------
    
    wire                mem_in_stall;
    
    reg                 mem_out_stall;
    reg     [31:0]      mem_out_instruction;
    reg     [31:0]      mem_out_pc;
    
    wire                mem_out_hazard;
    
    reg                 mem_out_dst_reg_en;
    reg     [4:0]       mem_out_dst_reg_addr;
    wire    [31:0]      mem_out_dst_reg_data;
    
    
    // stall
    wire                mem_stall;
    assign mem_stall = ex_out_stall | mem_in_stall;
    
    
    // memory access
    wire    [31:0]  mem_read_data;
    
    assign jbus_data_en    = dbg_jbus_data_valid ? dbg_jbus_data_en    : !interlock;
    assign jbus_data_addr  = dbg_jbus_data_valid ? dbg_jbus_data_addr  : ex_out_dst_reg_data[31:2];
    assign jbus_data_wdata = dbg_jbus_data_valid ? dbg_jbus_data_wdata : ex_out_mem_wdata;
    assign jbus_data_we    = dbg_jbus_data_valid ? dbg_jbus_data_we    : ex_out_mem_we;
    assign jbus_data_sel   = dbg_jbus_data_valid ? dbg_jbus_data_sel   : ex_out_mem_sel;
    assign jbus_data_valid = dbg_jbus_data_valid ? dbg_jbus_data_valid : ex_out_mem_en & !mem_stall;
    
    assign mem_read_data   = jbus_data_rdata;
    assign mem_out_hazard  = !jbus_data_ready;
    
    assign dbg_jbus_data_rdata = jbus_data_rdata;
    assign dbg_jbus_data_ready = jbus_data_ready;
    
        
    // FF
    reg                 mem_dst_src_mem;
    reg     [1:0]       mem_size;
    reg                 mem_unsigned;
    reg     [3:0]       mem_mask;
    reg     [1:0]       mem_shift;
    reg     [31:0]      mem_rt_data;
    reg     [31:0]      mem_ex_data;
    
    wire    [31:0]      mem_rdata;
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            mem_out_stall        <= 1'b0;
            mem_out_instruction  <= 0;
            mem_out_pc           <= 0;
            
            mem_out_dst_reg_en   <= 1'b1;       // write r0
            mem_out_dst_reg_addr <= 0;          // write r0
            
            mem_dst_src_mem      <= 1'b0;       // write r0
            mem_size             <= {2{1'bx}};
            mem_unsigned         <= 1'bx;
            mem_mask             <= {4{1'bx}};
            mem_shift            <= {2{1'bx}};
            mem_rt_data          <= {31{1'bx}};
            
            mem_ex_data          <= 0;          // write r0
        end
        else begin
            if ( !interlock ) begin
                mem_out_stall        <= mem_stall;
                mem_out_instruction  <= ex_out_instruction;
                mem_out_pc           <= ex_out_pc;
                
                mem_out_dst_reg_en   <= ex_out_dst_reg_en & ~mem_stall;
                mem_out_dst_reg_addr <= ex_out_dst_reg_addr;
                
                mem_dst_src_mem      <= ex_out_dst_src_mem;
                mem_size             <= ex_out_mem_size;
                mem_unsigned         <= ex_out_mem_unsigned;
                mem_mask             <= ex_out_mem_mask;
                mem_shift            <= ex_out_mem_shift;
                mem_ex_data          <= ex_out_dst_reg_data;
                
                // mem fowarding
                if ( USE_INST_LSWLR && mem_out_dst_reg_en && (mem_out_dst_reg_addr == ex_out_dst_reg_addr) ) begin
                    mem_rt_data <= mem_rdata;   // fowarding
                end
                else begin
                    mem_rt_data <= ex_out_mem_rt_data;
                end             
            end
        end
    end
    
    
    // memory access decoder
    jelly_cpu_memdec
        i_cpu_memdec
            (
                .in_rdata       (mem_read_data),
                .in_size        (mem_size),
                .in_unsigned    (mem_unsigned),
                .in_mask        (mem_mask),
                .in_shift       (mem_shift),
                .in_rt_data     (mem_rt_data),
                
                .out_rdata      (mem_rdata)
            );
    
    assign mem_out_dst_reg_data = mem_dst_src_mem ? mem_rdata : mem_ex_data;
    
    
    
    // -----------------------------
    //  Writeback stage
    // -----------------------------
    
    assign id_in_dst_reg_en   = mem_out_dst_reg_en;
    assign id_in_dst_reg_addr = mem_out_dst_reg_addr;
    assign id_in_dst_reg_data = mem_out_dst_reg_data;
    
    
    
    // -----------------------------
    //  Fowarding control
    // -----------------------------
    
    reg             fwd_rs_hit_ex;
    reg             fwd_rs_hit_mem;
    reg             fwd_rt_hit_ex;
    reg             fwd_rt_hit_mem;
    always @ ( posedge clk ) begin
        if ( reset ) begin
            fwd_rs_hit_ex  <= 1'b0;
            fwd_rs_hit_mem <= 1'b0;
            fwd_rt_hit_ex  <= 1'b0;
            fwd_rt_hit_mem <= 1'b0;
        end
        else begin
            if ( !interlock ) begin
                fwd_rs_hit_ex  <= (if_out_instruction[25:21] == id_out_dst_reg_addr) & id_out_dst_reg_en;
                fwd_rs_hit_mem <= (if_out_instruction[25:21] == ex_out_dst_reg_addr) & ex_out_dst_reg_en;
                fwd_rt_hit_ex  <= (if_out_instruction[20:16] == id_out_dst_reg_addr) & id_out_dst_reg_en;
                fwd_rt_hit_mem <= (if_out_instruction[20:16] == ex_out_dst_reg_addr) & ex_out_dst_reg_en;
            end
        end
    end
    
    always @* begin
        if ( fwd_rs_hit_ex ) begin
            ex_fwd_rs_data <= ex_out_dst_reg_data;
        end
        else if ( fwd_rs_hit_mem ) begin
            ex_fwd_rs_data <= mem_out_dst_reg_data;
        end
        else begin
            ex_fwd_rs_data <= id_out_rs_data;
        end
    end

    always @* begin
        if ( fwd_rt_hit_ex ) begin
            ex_fwd_rt_data <= ex_out_dst_reg_data;
        end
        else if ( fwd_rt_hit_mem ) begin
            ex_fwd_rt_data <= mem_out_dst_reg_data;
        end
        else begin
            ex_fwd_rt_data <= id_out_rt_data;
        end
    end
    
    
    
    // -----------------------------
    //  Pipeline control
    // -----------------------------
    
    // interlock
    assign interlock    = if_out_hazard | ex_out_hazard | mem_out_hazard | pause;
    
    // stall
    assign if_in_stall  = dbg_enable | ex_out_exception_en | ex_out_branch_en;
    assign id_in_stall  = dbg_enable | ex_out_exception_en | ex_out_branch_en;
    assign ex_in_stall  = dbg_enable | ex_out_exception_en;
    assign mem_in_stall = 1'b0;

    
    
    // -----------------------------
    //  Debug unit
    // -----------------------------
    
    generate
    if ( USE_DBUGGER ) begin
        jelly_cpu_dbu
            i_cpu_dbu
                (
                    .reset          (reset),
                    .clk            (clk),
                    .endian         (endian),
                    
                    .wb_adr_i       (wb_dbg_adr_i),
                    .wb_dat_i       (wb_dbg_dat_i),
                    .wb_dat_o       (wb_dbg_dat_o),
                    .wb_we_i        (wb_dbg_we_i),
                    .wb_sel_i       (wb_dbg_sel_i),
                    .wb_stb_i       (wb_dbg_stb_i),
                    .wb_ack_o       (wb_dbg_ack_o),
                    
                    .dbg_enable     (dbg_enable),
                    .dbg_break_req  (dbg_break_req),
                    .dbg_break      (dbg_break),
                    
                    .ibus_en        (dbg_jbus_inst_en),
                    .ibus_addr      (dbg_jbus_inst_addr),
                    .ibus_wdata     (dbg_jbus_inst_wdata),
                    .ibus_rdata     (dbg_jbus_inst_rdata),
                    .ibus_we        (dbg_jbus_inst_we),
                    .ibus_sel       (dbg_jbus_inst_sel),
                    .ibus_valid     (dbg_jbus_inst_valid),
                    .ibus_ready     (dbg_jbus_inst_ready),

                    .dbus_en        (dbg_jbus_data_en),
                    .dbus_addr      (dbg_jbus_data_addr),
                    .dbus_wdata     (dbg_jbus_data_wdata),
                    .dbus_rdata     (dbg_jbus_data_rdata),
                    .dbus_we        (dbg_jbus_data_we),
                    .dbus_sel       (dbg_jbus_data_sel),
                    .dbus_valid     (dbg_jbus_data_valid),
                    .dbus_ready     (dbg_jbus_data_ready),
                    
                    .gpr_en         (dbg_gpr_en),
                    .gpr_we         (dbg_gpr_we),
                    .gpr_addr       (dbg_gpr_addr),
                    .gpr_wdata      (dbg_gpr_wdata),
                    .gpr_rdata      (dbg_gpr_rdata),
                    
                    .hilo_en        (dbg_hilo_en),
                    .hilo_we        (dbg_hilo_we),
                    .hilo_addr      (dbg_hilo_addr),
                    .hilo_wdata     (dbg_hilo_wdata),
                    .hilo_rdata     (dbg_hilo_rdata),
                    
                    .cop0_en        (dbg_cop0_en),
                    .cop0_we        (dbg_cop0_we),
                    .cop0_addr      (dbg_cop0_addr),
                    .cop0_wdata     (dbg_cop0_wdata),
                    .cop0_rdata     (dbg_cop0_rdata)
                );
    end
    else begin
        assign wb_dbg_dat_o        = {32{1'b0}};
        assign wb_dbg_ack_o        = wb_dbg_stb_i;
        
        assign dbg_enable          = 1'b0;
        assign dbg_break_req       = 1'b0;
        
        assign dbg_jbus_inst_en    = 1'b0;
        assign dbg_jbus_inst_we    = 1'b0;
        assign dbg_jbus_inst_sel   = 4'b0000;
        assign dbg_jbus_inst_addr  = {30{1'b0}};
        assign dbg_jbus_inst_wdata = {32{1'b0}};
        assign dbg_jbus_inst_valid = 1'b0;
        
        assign dbg_jbus_data_en    = 1'b0;
        assign dbg_jbus_data_we    = 1'b0;
        assign dbg_jbus_data_sel   = 4'b0000;
        assign dbg_jbus_data_addr  = {30{1'b0}};
        assign dbg_jbus_data_wdata = {32{1'b0}};
        assign dbg_jbus_data_valid = 1'b0;
        
        assign dbg_gpr_en         = 1'b0;
        assign dbg_gpr_we         = 1'b0;
        assign dbg_gpr_addr       = 0;
        assign dbg_gpr_wdata      = {32{1'b0}};
                    
        assign dbg_hilo_en        = 1'b0;
        assign dbg_hilo_we        = 1'b0;
        assign dbg_hilo_addr      = 0;
        assign dbg_hilo_wdata     = {32{1'b0}};
                    
        assign dbg_cop0_en        = 1'b0;
        assign dbg_cop0_we        = 1'b0;
        assign dbg_cop0_addr      = 0;
        assign dbg_cop0_wdata     = {32{1'b0}};
    end
    endgenerate
    
    
    // -----------------------------
    //  PC trace
    // -----------------------------
    
    assign trace_valid       = !interlock & !ex_out_stall;
    assign trace_pc          = ex_out_pc;
    assign trace_instruction = ex_out_instruction;
    
    
    // -----------------------------
    //  simulation
    // -----------------------------
        
    generate 
    if ( SIMULATION ) begin
        // PC trace
        if ( SIM_TRACE_PC ) begin
            integer pc_trace_file;
            initial begin
                pc_trace_file = $fopen(SIM_TRACE_PC_FILE, "w");
                $fclose(pc_trace_file); 
            end
            
            always @ ( posedge clk ) begin
                if ( !reset ) begin
                    if ( !interlock & !ex_out_stall ) begin
                        pc_trace_file = $fopen(SIM_TRACE_PC_FILE, "a");
                        $fdisplay(pc_trace_file, "%d [pc]   p %h %h", $time, ex_out_pc, ex_out_instruction);
                        $fclose(pc_trace_file);
                    end
                end
            end
        end
        
        // GPR trace
        if ( SIM_TRACE_GPR ) begin
            integer pc_trace_file;
            initial begin
                pc_trace_file = $fopen(SIM_TRACE_GPR_FILE, "w");
                $fclose(pc_trace_file); 
            end
            
            always @ ( posedge clk ) begin
                if ( !reset ) begin
                    if ( !interlock & if_gpr_write_en ) begin
                        pc_trace_file = $fopen(SIM_TRACE_GPR_FILE, "a");
                        $fdisplay(pc_trace_file, "%d [gpr]  g %h %h", $time, if_gpr_write_addr, if_gpr_write_data);
                        $fclose(pc_trace_file);
                    end
                end
            end
        end
        
        // data-bus trace
        if ( SIM_TRACE_DBUS ) begin
            jelly_jbus_logger
                    #(
                        .ADDR_WIDTH     (32),
                        .DATA_SIZE      (2),    // 2^n (0:8bit, 1:16bit, 2:32bit ...)
                        .FILE_NAME      (SIM_TRACE_DBUS_FILE),
                        .DISPLAY        (0),
                        .MESSAGE        ("[dbus]")
                    )
                i_jbus_logger_data
                    (
                        .clk            (clk),
                        .reset          (reset),
                        
                        .jbus_en        (jbus_data_en),
                        .jbus_addr      ({jbus_data_addr, 2'b00}),
                        .jbus_wdata     (jbus_data_wdata),
                        .jbus_rdata     (jbus_data_rdata),
                        .jbus_we        (jbus_data_we),
                        .jbus_sel       (jbus_data_sel),
                        .jbus_valid     (jbus_data_valid),
                        .jbus_ready     (jbus_data_ready)
                    );
        end
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
