// This program was cloned from: https://github.com/hello-eternity/Cyberrio
// License: Apache License 2.0

module pipeline #(
    parameter RESET_VECTOR = 32'h8000_0000
) (
    `ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
    `endif
    input clk,
    input reset,

    // from interupt controller
    input meip,
    
    // from busio to fetch
    input [31:0] fetch_data,
    // from busio to memory
    input [31:0] mem_load_data,
    // from busio to hazard
    input fetch_ready,
    input mem_ready,

    // to busio from fetch
    output [31:0] fetch_address,
    // to busio from memory
    output [31:0] mem_address,
    output [31:0] mem_store_data,
    output [1:0] mem_size,
    output mem_signed,
    output mem_load,
    output mem_store
);

csr pipeline_csr (
    `ifdef USE_POWER_PINS
    .vccd1(vccd1),	// User area 1 1.8V supply
    .vssd1(vssd1),	// User area 1 digital ground
    `endif
    .clk(clk),
    .reset(reset),

    .meip(meip),

    // from decode (read port)
    .read_address(decode_to_csr_read_address),
    // to decode (read port)
    .read_data(csr_to_decode_read_data),
    .readable(csr_to_decode_readable),
    .writeable(csr_to_decode_writable),

    // from writeback (write port)
    .write_enable(writeback_to_csr_write_enable),
    .write_address(writeback_to_csr_write_address),
    .write_data(writeback_to_csr_write_data),
    // from writeback
    .retired(writeback_to_csr_retired),
    .traped(global_traped),
    .mret(global_mret),
    .ecp(writeback_to_csr_ecp),
    .trap_cause(writeback_to_csr_trap_cause),
    .interupt(writeback_to_csr_interupt),
    // to writeback
    .eip(csr_to_writeback_eip),
    .tip(csr_to_writeback_tip),
    .sip(csr_to_writeback_sip),

    // to fetch
    .trap_vector(csr_to_fetch_trap_vector),
    .mret_vector(csr_to_fetch_mret_vector)
);

wire [11:0] decode_to_csr_read_address;
wire [31:0] csr_to_decode_read_data;
wire csr_to_decode_readable;
wire csr_to_decode_writable;

wire writeback_to_csr_write_enable;
wire [11:0] writeback_to_csr_write_address;
wire [31:0] writeback_to_csr_write_data;
wire writeback_to_csr_retired;
wire [31:0] writeback_to_csr_ecp;
wire [3:0] writeback_to_csr_trap_cause;
wire writeback_to_csr_interupt;
wire csr_to_writeback_eip;
wire csr_to_writeback_tip;
wire csr_to_writeback_sip;

wire [31:0] csr_to_fetch_trap_vector;
wire [31:0] csr_to_fetch_mret_vector;

wire global_traped;
wire global_mret;
wire global_wfi;

regfile pipeline_registers (
    `ifdef USE_POWER_PINS
    .vccd1(vccd1),	// User area 1 1.8V supply
    .vssd1(vssd1),	// User area 1 digital ground
    `endif
    .clk(clk),

    // from decode (read ports)
    .rs1_address(decode_to_regfile_rs1_address),
    .rs2_address(decode_to_regfile_rs2_address),
    // to decode (read ports)
    .rs1_data(regfile_to_decode_rs1_data),
    .rs2_data(regfile_to_decode_rs2_data),

    // from writeback (write port)
    .rd_address(writeback_to_regfile_rd_address),
    .rd_data(writeback_to_regfile_rd_data)
);

wire [4:0] decode_to_regfile_rs1_address;
wire [4:0] decode_to_regfile_rs2_address;
wire [31:0] regfile_to_decode_rs1_data;
wire [31:0] regfile_to_decode_rs2_data;

wire [4:0] writeback_to_regfile_rd_address;
wire [31:0] writeback_to_regfile_rd_data;

