// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

`include "custom_include.v"
`include "defs.v"
`ifdef CORE_DEBUG
 `define DEBUG
`endif

module toycpu_core(
              input             clk, // clock
              input             rst, // reset

              // ICACHE port
              output reg [31:0] ic_addr,
              output reg        ic_rq,
              input [31:0]      ic_data_out,
              input             ic_data_out_valid,

              // LSU port
              input [31:0]      data_in, // bus data in
              input             data_in_ready, // bus data ready
              input             data_ack, // acknowledge write op

              output            data_wr, // request data write
              output            data_rd, // request data read 
              output [31:0]     data_address, // output data address
              output [31:0]     data_out, // data to be written

              // Interrupts
              input             irq, // IRQ requested
              input [3:0]       irqn, // IRQ number
              output            irq_ack, // Interrupt acknowledged and processed
              output            irq_busy, // Busy doing current interrupt (maintain your fifo outside!)

              // Debugging
              output reg [31:0] debug_reg_out,
              input [3:0]       debug_reg_num,

              input             debug,
              input             step,
              output reg        step_ack,
              input             stall,


              // Stack
              output [31:0]     stack_real_addr_a,
              output [31:0]     stack_real_addr_b,
              output            stack_wr_a,
              output [31:0]     stack_datain_a,
              input [31:0]      stack_data_a,
              input [31:0]      stack_data_b
              );

   parameter STACK_MAX = `RAM_DEPTH-1; // see above
   parameter IRQ_BASE = 28'h2000; // without the lowest 4 bits
   reg                      inIRQ; 
   reg                      out_irq_ack;
   reg                      doingIRQ; // switch to shadows

   reg                      inCritical; // block IRQ handling
   
   
   assign irq_ack = out_irq_ack;
   assign irq_busy = inIRQ;

   // Performance counters
   reg [31:0]               clk_counter;
   reg [31:0]               instr_counter;
   reg [31:0]               memop_counter;

   always @(posedge clk)
     begin
        if (!rst) begin
           clk_counter <= 0;
        end else begin
           clk_counter <= clk_counter + 1;
        end
     end


   //// Definitions

   // Magic numbers
   parameter ENTRY_PC = 32'h20100;
   

   // FSM states
   parameter S_IFETCH = 0;
   parameter S_IFETCH_WAIT = 1;
   parameter S_DECODE = 2;
   parameter S_EXEC_BRANCH = 3;
   parameter S_EXEC_ALU = 4;
   parameter S_MEMREAD_WAIT = 5;
   parameter S_MEMWRITE_WAIT = 6;
   parameter S_SETUP_IRQ = 7;
   parameter S_STACKMAPREAD = 8;
   parameter S_DECODE0 = 9;
`ifdef SYNCSTACK
   parameter S_DECODE_STAGE = S_DECODE0;
`endif
`ifndef SYNCSTACK
   parameter S_DECODE_STAGE = S_DECODE;
`endif
   parameter S_DEBUG_WAIT = 10;
   parameter S_DEBUG_WAIT_1 = 11;
   parameter S_EXEC_IMUL = 12;
   parameter S_EXEC_IMUL1 = 13;
   parameter S_EXEC_IMUL2 = 14;
   parameter S_EXEC_IMUL3 = 15;
   parameter S_EXEC_IMUL4 = 16;

   parameter S_CUSTOMWAIT = 17;
   parameter S_STACKMAPREAD0 = 18;
   
   
`include "opcodes.v"
 
   // CPU core registers
   reg [31:0]               PC;
   
   reg [31:0]               SP;
   reg [31:0]               FP;
   reg [31:0]               FPREL;
   reg                      CND;
                      
   
   reg                      CARRY;

   // Shadow registers for IRQ handling
   reg [31:0]               ShadowPC;
   reg [31:0]               ShadowSP;
   reg [31:0]               ShadowFP;
   reg [31:0]               ShadowFPREL;
   reg                      ShadowCARRY;

   // Internal registers
   reg [31:0]               instr;
   reg [31:0]               result;

   reg                      do_data_rd;
   reg                      do_data_wr;
   reg [31:0]               do_data_address;
   reg [31:0]               do_data_data;
   
   // FSM state register
   reg [7:0]                state;

   reg [31:0]               operand_a;
   reg [31:0]               operand_b;

`ifdef ENABLE_IMUL
   reg [31:0]               mul_1;
   reg [31:0]               mul_2;
   reg [31:0]               mul_3;
   reg [31:0]               mul_4;

   // Pipelined multiplication, shadowed by FSM stages
   always @(posedge clk) begin
      mul_1 <= operand_a * operand_b; // S_EXEC_IMUL
      mul_2 <= mul_1;                 // S_EXEC_IMUL1
      mul_3 <= mul_2;                 // S_EXEC_IMUL2
      mul_4 <= mul_3;                 // S_EXEC_IMUL3
   end
