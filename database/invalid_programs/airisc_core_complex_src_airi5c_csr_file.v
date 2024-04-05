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

`timescale 1ns/1ns

`include "rv32_opcodes.vh"
`include "airi5c_csr_addr_map.vh"
`include "airi5c_ctrl_constants.vh"
`include "airi5c_arch_options.vh"

`ifdef ISA_EXT_F
  `include "modules/airi5c_fpu/airi5c_FPU_constants.vh"
`endif

module airi5c_csr_file
(
  input                             clk,                  // system clock
  input                             nreset,               // system reset

  input                             debug_haltreq,        // external debugger halt request
  input       [`N_EXT_INTS-1:0]     ext_interrupts,       // external interrupt sources
  input                             system_timer_tick,    // main system timer interrupt (timer is a mem-mapped periph)

  input       [`XPR_LEN-1:0]        debug_handler_addr,


  input       [`CSR_ADDR_WIDTH-1:0] addr,                 // ctrl sets this address of the CSR register which is used in r/w operation
  input       [`CSR_CMD_WIDTH-1:0]  cmd,                  // command can be IDLE, READ, WRITE or others, see airi5c_csr_addr_map.vh
  input       [`XPR_LEN-1:0]        wdata,                // data to be written into CSR register
  output  reg [`XPR_LEN-1:0]        rdata,                // data read from CSR register
  output                            illegal_access,       // signals access to undefined CSR registers or registers not accessible in current priv mode

  input       [`CSR_ADDR_WIDTH-1:0] dm_csr_addr,          // CSR address
  input       [`CSR_CMD_WIDTH-1:0]  dm_csr_cmd,           // CSR command (0 == IDLE)
  input       [`XPR_LEN-1:0]        dm_csr_wdata,         // data to be written to CSR
  output  reg [`XPR_LEN-1:0]        dm_csr_rdata,         // data read from CSR  
  output                            illegal_access_debug, // in debug mode only undefined CSR registers or write attempts to read-only regs are reported

  output      [`PRV_WIDTH-1:0]      prv,                  // privilege level, see airi5c_csr_addr_map.vh, e.g. MACHINE / USER / SUPERVISORill 

  input                             retire,               // an instruction will retire this cycle
  input                             exception,            // Exception received
  input       [`MCAUSE_WIDTH-1:0]   exception_code,       // the part of MCAUSE describing the exception
  input                             exception_int,        // the exception is caused by an interrupt
  input                             eret,                 // MRET/URET or SRET in EXEC stage. We only implement MRET for M->U returns
  input                             dret,
  input                             redirect,             // 06.08.19, ASt - added to determine new dpc value (jmp or no jmp?)
  input       [`XPR_LEN-1:0]        exception_load_addr,  // Memory access address in case of exception
  input       [`XPR_LEN-1:0]        exception_PC,         // PC of the instruction causing the exception (NOT the instruction after!)
  input       [`XPR_LEN-1:0]        interrupt_PC,         // PC of the instruction that has not been executed because of an Interrupt

  output      [`XPR_LEN-1:0]        handler_PC,           // The handler address set by MTVEC/STVEC/UTVEC and the defined mode. We only support one handler.
  output      [`XPR_LEN-1:0]        mepc,                 // PC causing the exception (if exception) or pointer to instruction after (if interrupt)
  output      [`XPR_LEN-1:0]        dpc,                  // PC causing the exception (if exception) or pointer to instruction after (if interrupt)
  output                            interrupt_pending,    // at least one interrupt is pending (but may be masked)
  output                            interrupt_taken,      // at least unmasked interrupt is pending and will be serviced now.
  output      [`MCAUSE_WIDTH-1:0]   interrupt_code_EX,

  output                            stepmode,
  output                            dmode_WB,

  input                             stall_WB,             // get info on stalled WB to hold pending interrupts until they can be handled. ASt 08/20
  input       [`XPR_LEN-1:0]        inst_WB

`ifdef ISA_EXT_F
  ,
  // FPU
  input       [`FPU_OP_WIDTH-1:0]   fpu_op,
  input                             fpu_ready,
  input                             NX,
  input                             UF,
  input                             OF,
  input                             DZ,
  input                             NV,
  output      [2:0]                 rounding_mode,
  input                             fpu_reg_dirty,
  output                            fpu_ena