hazard pipeline_hazard (
    `ifdef USE_POWER_PINS
    .vccd1(vccd1),	// User area 1 1.8V supply
    .vssd1(vssd1),	// User area 1 digital ground
    `endif
    .reset(reset),

    // from decode
    .valid_decode(fetch_to_decode_valid),
    .rs1_address_decode(decode_to_regfile_rs1_address),
    .rs2_address_decode(decode_to_regfile_rs2_address),
    .uses_rs1(decode_to_hazaed_uses_rs1),
    .uses_rs2(decode_to_hazaed_uses_rs2),
    .uses_csr(decode_to_hazaed_uses_csr),

    // from execute
    .valid_execute(decode_to_execute_valid),
    .rd_address_execute(decode_to_execute_rd_address),
    .csr_write_execute(decode_to_execute_csr_write),
        
    // from memory
    .valid_memory(execute_to_memory_valid),
    .rd_address_memory(execute_to_memory_rd_address),
    .csr_write_memory(execute_to_memory_csr_write),
    .branch_taken(global_branch_taken),
    .mret_memory(execute_to_memory_mret),
    .load_store(mem_load || mem_store),
    .bypass_memory(memory_to_decode_bypass_address != 0),

    // from writeback
    .valid_writeback(memory_to_writeback_valid),
    .csr_write_writeback(writeback_to_csr_write_enable),
    .mret_writeback(global_mret),
    .traped(global_traped),
    .wfi(global_wfi),

    // from busio
    .fetch_ready(fetch_ready),
    .mem_ready(mem_ready),

    // to fetch
    .stall_fetch(hazard_to_fetch_stall),
    .invalidate_fetch(hazard_to_fetch_invalidate),

    // to decode
    .stall_decode(hazard_to_decode_stall),
    .invalidate_decode(hazard_to_decode_invalidate),

    // to execute
    .stall_execute(hazard_to_execute_stall),
    .invalidate_execute(hazard_to_execute_invalidate),

    // to memory
    .stall_memory(hazard_to_memory_stall),
    .invalidate_memory(hazard_to_memory_invalidate)
);

wire decode_to_hazaed_uses_rs1;
wire decode_to_hazaed_uses_rs2;
wire decode_to_hazaed_uses_csr;

wire hazard_to_fetch_stall;
wire hazard_to_fetch_invalidate;

wire hazard_to_decode_stall;
wire hazard_to_decode_invalidate;

wire hazard_to_execute_stall;
wire hazard_to_execute_invalidate;

wire hazard_to_memory_stall;
wire hazard_to_memory_invalidate;

wire global_branch_taken;

fetch #(
    .RESET_VECTOR(RESET_VECTOR)
) pipeline_fetch (
    `ifdef USE_POWER_PINS
    .vccd1(vccd1),	// User area 1 1.8V supply
    .vssd1(vssd1),	// User area 1 digital ground
    `endif
    .clk(clk),
    .reset(reset),

    // from memory
    .branch(global_branch_taken),
    .branch_vector(memory_to_fetch_branch_address),
    
    // from writeback
    .trap(global_traped),
    .mret(global_mret),

    // from csr
    .trap_vector(csr_to_fetch_trap_vector),
    .mret_vector(csr_to_fetch_mret_vector),

    // from hazard
    .stall(hazard_to_fetch_stall),
    .invalidate(hazard_to_fetch_invalidate),
    
    // to busio
    .fetch_address(fetch_address),
    // from busio
    .fetch_data(fetch_data),

    // to decode
    .pc_out(fetch_to_decode_pc),
    .next_pc_out(fetch_to_decode_next_pc),
    .instruction_out(fetch_to_decode_instruction),
    .valid_out(fetch_to_decode_valid)
);

wire [31:0] memory_to_fetch_branch_address;

wire [31:0] fetch_to_decode_pc;
wire [31:0] fetch_to_decode_next_pc;
wire [31:0] fetch_to_decode_instruction;
wire fetch_to_decode_valid;

