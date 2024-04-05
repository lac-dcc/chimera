//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//
//
// File             : airi5c_core.v
// Author           : A. Stanitzki
// Creation Date    : 09.10.20
// Last Modified    : Thu 20 Jan 2022 09:00:22 AM CET
// Version          : 1.0
// Abstract         : Airi5c core
// History          : 16.08.22 - improvements for AHB-Lite compatability
//                    07.07.20 - rebranding to AIRI5C
//                    22.08.19 - moved debug rom to its own module
//                             - removed legacy hacks and twirks
//                             - added more comments
//                             - fixed error in debug ROM code (wrong register stored to hw stack now fixed)
//                    10.12.18 - beautified and updated comments (ASt)
// Notes            : The core uses seperate instruction and data memory busses with an AHB-Lite 
//                    compatible interface (only basic AHB-Lite transfers are supported). 

`include "airi5c_arch_options.vh"
`include "airi5c_hasti_constants.vh"
`include "airi5c_ctrl_constants.vh"
`include "airi5c_csr_addr_map.vh"
`include "airi5c_dmi_constants.vh"
`include "rv32_opcodes.vh"

module airi5c_core(
  input                           rst_ni,
  input                           clk_i, 

  output                          ndmreset_o,
  input                           testmode_i,

  input [`N_EXT_INTS-1:0]         ext_interrupts_i,    // external interrupt sources, active high 
  input                           system_timer_tick_i, // system timer interrupt (system timer is a
                                                       //   mem-mapped periph)

  // AHB-Lite style system busses
  output [`HASTI_ADDR_WIDTH-1:0]  imem_haddr_o,
  output                          imem_hwrite_o,
  output [`HASTI_SIZE_WIDTH-1:0]  imem_hsize_o,
  output [`HASTI_BURST_WIDTH-1:0] imem_hburst_o,
  output                          imem_hmastlock_o,
  output [`HASTI_PROT_WIDTH-1:0]  imem_hprot_o,
  output [`HASTI_TRANS_WIDTH-1:0] imem_htrans_o,
  output [`HASTI_BUS_WIDTH-1:0]   imem_hwdata_o,
  input [`HASTI_BUS_WIDTH-1:0]    imem_hrdata_i,
  input                           imem_hready_i,
  input [`HASTI_RESP_WIDTH-1:0]   imem_hresp_i,

  output [`HASTI_ADDR_WIDTH-1:0]  dmem_haddr_o,
  output                          dmem_hwrite_o,
  output [`HASTI_SIZE_WIDTH-1:0]  dmem_hsize_o,
  output [`HASTI_BURST_WIDTH-1:0] dmem_hburst_o,
  output                          dmem_hmastlock_o,
  output [`HASTI_PROT_WIDTH-1:0]  dmem_hprot_o,
  output [`HASTI_TRANS_WIDTH-1:0] dmem_htrans_o,
  output [`HASTI_BUS_WIDTH-1:0]   dmem_hwdata_o,
  input [`HASTI_BUS_WIDTH-1:0]    dmem_hrdata_i,
  input                           dmem_hready_i,
  input [`HASTI_RESP_WIDTH-1:0]   dmem_hresp_i,

  // When partial reconfiguration is used on FPGAs, the lock_custom signal can be used to keep the
  // PCPI interface in a defined state while coprocessors are swapped.
  input                           lock_custom_i,

  // Debug Module Interface (DMI) bus. 
  // 
  // This connects the cores Debug Module (DM) to an external Debug Transport Module (DTM), which 
  // in our case is a JTAG-TAP.The DTM uses the DMI to access registers in the DM, thereby 
  // performing debug operations.
  input [`DMI_ADDR_WIDTH-1:0]     dmi_addr_i,
  input                           dmi_en_i,       
  output [`DMI_WIDTH-1:0]         dmi_rdata_o,
  input [`DMI_WIDTH-1:0]          dmi_wdata_i,
  input                           dmi_wen_i,
  output                          dmi_error_o,
  output                          dmi_dm_busy_o
);

  // ==============================================================================================
  // == Wires                                                                                     =
  // ==============================================================================================

  // constant assignments to ports
  buf(imem_hwrite_o,1'b0);   
  assign imem_hsize_o = `HASTI_SIZE_WORD;

  // internal reset generation from debug-module signals and global reset
  wire                          dm_ndmreset;
  assign ndmreset_o = dm_ndmreset;
  wire                          rst_pipeline_n = rst_ni & ndmreset_o;

  // System bus signals (to core) translated from the AHB-Lite signals
  wire [`HASTI_TRANS_WIDTH-1:0] imem_htrans_core;
  wire [`HASTI_TRANS_WIDTH-1:0] dmem_htrans_core;
   
  // register file access from debug module
  // the debug module can read/write registers in the 
  // general purpose register (GPR) file and in the 
  // control and status register (CSR) file directly using
  // a separate port.

  wire [`DMI_WIDTH-1:0]          dm_regfile_rd;
  wire [`DMI_WIDTH-1:0]          dm_regfile_wd;
  wire                           dm_regfile_wen;
  wire [`REG_ADDR_WIDTH-1:0]     dm_regfile_wara;