`endif
 // Wires connecting to the stack ports
   wire [31:0]              stack_addr_a;
   wire [31:0]              stack_addr_b;

   //// Instruction decode logic
   wire [2:0]               instr_class;
   
   assign instr_class = instr[2:0];

   wire [31:0]              immed;
   wire signed [31:0]       signed_immed;
   // sign-extended immediate
   assign signed_immed = {(instr[31]==1)?8'b11111111:8'b0, instr[31:8]};
   // 0-extended immediate
   assign immed = {8'b0, instr[31:8]};
   // opcode
   wire [4:0]               opcode;
   assign opcode = instr[7:3];

   wire signed [31:0]              immed_fpaddr0;
   assign immed_fpaddr0 = (opcode==READABS?0:FP) + signed_immed;

   wire signed [31:0]              immed_fpreladdr;
   assign immed_fpreladdr = immed_fpaddr0 + FPREL;

   wire signed [31:0]              immed_fpaddr;
   
   // assuming READFPREL == WRITEFPREL
   assign immed_fpaddr = (opcode == READFPREL||opcode==READABS)?immed_fpreladdr:immed_fpaddr0;

   // Debugging state
   reg                      doingStep;
   
   /// ALU
   wire [32:0]              alu_result; // 32 bits + carry


   reg          do_writeback;
   reg          do_writeback_fp;

   wire         alu_signed = immed[0];
   `ifdef ENABLE_IMUL
   wire alu_compop = opcode==ALU_LE || opcode == ALU_LEQ
                     || opcode == ALU_GE || opcode == ALU_GEQ;
   wire alu_compunsigned = 
        (opcode == ALU_LE)?(operand_b < operand_a):
        (opcode == ALU_LEQ)?(operand_b <= operand_a):
        (opcode == ALU_GE)?(operand_b > operand_a):
        (opcode == ALU_GEQ)?(operand_b >= operand_a):0;
   wire alu_compsigned = 
        (opcode == ALU_LE)?($signed(operand_b) < $signed(operand_a)):
        (opcode == ALU_LEQ)?($signed(operand_b) <= $signed(operand_a)):
        (opcode == ALU_GE)?($signed(operand_b) > $signed(operand_a)):
        (opcode == ALU_GEQ)?($signed(operand_b) >= $signed(operand_a)):0;
   `endif
                             
   assign alu_result = ((opcode == ALU_ADD)? operand_a + operand_b:
                        (opcode == ALU_AND)? operand_a & operand_b:
                        (opcode == ALU_OR)?  operand_a | operand_b:
                        (opcode == ALU_XOR)?  operand_a ^ operand_b:
                        (opcode == ALU_EQ)? (operand_a == operand_b):
`ifdef ENABLE_IMUL
                        (alu_compop)?{31'b0,alu_signed?alu_compsigned:alu_compunsigned}:
`endif
                        (opcode == ALU_NOT)? (~operand_a):
                        
                        (opcode == ALU_SHL)? {operand_a[30:0],1'b0}:
                        (opcode == ALU_ASHR
                         || opcode == ALU_SHR)? 
                        {(opcode==ALU_ASHR?operand_a[31]:1'b0),operand_a[31:1]}:
                        (opcode == ALU_SELECT)?(CND?operand_b:operand_a):
                        operand_a);

   // PCU
   wire [31:0]              branch_PC;
   wire [31:0]              rel_PC;
   wire [31:0]              INC_PC;
   
   wire                     cbranch;
   assign cbranch = operand_a != 0;

   assign rel_PC = PC + signed_immed;
   assign INC_PC = PC + 1;
   
   
   assign branch_PC = ((opcode == BR_JMP)?immed:
                       (opcode == BR_JMPR)?rel_PC:
                       (opcode == BR_JMPC)?(cbranch?immed:INC_PC):
                       (opcode == BR_JMPRC)?(cbranch?rel_PC:INC_PC):
                       (opcode == BR_JMPI)?operand_a:
                       (opcode == BR_JMPRI)?(PC + operand_a):INC_PC);

   wire                     branch_decsp;
   assign branch_decsp = ((opcode == BR_JMPI) || (opcode == BR_JMPRI)
                          || (opcode == BR_JMPC) || (opcode == BR_JMPRC));


   assign stack_real_addr_a = inIRQ?(STACK_MAX - stack_addr_a):stack_addr_a;
   assign stack_real_addr_b = inIRQ?(STACK_MAX - stack_addr_b):stack_addr_b;

   reg                      mapped_stack;
   reg [31:0]               mapped_stack_addr;
 
   // Stack is a 2-read 1-write port ram
   /*
    */
   // Combinational logic for the stack ports.
   // This is one of the slowest paths, consider splitting.
   assign stack_wr_a = (state == S_IFETCH) && (do_writeback||do_writeback_fp);
   

   assign stack_addr_a =
                        mapped_stack?mapped_stack_addr:
                        ( (state == S_DECODE_STAGE)? ((instr_class == IC_FPREAD)?immed_fpaddr:SP-1):
                          stack_wr_a? ((instr_class == IC_FPWRITE)?immed_fpaddr:SP) : 0 );
   assign stack_addr_b = ( (SP>2)?SP-2:0 );
   assign stack_datain_a = result;

   wire [31:0]              writeback_SP;
   assign writeback_SP = do_writeback?(mapped_stack?SP:SP+1):SP;
  
   assign data_address = do_data_address;
   assign data_wr = do_data_wr;
   assign data_rd = do_data_rd;
   assign data_out = do_data_data;

   // Debugging registers (can be queried via debug_reg_* interface)
   reg [31:0]               LAST_BRANCH;
   reg [31:0]               LAST_PUSH;
   reg [31:0]               LAST_POP1;
   reg [31:0]               LAST_POP2;
   reg [31:0]               LAST_INSTR;

   reg                      dbgenable;
   
   // Placeholder for the custom hoisted logic
   `include "custom_hoisted.v"
    
   // Main CPU core FSM
   always @(posedge clk)
     begin
        if (~rst) begin // Reset logic
           state <= S_IFETCH; // start fetching next instruction
           PC <= ENTRY_PC;   // set PC to the entry point
           SP <= 32'h0;       // flush stack
           FP <= 32'h0;
           FPREL <= 0;

           dbgenable <= 0;
           

           LAST_BRANCH <= 0;
           

           result <= 0;
           operand_a <= 0;
           operand_b <= 0;

           ic_rq <= 0;

           do_writeback <= 0;
           do_writeback_fp <= 0;

           // bus control
           do_data_rd <= 1'b0; 
           do_data_wr <= 1'b0;
           do_data_address <= 32'b0;
           // IRQ stuff
           inIRQ <= 0;
           out_irq_ack <= 0;
           doingIRQ <= 0;
           inCritical <= 0;

           instr <= 0;

           LAST_POP1 <= 0;
           LAST_POP2 <= 0;
           LAST_INSTR <= 0;
           LAST_PUSH <= 0;
           

           doingStep <= 0;
           step_ack <= 0;

           instr_counter <= 0;
           memop_counter <= 0;

           mapped_stack <= 0;

           // Custom reset logic
           `include "custom_reset.v"
           /////
        end else if(~stall) begin // if (!rst)
           case (state) // State machine logic
             S_DEBUG_WAIT: begin // wait for step to go up
                if (debug && step) begin
                   state <= S_IFETCH;
                end
             end
             S_DEBUG_WAIT_1: begin // wait for step to go low after ack
                if (~step) begin
                   step_ack <= 0;
                   state <= S_DEBUG_WAIT;
                end
             end
             S_IFETCH: begin // Starting fetching an instruction, set up a bus read
                if (do_writeback) begin
                   SP <= writeback_SP;
                   mapped_stack <= 0;
                   LAST_PUSH <= result;
                   do_writeback <= 0;
                end
                if (do_writeback_fp) begin
                   do_writeback_fp <= 0;
                end
                `ifdef DEBUG
                if (SP >= STACK_MAX) begin
                   $display("SP OVERFLOW %x", SP);
                   $finish;
                end
                `endif
                if (debug && ~step) begin
                   state <= S_DEBUG_WAIT;
                end else
                if (debug && doingStep) begin
                   doingStep <= 0;
                   step_ack <= 1;
                   state <= S_DEBUG_WAIT_1;
                end else
                begin
                if (step) doingStep <= 1;
                if (irq && !doingIRQ && !out_irq_ack && !inCritical) begin
                   // set up IRQ mode
                   doingIRQ <= 1;
                   inIRQ <= 1;

                   // Save registers
                   ShadowPC <= PC;
                   ShadowSP <= writeback_SP;
                   ShadowFP <= FP;
                   ShadowFPREL <= FPREL;
                   ShadowCARRY <= CARRY;

                   PC <= 0; // not really
                   SP <= 0; // may put interrupt argument data on top of stack, probably
                   FP <= 0;
                   FPREL <= 0;
                   
                   // Fetch IRQ vector data
                   do_data_rd <= 1;
                   do_data_address <= {IRQ_BASE,irqn};
                   state <= S_SETUP_IRQ;
                end else begin
                   ic_rq <= 1;
                   ic_addr <= PC;
                   state <= S_IFETCH_WAIT;
                   out_irq_ack <= 0;
                end
             end // case: S_IFETCH
             end // case: S_IFETCH
             S_SETUP_IRQ: begin
                if (data_in_ready) begin
                   PC <= data_in;
                   state <= S_IFETCH;
                   do_data_rd <= 0;
                end else begin
                   state <= S_SETUP_IRQ;
                end
             end
             S_IFETCH_WAIT: begin // Waiting for a bus to deliver a next instruction
                if (ic_data_out_valid) begin
                   instr <= ic_data_out;
                   LAST_INSTR <= ic_data_out;
           `ifdef SYNCSTACK
                   state <= S_DECODE0;
           `endif
           `ifndef SYNCSTACK
                   state <= S_DECODE;
           `endif
                   ic_rq <= 0;
                end else begin
                   state <= S_IFETCH_WAIT;
                end
             end // case: S_IFETCH_WAIT
           `ifdef SYNCSTACK
             S_DECODE0: begin
                state <= S_DECODE;
             end
           `endif
             S_DECODE: begin // Decode an instruction, 
                // fetch stack arguments, write immediate to stack, evaluate next PC, etc.
           `ifdef DEBUG
                if (dbgenable) begin
                $display ("INSTR=%X [%X]", instr, PC);
                $display ("SP=%X FP=%X", SP, FP);
                $display ("STK=%X, %X", stack_data_a, stack_data_b);
                end
           `endif
                
                // Perf. counter:
                instr_counter <= instr_counter + 1;

                // Debugging
                LAST_POP1 <= stack_data_a;
                LAST_POP2 <= stack_data_b;

                // Decode instruction class and select next stage accordingly
                case (instr_class)
                  IC_ALU: begin // for an ALU instruction fetch two values from the stack
                     // stack port reads should have been initiated by combinational logic
                     operand_a <= stack_data_a;
                     operand_b <= stack_data_b;
                     
           `ifdef DEBUG
                     if (opcode == ALU_DBG) begin
                        if (stack_data_b > 1 && stack_data_b < 999)
                          $display("DEBUG[%d]=%d", stack_data_b, stack_data_a);
                        else
                          if (stack_data_b == 0)
                            $write("%c", stack_data_a[7:0]);
                          else if (stack_data_b == 1) begin
                             $display("Registers: PC=%x, SP=%x, FP=%x", PC, SP, FP);
                          end
                                                      
                        
                        if (stack_data_b == 999) dbgenable <= stack_data_a[0];
                     end
           `endif
                     
                     // decrement stack pointer:
                     SP <= (opcode == ALU_NOT || opcode == ALU_SHR || opcode == ALU_ASHR
                            || opcode == ALU_SHL)?SP-1:SP - 2;
           `ifdef ENABLE_IMUL
                     if (opcode == ALU_MUL) begin
                        state <= S_EXEC_IMUL;
                     end else
           `endif
                       state <= S_EXEC_ALU;
                     PC <= INC_PC; // simply the next PC
                  end
                  IC_BRANCH: begin // for a conditional or an indirect branch, use top of the stack
                     operand_a <= stack_data_a;
                     state <= S_EXEC_BRANCH;
                  end
                  IC_IMMED: begin // push an immediate
                     state <= S_IFETCH;
                     do_writeback <= 1;
                     PC <= INC_PC;
                     result <= (opcode==PUSHSE?signed_immed:
                                opcode==PUSH?immed:
                                opcode==PUSHL?immed:
                                opcode==PUSHH?{immed[15:0],stack_data_a[15:0]}:0);
                     if (opcode == PUSHH) SP <= SP - 1;
                  end
                  IC_FPREAD: begin // read FP-relative stack location
                     result <= stack_data_a; // by combinational logic
                     PC <= INC_PC;
                     state <= S_IFETCH;
                     do_writeback <= 1;
                  end
                  IC_FPWRITE: begin // write to FP-relative stack location
                     PC <= INC_PC;
                     operand_a <= stack_data_a; // why operand_a?
                     result <= stack_data_a;
                     
                     SP <= SP - 1;
                     state <= S_IFETCH;
                     do_writeback_fp <= 1;
                  end
                  IC_MEMREAD: begin // read from the bus
                     // Mapped stack read
                     if ((stack_data_a & 32'hffff0000) == 0) begin
                        mapped_stack <= 1;
                        mapped_stack_addr <= stack_data_a;
                        state <= S_STACKMAPREAD0;
                     end else begin
                        memop_counter <= memop_counter + 1;
                        state <= S_MEMREAD_WAIT;
                        do_data_rd <= 1;
                        do_data_address <= stack_data_a;
                     end
                     SP <= SP - 1;
                     PC <= INC_PC;
                  end
                  IC_MEMWRITE: begin
                     if ((stack_data_a & 32'hffff0000) == 0) begin
                        state <= S_IFETCH;
                        do_writeback <= 1;
                        mapped_stack <= 1;
                        mapped_stack_addr <= stack_data_a;
                        result <= stack_data_b;
                     end else begin
                        memop_counter <= memop_counter + 1;
                        state <= S_MEMWRITE_WAIT;
                        do_data_rd <= 0;
                        do_data_wr <= 1;
                        do_data_address <= stack_data_a;
                        do_data_data <= stack_data_b;
                     end
                     PC <= INC_PC;
                     SP <= SP - 2;
                  end
                  IC_STACK: begin
                     if (opcode == CUSTOMOP) begin
                        // Custom op exec stage
                        `include "custom_exec.v"
                        ///////////////////////
                     end else begin
                        if (opcode == PUSHSP
                            || opcode == PUSHFP
                            || opcode == PUSHPC
                            || opcode == PUSHCARRY
                            || opcode == PUSHCOUNTER
                            || opcode == DUP) begin
                           state <= S_IFETCH;
                           do_writeback <= 1;
                        end
                        else begin
                           if (opcode == SETSP
                               || opcode == SETFP
                               || opcode == SETFPREL
                               || opcode == SETPC
                               || opcode == SETPCSP
                               || opcode == SETCND
                               || opcode == POP) begin
                              SP <= SP - 1;
                           end
                           state <= S_IFETCH;
                        end
                        result <= (opcode == PUSHSP)?SP:
                                  (opcode == PUSHPC)?PC:
                                  (opcode == PUSHFP)?FP:
                                  (opcode == PUSHCARRY)?CARRY:
                                  (opcode == PUSHCOUNTER)?
                                  ((immed == 0)?clk_counter:
                                   (immed == 1)?instr_counter:
                                   (immed == 2)?memop_counter:0):
                                  stack_data_a;

                        if (opcode == SETSP) SP <= stack_data_a;
                        if (opcode == SETFP) 
                          FP <= stack_data_a;
                        if (opcode == SETCND)
                          CND <= stack_data_a[0];
                        
                        if (opcode == SETFPREL) 
                          FPREL <= stack_data_a;
                        
                        if (opcode == SETPC) PC <= stack_data_a;
                        else if (opcode == SETPCSP)
                          begin
                             PC <= stack_data_a;
                             SP <= FPREL;
                          end else PC <= INC_PC;
                        
                        
                        if (opcode == SETCRITICAL) inCritical <= 1;
                        else if (opcode == LIFTCRITICAL) inCritical <= 0;
                        
                     end // else: !if(opcode == CUSTOMOP)
                  end
                endcase // case (instr_class)
             end // case: S_DECODE
             S_EXEC_BRANCH: begin
                if (opcode == BR_IRQACK) begin
                   PC <= ShadowPC;
                   SP <= ShadowSP;
                   FP <= ShadowFP;
                   FPREL <= ShadowFPREL;
                   CARRY <= ShadowCARRY;
                   out_irq_ack <= 1;
                   inIRQ <= 0;
                   doingIRQ <= 0;
                   state <= S_IFETCH;
                end else begin // if (opcode == BR_IRQACK)
                   `ifdef DEBUG
                   if (dbgenable) begin
                      $display ("BRANCH_PC(%X) = %X -- %X [%X]", operand_a, PC, branch_PC, SP);
                   end
                   `endif
                   
                   // Calculate the next PC
                   LAST_BRANCH <= PC;
                   PC <= branch_PC; // from combinational logic
                   state <= S_IFETCH;
                   if (branch_decsp) begin
                      SP <= SP - 1; // this branch op used a value from stack
                   end
                end
             end
             S_EXEC_ALU: begin // execute an ALU operation, write back the result
                state <= S_IFETCH;
                do_writeback <= 1;
                result <= alu_result[31:0]; // done by combinational logic
                CARRY  <= alu_result[32];
                `ifdef DEBUG
                if (dbgenable) begin
                   $display("ALU_RESULT = %x", alu_result);
                end
                `endif
             end
`ifdef ENABLE_IMUL
             // Follow the multiplication pipeline progress
             S_EXEC_IMUL: state <= S_EXEC_IMUL1;
             S_EXEC_IMUL1: state <= S_EXEC_IMUL2;
             S_EXEC_IMUL2: state <= S_EXEC_IMUL3;
             S_EXEC_IMUL3: state <= S_EXEC_IMUL4;
             S_EXEC_IMUL4: begin
                result <= mul_3;
                state <= S_IFETCH;
                do_writeback <= 1;
             end
`endif
             S_STACKMAPREAD0: begin
                state <= S_STACKMAPREAD;
                mapped_stack <= 0;
             end
             S_STACKMAPREAD: begin
                result <= stack_data_a;
                mapped_stack <= 0;
                state <= S_IFETCH;
                do_writeback <= 1;
             end
             S_MEMREAD_WAIT: begin // wait for the bus to return a sane result
                if (data_in_ready) begin
                   result <= data_in;
                   state <= S_IFETCH;
                   do_writeback <= 1;
                   do_data_rd <= 0;
                end else begin
                   state <= S_MEMREAD_WAIT;
                end
             end
             S_MEMWRITE_WAIT: begin // wait for the bus to assert it's done writing
                if (data_ack) begin
                   state <= S_IFETCH;
                   do_data_wr <= 0;
                end else begin
                   state <= S_MEMWRITE_WAIT;
                end
             end
             S_CUSTOMWAIT: begin
                // Custom ops blocking wait stage
                `include "custom_wait.v"
                ///////////////
             end
           endcase
        end
     end // always @ (posedge clk)


   // Debugging register polling interface
   always @(posedge clk)
     if (!rst) begin
        debug_reg_out <= 0;
     end else begin
        case (debug_reg_num)
          `DEBUG_REG_PC: debug_reg_out <= PC;
          `DEBUG_REG_SP: debug_reg_out <= SP;
          `DEBUG_REG_LAST_BRANCH: debug_reg_out <= LAST_BRANCH;
          `DEBUG_REG_LAST_PUSH: debug_reg_out <= LAST_PUSH;
          `DEBUG_REG_LAST_POP1: debug_reg_out <= LAST_POP1;
          `DEBUG_REG_LAST_POP2: debug_reg_out <= LAST_POP2;
          `DEBUG_REG_LAST_INSTR: debug_reg_out <= LAST_INSTR;
        endcase
     end
   
endmodule //toycpu_core