decode pipeline_decode (
    `ifdef USE_POWER_PINS
    .vccd1(vccd1),	// User area 1 1.8V supply
    .vssd1(vssd1),	// User area 1 digital ground
    `endif
    .clk(clk),

    // from fetch
    .pc_in(fetch_to_decode_pc),
    .next_pc_in(fetch_to_decode_next_pc),
    .instruction_in(fetch_to_decode_instruction),
    .valid_in(fetch_to_decode_valid),

    // from hazard
    .stall(hazard_to_decode_stall),
    .invalidate(hazard_to_decode_invalidate),
    // to hazard
    .uses_rs1(decode_to_hazaed_uses_rs1),
    .uses_rs2(decode_to_hazaed_uses_rs2),
    .uses_csr(decode_to_hazaed_uses_csr),

    // to regfile
    .rs1_address(decode_to_regfile_rs1_address),
    .rs2_address(decode_to_regfile_rs2_address),
    // from regfile
    .rs1_data(regfile_to_decode_rs1_data),
    .rs2_data(regfile_to_decode_rs2_data),
    
    // to csr
    .csr_address(decode_to_csr_read_address),
    // from csr
    .csr_data(csr_to_decode_read_data),
    .csr_readable(csr_to_decode_readable),
    .csr_writeable(csr_to_decode_writable),

    // from memory
    .bypass_memory_address(memory_to_decode_bypass_address),
    .bypass_memory_data(memory_to_decode_bypass_data),

    // from writeback
    .bypass_writeback_address(writeback_to_regfile_rd_address),
    .bypass_writeback_data(writeback_to_regfile_rd_data),

    // to execute
    .pc_out(decode_to_execute_pc),
    .next_pc_out(decode_to_execute_next_pc),
    // to execute (control EX)
    .rs1_data_out(decode_to_execute_rs1_data),
    .rs2_data_out(decode_to_execute_rs2_data),
    .rs1_bypass_out(decode_to_execute_rs1_bypass),
    .rs2_bypass_out(decode_to_execute_rs2_bypass),
    .rs1_bypassed_out(decode_to_execute_rs1_bypassed),
    .rs2_bypassed_out(decode_to_execute_rs2_bypassed),
    .csr_data_out(decode_to_execute_csr_data),
    .imm_data_out(decode_to_execute_imm_data),
    .alu_function_out(decode_to_execute_alu_function),
    .alu_function_modifier_out(decode_to_execute_alu_function_modifier),
    .alu_select_a_out(decode_to_execute_alu_select_a),
    .alu_select_b_out(decode_to_execute_alu_select_b),
    .cmp_function_out(decode_to_execute_cmp_function),
    .jump_out(decode_to_execute_jump),
    .branch_out(decode_to_execute_branch),
    .csr_read_out(decode_to_execute_csr_read),
    .csr_write_out(decode_to_execute_csr_write),
    .csr_readable_out(decode_to_execute_csr_readable),
    .csr_writeable_out(decode_to_execute_csr_writeable),
    // to execute (control MEM)
    .load_out(decode_to_execute_load),
    .store_out(decode_to_execute_store),
    .load_store_size_out(decode_to_execute_load_store_size),
    .load_signed_out(decode_to_execute_load_signed),
    .bypass_memory_out(decode_to_execute_bypass_memory),
    // to execute (control WB)
    .write_select_out(decode_to_execute_write_select),
    .rd_address_out(decode_to_execute_rd_address),
    .csr_address_out(decode_to_execute_csr_address),
    .mret_out(decode_to_execute_mret),
    .wfi_out(decode_to_execute_wfi),
    // to execute
    .valid_out(decode_to_execute_valid),
    .ecause_out(decode_to_execute_ecause),
    .exception_out(decode_to_execute_exception)
);

wire [4:0] memory_to_decode_bypass_address;
wire [31:0] memory_to_decode_bypass_data;