`ifdef ISA_EXT_F
  wire                           dm_sel_fpu_reg;
`endif

  wire [`CSR_ADDR_WIDTH-1:0]     dm_csr_addr;
  wire [`CSR_CMD_WIDTH-1:0]      dm_csr_cmd;
  wire [`XPR_LEN-1:0]            dm_csr_rdata;
  wire [`XPR_LEN-1:0]            dm_csr_wdata;

  // run control for individual harts
  // the debug module controls individual cores/harts 
  // using a set of request / status indiction lines.
  // within the debug module, there are mechanisms to 
  // select the group of targeted cores. On this hierarchy level, 
  // a set of control lines needs to be provided for each hart.
  //
  // the current implementation is single-core, so only one set 
  // of control lines is provided.

  wire                dm_hart0_haltreq; // requests the hart to halt and enter debug loop
  wire                dm_hart0_resumereq; // requests the hart to resume opertion at last PC
  wire                dm_hart0_resumeack; // acknowledges the hart has resumed.
  
  wire [`XPR_LEN-1:0] dm_hart0_progbuf0;  // two-instruction-program-buffer that can be filled
  wire [`XPR_LEN-1:0] dm_hart0_progbuf1;  // by the debugger with arbitrary commands. 
                  // thereby the main pipeline is used to execute functions
                  // like memory access in debug mode.

  wire                dm_hart0_postexecreq; // requests the hart to execute the programm buffer.
  wire                dm_hart0_halted;  // signals the hart has sucessfully entered debug loop


  reg [`XPR_LEN-1:0] imem_rdata_muxed;
  reg [`XPR_LEN-1:0] dmem_rdata_muxed;
  
  // ================================================================================================


  // IMEM/DMEM bus guards. Only propagate htrans to external bus if 
  // the adress mask matches. This prevents excessive bus toggling during debug.

  wire imem_external = |imem_haddr_o[31:28];
  assign imem_htrans_o = imem_external ? imem_htrans_core : `HASTI_TRANS_IDLE;

  wire dmem_external = |dmem_haddr_o[31:28];
  assign dmem_htrans_o = dmem_external ? dmem_htrans_core : `HASTI_TRANS_IDLE;

  assign imem_hwdata_o = 0;

  // ================================================================================================

  wire [4:0] unconnected_1;

  airi5c_debug_module debug_module( 
    .rst_ni(rst_ni),
    .clk_i(clk_i),
    .testmode(testmode_i),

    .dmi_addr_i(dmi_addr_i),
    .dmi_en_i(dmi_en_i),
    .dmi_error_o(dmi_error_o),
    .dmi_rdata_o(dmi_rdata_o),
    .dmi_wdata_i(dmi_wdata_i),
    .dmi_wen_i(dmi_wen_i),
    .dmi_dm_busy_o(dmi_dm_busy_o),

    .dm_regfile_wen(dm_regfile_wen),
    .dm_regfile_wara(dm_regfile_wara),
`ifdef ISA_EXT_F
    .dm_sel_fpu_reg(dm_sel_fpu_reg),
`endif
    .dm_regfile_rd(dm_regfile_rd),
    .dm_regfile_wd(dm_regfile_wd),

    .dm_hart0_haltreq(dm_hart0_haltreq),
    .dm_hart0_resumereq(dm_hart0_resumereq),
    .dm_hart0_halted(dm_hart0_halted),
    .dm_hart0_postexecreq(dm_hart0_postexecreq),
    .dm_hart0_resumeack(dm_hart0_resumeack),
    .dm_hart0_ndmreset(dm_ndmreset),

    .dm_hart0_progbuf0(dm_hart0_progbuf0),
    .dm_hart0_progbuf1(dm_hart0_progbuf1),

    .dm_illegal_csr_access(dm_illegal_csr_access),
    .dm_csr_addr(dm_csr_addr),
    .dm_csr_cmd(dm_csr_cmd),
    .dm_csr_rdata(dm_csr_rdata),
    .dm_csr_wdata(dm_csr_wdata),
    .dm_state_out(unconnected_1) // implement me
  );

  // ==============================================================================================
  // == Debug-ROM + Debug Program Buffer                                                          =
  // ==============================================================================================

  wire  [`XPR_LEN-1:0]        imem_rdata_debug; 
  wire  [`XPR_LEN-1:0]        dmem_rdata_debug;

  airi5c_debug_rom debug_rom(
    .rst_ni(rst_pipeline_n),
    .clk_i(clk_i),

    // status signals from/to debug module
    .postexec_req_i(dm_hart0_postexecreq),
    .resume_req_i(dm_hart0_resumereq),
    .halted_o(dm_hart0_halted),
    .resume_ack_o(dm_hart0_resumeack),

    // two-line program buffer located in debug module
    .progbuf0_i(dm_hart0_progbuf0),
    .progbuf1_i(dm_hart0_progbuf1),

     // Memory interface
    .rom_imem_addr_i(imem_haddr_o),
    .rom_imem_rdata_o(imem_rdata_debug),
    .rom_dmem_addr_i(dmem_haddr_o),
    .rom_dmem_write_i(dmem_hwrite_o),
    .rom_dmem_rdata_o(dmem_rdata_debug),
    .rom_dmem_wdata_i(dmem_hwdata_o)
  );


  // Instruction MUX between debug ROM and regular memory
  reg [31:0] imem_haddr_r;
  always @(posedge clk_i or negedge rst_ni) begin
    if(~rst_ni) begin
      imem_haddr_r <= 0;
    end else begin 
      if(imem_hready_i & |imem_htrans_core) 
        imem_haddr_r <= imem_haddr_o;
    end
  end

  always @* begin
    casez(imem_haddr_r)
      `ADDR_DEBUG_ROM   : begin
                            imem_rdata_muxed = imem_rdata_debug;
                          end
      `ADDR_IMEM        : begin 
                            imem_rdata_muxed = imem_hrdata_i;    
                          end
    endcase
  end

  // Data MUX between debug ROM and regular memory (and special places within debug rom)

  reg [31:0] dmem_haddr_r;
  always @(posedge clk_i or negedge rst_ni) begin
    if(~rst_ni) begin 
      dmem_haddr_r <= 0;
    end else begin
      if(dmem_hready_i & |dmem_htrans_core) 
        dmem_haddr_r <= dmem_haddr_o;
    end
  end

  always @* begin
    casez(dmem_haddr_r)
      `ADDR_DEBUG_ROM : begin
                          dmem_rdata_muxed = dmem_rdata_debug;
                        end
      `ADDR_IMEM      : begin 
                          dmem_rdata_muxed = dmem_hrdata_i;
                        end
    endcase
  end

  // ==============================================================================================
  // == Coprocessors                                                                              =
  // ==============================================================================================

  wire                 pcpi_valid;
  wire  [`XPR_LEN-1:0] pcpi_insn;
  wire  [`XPR_LEN-1:0] pcpi_rs1;
  wire  [`XPR_LEN-1:0] pcpi_rs2;
  wire  [`XPR_LEN-1:0] pcpi_rs3;
  wire                 pcpi_wr;      
  wire  [`XPR_LEN-1:0] pcpi_rd;
  wire  [`XPR_LEN-1:0] pcpi_rd2;
  wire                 pcpi_use_rd64;
  wire                 pcpi_wait;
  wire                 pcpi_ready;


  // ==============================================================================================
  // == M-Extension (MUL/DIV/REM)                                                                 =
  // ==============================================================================================