`endif
);

   // User Counter/Timer
`ifndef ISA_EXT_E
  reg     [`CSR_COUNTER_WIDTH-1:0]  cycle_full;         // Cycle counter, counts cycles since reset
  reg     [`CSR_COUNTER_WIDTH-1:0]  instret_full; 
`endif

  reg     [1:0]                     prv_r;              assign prv      = prv_r;  

  reg     [`XPR_LEN-1:0]            mie_csr;
  reg     [`XPR_LEN-1:0]            mip;
  wire    [`XPR_LEN-1:0]            mstatus;

  reg                               dmode;              // debug mode is handled with separate bit
  reg                               dmode_WB_r;
  assign dmode_WB = dmode_WB_r;


  reg     [`XPR_LEN-1:0]            mtvec;              // Machine Trap Vector, sets jump target for traps in Machine privilege mode

  reg     [`XPR_LEN-1:0]            mscratch;
  reg     [`XPR_LEN-1:0]            mepc_r;             assign mepc     = mepc_r;
  reg     [`XPR_LEN-1:0]            dpc_r;              assign dpc      = dpc_r;
  // ASt, 06.06.19, bit 2 of dcsr is "step"
  reg     [`XPR_LEN-1:0]            dcsr;               assign stepmode = dcsr[2] & ~dmode;

  wire                              ebreakm             = dcsr[15];
  wire                              ebreaks             = dcsr[13];
  wire                              ebreaku             = dcsr[12];
  wire                              stepie              = dcsr[11];
  wire                              stopcount           = dcsr[10];
  wire                              stoptime            = dcsr[9];
  wire    [2:0]                     dcause              = dcsr[8:6];
  wire                              mprven              = dcsr[4];

  reg     [`XPR_LEN-1:0]            dscratch0; 
  reg     [`XPR_LEN-1:0]            mcause;  
  reg     [`XPR_LEN-1:0]            mbadaddr; 

  wire                              system_en;
  wire                              debug_en;
  wire                              system_wen;
  wire                              debug_wen;
  wire                              wen_internal_or_debug; 
  wire    [`CSR_ADDR_WIDTH-1:0]     addr_muxed; 

  wire                              illegal_region;
  wire                              illegal_region_debug;
  reg                               defined;
  reg                               defined_debug;
  reg     [`XPR_LEN-1:0]            wdata_internal;
  wire                              uinterrupt;
  wire    [`XPR_LEN-1:0]            masked_interrupt;
  wire                              minterrupt;
  wire                              dinterrupt;         // external Debug interrupt. Causing the hart to enter park loop.
  reg     [`MCAUSE_WIDTH-1:0]       interrupt_code;     assign interrupt_code_EX  = interrupt_code;
  reg                               interrupt_taken_r;

  wire                              illegal_inst_fault;
  wire                              inst_addr_fault;
  wire                              loadstore_fault;
  wire                              page_fault;


  // ===========================================================
  // = Architecture capabilities and vendor information        =
  // ===========================================================
  // ** configured in airic5_arch_options.vh **

  // MISA - set info on supported ISA
  // --------------------------------

  // this can be a register if extensions can be en-/disable at 
  // runtime.
  wire    [`XPR_LEN-1:0]            misa;

  // concatenate supported extensions as set by configured defines
  assign  misa = ({2'b01,30'h0}) // MXL = rv32
  `ifndef ISA_EXT_E
    | `MISA_ENC_I // normal integer ISA
  `else 
    | `MISA_ENC_E // embedded integer ISA
  `endif
  `ifdef ISA_EXT_F
    | `MISA_ENC_F // IEEE-compatible floating-point unit
  `endif
  `ifdef ISA_EXT_C
    | `MISA_ENC_C // compressed instructions
  `endif
  `ifdef ISA_EXT_M
    | `MISA_ENC_M // hardware-based integer multiplication and divisions
  `endif
  `ifdef ISA_EXT_P
    | `MISA_ENC_P // packed SIMD (horizontal vectoring)
  `endif
  `ifdef ISA_EXT_CUSTOM
    | `MISA_ENC_X // custom / non-RISC-V ISA extension(s)
  `endif
    | `MISA_ENC_U; // less-privileged user mode (always enabled)

  // Global versioning and HART ID (see airi5c_arch_options.vh)
  // ----------------------------------------------------------

  wire    [`XPR_LEN-1:0] mvendorid = `VENDOR_ID;
  // official RISC-V architecture ID for AIRISC
  // see https://github.com/riscv/riscv-isa-manual/blob/master/marchid.md
  wire    [`XPR_LEN-1:0] marchid   = `XPR_LEN'd31;
  wire    [`XPR_LEN-1:0] mimpid    = `IMPL_ID;
  wire    [`XPR_LEN-1:0] mhartid   = `HART_ID;

  // Trap handler vector calculation
  // -------------------------------

  assign  handler_PC = (exception_code == `MCAUSE_BREAKPOINT) ? debug_handler_addr : {mtvec[31:2],2'b00};

  // =========================
  // = CSR file access ports =
  // =========================

  // CSR CMD decoding
  // ----------------
  assign  system_en             = cmd[2];
  assign  debug_en              = dm_csr_cmd[2];

  assign  system_wen            = cmd[1] || cmd[0];
  assign  debug_wen             = dm_csr_cmd[1] || dm_csr_cmd[0];

  assign  illegal_region        = ~dmode && ((system_wen && (addr[11:10] == 2'b11))
                                || (system_en && addr[9:8] > prv));

  assign  illegal_region_debug  = (debug_wen && (dm_csr_addr[11:10] == 2'b11));
  assign  illegal_access        = illegal_region || (system_en && !defined);
  assign  illegal_access_debug  = illegal_region_debug || (debug_en && !defined_debug);

  assign  wen_internal_or_debug = system_wen | debug_wen;
  assign  addr_muxed            = debug_wen ? dm_csr_addr : addr;

  // Calculate register content for bitwise SET/CLEAR commands
  // ---------------------------------------------------------
  always @(*) begin
    wdata_internal = |dm_csr_cmd ? dm_csr_wdata : wdata;             // default case = write full input word to register. Debug port has priority
    if (debug_wen) begin 
      case(dm_csr_cmd)
        `CSR_SET   : wdata_internal = (dm_csr_rdata | dm_csr_wdata);
        `CSR_CLEAR : wdata_internal = (dm_csr_rdata & ~dm_csr_wdata);
      endcase
    end else if (system_wen) begin
      case (cmd)                                                     // special cases.. logical OR should blend Debug CMD over idle internal cmd
        `CSR_SET   : wdata_internal = (rdata | wdata);               // SET
        `CSR_CLEAR : wdata_internal = (rdata & ~wdata);              // CLEAR
      endcase // case (cmd)
    end
  end

  // 8'b0 (WPRI)
  wire          TSR         = 1'b0;
  wire          TW          = 1'b0;
  wire          TVM         = 1'b0;
  wire          MXR         = 1'b0;
  wire          SUM         = 1'b0;
  wire          MPRV        = 1'b0;
//reg     [1:0] XS;//       = 2'b00;
  wire    [1:0] XS          = 2'b00;
`ifdef ISA_EXT_F
  reg     [1:0] FS;
`else
  wire    [1:0] FS;//       = 2'b00;
`endif
  reg     [1:0] MPP;
  // 2'b0 (WPRI)
  wire          SPP         = 1'b0;
  reg           MPIE;
  // 1'b0 (WPRI)
  wire          SPIE        = 1'b0;
  wire          UPIE        = 1'b0;
  reg           MIE;
  // 1'b0 (WPRI)
  wire          SIE         = 1'b0;
  wire          UIE         = 1'b0;
  wire          SD          = (XS[1] && XS[0]) || (FS[1] && FS[0]);

  wire          mstatus_wen = wen_internal_or_debug && (addr_muxed == `CSR_ADDR_MSTATUS);

  // FPU
`ifdef ISA_EXT_F
  reg     [`XPR_LEN-1:0]  fcsr;
  reg                     fpu_ena_r;
  wire                    wr_fpu_flags;
  assign                  fpu_ena       = fpu_ena_r;
  assign                  rounding_mode = fcsr[7:5];
`endif

`ifdef ISA_EXT_F
  wire          FS_dirty    =
    fpu_reg_dirty || wr_fpu_flags || (system_wen && 
    (addr_muxed == `CSR_ADDR_FFLAGS ||
    addr_muxed == `CSR_ADDR_FRM ||
    addr_muxed == `CSR_ADDR_FCSR));
`endif

  assign        mstatus     =
  {
    SD,   8'h0, TSR,  TW,   TVM,  MXR,  SUM,  MPRV, XS,   FS,
    MPP,  2'h0, SPP,  MPIE, 1'b0, SPIE, UPIE, MIE,  1'b0, SIE, UIE
  };

`ifdef ISA_EXT_F
  // FS bypass
  always @(*) begin
    fpu_ena_r = |FS;
    if (mstatus_wen) begin
      fpu_ena_r = |wdata_internal[14:13];
    end
  end 
`endif

  // stn: make sure to trigger the hardware stack for interrupt enable
  // and privilege level only *once* when a trap is started
  reg trap_trigger_buf;
  reg [7:0 ]eret_r;
  wire trap_trigger;

  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin
      trap_trigger_buf <= 1'b0;
      eret_r           <= 0;
    end else begin
      trap_trigger_buf <= exception;
      eret_r           <= {eret_r[6:0], eret};
    end
  end

  assign trap_trigger = exception & (~trap_trigger_buf);

  // hardware stack for interrupt enable and privilege level
  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin
      dmode <= 1'b0;
      prv_r <= `PRV_M;
  `ifdef ISA_EXT_F
      FS    <= 2'b01;
  `endif        
      MPP   <= 2'h`PRV_U;
      MPIE  <= 1'b0;
      MIE   <= 1'b0;
    end else if (mstatus_wen) begin
  `ifdef ISA_EXT_F
      FS    <= wdata_internal[14:13];
  `endif
      if ((wdata_internal[12:11] == `PRV_U) || (wdata_internal[12:11] == `PRV_M)) begin
        MPP <= wdata_internal[12:11];
      end
      MPIE  <= wdata_internal[7];
      MIE   <= wdata_internal[3];
    end else if (trap_trigger) begin
      if (exception_code == `MCAUSE_BREAKPOINT) begin
        dmode <= 1'b1;
      end else begin
        prv_r <= `PRV_M;
//      FS    <= ;
        MPP   <= prv_r;
        MPIE  <= MIE;
        MIE   <= 1'b0;
      end
    end else if (eret_r[7]) begin
      prv_r <= MPP;
//    FS    <= ;
      MPP   <= 2'h`PRV_M;
      MPIE  <= 1'b1;
      MIE   <= MPIE;
    end else if (dret) begin
      dmode <= 1'b0;
      prv_r <= dcsr[1:0];
    end
    `ifdef ISA_EXT_F
    else if (FS_dirty)
      FS    <= 2'b11;
    `endif
  end

// =====================================================================
// = Interrupt handling                                                =
// =====================================================================

  reg haltreq_r;

  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin 
       haltreq_r <= 1'b0;
    end else begin
       haltreq_r <= debug_haltreq;
    end
  end

  // machine external interrupt buffer
  reg  [`N_EXT_INTS-1:0] xirq_buf;
  wire [`N_EXT_INTS-1:0] xirq_trigger;

  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin
      xirq_buf <= 0;
    end else begin
      xirq_buf <= ext_interrupts;
    end
  end

  assign xirq_trigger = ext_interrupts & (~xirq_buf); // rising-edge trigger

  // machine interrupt enable register
  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin
      mie_csr <= 0;
    end else begin
      if (wen_internal_or_debug && (addr_muxed == `CSR_ADDR_MIE)) begin
        mie_csr[7] <= wdata_internal[7]; // machine timer interrupt
        mie_csr[(`N_EXT_INTS+16)-1:16] <= wdata_internal[(`N_EXT_INTS+16)-1:16]; // airisc external interrupts
      end
    end
  end

  // machine interrupt pending register
  reg [`N_EXT_INTS-1:0] xirq_clr;

  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin
      mip      <= 0;
      xirq_clr <= 0;
    end else begin
      // manual write access (clearing of XIRQs only)
      xirq_clr <= {`N_EXT_INTS{1'b1}}; // default
      if (wen_internal_or_debug && (addr_muxed == `CSR_ADDR_MIP)) begin
        xirq_clr <= wdata_internal[(`N_EXT_INTS+16)-1:16]; // clear pending XIRQ by writing zero
      end
      // buffer interrupt requests
      mip[7] <= system_timer_tick;
      mip[(`N_EXT_INTS+16)-1:16] <= xirq_clr[`N_EXT_INTS-1:0] & (mip[(`N_EXT_INTS+16)-1:16] | xirq_trigger[`N_EXT_INTS-1:0]);
    end
  end

  wire [`XPR_LEN-1:0] mip_masked = mip & mie_csr; // only enabled sources are allowed to fire
  wire mip_firing = |mip_masked;

  assign uinterrupt = 1'b0; // N extension (user-level interrupts) not implemented
  assign minterrupt = mip_firing & MIE;
  assign dinterrupt = (debug_haltreq & ~haltreq_r & ~dmode);

  assign interrupt_pending = |mip;


  // interrupt priority logic
  wire mtip        = mip[7];
  wire msip        = mip[3];
  wire meip        = mip[11];
  wire [15:0] mxip = mip[31:16];

  always @(*) begin
    if (dinterrupt) begin
      interrupt_code = `MCAUSE_BREAKPOINT;
    end else if (mxip[0]) begin
      interrupt_code = `MCAUSE_XIRQ0_INT;
    end else if (mxip[1]) begin
      interrupt_code = `MCAUSE_XIRQ1_INT;
    end else if (mxip[2]) begin
      interrupt_code = `MCAUSE_XIRQ2_INT;
    end else if (mxip[3]) begin
      interrupt_code = `MCAUSE_XIRQ3_INT;
    end else if (mxip[4]) begin
      interrupt_code = `MCAUSE_XIRQ4_INT;
    end else if (mxip[5]) begin
      interrupt_code = `MCAUSE_XIRQ5_INT;
    end else if (mxip[6]) begin
      interrupt_code = `MCAUSE_XIRQ6_INT;
    end else if (mxip[7]) begin
      interrupt_code = `MCAUSE_XIRQ7_INT;
    end else if (mxip[8]) begin
      interrupt_code = `MCAUSE_XIRQ8_INT;
    end else if (mxip[9]) begin
      interrupt_code = `MCAUSE_XIRQ9_INT;
    end else if (mxip[10]) begin
      interrupt_code = `MCAUSE_XIRQ10_INT;
    end else if (mxip[11]) begin
      interrupt_code = `MCAUSE_XIRQ11_INT;
    end else if (mxip[12]) begin
      interrupt_code = `MCAUSE_XIRQ12_INT;
    end else if (mxip[13]) begin
      interrupt_code = `MCAUSE_XIRQ13_INT;
    end else if (mxip[14]) begin
      interrupt_code = `MCAUSE_XIRQ14_INT;
    end else if (mxip[15]) begin
      interrupt_code = `MCAUSE_XIRQ15_INT;
    end else if (meip) begin
      interrupt_code = `MCAUSE_EXT_INT_M;
    end else if (msip) begin
      interrupt_code = `MCAUSE_SOFTWARE_INT_M;
    end else begin // if (mtip)
      interrupt_code = `MCAUSE_TIMER_INT_M;
    end
  end

  always @(*) begin
    case (prv)
      `PRV_U  : interrupt_taken_r <= ~dmode & ~stepmode & (uinterrupt | minterrupt | dinterrupt); // in User-mode, User-Interrupts and Machine-Interrupts are taken, M-Ints always!
      `PRV_M  : interrupt_taken_r <= ~dmode & ~stepmode & (             minterrupt | dinterrupt); // in Machine mode, only Machine-Interrupts are taken, if enabled
      default : interrupt_taken_r <= 1'b0;         
    endcase // case (prv)
  end

  assign interrupt_taken = interrupt_taken_r;


// ===================================================
// == Handle MSTATUS priv stack on priv mode changes =
// ===================================================

  always @(posedge clk or negedge nreset) begin 
    if (~nreset) begin 
      dcsr <= {`DBG_VER, 28'h0000000};
    end else begin 
      if (wen_internal_or_debug && (addr_muxed == `CSR_ADDR_DCSR)) begin 
        dcsr <= wdata_internal;
      end else if (trap_trigger) begin
        if (exception_code == `MCAUSE_BREAKPOINT) begin 
          dcsr[1:0] <= prv_r;
          dcsr[8:6] <= stepmode ? `DCAUSE_STEPMODE : `DCAUSE_EBREAK;  
        end
      end
    end
  end

  // FPU
`ifdef ISA_EXT_F
  assign wr_fpu_flags = fpu_op != `FPU_OP_NOP && fpu_ready;
  
  always @(posedge clk, negedge nreset) begin
    if (!nreset) begin
      fcsr <= 32'h00000000;			
    end else if (wen_internal_or_debug) begin
      case (addr_muxed)
      `CSR_ADDR_FFLAGS: fcsr <= {24'h000000, fcsr[7:5], wdata_internal[4:0]};
      `CSR_ADDR_FRM:    fcsr <= {24'h000000, wdata_internal[2:0], fcsr[4:0]};
      `CSR_ADDR_FCSR:   fcsr <= {24'h000000, wdata_internal[7:5], wdata_internal[4:0]};
      default:;
      endcase
    end else if (wr_fpu_flags) begin
      fcsr[0] <= NX;
      fcsr[1] <= UF;
      fcsr[2] <= OF;
      fcsr[3] <= DZ;
      fcsr[4] <= NV;
	  end
  end
`else
  assign wr_fpu_flags = 1'b0;
`endif


  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin
      dmode_WB_r <= 1'b0; // 30.07.19, ASt: WB stage is in dmode one cycle after the return inst
    end else begin
      dmode_WB_r <= dmode;
    end
  end

  // set MEPC and current mode in exception/interrupt/write situations
  // on an exception, the MEPC points to the causing instruction (which might be repeated then..)
  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin
      mepc_r <= `START_HANDLER;
    end else begin
      if (wen_internal_or_debug && (addr_muxed == `CSR_ADDR_MEPC)) begin
        mepc_r <= wdata_internal; 
      end else if (trap_trigger & ~dmode & ~(stepmode && exception_code == `MCAUSE_BREAKPOINT)) begin
        if (exception_int) begin // interrupt (= async. exception)
          mepc_r <= (interrupt_PC & {{31{1'b1}},1'b0});
        end else begin // software exception (= sync. exception)
          mepc_r <= (exception_PC & {{31{1'b1}},1'b0});
        end
      end
    end
  end

  // handle changes to DPC in various situations
  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin
      dpc_r <= `START_HANDLER;
    end else begin   
      if (!dmode && trap_trigger && (exception_code == `MCAUSE_BREAKPOINT)) begin
        dpc_r <= exception_PC;
      end else if (wen_internal_or_debug && (addr_muxed == `CSR_ADDR_DPC)) begin
        dpc_r <= wdata_internal;
      end	
    end
  end

  // set mcause  on interrupts, exceptions and writes
  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin
      mcause <= 0;      
    end else if (wen_internal_or_debug && (addr_muxed == `CSR_ADDR_MCAUSE)) begin
      mcause <= wdata_internal[31:0];
    end else if (trap_trigger && ~dmode && ~(stepmode && (exception_code == `MCAUSE_BREAKPOINT))) begin
      mcause[`MCAUSE_WIDTH-1:0] <= exception_code[`MCAUSE_WIDTH-1:0];
      mcause[31] <= exception_int;
    end 
  end 

  assign inst_addr_fault    = (exception_code == `MCAUSE_INST_ADDR_MISALIGNED) ||
                              (exception_code == `MCAUSE_INST_ACCESS_FAULT);

  assign loadstore_fault    = (exception_code == `MCAUSE_LOAD_ACCESS_FAULT) ||
                              (exception_code == `MCAUSE_STORE_AMO_ACCESS_FAULT) ||
                              (exception_code == `MCAUSE_LOAD_ADDR_MISALIGNED) ||
                              (exception_code == `MCAUSE_STORE_AMO_ADDR_MISALIGNED);

  assign page_fault         = (exception_code == `MCAUSE_INST_PAGE_FAULT) ||
                              (exception_code == `MCAUSE_LOAD_PAGE_FAULT) ||
                              (exception_code == `MCAUSE_STORE_AMO_PAGE_FAULT);

  assign illegal_inst_fault = (exception_code == `MCAUSE_ILLEGAL_INST);

  // set MTVAL on exceptions and writes
  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin
      mbadaddr <= `XPR_LEN'h0;          
    end else begin
      if ((wen_internal_or_debug && addr_muxed == `CSR_ADDR_MTVAL)) mbadaddr <= wdata_internal;
      else if (trap_trigger)
        if      (inst_addr_fault)    mbadaddr <= exception_PC;
        else if (loadstore_fault)    mbadaddr <= exception_load_addr;
        else if (page_fault)         mbadaddr <= exception_PC;
        else if (illegal_inst_fault) mbadaddr <= inst_WB;
    end
  end



// ==================
// == CPU Counters ==
// ==================

  // machine counter inhibit register
  reg [`XPR_LEN-1:0] mcountinhibit;

  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin
      mcountinhibit <= 0;
    end else begin 
      if (wen_internal_or_debug && (addr_muxed == `CSR_ADDR_MCOUNTINHIBIT)) begin
        mcountinhibit[0] <= wdata_internal[0]; // CY
        mcountinhibit[2] <= wdata_internal[2]; // IR
      end
    end
  end


`ifndef ISA_EXT_E
  // Handle writes to INSTRET / MINSTRET
  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin
      instret_full <= 0;
    end else begin 
      if (wen_internal_or_debug) begin
        if ((addr_muxed == `CSR_ADDR_INSTRET) || (addr_muxed == `CSR_ADDR_MINSTRET)) begin
          instret_full[0+:`XPR_LEN] <= wdata_internal;
        end else if (addr_muxed == `CSR_ADDR_INSTRETH) begin 
          instret_full[`XPR_LEN+:`XPR_LEN] <= wdata_internal;
        end
      end else begin 
        if ((retire) && (~mcountinhibit[2])) begin
          instret_full <= instret_full + 1;
        end
      end
    end
  end

  // Handle writes to CYCLE / MCYCLE
  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin
      cycle_full <= 0;
    end else begin 
      if (wen_internal_or_debug) begin
        if ((addr_muxed == `CSR_ADDR_CYCLE) || (addr_muxed == `CSR_ADDR_MCYCLE)) begin
          cycle_full[0+:`XPR_LEN] <= wdata_internal;
        end else if ((addr_muxed == `CSR_ADDR_CYCLEH) || (addr_muxed == `CSR_ADDR_MCYCLEH)) begin 
          cycle_full[`XPR_LEN+:`XPR_LEN] <= wdata_internal;
        end
      end else if (~mcountinhibit[0]) begin 
        cycle_full <= cycle_full + 1;
      end
    end
  end
`endif

  // handle Write access to CSR registers and internal counters
  always @(posedge clk or negedge nreset) begin
    if (~nreset) begin         
      mtvec <= `XPR_LEN'h80000000;
      mscratch <= 0;
      dscratch0 <= 0;
    end else begin 
      if (wen_internal_or_debug && ~illegal_region) begin
        case (addr_muxed)              
          `CSR_ADDR_DSCRATCH0 : dscratch0 <= wdata_internal;
          `CSR_ADDR_MTVEC     : mtvec <= wdata_internal & {{30{1'b1}},2'b0};
          `CSR_ADDR_MSCRATCH  : mscratch <= wdata_internal;
          default : ;
        endcase
      end
    end
  end

// ===================================================
// == Read Port decoding and multiplexing            =
// ===================================================

  always @(*) begin
    rdata = 0; 
    defined = 1'b1;
    case (addr)
      `CSR_ADDR_DCSR        : rdata = dcsr;
      `CSR_ADDR_DPC         : rdata = dpc_r;
      `CSR_ADDR_DSCRATCH0   : rdata = dscratch0;
      `CSR_ADDR_MARCHID     : rdata = marchid;
      `CSR_ADDR_MCAUSE      : rdata = mcause;
      `CSR_ADDR_MEPC        : rdata = mepc; 
      `CSR_ADDR_MIE         : rdata = mie_csr;
      `CSR_ADDR_MIP         : rdata = mip;
      `CSR_ADDR_MISA        : rdata = misa;
      `CSR_ADDR_MIMPID      : rdata = mimpid;
      `CSR_ADDR_MHARTID     : rdata = mhartid;
      `CSR_ADDR_MSCRATCH    : rdata = mscratch;
      `CSR_ADDR_MSTATUS     : rdata = mstatus;
      `CSR_ADDR_MTVAL       : rdata = mbadaddr;
      `CSR_ADDR_MTVEC       : rdata = mtvec;
      `CSR_ADDR_MVENDORID   : rdata = mvendorid;
      `CSR_ADDR_TSELECT     : rdata = 32'hdeadbeef; // for debugger auto-detect

      `ifndef ISA_EXT_E
        `CSR_ADDR_CYCLE     : rdata = cycle_full[0+:`XPR_LEN];
        `CSR_ADDR_CYCLEH    : rdata = cycle_full[`XPR_LEN+:`XPR_LEN];
        `CSR_ADDR_INSTRET   : rdata = instret_full[0+:`XPR_LEN];
        `CSR_ADDR_INSTRETH  : rdata = instret_full[`XPR_LEN+:`XPR_LEN];
        `CSR_ADDR_MCYCLE    : rdata = cycle_full[0+:`XPR_LEN];
        `CSR_ADDR_MCYCLEH   : rdata = cycle_full[`XPR_LEN+:`XPR_LEN];
        `CSR_ADDR_MINSTRET  : rdata = instret_full[0+:`XPR_LEN];
        `CSR_ADDR_MINSTRETH : rdata = instret_full[`XPR_LEN+:`XPR_LEN];
      `endif

      `CSR_ADDR_MCOUNTINHIBIT : rdata = mcountinhibit;

      `ifdef ISA_EXT_F
        `CSR_ADDR_FFLAGS    : rdata = {27'h00000, fcsr[4:0]};
        `CSR_ADDR_FRM       : rdata = {29'h0000000, fcsr[7:5]};
        `CSR_ADDR_FCSR      : rdata = {24'h00000, fcsr[7:5], fcsr[4:0]};
      `endif

      default               : defined = 1'b0;
    endcase
  end

  always @(*) begin
    dm_csr_rdata = 0;
    defined_debug = 1'b1;
    case (dm_csr_addr)
      `CSR_ADDR_DCSR        : dm_csr_rdata = dcsr;
      `CSR_ADDR_DPC         : dm_csr_rdata = dpc_r;
      `CSR_ADDR_DSCRATCH0   : dm_csr_rdata = dscratch0;
      `CSR_ADDR_MARCHID     : dm_csr_rdata = marchid;
      `CSR_ADDR_MCAUSE      : dm_csr_rdata = mcause;
      `CSR_ADDR_MEPC        : dm_csr_rdata = mepc;
      `CSR_ADDR_MIE         : dm_csr_rdata = mie_csr;
      `CSR_ADDR_MIP         : dm_csr_rdata = mip;
      `CSR_ADDR_MISA        : dm_csr_rdata = misa;
      `CSR_ADDR_MIMPID      : dm_csr_rdata = mimpid;
      `CSR_ADDR_MHARTID     : dm_csr_rdata = mhartid;
      `CSR_ADDR_MSCRATCH    : dm_csr_rdata = mscratch;
      `CSR_ADDR_MSTATUS     : dm_csr_rdata = mstatus;
      `CSR_ADDR_MTVAL       : dm_csr_rdata = mbadaddr;
      `CSR_ADDR_MTVEC       : dm_csr_rdata = mtvec;
      `CSR_ADDR_MVENDORID   : dm_csr_rdata = mvendorid;
      `CSR_ADDR_TSELECT     : dm_csr_rdata = 32'hdeadbeef; // for debugger auto-detect

      `ifndef ISA_EXT_E
        `CSR_ADDR_CYCLE     : dm_csr_rdata = cycle_full[0+:`XPR_LEN];
        `CSR_ADDR_CYCLEH    : dm_csr_rdata = cycle_full[`XPR_LEN+:`XPR_LEN];
        `CSR_ADDR_INSTRET   : dm_csr_rdata = instret_full[0+:`XPR_LEN];
        `CSR_ADDR_INSTRETH  : dm_csr_rdata = instret_full[`XPR_LEN+:`XPR_LEN];
        `CSR_ADDR_MCYCLE    : dm_csr_rdata = cycle_full[0+:`XPR_LEN];
        `CSR_ADDR_MCYCLEH   : dm_csr_rdata = cycle_full[`XPR_LEN+:`XPR_LEN];
        `CSR_ADDR_MINSTRET  : dm_csr_rdata = instret_full[0+:`XPR_LEN];
        `CSR_ADDR_MINSTRETH : dm_csr_rdata = instret_full[`XPR_LEN+:`XPR_LEN];
      `endif

      `CSR_ADDR_MCOUNTINHIBIT : dm_csr_rdata = mcountinhibit;

      `ifdef ISA_EXT_F
        `CSR_ADDR_FFLAGS    : dm_csr_rdata = {27'h00000, fcsr[4:0]};
        `CSR_ADDR_FRM       : dm_csr_rdata = {29'h0000000, fcsr[7:5]};
        `CSR_ADDR_FCSR      : dm_csr_rdata = {24'h00000, fcsr[7:5], fcsr[4:0]};
      `endif

      default               : defined_debug = 1'b0;
    endcase
  end


endmodule