wire [31:0] decode_to_execute_pc;
wire [31:0] decode_to_execute_next_pc;
wire [31:0] decode_to_execute_rs1_data;
wire [31:0] decode_to_execute_rs2_data;
wire [31:0] decode_to_execute_rs1_bypass;
wire [31:0] decode_to_execute_rs2_bypass;
wire decode_to_execute_rs1_bypassed;
wire decode_to_execute_rs2_bypassed;
wire [31:0] decode_to_execute_csr_data;
wire [31:0] decode_to_execute_imm_data;
wire [2:0] decode_to_execute_alu_function;
wire decode_to_execute_alu_function_modifier;
wire [1:0] decode_to_execute_alu_select_a;
wire [1:0] decode_to_execute_alu_select_b;
wire [2:0] decode_to_execute_cmp_function;
wire decode_to_execute_jump;
wire decode_to_execute_branch;
wire decode_to_execute_csr_read;
wire decode_to_execute_csr_write;
wire decode_to_execute_csr_readable;
wire decode_to_execute_csr_writeable;
wire decode_to_execute_load;
wire decode_to_execute_store;
wire [1:0] decode_to_execute_load_store_size;
wire decode_to_execute_load_signed;
wire decode_to_execute_bypass_memory;
wire [1:0] decode_to_execute_write_select;
wire [4:0] decode_to_execute_rd_address;
wire [11:0] decode_to_execute_csr_address;
wire decode_to_execute_mret;
wire decode_to_execute_wfi;
wire decode_to_execute_valid;
wire [3:0] decode_to_execute_ecause;
wire decode_to_execute_exception;

execute pipeline_execute (
    `ifdef USE_POWER_PINS
    .vccd1(vccd1),	// User area 1 1.8V supply
    .vssd1(vssd1),	// User area 1 digital ground
    `endif
    .clk(clk),

    // from decode
    .pc_in(decode_to_execute_pc),
    .next_pc_in(decode_to_execute_next_pc),
    // from decode (control EX)
    .rs1_data_in(decode_to_execute_rs1_data),
    .rs2_data_in(decode_to_execute_rs2_data),
    .rs1_bypass_in(decode_to_execute_rs1_bypass),
    .rs2_bypass_in(decode_to_execute_rs2_bypass),
    .rs1_bypassed_in(decode_to_execute_rs1_bypassed),
    .rs2_bypassed_in(decode_to_execute_rs2_bypassed),
    .csr_data_in(decode_to_execute_csr_data),
    .imm_data_in(decode_to_execute_imm_data),
    .alu_function_in(decode_to_execute_alu_function),
    .alu_function_modifier_in(decode_to_execute_alu_function_modifier),
    .alu_select_a_in(decode_to_execute_alu_select_a),
    .alu_select_b_in(decode_to_execute_alu_select_b),
    .cmp_function_in(decode_to_execute_cmp_function),
    .jump_in(decode_to_execute_jump),
    .branch_in(decode_to_execute_branch),
    .csr_read_in(decode_to_execute_csr_read),
    .csr_write_in(decode_to_execute_csr_write),
    .csr_readable_in(decode_to_execute_csr_readable),
    .csr_writeable_in(decode_to_execute_csr_writeable),
    // from decode (control MEM)
    .load_in(decode_to_execute_load),
    .store_in(decode_to_execute_store),
    .load_store_size_in(decode_to_execute_load_store_size),
    .load_signed_in(decode_to_execute_load_signed),
    .bypass_memory_in(decode_to_execute_bypass_memory),
    // from decode (control WB)
    .write_select_in(decode_to_execute_write_select),
    .rd_address_in(decode_to_execute_rd_address),
    .csr_address_in(decode_to_execute_csr_address),
    .mret_in(decode_to_execute_mret),
    .wfi_in(decode_to_execute_wfi),
    // from decode
    .valid_in(decode_to_execute_valid),
    .ecause_in(decode_to_execute_ecause),
    .exception_in(decode_to_execute_exception),
    
    // from hazard
    .stall(hazard_to_execute_stall),
    .invalidate(hazard_to_execute_invalidate),

    // to memory
    .pc_out(execute_to_memory_pc),
    .next_pc_out(execute_to_memory_next_pc),
    // to memory (control MEM)
    .alu_data_out(execute_to_memory_alu_data),
    .alu_addition_out(execute_to_memory_alu_addition),
    .rs2_data_out(execute_to_memory_rs2_data),
    .csr_data_out(execute_to_memory_csr_data),
    .branch_out(execute_to_memory_branch),
    .jump_out(execute_to_memory_jump),
    .cmp_output_out(execute_to_memory_cmp_output),
    .load_out(execute_to_memory_load),
    .store_out(execute_to_memory_store),
    .load_store_size_out(execute_to_memory_load_store_size),
    .load_signed_out(execute_to_memory_load_signed),
    .bypass_memory_out(execute_to_memory_bypass_memory),
    // to memory (control WB)
    .write_select_out(execute_to_memory_write_select),
    .rd_address_out(execute_to_memory_rd_address),
    .csr_address_out(execute_to_memory_csr_address),
    .csr_write_out(execute_to_memory_csr_write),
    .mret_out(execute_to_memory_mret),
    .wfi_out(execute_to_memory_wfi),
    // to memory
    .valid_out(execute_to_memory_valid),
    .ecause_out(execute_to_memory_ecause),
    .exception_out(execute_to_memory_exception)
);