`ifdef ISA_EXT_M
`ifndef ISA_EXT_P
  wire                 pcpi_wr_mul_div;
  wire  [`XPR_LEN-1:0] pcpi_rd_mul_div;
  wire  [`XPR_LEN-1:0] pcpi_rd2_mul_div = `XPR_LEN'h0;
  wire                 pcpi_use_rd64_mul_div = 1'b0;
  wire                 pcpi_wait_mul_div;
  wire                 pcpi_ready_mul_div;

  airi5c_mul_div  mul_div(
    .nreset(rst_pipeline_n),
    .clk(clk_i),
  
    .pcpi_valid(pcpi_valid),
    .pcpi_insn(pcpi_insn),
    .pcpi_rs1(pcpi_rs1),
    .pcpi_rs2(pcpi_rs2),
  //  .pcpi_rs3(pcpi_rs3),
    .pcpi_wr(pcpi_wr_mul_div),
    .pcpi_rd(pcpi_rd_mul_div),
  //  .pcpi_rd2(pcpi_rd2_mul_div),
  //  .pcpi_use_rd64(pcpi_use_rd64_mul_div),
    .pcpi_wait(pcpi_wait_mul_div),
    .pcpi_ready(pcpi_ready_mul_div)
  );
`endif
`endif

  // ==============================================================================================
  // == Custom Arithmetics                                                                        =
  // ==============================================================================================

`ifdef ISA_EXT_CUSTOM
  wire                 pcpi_wr_custom;
  wire  [`XPR_LEN-1:0] pcpi_rd_custom;
  wire  [`XPR_LEN-1:0] pcpi_rd2_custom;
  wire                 pcpi_use_rd64_custom;
  wire                 pcpi_wait_custom;
  wire                 pcpi_ready_custom;

  airi5c_custom custom(
    .nreset(rst_pipeline_n),
    .clk(clk_i),
  
    .pcpi_valid(pcpi_valid),
    .pcpi_insn(pcpi_insn),
    .pcpi_rs1(pcpi_rs1),
    .pcpi_rs2(pcpi_rs2),
    .pcpi_rs3(pcpi_rs3),
    .pcpi_wr(pcpi_wr_custom),
    .pcpi_rd(pcpi_rd_custom),
    .pcpi_rd2(pcpi_rd2_custom),
    .pcpi_use_rd64(pcpi_use_rd64_custom),
    .pcpi_wait(pcpi_wait_custom),
    .pcpi_ready(pcpi_ready_custom)
  );
