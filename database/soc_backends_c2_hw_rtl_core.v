// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

`timescale 1 ns / 1 ps

`define STR(a) `"a`"

`ifndef CPUNAME
 `define CPUPREFIX .
 `define CPUNAME cpu
`endif

`define IPATH(a) `include `STR(`CPUPREFIX/a)

`include "defines.v"

// This core is somewhat more complex than it should have been, because on ICE40 BRAMs are
// inferred if there is a registered input, while on Xilinx platforms an output must be registered,
// therefore we have to support both modes here.
//
// Register file is implemented as a distributed RAM (on Xilinx), but for the sake of timing we have to register
// the outputs on Xilinx anyway.
//
// ICE40 register file is inferred as mirroring BRAMs
//
`ifdef NEXYS
 `define RAM_REGISTERED_OUT 1
`endif

`ifdef ICE
 `define RAM_REGISTERED_OUT 1
`endif

`ifndef ICE
 `define REGFILE_REGISTERED_OUT 1
`endif

// Uncomment this to disable microops support (CALL/RET)

// `define DISABLE_MICROOPS 1

// `define ENABLE_BARREL_SHIFTER 1

/* ISA encoding: see core.txt */

/*  Microcode:
    If DISABLE_MICROOPS is not defined, the core will treat absolute jumps to non-zero addresses as calls
    and jumps to zero addresses as returns. Both are implemented as sequence of instructions scheduled while
    FETCH stage is stalled:
       For CALL, the instructions are following:
         - (storei SP SP (const -1))
         - (storei SP FP (const -1))
         - (storei SP PC (const -1))
         - (jmp (label ...))
       For RET, the instructions are following:
         - (load SP CP (const 3))
         - (load SC FP (const 1))
         - (load FP FP (const 2))
         - (jmpci R1 SC (const 2))
         - (nop)
         - (nop)
     (TODO: consider moving SP and FP loads into the delay slots?)
  */

   // Pipeline:
   // 
   // FETCH: sets the PC value, the next PC value (potentially from forwarding),
   //        for the next clock cycle to fetch the instruction for this PC
   // DECODE0: receive the new instruction from or muop FSM, forward the new PC if it's a
   //          simple branch instruction, set the argument register addresses for regfile
   // DECODE:  receive the values from the regfile, apply forwarding from the corresponding
   //          WB stage
   // EXEC:    apply forwarding from the corresponding MEM and WB stage, the former is for the simple register
   //          results only (i.e., no addition, no memory output). Set up the complex branching PC forwarding.
   //          Run the ALU actions on the arguments. Set the RAM input/output address, data and WE
   // MEM:     receive the EXEC result and RAM output, set up forwarding into DECODE stage and a simple forwarding
   //          into the EXEC stage.
   // WB:      commit the register file write-back
 

/* 
 
 Ext includes here:
 
  c2_custom_include.v - for including external modules
  c2_custom_hoist.v   - wires, registers, assignments, module instantiations
  c2_custom_reset.v   - register assignments in reset
  c2_custom_pipeline.v - register assignments in pipeline
 
 Long ext only:
  c2_custom_idle.v    - IDLE stage of the FSM
  c2_custom_wait.v    - WAIT stage of the FSM
 
 */

`ifdef ENABLE_EXT
 `IPATH(c2_custom_include.v)