wire [31:0] execute_to_memory_pc;
wire [31:0] execute_to_memory_next_pc;
wire [31:0] execute_to_memory_alu_data;
wire [31:0] execute_to_memory_alu_addition;
wire [31:0] execute_to_memory_rs2_data;
wire [31:0] execute_to_memory_csr_data;
wire execute_to_memory_branch;
wire execute_to_memory_jump;
wire execute_to_memory_cmp_output;
wire execute_to_memory_load;
wire execute_to_memory_store;
wire [1:0] execute_to_memory_load_store_size;
wire execute_to_memory_load_signed;
wire execute_to_memory_bypass_memory;
wire [1:0] execute_to_memory_write_select;
wire [4:0] execute_to_memory_rd_address;
wire [11:0] execute_to_memory_csr_address;
wire execute_to_memory_csr_write;
wire execute_to_memory_mret;
wire execute_to_memory_wfi;
wire execute_to_memory_valid;
wire [3:0] execute_to_memory_ecause;
wire execute_to_memory_exception;

memory pipeline_memory (
    `ifdef USE_POWER_PINS
    .vccd1(vccd1),	// User area 1 1.8V supply
    .vssd1(vssd1),	// User area 1 digital ground
    `endif
    .clk(clk),
    // from execute
    .pc_in(execute_to_memory_pc),
    .next_pc_in(execute_to_memory_next_pc),
    // from execute (control MEM)
    .alu_data_in(execute_to_memory_alu_data),
    .alu_addition_in(execute_to_memory_alu_addition),
    .rs2_data_in(execute_to_memory_rs2_data),
    .csr_data_in(execute_to_memory_csr_data),
    .branch_in(execute_to_memory_branch),
    .jump_in(execute_to_memory_jump),
    .cmp_output_in(execute_to_memory_cmp_output),
    .load_in(execute_to_memory_load),
    .store_in(execute_to_memory_store),
    .load_store_size_in(execute_to_memory_load_store_size),
    .load_signed_in(execute_to_memory_load_signed),
    .bypass_memory_in(execute_to_memory_bypass_memory),
    // from execute (control WB)
    .write_select_in(execute_to_memory_write_select),
    .rd_address_in(execute_to_memory_rd_address),
    .csr_address_in(execute_to_memory_csr_address),
    .csr_write_in(execute_to_memory_csr_write),
    .mret_in(execute_to_memory_mret),
    .wfi_in(execute_to_memory_wfi),
    // from execute
    .valid_in(execute_to_memory_valid),
    .ecause_in(execute_to_memory_ecause),
    .exception_in(execute_to_memory_exception),
    
    // from hazard
    .stall(hazard_to_memory_stall),
    .invalidate(hazard_to_memory_invalidate),

    // to decode
    .bypass_address(memory_to_decode_bypass_address),
    .bypass_data(memory_to_decode_bypass_data),

    // to busio
    .mem_address(mem_address),
    .mem_store_data(mem_store_data),
    .mem_size(mem_size),
    .mem_signed(mem_signed),
    .mem_load(mem_load),
    .mem_store(mem_store),
    
    // from busio
    .mem_load_data(mem_load_data),
    
    // to fetch
    .branch_taken(global_branch_taken),
    .branch_address(memory_to_fetch_branch_address),

    // to writeback
    .pc_out(memory_to_writeback_pc),
    .next_pc_out(memory_to_writeback_next_pc),
    // to writeback (control WB)
    .alu_data_out(memory_to_writeback_alu_data),
    .csr_data_out(memory_to_writeback_csr_data),
    .load_data_out(memory_to_writeback_load_data),
    .write_select_out(memory_to_writeback_write_select),
    .rd_address_out(memory_to_writeback_rd_address),
    .csr_address_out(memory_to_writeback_csr_address),
    .csr_write_out(memory_to_writeback_csr_write),
    .mret_out(memory_to_writeback_mret),
    .wfi_out(memory_to_writeback_wfi),
    // to writeback
    .valid_out(memory_to_writeback_valid),
    .ecause_out(memory_to_writeback_ecause),
    .exception_out(memory_to_writeback_exception)
);