`endif

  // ==============================================================================================
  // == AI accelerator                                                                            =
  // ==============================================================================================


`ifdef ISA_EXT_AIACC

  wire                 pcpi_wr_ai_acc;
  wire  [`XPR_LEN-1:0] pcpi_rd_ai_acc;
  wire  [`XPR_LEN-1:0] pcpi_rd2_ai_acc;
  wire                 pcpi_use_rd64_ai_acc;
  wire                 pcpi_wait_ai_acc;
  wire                 pcpi_ready_ai_acc;

  airi5c_ai_acc ai_acc(
    .nreset(rst_pipeline_n),
    .clk(clk_i),
    .pcpi_valid(pcpi_valid),
    .pcpi_insn(pcpi_insn),
    .pcpi_rs1(pcpi_rs1),
    .pcpi_rs2(pcpi_rs2), //unused
    .pcpi_rs3(pcpi_rs3), //unused
    .pcpi_wr(pcpi_wr_ai_acc),
    .pcpi_rd(pcpi_rd_ai_acc),
    .pcpi_rd2(pcpi_rd2_ai_acc),//unused
    .pcpi_use_rd64(pcpi_use_rd64_ai_acc),//unused
    .pcpi_wait(pcpi_wait_ai_acc),
    .pcpi_ready(pcpi_ready_ai_acc)
  );


`endif


  // ==============================================================================================
  // == SIMD/DSP extension                                                                        =
  // ==============================================================================================


`ifdef ISA_EXT_P
  wire                 pcpi_wr_dsp;
  wire  [`XPR_LEN-1:0] pcpi_rd_dsp;
  wire  [`XPR_LEN-1:0] pcpi_rd2_dsp;
  wire                 pcpi_use_rd64_dsp;
  wire                 pcpi_wait_dsp;
  wire                 pcpi_ready_dsp;

  wire                 pcpi_wr_mul_div;
  wire  [`XPR_LEN-1:0] pcpi_rd_mul_div;
  wire  [`XPR_LEN-1:0] pcpi_rd2_mul_div;
  wire                 pcpi_use_rd64_mul_div;
  wire                 pcpi_wait_mul_div;
  wire                 pcpi_ready_mul_div;

  airi5c_mul_div_simd  mul_div(
    .nreset(rst_pipeline_n),
    .clk(clk_i),
  
    .pcpi_valid(pcpi_valid),
    .pcpi_insn(pcpi_insn),
    .pcpi_rs1(pcpi_rs1),
    .pcpi_rs2(pcpi_rs2),
    .pcpi_rs3(pcpi_rs3),
    .pcpi_wr(pcpi_wr_mul_div),
    .pcpi_rd(pcpi_rd_mul_div),
    .pcpi_rd2(pcpi_rd2_mul_div),
    .pcpi_use_rd64(pcpi_use_rd64_mul_div),
    .pcpi_wait(pcpi_wait_mul_div),
    .pcpi_ready(pcpi_ready_mul_div)
  );

  airi5c_alu_simd dsp(
    .nreset(rst_pipeline_n),
    .clk(clk_i),

    .pcpi_valid(pcpi_valid),
    .pcpi_insn(pcpi_insn),
    .pcpi_rs1(pcpi_rs1),
    .pcpi_rs2(pcpi_rs2),
    .pcpi_rs3(pcpi_rs3),
    .pcpi_wr(pcpi_wr_dsp),
    .pcpi_rd(pcpi_rd_dsp),
    .pcpi_rd2(pcpi_rd2_dsp),
    .pcpi_use_rd64(pcpi_use_rd64_dsp),
    .pcpi_wait(pcpi_wait_dsp),
    .pcpi_ready(pcpi_ready_dsp)
  );
