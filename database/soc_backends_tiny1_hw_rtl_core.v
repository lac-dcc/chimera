module tiny1_core(
                  input         clk, // clock
                  input         rst, // reset (neg)

                  input         irq, // interrupt requested
                  output reg    irqack, // interrupt acknowledged

                  // A single memory port for both reading and writing
                  output [15:0] mem_addr, 
                  output [15:0] mem_data_o,
                  input [15:0]  mem_data_i,
                  input [15:0]  ram_data_i, // bypass, to avoid circular deps
                  
                  output        mem_wr,
                  output        mem_rd);

   parameter FSM_FETCH_ISRC = 0;   // macro instruction fetch mode
   parameter FSM_FETCH_MPC  = 1;   // microcode address table lookup
   parameter FSM_FETCH_MUOP = 2;   // micro instruction fetch mode
   parameter FSM_EXEC_MUOP  = 3;   // micro instruction execution
   parameter FSM_MPC_FINISH = 4;
   
   
   // Memory map:
   // 0 -  31: slots for vregs
   // 32 - 63: IRQ mode vregs
   // 64 - 127: microcode handlers table
   // 128 - 139: IRQ handler entry, one for all, must fit 12 bytes
   // 140 - 151: Entry point
   // 152 - MUEND: mucode
   // MUEND+1 - 16383: code + data
   // 16384 - 65535: memory-mapped area (handled outside of the core)
 

   // Magic numbers:
   parameter ADDR_ENTRY_POINT = 140;
   parameter ADDR_IRQ_ENTRY = 128;

   // Internal registers:
   reg [15:0]                   PC; // Program counter, visible from the macrocode
   reg [15:0]                   A;  // Microcode-visible accumulator
   reg [15:0]                   B;  // Microcode-visible accumulator
   reg [15:0]                   C;  // Microcode address register
   reg [15:0]                   MPC; // Microcode program counter
   reg [15:0]                   ISRC; // Macrocode instruction source
   reg                          CR;  // Carry bit from the previous ALU cycle

   // Special registers:
   reg [15:0]                   MuOP; // Current microinstruction (if in an after-read stage)

   reg                          firstMuOP; // Is it the first muOP of an instruction?
   
   
   // Offset register, if in an IRQ
   reg                          O;

   // Macro program counter stored for an IRQ handler
   reg [15:0]                   savedPC;

   // Indicates an after-read state
   reg                          afterRead;


   // Combinatorial logic: MuOP decoding
   wire [15:0]                  effMuOP;
   assign effMuOP = (afterRead)?MuOP:ram_data_i; // never from mmap io

   // For convenience, decoding a muOP
   wire [1:0]                   AL = effMuOP[15:14];
   wire [1:0]                   SH = effMuOP[13:12];
   wire [1:0]                   DS = effMuOP[11:10];
   wire [1:0]                   MM = effMuOP[9:8];
   wire [1:0]                   CN = effMuOP[7:6];
   wire [1:0]                   IS = effMuOP[5:4];
   wire [3:0]                   IMMD = effMuOP[3:0];
   wire [5:0]                   SIMMED = effMuOP[5:0];

   wire [1:0]                   IS1 = (CN==0)?IS:0;

   // Computing an address: special handling for vregs
   wire [15:0]                  effC;
   wire                         longconst;
   assign longconst = (IS==0 && (IMMD&2)) && MM==1;
   
   assign effC = (IS==0 && (IMMD&1))?{O,C[3:0],1'b0}:
                 (IS==0 && (IMMD&2))?{MPC[15:2],2'b10}:C;

   // MPC comes from either memory read or from a register, if it is not the first muOP
   wire [15:0]                  effMPC;
   assign effMPC = (firstMuOP)?ram_data_i:MPC;

   // Memory read or write address computation
   assign mem_addr = 
                     (cpu_state == FSM_FETCH_ISRC)?PC:
                     (cpu_state == FSM_FETCH_MPC)?{10'b1,ram_data_i[15:11],1'b0}:
                     (cpu_state == FSM_FETCH_MUOP)?effMPC:
                     /*(cpu_state == FSM_EXEC_MUOP)?*/ effC;

   // Write flag: can only write in exec stage
   assign mem_wr = (cpu_state == FSM_EXEC_MUOP &&
                    MM == 2)?1:0;

   // Read flag: always reading something, unless explicitly not reading in
   //    a muop exec stage
   assign mem_rd = (cpu_state == FSM_EXEC_MUOP &&
                    (MM!=1 || afterRead))?0:1;

   // ALU: select source
   wire [15:0]                  SRC;
   assign SRC = (MM==1 && afterRead)?mem_data_i:
                (MM==3)?((IMMD&1)?CR:ISRC):
                (IS1==1)?IMMD:
                (IS1==2)?PC:
                (IS1==3)?C:A;

   // May consider a multi-stage 4-bit adder instead
   wire [15:0]                  ALU1;
   wire                         CR0;

   // ALU: select operation
   assign {CR0,ALU1} = (AL==0)?SRC+B:
                      (AL==1)?{1'b0,SRC&B}:
                      (AL==2)?{1'b0,SRC}:{1'b0,~SRC};

   // ALU2 holds the ALU result
   wire [15:0]                  ALU2;
   reg                          ALU2Z;
   
   assign ALU2 = (SH==0)?ALU1:
                 (SH==1)?ALU1<<1:
                 (SH==2)?ALU1>>1:
                         ALU1>>4;

   // Computing the next microcode PC (should not really be 16bits)
   wire [15:0]                  MPCdelta;
   wire [15:0]                  ExtSIMMED;
   

   assign ExtSIMMED = (SIMMED[5]==1)?{9'h1ff, SIMMED[5:0], 1'b0}:
                      /* else */     {9'h0, SIMMED[5:0], 1'b0};


   wire [15:0]                  MPCdeltaDefault;
   assign MPCdeltaDefault = longconst?4:2;
   
   assign MPCdelta = (CN==0)?MPCdeltaDefault:
                     (CN==1)?((ALU2Z)?ExtSIMMED:MPCdeltaDefault):
                     (CN==2)?((ALU2Z)?MPCdeltaDefault:ExtSIMMED):
                             ExtSIMMED;

   // Memory write
   assign mem_data_o = ALU2;
   
   // Main FSM loop
   reg [2:0]                    cpu_state;

   
   always @(posedge clk)
     if (!rst) begin
        firstMuOP <= 1;
        PC <= ADDR_ENTRY_POINT; // FIXED ENTRY POINT
        savedPC <= 0;
        irqack <= 0;
        cpu_state <= FSM_FETCH_ISRC;
        afterRead <= 0;

        A <= 0;
        B <= 0;
        C <= 0;
        O <= 0;
        CR <= 0;

        MuOP <= 0;
        ALU2Z <= 0;

     end else begin
        case (cpu_state)
          
          // Fetch the macro opcode from PC,
          //    or switch to or from the IRQ handling
          //    and repeat fetching
          FSM_FETCH_ISRC: begin
             firstMuOP <= 1;
             if (irq && !O) begin
                savedPC <= PC;
                PC <= ADDR_IRQ_ENTRY;
                O <= 1;
                irqack <= 1;
                cpu_state <= FSM_FETCH_ISRC;
             end else if(PC == 0 && O) begin
                PC <= savedPC;
                O <= 0;
                irqack <= 0;
                cpu_state <= FSM_FETCH_ISRC;
             end else begin
                cpu_state <= FSM_FETCH_MPC;
             end
          end // case: FSM_FETCH_ISRC
          // Fetch the microcode PC for the current macro opcode
          FSM_FETCH_MPC: begin
             ISRC <= ram_data_i;
             cpu_state <= FSM_FETCH_MUOP;
          end
          // Fetch the microcode opcode for the current MPC
          FSM_FETCH_MUOP: begin
             if(firstMuOP) begin
                MPC <= ram_data_i;
                firstMuOP <= 0;
             end
             afterRead <= 0;
             cpu_state <= FSM_EXEC_MUOP;
          end
          // Execute the muOP, may take two cycles if reading a memory
          FSM_EXEC_MUOP: begin
             if (MM == 1 && !afterRead) begin
                afterRead <= 1;
                cpu_state <= FSM_EXEC_MUOP; // skip one cycle to get the value
                MuOP <= effMuOP;
             end else begin
                // only commit the ALU result if not writing to memory and
                //   not jumping
                if (MM!=2 && CN==0) begin
                   A  <= (DS==0)?ALU2: A;
                   B  <= (DS==1)?ALU2: B;
                   C  <= (DS==2)?ALU2: C;
                   PC <= (DS==3)?ALU2:PC;

                   CR <= CR0;
                end
                ALU2Z <= ALU2==0;
                cpu_state <= FSM_MPC_FINISH;
             end // else: !if(MM == 1 && !afterRead)
          end
          FSM_MPC_FINISH: begin
             MPC <= MPC + MPCdelta;
             // Jumping with 0 offset is a special case, forcing a return to the macro
             //   instruction mode.
             if (MPCdelta == 0) begin
                cpu_state <= FSM_FETCH_ISRC;
             end else begin
                cpu_state <= FSM_FETCH_MUOP;
             end
          end
        endcase
     end
endmodule // tiny1_core