wire [31:0] memory_to_writeback_pc;
wire [31:0] memory_to_writeback_next_pc;
wire [31:0] memory_to_writeback_alu_data;
wire [31:0] memory_to_writeback_csr_data;
wire [31:0] memory_to_writeback_load_data;
wire [1:0] memory_to_writeback_write_select;
wire [4:0] memory_to_writeback_rd_address;
wire [11:0] memory_to_writeback_csr_address;
wire memory_to_writeback_csr_write;
wire memory_to_writeback_mret;
wire memory_to_writeback_wfi;
wire memory_to_writeback_valid;
wire [3:0] memory_to_writeback_ecause;
wire memory_to_writeback_exception;

writeback pipeline_writeback (
    `ifdef USE_POWER_PINS
    .vccd1(vccd1),	// User area 1 1.8V supply
    .vssd1(vssd1),	// User area 1 digital ground
    `endif
    /* .clk(clk), */

    // from memory
    .pc_in(memory_to_writeback_pc),
    .next_pc_in(memory_to_writeback_next_pc),
    // from memory (control WB)
    .alu_data_in(memory_to_writeback_alu_data),
    .csr_data_in(memory_to_writeback_csr_data),
    .load_data_in(memory_to_writeback_load_data),
    .write_select_in(memory_to_writeback_write_select),
    .rd_address_in(memory_to_writeback_rd_address),
    .csr_address_in(memory_to_writeback_csr_address),
    .csr_write_in(memory_to_writeback_csr_write),
    .mret_in(memory_to_writeback_mret),
    .wfi_in(memory_to_writeback_wfi),
    // from memory
    .valid_in(memory_to_writeback_valid),
    .ecause_in(memory_to_writeback_ecause),
    .exception_in(memory_to_writeback_exception),

    // from csr
    .sip(csr_to_writeback_sip),
    .tip(csr_to_writeback_tip),
    .eip(csr_to_writeback_eip),

    // to regfile
    .rd_address(writeback_to_regfile_rd_address),
    .rd_data(writeback_to_regfile_rd_data),

    // to csr
    .csr_write(writeback_to_csr_write_enable),
    .csr_address(writeback_to_csr_write_address),
    .csr_data(writeback_to_csr_write_data),

    // to fetch and csr and hazard
    .traped(global_traped),
    .mret(global_mret),
    // to hazard
    .wfi(global_wfi),

    // to csr
    .retired(writeback_to_csr_retired),
    .ecp(writeback_to_csr_ecp),
    .ecause(writeback_to_csr_trap_cause),
    .interupt(writeback_to_csr_interupt)
);

endmodule