`endif

  // ==============================================================================================
  // == eFPGA extension                                                                           =
  // ==============================================================================================

`ifdef ISA_EXT_EFPGA
  wire                 pcpi_wr_efpga;
  wire  [`XPR_LEN-1:0] pcpi_rd_efpga;
  wire  [`XPR_LEN-1:0] pcpi_rd2_efpga;
  wire                 pcpi_use_rd64_efpga;
  wire                 pcpi_wait_efpga;
  wire                 pcpi_ready_efpga;

  airi5c_efpga efpga(
    .nreset(rst_pipeline_n),
    .clk(clk_i),

    .pcpi_valid(pcpi_valid),
    .pcpi_insn(pcpi_insn),
    .pcpi_rs1(pcpi_rs1),
    .pcpi_rs2(pcpi_rs2),
    .pcpi_rs3(pcpi_rs3),
    .pcpi_wr(pcpi_wr_efpga),
    .pcpi_rd(pcpi_rd_efpga),
    .pcpi_rd2(pcpi_rd2_efpga),
    .pcpi_use_rd64(pcpi_use_rd64_efpga),
    .pcpi_wait(pcpi_wait_efpga),
    .pcpi_ready(pcpi_ready_efpga)
  );
`endif

// Multiplex the various coprocessor results here

  assign  pcpi_wr = 1'b0
`ifdef ISA_EXT_M
    | pcpi_wr_mul_div  
`endif
`ifdef ISA_EXT_CUSTOM
    | (pcpi_wr_custom & ~lock_custom_i)
`endif
`ifdef ISA_EXT_EFPGA
    | pcpi_wr_efpga
`endif
`ifdef ISA_EXT_P
  | pcpi_wr_dsp
`endif
`ifdef ISA_EXT_AIACC
  | pcpi_wr_ai_acc
`endif;

  assign  pcpi_rd = 1'b0
`ifdef ISA_EXT_M 
    | pcpi_rd_mul_div  
`endif
`ifdef ISA_EXT_CUSTOM
    | pcpi_rd_custom 
`endif
`ifdef ISA_EXT_EFPGA
    | pcpi_rd_efpga
`endif
`ifdef ISA_EXT_P
  | pcpi_rd_dsp
`endif
`ifdef ISA_EXT_AIACC
  | pcpi_rd_ai_acc
`endif;

  assign  pcpi_rd2 = 1'b0
`ifdef ISA_EXT_M 
    | pcpi_rd2_mul_div  
`endif
`ifdef ISA_EXT_CUSTOM
    | pcpi_rd2_custom
`endif
`ifdef ISA_EXT_EFPGA
    | pcpi_rd2_efpga
`endif
`ifdef ISA_EXT_P
  | pcpi_rd2_dsp
`endif
`ifdef ISA_EXT_AIACC
  | pcpi_rd2_ai_acc
`endif;

  assign  pcpi_use_rd64 = 1'b0
`ifdef ISA_EXT_M 
    | pcpi_use_rd64_mul_div  
`endif
`ifdef ISA_EXT_CUSTOM
    | (pcpi_use_rd64_custom & ~lock_custom_i) 
`endif
`ifdef ISA_EXT_EFPGA
    | pcpi_use_rd64_efpga
`endif
`ifdef ISA_EXT_P
  | pcpi_use_rd64_dsp
`endif
`ifdef ISA_EXT_AIACC
  | pcpi_use_rd64_ai_acc
