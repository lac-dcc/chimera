/*-------------------------------------------------------------------------
// Module:  core_top
// File:    core_top.v
// Author:  shawn Liu
// E-mail:  shawn110285@gmail.com
// Description: the top module of the cpu core (Kookaburra)
--------------------------------------------------------------------------*/

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//-----------------------------------------------------------------

`include "defines.v"

module core_top(
	input  wire					   clk_i,
	input  wire					   n_rst_i,

	// signal to rom, to read the instruction
	output wire                    rom_ce_o,
	output wire[`RegBus]           rom_addr_o,
	input  wire[`RegBus]           rom_data_i,

	// signal to ram, to read/write the data
	output wire                    ram_ce_o,
	output wire[3:0]               ram_sel_o,
	output wire[`RegBus]           ram_addr_o,
	output wire                    ram_we_o,
	output wire[`RegBus]           ram_data_o,
	input  wire                    ram_data_rvalid,
	input  wire[`RegBus]           ram_data_i,

	// interrupt signal
    input  wire                    irq_software_i,
    input  wire                    irq_timer_i,
    input  wire                    irq_external_i
);

	//------------ signal from ctrl unit  -----------
    wire                 ctrl_ie_type_o;
    wire                 ctrl_set_epc_o;
    wire[`RegBus]        ctrl_epc_o;

    wire                 ctrl_set_mtval_o;
    wire[`RegBus]        ctrl_mtval_o;

    wire                 ctrl_set_cause_o;
    wire[3:0]            ctrl_trap_casue_o;

    wire                 ctrl_mstatus_ie_clear_o;
    wire                 ctrl_mstatus_ie_set_o;

	wire[5:0]            ctrl_stall_o;
	wire                 ctrl_flush_o;
	wire[`RegBus]        ctrl_new_pc_o;


    //------- signals from if  ----
	wire[`InstAddrBus]   if_pc_o;
    assign rom_addr_o =  if_pc_o;

    wire                 if_stall_req_o;
	wire[`InstAddrBus]   if_next_pc_o;
    wire                 if_next_taken_o;
	wire                 if_branch_slot_end_o;

    //wire[`InstAddrBus]   if_next_pc_o;
	//wire[1:0]            if_next_taken_o;

    //------signals from branch prediction ---
    wire[`InstAddrBus]   bp_next_pc_o;
	wire                 bp_next_taken_o;

    //-------signals from if_id ----
	wire[`InstAddrBus]   id_pc_i;
	wire[`InstBus]       id_inst_i;
	wire[`InstAddrBus]   id_next_pc_i;
    wire                 id_next_taken_i;
    wire                 id_branch_slot_end_i;

    //-------signals from id -------

    //id --> reg
    wire                 id_rs1_re_o;
    wire                 id_rs2_re_o;
    wire[`RegAddrBus]    id_rs1_raddr_o;
    wire[`RegAddrBus]    id_rs2_raddr_o;

    //id --> ctrl
    wire                 id_stall_req_o;

    //id --> id_ex
    wire[`RegBus]        id_inst_o;
	wire[`RegBus]        id_imm_o;
	wire[`InstAddrBus]   id_next_pc_o;
    wire                 id_next_taken_o;
    wire                 id_branch_slot_end_o;

	wire                 id_csr_we_o;
	wire[`RegBus]        id_csr_addr_o;

	wire[`RegBus]        id_rs1_data_o;
	wire[`RegBus]        id_rs2_data_o;
	wire                 id_rd_we_o;
	wire[`RegAddrBus]    id_rd_waddr_o;

	wire[`AluSelBus]     id_alusel_o;
	wire[`AluOpBus]      id_uopcode_o;

    wire[`RegBus]        id_pc_o;
	wire[`RegBus]        id_excepttype_o;

    //-------signals from id_ex -------
	// id_ex --> ex
    wire[`RegBus]        ex_pc_i;
    wire[`RegBus]        ex_inst_i;
	wire[`InstAddrBus]   ex_next_pc_i;
    wire                 ex_next_taken_i;
    wire                 ex_branch_slot_end_i;

	wire[`AluSelBus]     ex_alusel_i;
	wire[`AluOpBus]      ex_uopcode_i;

	wire[`RegBus]        ex_rs1_data_i;
	wire[`RegBus]        ex_rs2_data_i;
	wire[`RegBus]        ex_imm_i;
	wire                 ex_rd_we_i;
	wire[`RegAddrBus]    ex_rd_addr_i;

	wire                 ex_csr_we_i;
	wire[`RegBus]        ex_csr_addr_i;

	wire[`RegBus]        ex_excepttype_i;

    //-------signals from ex -------
    // ex --> div
	wire[`RegBus]        ex_dividend_o;
	wire[`RegBus]        ex_divisor_o;
	wire                 ex_div_start_o;
	wire                 ex_div_annul_o;
	wire                 ex_div_signed_o;

    // ex --> ctrl
    wire                 ex_stall_req_o;

    // ex --> csr
    wire[`RegBus]        ex_csr_raddr_o;

	// ex --> ex_mem
    wire[`RegBus]        ex_pc_o;   //to branch prediction as well
	wire[`RegBus]        ex_inst_o;

    wire                 ex_branch_tag_o;
    wire                 ex_branch_slot_end_o;

	wire                 ex_csr_we_o;
	wire[`RegBus]        ex_csr_waddr_o;
	wire[`RegBus]        ex_csr_wdata_o;

	wire                 ex_rd_we_o;
	wire[`RegAddrBus]    ex_rd_addr_o;
	wire[`RegBus]        ex_rd_wdata_o;

	wire[`AluOpBus]      ex_uopcode_o;
	wire[`RegBus]        ex_mem_addr_o;
	wire[`RegBus]        ex_mem_wdata_o;

    wire[`RegBus]        ex_excepttype_o;

    // ex --> branch prediction
	wire                 ex_branch_request_o;
	wire                 ex_branch_taken_o;
	wire                 ex_branch_call_o;
	wire                 ex_branch_ret_o;
	wire                 ex_branch_jmp_o;
	wire[`RegBus]        ex_branch_target_o;

    wire                 ex_branch_redirect_o;   //miss predicted, redirect the pc
	wire[`RegBus]        ex_branch_redirect_pc_o;


    //-------signals from ex_mem -------
	wire                 mem_rd_we_i;
	wire[`RegAddrBus]    mem_rd_addr_i;
	wire[`RegBus]        mem_rd_wdata_i;

	wire[`AluOpBus]      mem_uopcode_i;
	wire[`RegBus]        mem_mem_addr_i;
	wire[`RegBus]        mem_mem_wdata_i;

	wire                 mem_csr_we_i;
	wire[`RegBus]        mem_csr_waddr_i;
	wire[`RegBus]        mem_csr_wdata_i;

    wire[`RegBus]        mem_excepttype_i;
	wire[`RegBus]        mem_pc_i;
	wire[`RegBus]        mem_inst_i;


    //-------signals from mem -----------
	wire                 mem_rd_we_o;
	wire[`RegAddrBus]    mem_rd_addr_o;
	wire[`RegBus]        mem_rd_wdata_o;

	wire                 mem_csr_we_o;
	wire[`RegBus]        mem_csr_waddr_o;
	wire[`RegBus]        mem_csr_wdata_o;

    wire                 mem_stall_req_o;
	wire[`RegBus]        mem_excepttype_o;
	wire[`RegBus]        mem_pc_o;
	wire[`RegBus]        mem_inst_o;


    //----------- signals sourced from mem_wb ----
	wire                 wb_rd_we_i;
	wire[`RegAddrBus]    wb_rd_addr_i;
	wire[`RegBus]        wb_rd_wdata_i;

	wire                 wb_csr_we_i;
	wire[`RegBus]        wb_csr_waddr_i;
	wire[`RegBus]        wb_csr_wdata_i;

    wire                 wb_instret_incr_i;


    //------------ signals from div -----------------------
	wire[`DoubleRegBus]    div_result_o;
	wire                   div_ready_o;


	//------------ signals from reg file -------------------
    wire[`RegBus]          reg_rs1_rdata_o;
    wire[`RegBus]          reg_rs2_rdata_o;


    //-------------------- signals from csr -----------------
    wire[`RegBus]          csr_rdata_o;

    wire[`RegBus]          csr_mstatus_o;    // mstatus
    wire[`RegBus]          csr_mie_o;
    wire[`RegBus]          csr_mip_o;
    wire[`RegBus]          csr_mtvec_o;      // mtvec
    wire[`RegBus]          csr_mepc_o;       // mepc

    wire                   csr_mstatus_ie_o;
    wire                   csr_mie_external_o;
    wire                   csr_mie_timer_o;
    wire                   csr_mie_sw_o;
    wire                   csr_mip_external_o;
	wire                   csr_mip_timer_o;
    wire                   csr_mip_sw_o;

    wire[`RegBus]          csr_mtvec_o;
	wire[`RegBus]          csr_epc_o;

    //ifu instantiate
	ifu ifu0(
		.clk_i(clk_i),
		.n_rst_i(n_rst_i),

		// from the control unit
		.stall_i(ctrl_stall_o),
		.flush_i(ctrl_flush_o),
		.new_pc_i(ctrl_new_pc_o),

        // from bp
		.next_pc_i (bp_next_pc_o),
		.next_taken_i(bp_next_taken_o),

		// from exe unit
		.branch_redirect_i(ex_branch_redirect_o),
		.branch_redirect_pc_i(ex_branch_redirect_pc_o),

        // to rom and to bp
		.pc_o(if_pc_o),
		.ce_o(rom_ce_o),	   //connect to outside rom

		// to ctrl
		.stall_req_o(if_stall_req_o),

		// to exe unit
        .next_pc_o(if_next_pc_o),
		.next_taken_o(if_next_taken_o),
		.branch_slot_end_o(if_branch_slot_end_o)
	);


    branch_prediction bp0(
		.clk_i(clk_i),
		.n_rst_i(n_rst_i),

		.branch_source_i(ex_pc_o),   // the pc caused the branch
		.branch_request_i(ex_branch_request_o),  // is this instruction a branch/jump ?
		.branch_is_taken_i(ex_branch_taken_o),
		.branch_is_call_i(ex_branch_call_o),
		.branch_is_ret_i(ex_branch_ret_o),
		.branch_is_jmp_i(ex_branch_jmp_o),
		.branch_target_i(ex_branch_target_o),   // the acually branch target pc
		.branch_mispredict_i(ex_branch_redirect_o),

		//input signals from fetch unit
		.pc_i (if_pc_o),
		.stall_i(ctrl_stall_o[0]),

		// output signals to fetch unit
		.next_pc_o (bp_next_pc_o),    // next predicted pc
		.next_taken_o (bp_next_taken_o)  // branch take or not, forward to execute via fetch module
	);


    //if_id instantiate
	if_id if_id0(
		.clk_i(clk_i),
		.n_rst_i(n_rst_i),

		//from ctrl unit
		.stall_i(ctrl_stall_o),
		.flush_i(ctrl_flush_o),

		//from if
		.pc_i(if_pc_o),
        .next_pc_i(if_next_pc_o),
        .next_taken_i(if_next_taken_o),
        .branch_slot_end_i(if_branch_slot_end_o),

		//from rom
		.inst_i(rom_data_i),

		.branch_redirect_i(ex_branch_redirect_o),

		// to id
		.pc_o(id_pc_i),
		.inst_o(id_inst_i),
        .next_pc_o(id_next_pc_i),
        .next_taken_o(id_next_taken_i),
		.branch_slot_end_o(id_branch_slot_end_i)
	);


    //instantiate id
	id id0(
		.n_rst_i(n_rst_i),

		//signal from the if_id
		.pc_i(id_pc_i),
		.inst_i(id_inst_i),
        .next_pc_i(id_next_pc_i),
        .next_taken_i(id_next_taken_i),
        .branch_slot_end_i(id_branch_slot_end_i),

		//signal to read regfile
		.rs1_re_o(id_rs1_re_o),
		.rs2_re_o(id_rs2_re_o),
		.rs1_raddr_o(id_rs1_raddr_o),
		.rs2_raddr_o(id_rs2_raddr_o),

        // signal from regfile
		.rs1_rdata_i(reg_rs1_rdata_o),
		.rs2_rdata_i(reg_rs2_rdata_o),

	    //bypass from the ex
		.branch_redirect_i(ex_branch_redirect_o),
  	    .ex_uopcode_i(ex_uopcode_o),
		.ex_rd_we_i(ex_rd_we_o),
		.ex_rd_waddr_i(ex_rd_addr_o),
		.ex_rd_wdata_i(ex_rd_wdata_o),

	    //bypass the dest rd in mem to decode
		.mem_rd_we_i(mem_rd_we_o),
		.mem_rd_waddr_i(mem_rd_addr_o),
		.mem_rd_wdata_i(mem_rd_wdata_o),

        //signal to ctrl
		.stall_req_o(id_stall_req_o),

		//signals to id_ex
        .pc_o(id_pc_o),
		.inst_o(id_inst_o),
        .next_pc_o(id_next_pc_o),
        .next_taken_o(id_next_taken_o),
		.branch_slot_end_o(id_branch_slot_end_o),

		.imm_o(id_imm_o),

		.csr_we_o(id_csr_we_o),
		.csr_addr_o(id_csr_addr_o),

		.rs1_data_o(id_rs1_data_o),
		.rs2_data_o(id_rs2_data_o),
		.rd_we_o(id_rd_we_o),
		.rd_waddr_o(id_rd_waddr_o),

		.alusel_o(id_alusel_o),
		.uopcode_o(id_uopcode_o),

        .exception_o(id_excepttype_o)
	);



	//instantiate id_ex
	id_ex id_ex0(
		.clk_i(clk_i),
		.n_rst_i(n_rst_i),

		//signal from the ctrl unit
		.stall_i(ctrl_stall_o),
		.flush_i(ctrl_flush_o),

		//signal from id
		.pc_i(id_pc_o),
        .inst_i(id_inst_o),
        .next_pc_i(id_next_pc_o),
        .next_taken_i(id_next_taken_o),
		.branch_slot_end_i(id_branch_slot_end_o),

		.alusel_i(id_alusel_o),
		.uopcode_i(id_uopcode_o),

		.rs1_data_i(id_rs1_data_o),
		.rs2_data_i(id_rs2_data_o),
        .imm_i(id_imm_o),
		.rd_we_i(id_rd_we_o),
		.rd_addr_i(id_rd_waddr_o),

		.csr_we_i(id_csr_we_o),
        .csr_addr_i(id_csr_addr_o),

		.exception_i(id_excepttype_o),


		//signal to ex
		.pc_o(ex_pc_i),
		.inst_o(ex_inst_i),
        .next_pc_o(ex_next_pc_i),
        .next_taken_o(ex_next_taken_i),
        .branch_slot_end_o(ex_branch_slot_end_i),

		.alusel_o(ex_alusel_i),
		.uopcode_o(ex_uopcode_i),

		.rs1_data_o(ex_rs1_data_i),
		.rs2_data_o(ex_rs2_data_i),
		.imm_o(ex_imm_i),
		.rd_we_o(ex_rd_we_i),
		.rd_addr_o(ex_rd_addr_i),

		.csr_we_o(ex_csr_we_i),
        .csr_addr_o(ex_csr_addr_i),

		.exception_o(ex_excepttype_i)
	);


	//EX模块
	ex ex0(
		.n_rst_i(n_rst_i),

		//from the id_ex
		.pc_i(ex_pc_i),
		.inst_i(ex_inst_i),
        .next_pc_i(ex_next_pc_i),
		.next_taken_i(ex_next_taken_i),
        .branch_slot_end_i(ex_branch_slot_end_i),

		.alusel_i(ex_alusel_i),
		.uopcode_i(ex_uopcode_i),

		.rs1_data_i(ex_rs1_data_i),
		.rs2_data_i(ex_rs2_data_i),
		.imm_i(ex_imm_i),
		.rd_we_i(ex_rd_we_i),
		.rd_addr_i(ex_rd_addr_i),

		.csr_we_i(ex_csr_we_i),
        .csr_addr_i(ex_csr_addr_i),
        .exception_i(ex_excepttype_i),

        // to div module
		.dividend_o(ex_dividend_o),
		.divisor_o(ex_divisor_o),
		.div_start_o(ex_div_start_o),
		.div_signed_o(ex_div_signed_o),
        // result from div module
		.div_result_i(div_result_o),
		.div_ready_i(div_ready_o),

        // to control unit
		.stall_req_o(ex_stall_req_o),

        // read the csr
		.csr_raddr_o(ex_csr_raddr_o),
		.csr_rdata_i(csr_rdata_o),

		//forward the csr updating from mem stage
     	.mem_csr_we_i(mem_csr_we_o),
		.mem_csr_waddr_i(mem_csr_waddr_o),
		.mem_csr_wdata_i(mem_csr_wdata_o),

		//forward the csr updating from write back stage
    	.wb_csr_we_i(wb_csr_we_i),
		.wb_csr_waddr_i(wb_csr_waddr_i),
		.wb_csr_wdata_i(wb_csr_wdata_i),


		//pass down the signals to next pipeline stage
		.pc_o(ex_pc_o),
		.inst_o(ex_inst_o),

		// branch
        .branch_request_o (ex_branch_request_o),  // is this instruction a branch/jump ?
        .branch_is_taken_o (ex_branch_taken_o),
        .branch_is_call_o (ex_branch_call_o),
        .branch_is_ret_o (ex_branch_ret_o),
        .branch_is_jmp_o (ex_branch_jmp_o),
        .branch_target_o (ex_branch_target_o),   // the acually branch target pc
		.branch_redirect_o(ex_branch_redirect_o),
		.branch_redirect_pc_o(ex_branch_redirect_pc_o),
		.branch_tag_o(ex_branch_tag_o),
        .branch_slot_end_o(ex_branch_slot_end_o),

		.csr_we_o(ex_csr_we_o),
		.csr_waddr_o(ex_csr_waddr_o),
		.csr_wdata_o(ex_csr_wdata_o),

		.rd_we_o(ex_rd_we_o),    //foward the rd info to idu meanwhile
		.rd_addr_o(ex_rd_addr_o),
		.rd_wdata_o(ex_rd_wdata_o),

		.uopcode_o(ex_uopcode_o),
		.mem_addr_o(ex_mem_addr_o),
		.mem_wdata_o(ex_mem_wdata_o),

		.exception_o(ex_excepttype_o)
	);


	div div0(
		.clk_i(clk_i),
		.n_rst_i(n_rst_i),
	    // from the ex
		.div_signed_i(ex_div_signed_o),
		.dividend_i(ex_dividend_o),
		.divisor_i(ex_divisor_o),
		.start_i(ex_div_start_o),
		.annul_i(1'b0),
	     // to exu
		.result_o(div_result_o),
		.ready_o(div_ready_o)
	);

    ex_mem ex_mem0(
		.clk_i(clk_i),
		.n_rst_i(n_rst_i),

	    //from ctrl unit
	    .stall_i(ctrl_stall_o),
	    .flush_i(ctrl_flush_o),

		//from the exu
		.pc_i(ex_pc_o),
		.inst_i(ex_inst_o),

        .branch_tag_i(ex_branch_tag_o),
		.branch_slot_end_i(ex_branch_slot_end_o),

		.rd_we_i(ex_rd_we_o),
		.rd_addr_i(ex_rd_addr_o),
		.rd_wdata_i(ex_rd_wdata_o),

    	.uopcode_i(ex_uopcode_o),
		.mem_addr_i(ex_mem_addr_o),
		.mem_wdata_i(ex_mem_wdata_o),

		.csr_we_i(ex_csr_we_o),
		.csr_waddr_i(ex_csr_waddr_o),
		.csr_wdata_i(ex_csr_wdata_o),

        .exception_i(ex_excepttype_o),

		// pass down to lsu
		.rd_we_o(mem_rd_we_i),    //forward to id meanwhile
		.rd_addr_o(mem_rd_addr_i),
		.rd_wdata_o(mem_rd_wdata_i),

		// load or store
     	.uopcode_o(mem_uopcode_i),

		 // store to the memory
		.mem_addr_o(mem_mem_addr_i),
		.mem_wdata_o(mem_mem_wdata_i),

		.csr_we_o(mem_csr_we_i),    //forward to ex meanwhile
		.csr_waddr_o(mem_csr_waddr_i),
		.csr_wdata_o(mem_csr_wdata_i),

		.exception_o(mem_excepttype_i),
		.pc_o(mem_pc_i),
		.inst_o(mem_inst_i)
	);

	mem mem0(
		.n_rst_i(n_rst_i),

		// signals from exu
        .exception_i(mem_excepttype_i),
		.pc_i(mem_pc_i),
		.inst_i(mem_inst_i),

		// GPR
		.rd_we_i(mem_rd_we_i),
		.rd_addr_i(mem_rd_addr_i),
		.rd_wdata_i(mem_rd_wdata_i),

  	    .uopcode_i(mem_uopcode_i),
		.mem_addr_i(mem_mem_addr_i),
		.mem_wdata_i(mem_mem_wdata_i),

		// read or write the memory
		.mem_addr_o(ram_addr_o),
		.mem_we_o(ram_we_o),
		.mem_sel_o(ram_sel_o),
		.mem_data_o(ram_data_o),
		.mem_ce_o(ram_ce_o),
		.mem_data_i(ram_data_i),

	    // CSR write signals
		.csr_we_i(mem_csr_we_i),
		.csr_waddr_i(mem_csr_waddr_i),
		.csr_wdata_i(mem_csr_wdata_i),

        //回写阶段的指令是否要写CSR，用来检测数据相关
        .wb_csr_we_i(wb_csr_we_i),
		.wb_csr_waddr_i(wb_csr_waddr_i),
        .wb_csr_wdata_i(wb_csr_wdata_i),


		//pass down to mem_wb stage
		//GPR
		.rd_we_o(mem_rd_we_o),
		.rd_addr_o(mem_rd_addr_o),
		.rd_wdata_o(mem_rd_wdata_o),

        // CSR
		.csr_we_o(mem_csr_we_o),
		.csr_waddr_o(mem_csr_waddr_o),
		.csr_wdata_o(mem_csr_wdata_o),

        // stall req and execeptions
		.stall_req_o(mem_stall_req_o),
		.exception_o(mem_excepttype_o),
		.pc_o(mem_pc_o),
		.inst_o(mem_inst_o)

	);

	mem_wb mem_wb0(
		.clk_i(clk_i),
		.n_rst_i(n_rst_i),

         //wires from ctrl unit
        .stall_i(ctrl_stall_o),
		.flush_i(ctrl_flush_o),

		//from mem
		.rd_we_i(mem_rd_we_o),
		.rd_addr_i(mem_rd_addr_o),
		.rd_wdata_i(mem_rd_wdata_o),

		.csr_we_i(mem_csr_we_o),
		.csr_waddr_i(mem_csr_waddr_o),
		.csr_wdata_i(mem_csr_wdata_o),

		// pass down to write back stage, update the csr and gpr
		.rd_we_o(wb_rd_we_i),
		.rd_addr_o(wb_rd_addr_i),
		.rd_wdata_o(wb_rd_wdata_i),

		.csr_we_o(wb_csr_we_i),
		.csr_waddr_o(wb_csr_waddr_i),
		.csr_wdata_o(wb_csr_wdata_i),

		.instret_incr_o(wb_instret_incr_i)
	);


	ctrl ctrl0(
		.clk_i(clk_i),
		.n_rst_i(n_rst_i),
	     //from mem
        .exception_i(mem_excepttype_o),
		.pc_i(mem_pc_o),
		.inst_i(mem_inst_o),
         //from if, id, eu, mem
        .stallreq_from_if_i(if_stall_req_o),
		.stallreq_from_id_i(id_stall_req_o),
		.stallreq_from_ex_i(ex_stall_req_o),
		.stallreq_from_mem_i(mem_stall_req_o),

        //from csr
        .mstatus_ie_i(csr_mstatus_ie_o),

        .mie_external_i(csr_mie_external_o),
        .mie_timer_i(csr_mie_timer_o),
        .mie_sw_i (csr_mie_sw_o),

        .mip_external_i(csr_mip_external_o),
		.mip_timer_i(csr_mip_timer_o),
        .mip_sw_i(csr_mip_sw_o),

        .mtvec_i(csr_mtvec_o),
		.epc_i(csr_epc_o),

        // to csr
        .ie_type_o(ctrl_ie_type_o),
        .set_cause_o(ctrl_set_cause_o),
        .trap_casue_o(ctrl_trap_casue_o),

        .set_epc_o(ctrl_set_epc_o),
        .epc_o(ctrl_epc_o),

        .set_mtval_o(ctrl_set_mtval_o),
        .mtval_o(ctrl_mtval_o),


        .mstatus_ie_clear_o(ctrl_mstatus_ie_clear_o),
        .mstatus_ie_set_o(ctrl_mstatus_ie_set_o),

         //output the control signals
		.stall_o(ctrl_stall_o),
		.flush_o(ctrl_flush_o),
        .new_pc_o(ctrl_new_pc_o)
	);



	csr_file csr0(
		.clk_i(clk_i),
		.n_rst_i(n_rst_i),

		.irq_software_i(irq_software_i),
		.irq_timer_i(irq_timer_i),
		.irq_external_i(irq_external_i),

        // read csr
		.raddr_i(ex_csr_raddr_o),
		.rdata_o(csr_rdata_o),

        //write csr
		.we_i(wb_csr_we_i),
		.waddr_i(wb_csr_waddr_i),
		.wdata_i(wb_csr_wdata_i),

        .instret_incr_i(wb_instret_incr_i),

        //from control
        .ie_type_i(ctrl_ie_type_o),
        .set_cause_i(ctrl_set_cause_o),
        .trap_casue_i(ctrl_trap_casue_o),

        .set_epc_i(ctrl_set_epc_o),
        .epc_i(ctrl_epc_o),

        .set_mtval_i(ctrl_set_mtval_o),
        .mtval_i(ctrl_mtval_o),

        .mstatus_ie_clear_i(ctrl_mstatus_ie_clear_o),
        .mstatus_ie_set_i(ctrl_mstatus_ie_set_o),

		// to control
        .mstatus_ie_o(csr_mstatus_ie_o),

        .mie_external_o(csr_mie_external_o),
        .mie_timer_o(csr_mie_timer_o),
        .mie_sw_o(csr_mie_sw_o),

        .mip_external_o(csr_mip_external_o),
		.mip_timer_o(csr_mip_timer_o),
        .mip_sw_o(csr_mip_sw_o),

        .mtvec_o(csr_mtvec_o),
		.epc_o(csr_epc_o)
	);


    //instantiate the regfile
	regfile regfile0(
		.clk_i (clk_i),
		.n_rst_i (n_rst_i),

		.rd_we_i(wb_rd_we_i),
		.rd_addr_i(wb_rd_addr_i),
		.rd_wdata_i(wb_rd_wdata_i),

		.rs1_re_i(id_rs1_re_o),
		.rs1_raddr_i(id_rs1_raddr_o),
		.rs1_rdata_o(reg_rs1_rdata_o),

		.rs2_re_i(id_rs2_re_o),
		.rs2_raddr_i(id_rs2_raddr_o),
		.rs2_rdata_o(reg_rs2_rdata_o)
	);

endmodule