`endif


/////////////////////////
// A note on register and wire naming:
// A value relevant to a certain pipeline stage is prefixed with this stage name,
//  e.g., if it's a DECODE stage PC, it is called decode_PC, even if it's assigned in the DECODE0 stage.
/////////////////////////


module `CPUNAME 
          (input clk,
           input         rst,

           input [31:0]  ram_data_in_a,
           output [31:0] ram_addr_in_a,
           input [31:0]  ram_data_in_b,
           output [31:0] ram_addr_in_b,
           output [31:0] ram_data_out_b,
           output        ram_we_out,

           /**************************/
           // TODO: also include hoisted external signals
           `IPATH(soccpusignals.v)
           /**************************/

           input         stall_cpu // external stall
           );

   //---------------------------------------------------
   //--1. Clock counter, for debugging and perf counters
   //---------------------------------------------------
   reg [31:0]     clkcounter;
   always @(posedge clk)
     if (~rst) clkcounter <= 0;
     else clkcounter <= clkcounter + 1;

 

   // COMMON Stall logic
   wire           stall_exec;
   wire           stall_mem;
   wire           stall;
   wire           stall_but_ext;
   reg            unstall;
   
   
   
   assign stall = stall_cpu | stall_exec | stall_mem; // ?!?
   assign stall_but_ext = 0; // ?!?
   assign stall_mem = 0;
   

   
   //------------------------------------------------
   //--2. FETCH logic--------------------------------
   //------------------------------------------------
   
   reg [31:0]     fetch_PC; // PC value at the end of FETCH stage / in DECODE0 stage
   wire [31:0]    decode0_PC;

   
   assign decode0_PC = fetch_PC;
    
   wire [31:0]    fetch_PC_next; // PC value in the FETCH stage
`ifndef RAM_REGISTERED_OUT
   assign ram_addr_in_a = fetch_PC;
`else
   assign ram_addr_in_a = fetch_PC_next;
`endif

   wire           decode0_branch_override1;
   wire           exec_branch_override2;
   wire [31:0]    decode0_PC_next; // PC value inferred at the DECODE stage
   wire [31:0]    exec_PC_next;   // PC value inferred at the EXEC stage
   reg            decode_ready;   // It's not the first clock cycle
   
   assign fetch_PC_next = decode_ready?
                          (decode0_branch_override1?decode0_PC_next:
                           exec_branch_override2?exec_PC_next:
                           fetch_microops?fetch_PC:(fetch_PC + 1)):fetch_PC;

   always @(posedge clk)
     if (~rst) begin
        fetch_PC <= 0;
        decode_ready <= 0;
        unstall <= 0;
        
     end else begin
        fetch_PC <= stall?fetch_PC:fetch_PC_next;
        decode_ready <= 1;
        unstall <= stall;
        
     end

   //------------------------------------------------
   //--3. DECODE0 logic------------------------------
   //------------------------------------------------

   
   wire           fetch_microops;
   wire [31:0]    fetch_next_muop;

   wire [31:0]    decode0_Instr; // Instruction as of beginning of DECODE0
   reg [31:0]     decode0_Instr_r;
   reg            stall_r;
   
   
   // decode0_Instr arrives in the DECODE0 stage (from a PC address formed in the FETCH stage),
   // or is generated by the muop FSM if it's a multi-stage instruction and muops are enabled.
   assign decode0_Instr = stall_r?decode0_Instr_r:(
                          exec_typeee?0:    // If it's a second part of a long extended instruction, push a bubble
                          fetch_microops?fetch_next_muop:
                          ram_data_in_a);
   
   wire [4:0]     decode0_reg1addr_next;
   wire [4:0]     decode0_reg2addr_next;
   reg [4:0]      decode_reg1addr;
   reg [4:0]      decode_reg2addr;
   
   
   wire           decode0_typea;
   wire           decode0_typeb1;
   wire           decode0_typeb2;
   wire           decode0_typei;
   wire           decode0_typee;
   wire           decode0_typem;

   assign decode0_typea = decode0_Instr[2:0] == 0; // also true for type E and type EE
   assign decode0_typeb1 = decode0_Instr[1:0] == 2'b01;
   assign decode0_typeb2 = decode0_Instr[1:0] == 2'b11;
   assign decode0_typei = decode0_Instr[1:0] == 2'b10;
   assign decode0_typem = decode0_Instr[2:0] == 3'b100;
   assign decode0_typee = decode0_Instr[6:0] == 7'b1111000;
   
   assign decode0_reg1addr_next = decode0_typea?decode0_Instr[16:12]:
                                  decode0_typeb2?decode0_Instr[7:3]:
                                  decode0_typem?decode0_Instr[9:5]:0;

   assign decode0_reg2addr_next = decode0_typea?decode0_Instr[21:17]:
                                  decode0_typeb2?decode0_Instr[12:8]:
                                  decode0_typem?decode0_Instr[14:10]:0;

   assign decode0_branch_override1 = decode_ready?decode0_typeb1:0;

   // Forwarding the simple branching PC value - 0 delay slots
   wire [31:0]    decode0_simmed29;
   assign decode0_simmed29 = {{3{decode0_Instr[31]}},decode0_Instr[31:3]};
   
   assign decode0_PC_next = decode0_typeb1?
                            (decode0_Instr[2]?(fetch_PC + decode0_simmed29):decode0_Instr[31:3]):
                            (fetch_PC + 1);

   reg [31:0]     decode_Instr;
   reg [31:0]     decode_PC;

   wire [31:0]    decode0_reg1addr_next1;
   wire [31:0]    decode0_reg2addr_next1;

   assign decode0_reg1addr_next1 = stall?decode_reg1addr:decode0_reg1addr_next;
   assign decode0_reg2addr_next1 = stall?decode_reg2addr:decode0_reg2addr_next;
   

   always @(posedge clk)
     if (~rst) begin
        decode_reg1addr <= 0;
        decode_reg2addr <= 0;
        
        decode_PC <= 0;
        decode_Instr <= 0;
        // Stall logic:
        decode0_Instr_r <= 0;
        stall_r <= 0;
        
        
     end else begin
        decode_reg1addr <= decode0_reg1addr_next1;
        decode_reg2addr <= decode0_reg2addr_next1;
        decode_PC <= (stall|fetch_microops)?decode_PC:decode0_PC;
        decode_Instr <= stall?decode_Instr:decode0_Instr;
        decode0_Instr_r <= decode0_Instr;
        stall_r <= stall;
     end // else: !if(~rst)

   // MUOP logic for DECODE0
`ifndef DISABLE_MICROOPS
   wire           is_muop;
   wire           is_call;
   wire           is_ret;
   
   
   wire           executing_microops;
   
   assign fetch_microops = is_muop | executing_microops;
   assign is_muop = (~executing_microops) & (ram_data_in_a[2:0] == 1);
   assign is_ret = ram_data_in_a[31:3] == 0;
   assign is_call = ~is_ret;

   reg [31:0]     next_muop_r;
   
   
   assign fetch_next_muop = is_muop? // starting insn
                            (is_call?32'hfffff7bc: // (storei SP SP (const -1))
                             32'h1fba4): // (load SP FP (const 3))
                            next_muop_r;

   reg [28:0]     muop_call_dst;
   reg [3:0]      muop_state;

   localparam S_MU_IDLE = 0;
   localparam S_MU_CALL1 = 1;
   localparam S_MU_CALL2 = 2;
   localparam S_MU_RET1 = 3;
   localparam S_MU_RET2 = 4;
   localparam S_MU_RET3 = 5;
   localparam S_MU_RET4 = 6;
   localparam S_MU_DONE = 7;
   
   
   assign executing_microops = muop_state != S_MU_IDLE;
   
   always @(posedge clk)
     if (~rst) begin
        next_muop_r <= 0;
        muop_call_dst <= 0;
        muop_state <= S_MU_IDLE;
     end else begin
        case (muop_state)
          S_MU_IDLE: begin
             if (is_muop) begin // start muops
                muop_call_dst <= ram_data_in_a[31:3];
                if (is_call) begin
                   muop_state <= S_MU_CALL1;
                   next_muop_r <= 32'hfffff7dc; // (storei SP FP (const -1))
                end else begin
                   muop_state <= S_MU_RET1;
                   next_muop_r <= 32'hfb84; // (load SC FP (const 1))
                end
             end
          end
          S_MU_CALL1: begin
             muop_state <= S_MU_CALL2;
             next_muop_r <= 32'hfffff7fc;
          end
          S_MU_CALL2: begin
             muop_state <= S_MU_DONE;
             next_muop_r <= {muop_call_dst, 3'b001};
          end
          S_MU_RET1: begin
             next_muop_r <= 32'h17bc4; // (load FP FP (const 2))
             muop_state <= S_MU_RET2;
          end
          S_MU_RET2: begin
             next_muop_r <= 32'h9c0f; // (jmpci R1 SC (const 1))
             muop_state <= S_MU_RET3;
          end
          S_MU_RET3: begin
             next_muop_r <= 0;
             muop_state <= S_MU_RET4;
          end
          S_MU_RET4: begin
             next_muop_r <= 0;
             muop_state <= S_MU_DONE;
          end
          S_MU_DONE: begin
             muop_state <= S_MU_IDLE;
          end
        endcase
     end // else: !if(~rst)
`else // !`ifndef DISABLE_MICROOPS
   assign fetch_microops = 0;
   assign fetch_next_muop = 0;
`endif


   //------------------------------------------------
   //--4. DECODE logic-------------------------------
   //------------------------------------------------

   wire        fwd_mem;
   wire [31:0] fwd_mem_data;
   wire [4:0]  fwd_mem_reg;

   wire        fwd_wb;
   wire [31:0] fwd_wb_data;
   wire [4:0]  fwd_wb_reg;
   
   
   wire [31:0]    decode_arg1_next;
   wire [31:0]    decode_arg2_next;

   // Register values returned from the regfile (as requested by the DECODE0 stage)
   wire [31:0]    decode_arg1_out;
   wire [31:0]    decode_arg2_out;
   reg [31:0]    decode_arg1_out_r;
   reg [31:0]    decode_arg2_out_r;

   wire [31:0]   decode_arg1_out_s = (unstall)?decode_arg1_out_r:decode_arg1_out;
   wire [31:0]   decode_arg2_out_s = (unstall)?decode_arg2_out_r:decode_arg2_out;
   
   // Register argument values amended with forwarding (TODO!)
   // Forwarding: WB -> DECODE
   assign decode_arg1_next =
                            (fwd_mem   &(fwd_mem_reg!=0)&(decode_reg1addr == fwd_mem_reg))?fwd_mem_data:
                            (fwd_wb    &(fwd_wb_reg!=0)&(decode_reg1addr == fwd_wb_reg))?fwd_wb_data:
                            decode_arg1_out_s;
   assign decode_arg2_next =
                            (fwd_mem   &(fwd_mem_reg!=0)&(decode_reg2addr == fwd_mem_reg))?fwd_mem_data:
                            (fwd_wb    &(fwd_wb_reg!=0)&(decode_reg2addr == fwd_wb_reg))?fwd_wb_data:
                            decode_arg2_out_s;

   reg [31:0]     exec_Instr;
   reg [31:0]     exec_PC;
   reg [31:0]     exec_arg1_r;
   reg [31:0]     exec_arg2_r;
   reg [4:0]      exec_reg1addr;
   reg [4:0]      exec_reg2addr;

`ifdef ICE_DEBUG
   assign PCdebug = exec_PC;
`endif
   
   always @(posedge clk)
     if (~rst) begin
        exec_Instr <= 0;
        exec_PC <= 0;
        exec_arg1_r <= 0;
        exec_arg2_r <= 0;
        exec_reg1addr <= 0;
        exec_reg2addr <= 0;
        decode_arg1_out_r <= 0;
        decode_arg2_out_r <= 0;
     end else begin
        exec_Instr <= stall?exec_Instr:decode_Instr;
        exec_PC <= stall?exec_PC:decode_PC;
        exec_arg1_r <= stall?exec_arg1:decode_arg1_next;
        exec_arg2_r <= stall?exec_arg2:decode_arg2_next;
        exec_reg1addr <= stall?exec_reg1addr:decode_reg1addr;
        exec_reg2addr <= stall?exec_reg2addr:decode_reg2addr;
        decode_arg1_out_r <= decode_arg1_out_s;
        decode_arg2_out_r <= decode_arg2_out_s;
     end // else: !if(~rst)

   //------------------------------------------------
   //--5. EXEC logic---------------------------------
   //------------------------------------------------
   wire [31:0] exec_arg1;
   wire [31:0] exec_arg2;

   // Apply simple forwarding (MEM -> EXEC) and WB->EXEC

   wire        fwd_simple;
   wire [31:0] fwd_simple_data;
   wire [4:0]  fwd_simple_reg;

   assign exec_arg1 = (fwd_simple&(fwd_simple_reg!=0)&(exec_reg1addr == fwd_simple_reg))?fwd_simple_data:
                      (fwd_mem   &(fwd_mem_reg!=0)&(exec_reg1addr == fwd_mem_reg))?fwd_mem_data:
                      (fwd_wb    &(fwd_wb_reg!=0)&(exec_reg1addr == fwd_wb_reg))?fwd_wb_data:
                      exec_arg1_r;
   assign exec_arg2 = (fwd_simple&(fwd_simple_reg!=0)&(exec_reg2addr == fwd_simple_reg))?fwd_simple_data:
                      (fwd_mem   &(fwd_mem_reg!=0)&(exec_reg2addr == fwd_mem_reg))?fwd_mem_data:
                      (fwd_wb    &(fwd_wb_reg!=0)&(exec_reg2addr == fwd_wb_reg))?fwd_wb_data:
                      exec_arg2_r;
   
   wire        exec_typei;
   
   assign exec_typei = exec_Instr[1:0] == 2'b10;
   wire [3:0]  exec_opcode_typeA;
   assign exec_opcode_typeA = exec_Instr[6:3];
   
   wire        exec_typee;
   wire        exec_typeee;
   wire        exec_isext;
   wire        exec_typeb2;
   wire        exec_typem;
   wire        exec_typea;

   reg         mem_typee;
   reg         mem_typei;
   reg         mem_typem;
   reg         mem_typea;

   assign exec_typea = exec_Instr[2:0] == 0;

   wire        exec_ext_hasout;
   assign exec_ext_hasout = exec_typee;
   
   assign exec_isext = exec_typee;
   assign exec_typeb2 = exec_Instr[1:0] == 2'b11;
   assign exec_typem = exec_Instr[2:0] == 3'b100;
   assign exec_typee = exec_Instr[6:0] == 7'b1111000;
   assign exec_typeee = exec_typee & ( exec_Instr[31:22] == 10'b1111111111 );

   localparam OPC_AND = 1;
   localparam OPC_ADD = 2;
   localparam OPC_SUB = 3;
   localparam OPC_OR = 4;
   localparam OPC_NOT = 5;
   localparam OPC_SHL = 6;
   localparam OPC_SHR = 7;
   localparam OPC_XOR = 8;
   localparam OPC_EQ = 9;
   localparam OPC_NE = 10;
   localparam OPC_CMP = 11;
   localparam OPC_ASHR = 12;
   
   localparam OPC_SELECT = 14;
   
   localparam CMP_SLT = 0;
   localparam CMP_SGT = 1;
   localparam CMP_SLE = 2;
   localparam CMP_SGE = 3;
   localparam CMP_ULT = 4;
   localparam CMP_UGT = 5;
   localparam CMP_ULE = 6;
   localparam CMP_UGE = 7;
   
   wire [9:0]  exec_immed10;
   wire [31:0] exec_immed_signext;
   assign exec_immed10 = exec_Instr[31:22];

   assign exec_immed_signext = {{22{exec_Instr[31]}},exec_Instr[31:22]};
   wire [31:0]   exec_immed25_signext;
   assign exec_immed25_signext = {{7{exec_Instr[31]}},exec_Instr[31:7]};
   
   wire [31:0] exec_out_cmp;
   assign exec_out_cmp = (exec_immed10[2:0] == CMP_SLT)?($signed(exec_arg1)<$signed(exec_arg2)):
                         (exec_immed10[2:0] == CMP_SGT)?($signed(exec_arg1)>$signed(exec_arg2)):
`ifndef DISABLE_CMPOPS
                         (exec_immed10[2:0] == CMP_SLE)?($signed(exec_arg1)<=$signed(exec_arg2)):
                         (exec_immed10[2:0] == CMP_SGE)?($signed(exec_arg1)>=$signed(exec_arg2)):
                         (exec_immed10[2:0] == CMP_ULT)?(exec_arg1<exec_arg2):
                         (exec_immed10[2:0] == CMP_UGT)?(exec_arg1>exec_arg2):
                         (exec_immed10[2:0] == CMP_ULE)?(exec_arg1<=exec_arg2):
                         (exec_immed10[2:0] == CMP_UGE)?(exec_arg1>=exec_arg2):
`endif
                         0;

   wire [31:0] exec_out_next_alu;
   assign exec_out_next_alu = (exec_opcode_typeA == OPC_ADD)?
                              (exec_arg1 + exec_arg2):
                              (exec_opcode_typeA == OPC_SUB)?
                              (exec_arg1 - exec_arg2):
                              (exec_opcode_typeA == OPC_AND)?
                              (exec_arg1 & exec_arg2):
                              (exec_opcode_typeA == OPC_OR)?
                              (exec_arg1 | exec_arg2):
                              (exec_opcode_typeA == OPC_XOR)?
                              (exec_arg1 ^ exec_arg2):
                              (exec_opcode_typeA == OPC_NOT)?
                              (~exec_arg1):
`ifdef ENABLE_BARREL_SHIFTER
                              (exec_opcode_typeA == OPC_SHL)?(exec_arg1 << exec_arg2):
                              (exec_opcode_typeA == OPC_SHR)?(exec_arg1 >> exec_arg2):
                              (exec_opcode_typeA == OPC_ASHR)?$signed($signed(exec_arg1) >>> exec_arg2):
`else
                              (exec_opcode_typeA == OPC_SHL)?(exec_arg1 << 1):
                              (exec_opcode_typeA == OPC_SHR)?(exec_arg1>>1):
                              (exec_opcode_typeA == OPC_ASHR)?({exec_arg1[31],exec_arg1[31:1]}):
`endif
                              (exec_opcode_typeA == OPC_EQ)?
                              (exec_arg1 == 
                               ((exec_immed_signext == 0)?
                                exec_arg2:exec_immed_signext)):
                              (exec_opcode_typeA == OPC_NE)?
                              (exec_arg1 != exec_arg2):
                              (exec_opcode_typeA == OPC_CMP)?
                              (exec_out_cmp):
                              (exec_opcode_typeA == OPC_SELECT)?
                              (fwd_simple_data[0]?exec_arg1:exec_arg2):0;
   
   wire [1:0]  exec_opcode_typeM;
   assign exec_opcode_typeM = exec_Instr[4:3];
   localparam OPC_LOAD = 0;
   localparam OPC_LOADR = 2;
   localparam OPC_STORE = 1;
   localparam OPC_STOREI = 3;

   ///
   // EXEC memory address logic
   ///
   reg [31:0]  exec_ram_addr_b;
   wire [31:0] exec_ram_addr_b_next;
   reg [31:0]  exec_ram_data_out_b;
   
   wire [31:0] exec_ram_data_out_b_next;
   reg         exec_ram_we_out;
   wire        exec_ram_we_out_next;

   // Mem queue:
   reg [31:0]  mem_queue_addr_1;
   reg [31:0]  mem_queue_data_1;
   reg         mem_queue_we_1;

   reg [31:0]  mem_queue_addr_2;
   reg [31:0]  mem_queue_data_2;
   reg         mem_queue_we_2;
   
   reg [31:0]  mem_queue_addr_3;
   reg [31:0]  mem_queue_data_3;
   reg         mem_queue_we_3;
   
   wire [31:0] mem_queue_addr_0;
   wire [31:0] mem_queue_data_0;
   wire        mem_queue_we_0;
   assign mem_queue_addr_0 = exec_ram_addr_b;
   assign mem_queue_data_0 = exec_ram_data_out_b;
   assign mem_queue_we_0 = exec_ram_we_out;
   
   
   assign ram_addr_in_b = exec_ram_addr_b;
   assign ram_data_out_b = exec_ram_data_out_b;
   assign ram_we_out = exec_ram_we_out;

   wire [31:0] exec_simmed17;
   assign exec_simmed17 = {{15{exec_Instr[31]}},exec_Instr[31:15]};


   wire        exec_isstore;

   assign exec_isstore = exec_Instr[3];
   assign exec_ram_addr_b_next 
     =
      exec_typem?
      ((exec_opcode_typeM == OPC_STOREI)?exec_arg2:
       (exec_arg2 + exec_simmed17)):0; // both LOAD and STORE
   
   assign exec_ram_we_out_next = exec_typem&(exec_isstore);
   assign exec_ram_data_out_b_next = exec_arg1;

   reg [31:0]  mem_out_alu_r;
   reg [31:0]  mem_out_s1_r;
   reg [31:0]  mem_immed_signext_r;

   reg [31:0]  mem_Instr;
   reg [31:0]  mem_PC;

   wire [31:0] exec_simmed24;
   assign exec_simmed24 = {{8{exec_Instr[31]}},exec_Instr[31:8]};
   assign exec_branch_override2 = exec_typeb2;
   assign exec_PC_next = (exec_Instr[2:1] == 2'b01 )? 
                         (exec_arg1[0]?(exec_PC + exec_simmed24):(fetch_PC + 1)):
                         (exec_arg1[0]?(exec_arg2):(fetch_PC + 1));

   reg [4:0]   mem_sd_class;
   wire [4:0]  mem_sd_class_next;

   assign mem_sd_class_next[0] = exec_typei;
   assign mem_sd_class_next[1] = exec_ext_hasout;
   assign mem_sd_class_next[2] = (exec_typem&(exec_opcode_typeM==3));
   assign mem_sd_class_next[3] = exec_typea & (exec_opcode_typeA == OPC_ADD);
   assign mem_sd_class_next[4] = exec_typem && (exec_opcode_typeM == 0); // LOAD

   
`ifdef ENABLE_EXT
   `IPATH(c2_custom_hoist.v)
`endif

   reg [3:0]   sfsm_state;
   localparam S_IDLE = 0;
   localparam S_WAIT = 1;

   localparam DONE = 1;
   
   reg         ext_done;
   
   reg         stall_exec_r;
   
   assign stall_exec = (exec_typee && exec_immed10[0] && ~ext_done) || (sfsm_state == S_WAIT);

   reg [31:0]  mem_out_ext_r;
   
   always @(posedge clk)
     if (~rst) begin
        mem_out_alu_r <= 0;
        mem_out_s1_r <= 0;
        mem_Instr <= 0;
        mem_PC <= 0;
        
        mem_typee <= 0; mem_typei <= 0; mem_typem <= 0; mem_typea <= 0;
        mem_sd_class <= 0;
        
        exec_ram_addr_b <= 0;
        exec_ram_data_out_b <= 0;
        exec_ram_we_out <= 0;

        ext_done <= 0;
        sfsm_state <= S_IDLE;
        stall_exec_r <= 0;

        mem_out_ext_r <= 0;
        
              
`ifdef ENABLE_EXT
        `IPATH(c2_custom_reset.v)
`endif
        
     end else begin
        mem_out_alu_r <= stall?mem_out_alu_r:((exec_typei)?exec_immed25_signext:exec_out_next_alu);
        mem_out_s1_r  <= stall?mem_out_s1_r:(exec_arg2+exec_simmed17);
        mem_immed_signext_r <= stall?mem_immed_signext_r:exec_immed_signext;
        
        mem_Instr <= stall?mem_Instr:exec_Instr;
        mem_PC <= stall?mem_PC:exec_PC;

        mem_typee <= stall?mem_typee:exec_typee;
        mem_typei <= stall?mem_typei:exec_typei;
        mem_typem <= stall?mem_typem:exec_typem;
        mem_typea <= stall?mem_typea:exec_typea;
        mem_sd_class <= stall?mem_sd_class:mem_sd_class_next;

        // 
        exec_ram_addr_b <= exec_ram_addr_b_next;
        exec_ram_data_out_b <= exec_ram_data_out_b_next;
        exec_ram_we_out <= exec_ram_we_out_next;

`ifndef DISABLE_MEMQUEUE
        if (~stall) begin
           mem_queue_addr_1 <=  exec_ram_addr_b;
           mem_queue_we_1   <=  exec_ram_we_out;
           mem_queue_data_1 <=  exec_ram_data_out_b;
           
           mem_queue_addr_2 <=  mem_queue_addr_1;
           mem_queue_we_2   <=  mem_queue_we_1;
           mem_queue_data_2 <=  mem_queue_data_1;
           
           mem_queue_addr_3 <=  mem_queue_addr_2;
           mem_queue_we_3   <=  mem_queue_we_2;
           mem_queue_data_3 <=  mem_queue_data_2;
        end // if (~stall)
`endif

`ifdef ENABLE_EXT
        `IPATH(c2_custom_pipeline.v)
`endif

        // Ext. FSM for the multi-cycle instructions (i.e., those with a wait stage)
`ifdef ENABLE_LONG_EXT
        
        stall_exec_r <= stall_exec;
        case (sfsm_state)
          S_IDLE:
            begin
               ext_done <= 0;
               if (exec_typee && exec_immed10[0] && ~stall_but_ext && ~ext_done) begin
                  sfsm_state <= S_WAIT;
               end
            end
          S_WAIT:
            begin
               `IPATH(c2_custom_wait.v)
            end
        endcase
`endif
     end
   

   //------------------------------------------------
   //--6. MEM logic----------------------------------
   //------------------------------------------------
   wire [31:0] mem_out_next;
   wire [31:0] mem_out_simple_next;

   
   wire        mem_ext_hasout;
   assign mem_ext_hasout = mem_typee;
   
   wire [1:0]  mem_opcode_typeM;
   assign mem_opcode_typeM = mem_Instr[4:3];
   wire [3:0]  mem_opcode_typeA;
   
   assign mem_opcode_typeA = mem_Instr[6:3];
   
   wire [31:0] mem_ram_input;

`ifndef DISABLE_MEMQUEUE
   assign mem_ram_input = ((mem_queue_addr_0 == mem_queue_addr_1)&mem_queue_we_1)?mem_queue_data_1:
                          ((mem_queue_addr_0 == mem_queue_addr_2)&mem_queue_we_2)?mem_queue_data_2:
                          ((mem_queue_addr_0 == mem_queue_addr_3)&mem_queue_we_3)?mem_queue_data_3:ram_data_in_b;
`else
   assign mem_ram_input = ram_data_in_b;
`endif
   

   // Selecting the right EXEC / RAM output
   assign mem_out_next = 
                         mem_sd_class==1?mem_out_alu_r:
                         mem_sd_class==2?mem_out_ext_r:
                         mem_sd_class==4?mem_out_s1_r:
                         mem_sd_class==8?(mem_out_alu_r + mem_immed_signext_r):
                         mem_out_alu_r;

   // Same but without an addition and mem output, to shorten the forwarding critical path
   assign mem_out_simple_next = 
                         mem_sd_class==1?mem_out_alu_r:
                         mem_sd_class==2?mem_out_ext_r:
                         mem_sd_class==4?mem_out_s1_r:
                         mem_out_alu_r;

   wire       mem_out_we_next;

   assign mem_out_we_next = mem_typei |
                            (mem_typea && (mem_opcode_typeA!=0)) |
                            (mem_typem && (mem_opcode_typeM == 3));

   wire       mem_out_we_delayed_next;
   
   assign mem_out_we_delayed_next = mem_out_we_next | (mem_typem && (mem_opcode_typeM != 1));
   

   wire [4:0] mem_out_reg_next;
   
   assign mem_out_reg_next =
                      mem_typea?mem_Instr[11:7]:
                      (mem_typei?mem_Instr[6:2]:
                       ((mem_typem&(mem_Instr[3]==0))?
                        mem_Instr[9:5]:
                        (mem_typem&(mem_opcode_typeM==3))?mem_Instr[14:10]:
                        mem_Instr[19:15]));

   // A simple MEM->EXEC forwarding feedback
   assign fwd_simple = mem_out_we_next;
   assign fwd_simple_data = mem_out_simple_next;
   assign fwd_simple_reg = mem_out_reg_next;
   /////
   

   reg [31:0] wb_Instr;
   reg [31:0] wb_PC;
   reg [31:0] mem_out;
   reg        mem_out_we;
   reg        mem_out_we_delayed;
   reg [4:0]  mem_out_reg;
   reg        wb_readmem;
   


   assign fwd_mem = mem_out_we;
   assign fwd_mem_reg = mem_out_reg;
   assign fwd_mem_data = mem_out;
   
   always @(posedge clk)
     if (~rst) begin
        wb_Instr <= 0;
        wb_PC <= 0;
        mem_out <= 0;
        mem_out_we <= 0;
        mem_out_we_delayed <= 0;
        mem_out_reg <= 0;
        wb_readmem <= 0;
     end else begin
        wb_Instr <= stall?wb_Instr:mem_Instr;
        wb_PC <= stall?wb_PC:mem_PC;
        mem_out <= stall?mem_out:mem_out_next;
        mem_out_we <= stall?mem_out_we:mem_out_we_next;
        mem_out_we_delayed <= stall?mem_out_we_delayed:mem_out_we_delayed_next;
        mem_out_reg <= stall?mem_out_reg:mem_out_reg_next;
        wb_readmem <= stall?wb_readmem:(mem_sd_class==16);
     end // else: !if(~rst)

   //------------------------------------------------
   //--7. WB logic-----------------------------------
   //------------------------------------------------

   reg [31:0] wb_out;
   reg        wb_out_we;
   reg [4:0]  wb_out_reg;

   wire [31:0] wb_ram_input;
`ifndef DISABLE_MEMQUEUE
   assign wb_ram_input = ((mem_queue_addr_0 == mem_queue_addr_1)&mem_queue_we_1)?mem_queue_data_1:
                         ((mem_queue_addr_0 == mem_queue_addr_2)&mem_queue_we_2)?mem_queue_data_2:
                         ((mem_queue_addr_0 == mem_queue_addr_3)&mem_queue_we_3)?mem_queue_data_3:ram_data_in_b;
`else
   assign wb_ram_input = ram_data_in_b;
`endif
   wire [31:0] wb_out_next;
   wire        wb_out_we_next;
   
   
   assign wb_out_next = wb_readmem?wb_ram_input:mem_out;
   assign wb_out_we_next = mem_out_we_delayed;

   assign fwd_wb = wb_out_we;
   assign fwd_wb_reg = wb_out_reg;
   assign fwd_wb_data = wb_out;
   
   always @(posedge clk)
     if (~rst) begin
        wb_out <= 0;
        wb_out_we <= 0;
        wb_out_reg <= 0;
     end else begin
        wb_out <= stall?wb_out:wb_out_next;
        wb_out_we <= stall?wb_out_we:wb_out_we_next;
        wb_out_reg <= stall?wb_out_reg:mem_out_reg;
     end
   
   //------------------------------------------------
   //--8. Reg file instance--------------------------
   //------------------------------------------------

   // Address values for the reg file are formed in the DECODE0 stage (or after DECODE0 stage if
   //   REGFILE_REGISTERED_OUT is not set).
   // The output is ready in the DECODE stage (and quite late in it).

   // Input port address, data and WE are formed in the end of WB stage

   wire [4:0] dbgreg;
   wire       dbgreg_en;
   assign dbgreg_en = 0;
   
   
   regfile #(
`ifndef DISABLE_MICROOPS
             .MICROOPS_ENABLED(1)
`else
             .MICROOPS_ENABLED(0)
`endif
             ) regfile1
     (.clk(clk),
      .rst(rst),
      
      .PC(fetch_PC),  // PC value to be fed as a virtual register R31
      
`ifdef REGFILE_REGISTERED_OUT
      .addr1(decode0_reg1addr_next1),
      .addr2(decode0_reg2addr_next1),
`else
      .addr1(decode_reg1addr),
      .addr2(decode_reg2addr),
`endif
      
      
      .out1(decode_arg1_out),
      .out2(decode_arg2_out),
      
      .dbgreg(dbgreg),
      .dbgreg_en(dbgreg_en),
      
      .wdata(wb_out),
      .addrw(wb_out_reg),
      .we(wb_out_we),
      .clkcounter(clkcounter) // for debugging only
      );

   //------------------------------------------------
   //-- 9. Debugging output--------------------------
   //------------------------------------------------

   
`ifdef DEBUG
   always @(posedge clk)
     if (rst) begin
        $display("");
        $display("----------------------------------------------------");
        $display("CLK %0d", clkcounter);
        $display("IF      PC=%0d", fetch_PC_next);
        $display("DECODE0 PC=%0d \t INSN=%x", decode0_PC, decode0_Instr);
        $display("        ARG1(R%0d) \t ARG2(R%0d)",  decode0_reg1addr_next,
                 decode0_reg2addr_next);
        $display("DECODE  PC=%0d \t INSN=%x", decode_PC, decode_Instr);
        /*
        $display("        ARG1(R%0d) = %0d \t ARG2(R%0d) = %0d",  decode_reg1addr,
                 decode_arg1_next,
                 decode_reg2addr, decode_arg2_next);
        if (fwd_mem) $display("     MEM FWD: R%0d = %d", fwd_mem_reg, fwd_mem_data);
        if (fwd_wb)  $display("     WB  FWD: R%0d = %d", fwd_wb_reg, fwd_wb_data);
        */
        $display("EXEC    PC=%0d \t INSN=%x", exec_PC, exec_Instr);
        $display("        ARG1(R%0d)=%0d \t ARG2(R%0d)=%0d", exec_reg1addr, exec_arg1, exec_reg2addr, exec_arg2);
 `ifdef DEBUGFWD
        if (fwd_simple) $display("     SIMPLE FWD: R%0d = %d", fwd_simple_reg, fwd_simple_data);
        if (fwd_mem) $display("     MEM FWD: R%0d = %d", fwd_mem_reg, fwd_mem_data);
        if (fwd_wb) $display("     WB FWD: R%0d = %d", fwd_wb_reg, fwd_wb_data);
        if (exec_isext)   $display("        EXT OP");
        if (exec_typem)   $display("        MEM OP");
        if (exec_typei)   $display("        IMMED OP");
        if (exec_typem & exec_isstore) $display("        STORE OP");
 `endif
        $display("MEM     PC=%0d \t INSN=%x", mem_PC, mem_Instr);
        $display("WB      PC=%0d \t INSN=%x", wb_PC, wb_Instr);
        if(mem_out_we)
          $display("        WB: R%0d <= %0d", mem_out_reg, wb_out_next);
     end
`endif

   

endmodule