`endif;

  assign  pcpi_wait = 1'b0
`ifdef ISA_EXT_M 
    | pcpi_wait_mul_div 
`endif
`ifdef ISA_EXT_CUSTOM
    | (pcpi_wait_custom & ~lock_custom_i)
`endif
`ifdef ISA_EXT_EFPGA
    | pcpi_wait_efpga
`endif
`ifdef ISA_EXT_P
  | pcpi_wait_dsp
`endif
`ifdef ISA_EXT_AIACC
  | pcpi_wait_ai_acc
`endif;

  assign  pcpi_ready =  1'b0
`ifdef ISA_EXT_M
    | pcpi_ready_mul_div 
`endif
`ifdef ISA_EXT_CUSTOM
    | (pcpi_ready_custom & ~lock_custom_i)
`endif
`ifdef ISA_EXT_EFPGA
    | pcpi_ready_efpga
`endif
`ifdef ISA_EXT_P
    | pcpi_ready_dsp
  `ifndef ISA_EXT_M
    | pcpi_ready_mul_div
  `endif
`endif
`ifdef ISA_EXT_AIACC
  | pcpi_ready_ai_acc
`endif;


  // ==============================================================================================
  // == AIRISC Core Pipeline                                                                      =
  // ==============================================================================================

  airi5c_pipeline pipeline(
    .rst_ni(rst_pipeline_n),
    .clk_i(clk_i),

    // Interrupts
    .ext_interrupts(ext_interrupts_i),            // External interrrupt sources, active high
    .system_timer_tick(system_timer_tick_i),      // system_timer_tick is a special interrupt source
    .debug_haltreq(dm_hart0_haltreq),           

    // Instruction memory interface
    .imem_hready_i(imem_hready_i),
    .imem_haddr_o(imem_haddr_o),
    .imem_hrdata_i(imem_rdata_muxed),
    .imem_htrans_o(imem_htrans_core),
    .imem_hburst_o(imem_hburst_o),
    .imem_hmastlock_o(imem_hmastlock_o),
    .imem_hprot_o(imem_hprot_o),
    .imem_badmem_e(1'b0),

    // Data memory interface
    .dmem_hready_i(dmem_hready_i),
    .dmem_hwrite_o(dmem_hwrite_o),
    .dmem_hsize_o(dmem_hsize_o),
    .dmem_haddr_o(dmem_haddr_o),
    .dmem_hwdata_o(dmem_hwdata_o),
    .dmem_hrdata_i(dmem_rdata_muxed),
    .dmem_hburst_o(dmem_hburst_o),
    .dmem_hmastlock_o(dmem_hmastlock_o),
    .dmem_hprot_o(dmem_hprot_o),
    .dmem_htrans_o(dmem_htrans_core),
    .dmem_badmem_e(1'b0),

    // Debug Module Interface
    .dm_wen(dm_regfile_wen),                          // write enable, active high
    .dm_wara(dm_regfile_wara),                        // write/read address
`ifdef ISA_EXT_F
    .dm_sel_fpu_reg(dm_sel_fpu_reg),
`endif
    .dm_rd(dm_regfile_rd),                            // data regfile -> DM
    .dm_wd(dm_regfile_wd),                            // data DM -> regfile

    // Debug Module CSR access
    .dm_csr_cmd(dm_csr_cmd),                          // command. read = 0, write = >0
    .dm_csr_addr(dm_csr_addr),                        // register address
    .dm_csr_rdata(dm_csr_rdata),                      // data CSR -> DM
    .dm_csr_wdata(dm_csr_wdata),                      // data DM -> CSR

    .dm_illegal_csr_access(dm_illegal_csr_access),    // signal illegal address to DM

    // PCPI coprocessor interface
    .pcpi_valid(pcpi_valid),
    .pcpi_insn(pcpi_insn),
    .pcpi_rs1(pcpi_rs1),
    .pcpi_rs2(pcpi_rs2),
    .pcpi_rs3(pcpi_rs3),
    .pcpi_wr(pcpi_wr),
    .pcpi_rd(pcpi_rd),
    .pcpi_rd2(pcpi_rd2),
    .pcpi_use_rd64(pcpi_use_rd64),
    .pcpi_wait(pcpi_wait),
    .pcpi_ready(pcpi_ready)
    `ifdef ISA_EXT_P
    ,
    .pcpi_ready_mul_div(pcpi_ready_mul_div)
    `endif
  );

endmodule
