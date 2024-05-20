// This program was cloned from: https://github.com/jrbuchanan02/multicycle-rv32i
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2023 01:19:23 PM
// Design Name: 
// Module Name: cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 1 - File Created
// Revision 2 - Changed PC Increment to happen during the ALU Operation.
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module cpu(clock, reset, hclk, hresetn, haddr, hburst, hmastlock, hprot, hsize, htrans, hwdata, hwrite, hrdata, hreadyout, hresp, hsel, hreadyin);
    parameter XLEN = 32;
    parameter sync_reset = "FALSE";
    parameter [XLEN-1:2] reset_address = 0;
    input clock;
    input reset;
    output hclk;
    output hresetn;
    output [XLEN-1:0] haddr;
    output [2:0] hburst;
    output hsel;
    output hmastlock;
    output [3:0] hprot;
    output [2:0] hsize;
    output [1:0] htrans;
    output [XLEN-1:0] hwdata;
    output hwrite;
    input  [XLEN-1:0] hrdata;
    input  hreadyout;
    output hreadyin;
    input  hresp;
    
    assign hreadyin = hreadyout;
    localparam register_count = 32;
    localparam register_zero  = 0;
    
    localparam [0:0] mem_mode_word = 1'b0;
    localparam [0:0] mem_mode_func = 1'b1;
    
    localparam [1:0] addr_sel_curr = 2'b00; // current value in the PC
    localparam [1:0] addr_sel_next = 2'b01; // PC + 4
    localparam [1:0] addr_sel_data = 2'b10; // alu_res
    
    localparam [2:0] fmt_i_type = 3'b000;
    localparam [2:0] fmt_s_type = 3'b001;
    localparam [2:0] fmt_b_type = 3'b010;
    localparam [2:0] fmt_u_type = 3'b011;
    localparam [2:0] fmt_j_type = 3'b100;
    
    localparam [1:0] write_sel_ret = 2'b00;
    localparam [1:0] write_sel_res = 2'b01;
    localparam [1:0] write_sel_mem = 2'b10;
    
    localparam [1:0] lhs_sel_pc = 2'b00;
    localparam [1:0] lhs_sel_rs = 2'b01;
    localparam [1:0] lhs_sel_00 = 2'b10;
    
    localparam [0:0] rhs_sel_rs = 1'b0;
    localparam [0:0] rhs_sel_im = 1'b1;
    
    localparam [1:0] alu_mode_add = 2'b00;
    localparam [1:0] alu_mode_cmp = 2'b01;
    localparam [1:0] alu_mode_fun = 2'b10;
    localparam [1:0] alu_mode_fn3 = 2'b11;
    
    localparam [3:0] alu_op_add = 4'b0000;
    localparam [3:0] alu_op_sub = 4'b0001;
    localparam [3:0] alu_op_slt = 4'b0010;
    localparam [3:0] alu_opsltu = 4'b0011;
    localparam [3:0] alu_op_and = 4'b0100;
    localparam [3:0] alu_op_or  = 4'b0101;
    localparam [3:0] alu_op_xor = 4'b0110;
    localparam [3:0] alu_op_sl  = 4'b0111;
    localparam [3:0] alu_op_srl = 4'b1000;
    localparam [3:0] alu_op_sra = 5'b1001;
    
    localparam [1:0] branch_if_zero = 2'b00;
    localparam [1:0] branch_if_notz = 2'b01;
    localparam [1:0] branch_if_less = 2'b10;
    localparam [1:0] branch_if_notl = 2'b11;
    
    localparam [1:0] pc_sel_next = 2'b00;
    localparam [1:0] pc_sel_jump = 2'b01;
    localparam [1:0] pc_sel_cond = 2'b10;
    
    localparam [6:0] opcode_load  = 7'b00000??;
    localparam [6:0] opcode_store = 7'b01000??;
    localparam [6:0] opcode_branch= 7'b11000??; 
    localparam [6:0] opcode_jal   = 7'b11011??;
    localparam [6:0] opcode_op_imm= 7'b00100??;
    localparam [6:0] opcode_op    = 7'b01100??;
    localparam [6:0] opcode_auipc = 7'b00101??;
    localparam [6:0] opcode_lui   = 7'b01101??;
    localparam [6:0] opcode_jalr  = 7'b11001??;
    localparam [6:0] opcode_miscmm= 7'b00011??;
    localparam [6:0] opcode_system= 7'b11100??;
    
    // wires coming to / from the main controller.
    wire [6:0] opcode;
    wire pc_write;
    wire [1:0] addr_sel;
    wire mem_write;
    wire ir_write;
    wire mem_grab;
    wire [1:0] write_sel;
    wire reg_write;
    wire lhs_grab;
    wire rhs_grab;
    wire [1:0] lhs_sel;
    wire rhs_sel;
    wire [1:0] alu_mode;
    wire [2:0] imm_fmt;
    wire operation_complete;
    wire mem_mode;
    wire mem_transfer;
    wire [1:0] pc_select;
    // wires coming to / from the memory interface
    wire [XLEN - 1:0] rdata;
    wire [XLEN - 1:0] wdata;
    wire [XLEN-1:0] cpu_addr;
    wire cpu_write;
    wire [2:0] mem_function;
    
    // wires coming to / from the instruction register
    wire [XLEN - 1:0] ir_d;
    wire [XLEN - 1:0] ir_q;
    wire ld_ir;
    
    // wires coming to / from the memory data register
    wire [XLEN - 1:0] mdr_d;
    wire [XLEN - 1:0] mdr_q;
    
    // wires coming to / from the register file
    wire [4:0] wrr;
    wire [4:0] rr1;
    wire [4:0] rr2;
    wire write_reg;
    wire [XLEN - 1:0] wdat;
    wire [XLEN - 1:0] rs1;
    wire [XLEN - 1:0] rs2;
    
    // wires coming to / from lhs
    wire [XLEN - 1:0] lhs_d;
    wire [XLEN - 1:0] lhs_q;
    
    // wires coming to / from rhs
    wire [XLEN - 1:0] rhs_d;
    wire [XLEN - 1:0] rhs_q;
    
    // wires coming to / from the immediate controller
    wire [XLEN - 1:0] instr;
    wire [2:0] imm_format;
    wire [XLEN - 1:0] immediate;
    
    // wires coming to / from the alu controller
    wire [1:0] alu_ctrl_mode;
    wire [2:0] func3;
    wire [6:0] func7;
    wire [3:0] alu_op;
    wire [1:0] b_cond;
    
    // wires coming to / from the alu
    wire [3:0] operation;
    wire [XLEN - 1:0] alu_lhs;
    wire [XLEN - 1:0] alu_rhs;
    wire [XLEN - 1:0] alu_res;
    wire zero;
    wire less;
    
    // wires coming to / from the PC
    wire [XLEN - 1:0] pc_d;
    wire [XLEN - 1:0] pc_q;
    wire ld_pc;
    
    wire branch; // flag that gets set when b_cond, zero, and 
                 // less indicate that a branch may occur.
    wire [XLEN - 1:0] pc_next;
    wire [XLEN - 1:0] pc_cond; // pc if branch.
    wire [XLEN - 1:0] pc_branch; // branch target
    wire ld_branch;              // load for the branch target.
    
    main_controller mc(.clock(clock),
                       .reset(reset),
                       .opcode(opcode),
                       .mem_write(mem_write),
                       .ir_write(ir_write),
                       .write_sel(write_sel),
                       .reg_write(reg_write),
                       .lhs_sel(lhs_sel),
                       .rhs_sel(rhs_sel),
                       .pc_sel(pc_select),
                       .alu_mode(alu_mode),
                       .imm_fmt(imm_fmt),
                       .pc_write(pc_write),
                       .operation_complete(operation_complete),
                       .mem_mode(mem_mode),
                       .transfer(mem_transfer),
                       .addr_sel(addr_sel),
                       .ld_branch(ld_branch));
    
    memory_interface mi(.clock(clock),
                        .reset(reset),
                        .haddr(haddr),
                        .hburst(hburst),
                        .hmastlock(hmastlock),
                        .hprot(hprot),
                        .hsize(hsize),
                        .htrans(htrans),
                        .hwdata(hwdata),
                        .hwrite(hwrite),
                        .hrdata(hrdata),
                        .hreadyout(hreadyout),
                        .hresp(hresp),
                        .hsel(hsel),
                        .cpu_addr(cpu_addr),
                        .rdata(rdata),
                        .wdata(wdata),
                        .cpu_write(cpu_write),
                        .operation_complete(operation_complete),
                        .mem_mode(mem_mode),
                        .mem_transfer(mem_transfer),
                        .mem_function(mem_function));
    
    register ir(.clock(clock),
                .reset(reset),
                .d(ir_d),
                .q(ir_q),
                .ld(ld_ir));
    
    register mdr(.clock(clock),
                 .reset(reset),
                 .d(mdr_d),
                 .q(mdr_q),
                 .ld(1));
                 
    register_file rf(.clock(clock),
                     .reset(reset),
                     .reg_w(wrr),
                     .reg_1(rr1),
                     .reg_2(rr2),
                     .write(write_reg),
                     .wdata(wdat),
                     .rs1(rs1),
                     .rs2(rs2));
                     
    register lhs(.clock(clock),
                 .reset(reset),
                 .d(lhs_d),
                 .q(lhs_q),
                 .ld(1));
                 
    register rhs(.clock(clock),
                 .reset(reset),
                 .d(rhs_d),
                 .q(rhs_q),
                 .ld(1));
    
    immediate_controller ic(.instruction(instr),
                            .imm_fmt(imm_format),
                            .immediate(immediate));
    
    alu_controller ac(.alu_mode(alu_ctrl_mode),
                      .func3(func3),
                      .func7(func7),
                      .alu_op(alu_op),
                      .b_cond_val(b_cond));
    
    alu al(.operation(operation),
           .lhs(alu_lhs),
           .rhs(alu_rhs),
           .zero(zero),
           .result(alu_res));
    
    register pc(.clock(clock),
                .reset(reset),
                .d(pc_d),
                .q(pc_q),
                .ld(ld_pc));
    
    register btarg(.clock(clock),
                   .reset(reset),
                   .d(alu_res),
                   .q(pc_branch),
                   .ld(ld_branch));
    
    assign pc_next = pc_q + 4;
    // assigns from the main controller to other 
    // modules
    
    assign cpu_write     = mem_write;
    assign ld_ir         = ir_write;
    assign write_reg     = reg_write;
    assign imm_format    = imm_fmt;
    assign alu_ctrl_mode = alu_mode;
    assign ld_pc         = pc_write;
    // assigns from the memory interface to other
    // modules
    
    
    assign ir_d  = {rdata[7:0], rdata[15:8], rdata[23:16], rdata[31:24]};
    assign mdr_d = rdata;
    assign mem_function = ir_q[14:12];
    // assigns from the instruction register to
    // other modules
    
    assign opcode = ir_q[6:0];
    assign wrr = ir_q[11:7];
    assign rr1 = ir_q[19:15];
    assign rr2 = ir_q[24:20];
    assign instr = ir_q;
    assign func3 = ir_q[14:12];
    assign func7 = ir_q[31:25];
    
    // assigns from the memory data register to
    // other modules
    
    // assigns from the register file to other modules
    
    assign lhs_d = rs1;
    assign rhs_d = rs2;
    assign wdata = rs2;
    
    // asigns from the immediate controller to other modules
    
    // assigns from the alu controller to other modules
    assign operation = alu_op;
    
    // assigns from the alu to other modules
    assign less = alu_res[0];
    
    assign pc_cond = branch ? pc_branch : pc_next; 
    assign pc_d = pc_select == pc_sel_next ? pc_next:
                  pc_select == pc_sel_jump ? alu_res:
                  pc_select == pc_sel_cond ? pc_cond: pc_cond;
    
    // assign for branch
    assign branch = b_cond == branch_if_zero ? zero :
                    b_cond == branch_if_notz ? !zero:
                    b_cond == branch_if_less ? less :
                    b_cond == branch_if_notl ? !less : 1'bx;
    
    // selected values into the main controller
    
    // selected values into the memory interface
    assign cpu_addr = addr_sel == addr_sel_curr ? pc_q :
                      addr_sel == addr_sel_next ? pc_next :
                      addr_sel == addr_sel_data ? alu_res : 'hx;
    // selected values into the instruction register
    
    // selected values into the memory data register
    
    // selected values into the register file
    assign wdat = write_sel == write_sel_res ? alu_res :
                  write_sel == write_sel_ret ? pc_next :
                  write_sel == write_sel_mem ? mdr_q   : mdr_q; // provide a default value
                  
    // selected values into the immediate controller
    
    // selected values into the alu controller
    
    // selected values into the alu.
    // It was found after finishing the state machine for the 
    // entire CPU (excl. non-word load and store instructions)
    // that RISC-V uses PC for branch / jump offsets instead of PC + 4.
    // Since those only ever apply when going into the ALU, the offset
    // fix parameter is added to the program counter and subtracted from
    // 4 to achieve the desired branching effect.
    assign alu_lhs = lhs_sel == lhs_sel_rs ? lhs_q: 
                     lhs_sel == lhs_sel_pc ? pc_q :
                     lhs_sel == lhs_sel_00 ? 0    : 0; // provide a default value.
                     
    assign alu_rhs = rhs_sel == rhs_sel_rs ? rhs_q     :
                     rhs_sel == rhs_sel_im ? immediate : {XLEN{1'bx}};
    
    assign hclk = clock;
    assign hresetn = ~reset;
    
    defparam mc.i_type        = fmt_i_type;
    defparam mc.s_type        = fmt_s_type;
    defparam mc.b_type        = fmt_b_type;
    defparam mc.u_type        = fmt_u_type;
    defparam mc.j_type        = fmt_j_type;
    defparam mc.write_ret     = write_sel_ret;
    defparam mc.write_res     = write_sel_res;
    defparam mc.write_mem     = write_sel_mem;
    defparam mc.lhs_is_rs     = lhs_sel_rs;
    defparam mc.lhs_is_pc     = lhs_sel_pc;
    defparam mc.lhs_is_00     = lhs_sel_00;
    defparam mc.rhs_is_rs     = rhs_sel_rs;
    defparam mc.rhs_is_im     = rhs_sel_im;
    defparam mc.alu_mode_add  = alu_mode_add;
    defparam mc.alu_mode_cmp  = alu_mode_cmp;
    defparam mc.alu_mode_fun  = alu_mode_fun;
    defparam mc.alu_mode_fn3  = alu_mode_fn3;
    defparam mc.opcode_load   = opcode_load;
    defparam mc.opcode_store  = opcode_store;
    defparam mc.opcode_branch = opcode_branch;
    defparam mc.opcode_jal    = opcode_jal;
    defparam mc.opcode_op_imm = opcode_op_imm;
    defparam mc.opcode_op     = opcode_op;
    defparam mc.opcode_jalr   = opcode_jalr;
    defparam mc.opcode_lui    = opcode_lui;
    defparam mc.opcode_auipc  = opcode_auipc;
    defparam mc.opcode_miscmm = opcode_miscmm;
    defparam mc.opcode_system = opcode_system;
    defparam mc.sync_reset    = sync_reset;
    defparam mc.mem_mode_word = mem_mode_word;
    defparam mc.mem_mode_func = mem_mode_func;
    defparam mc.pc_sel_next   = pc_sel_next;
    defparam mc.pc_sel_jump   = pc_sel_jump;
    defparam mc.pc_sel_cond   = pc_sel_cond;
    
    defparam mi.XLEN = XLEN;
    defparam mi.mode_word   = mem_mode_word;
    defparam mi.mode_func   = mem_mode_func;
    
    defparam ir.XLEN = XLEN;
    defparam ir.reset_val = {XLEN{1'b0}};
    defparam ir.sync_reset = sync_reset;
    
    defparam mdr.XLEN = XLEN;
    defparam mdr.reset_val = {XLEN{1'b0}};
    defparam mdr.sync_reset = sync_reset;
    
    defparam rf.XLEN = XLEN;
    
    defparam lhs.XLEN = XLEN;
    defparam lhs.reset_val = {XLEN{1'b0}};
    defparam lhs.sync_reset = sync_reset;
    
    defparam rhs.XLEN = XLEN;
    defparam rhs.reset_val = {XLEN{1'b0}};
    defparam rhs.sync_reset = sync_reset;
    
    defparam ic.XLEN = XLEN;
    defparam ic.i_type = fmt_i_type;
    defparam ic.s_type = fmt_s_type;
    defparam ic.b_type = fmt_b_type;
    defparam ic.u_type = fmt_u_type;
    defparam ic.j_type = fmt_j_type;
    
    defparam ac.OLEN = 4;
    defparam ac.alu_mode_add = alu_mode_add;
    defparam ac.alu_mode_cmp = alu_mode_cmp;
    defparam ac.alu_mode_fun = alu_mode_fun;
    defparam ac.alu_mode_fn3 = alu_mode_fn3;
    defparam ac.op_add       = alu_op_add;
    defparam ac.op_sub       = alu_op_sub;
    defparam ac.op_slt       = alu_op_slt;
    defparam ac.opsltu       = alu_opsltu;
    defparam ac.op_and       = alu_op_and;
    defparam ac.op_or        = alu_op_or;
    defparam ac.op_xor       = alu_op_xor;
    defparam ac.op_sl        = alu_op_sl;
    defparam ac.op_srl       = alu_op_srl;
    defparam ac.op_sra       = alu_op_sra;
    defparam ac.b_cond_zero  = branch_if_zero;
    defparam ac.b_cond_notz  = branch_if_notz;
    defparam ac.b_cond_less  = branch_if_less;
    defparam ac.b_cond_notl  = branch_if_notl;
    
    defparam al.XLEN       = XLEN;
    defparam al.SHIFT_BITS = 5;
    defparam al.OLEN       = 4;
    defparam al.op_add     = alu_op_add;
    defparam al.op_sub     = alu_op_sub;
    defparam al.op_slt     = alu_op_slt;
    defparam al.opsltu     = alu_opsltu;
    defparam al.op_and     = alu_op_and;
    defparam al.op_or      = alu_op_or;
    defparam al.op_xor     = alu_op_xor;
    defparam al.op_sl      = alu_op_sl;
    defparam al.op_srl     = alu_op_srl;
    defparam al.op_sra     = alu_op_sra;
    
    defparam pc.XLEN = XLEN;
    defparam pc.reset_val = reset_address;
    defparam pc.sync_reset = sync_reset;
    
    defparam btarg.XLEN = XLEN;
    defparam btarg.reset_val = reset_address;
    defparam btarg.sync_reset = sync_reset;
    
endmodule
