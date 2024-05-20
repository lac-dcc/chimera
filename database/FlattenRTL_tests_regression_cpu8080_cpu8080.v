// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

////////////////////////////////////////////////////////////////////////////////
// Company:                                                                   //  
// Engineer:       Scott Moore                                                //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
// Chris N. Strahm - Modifications for Altera Quartus build.                  //
//                                                                            //
// Create Date:    11:45:32 09/04/2006                                        // 
// Design Name:                                                               // 
// Module Name:    cpu8080                                                    //
// Project Name:   cpu8080                                                    //
// Target Devices: xc3c200, xc3s1000                                          //
// Tool versions:                                                             //
// Description:                                                               //
//                                                                            //
//     Executes the 8080 instruction set. It is designed to be an internal    //
//     cell. Each of the I/Os are positive logic, and all signals are         //
//     constant with the exception of the data bus. The control signals are   //
//     fully decoded (unlike the orignal 8080), and features read and write   //
//     signals for both memory and I/O space. The I/O space is an 8 bit       //
//     address as in the original 8080. It does NOT echo the lower 8 bits to  //
//     the higher 8 bits, as was the practice in some systems.                //
//                                                                            //
//     Like the original 8080, the interrupt vectoring is fully external. The //
//     the external controller forces a full instruction onto the data bus.   //
//     The sequence begins with the assertion of interrupt request. The CPU   //
//     will then assert interrupt acknowledge, then it will run a special     //
//     read cycle with inta asserted for each cycle of a possibly             //
//     multibyte instruction. This matches the original 8080, which typically //
//     used single byte restart instructions to form a simple interrupt       //
//     controller, but was capable of full vectoring via insertion of a jump, //
//     call or similar instruction.                                           //
//                                                                            //
//     Note that the interrupt vector instruction should branch. This is      //
//     because the PC gets changed by the vector instruction, so if it does   //
//     not branch, it will have skipped a number of bytes after the interrupt //
//     equivalent to the vector instruction. The only instructions that       //
//     should really be used to vector are jmp, rst and call instructions.    //
//     Specifically, rst and call instruction compensate for the pc movement  //
//     by putting the pc unmodified on the stack.                             //
//                                                                            //
//     The memory, I/O and interrupt fetches all obey a simple clocking       //
//     sequence as follows. The CPU uses the positive clock edge to assert    //
//     and sample signals and data. The external logic theoretically uses the //
//     negative edge to check signal assertions and sample data, but it can   //
//     either use the negative edge, or actually be asynronous logic.         //
//                                                                            //
//     A standard read sequence is as follows:                                //
//                                                                            //
//     1. At the positive clock edge, readmem, readio or readint is asserted. //
//     2. At the negative clock edge (or immediately), the external memory    //
//        places data onto the data bus.                                      //
//     3. We hold automatically for one cycle.                                //
//     4. At the next positive clock edge, the data is sampled, and the read  //
//        Signal is deasserted.                                               //
//                                                                            //
//     A standard write sequence is as follows:                               //
//                                                                            //
//     1. At the positive edge, data is asserted on the data bus.             //
//     2. At the next postive clock edge, writemem or writeio is asserted.    //
//     3. At the next positive clock edge, writemem or writeio is deasserted. //
//     4. At the next positive edge, the data is deasserted.                  //
//                                                                            //
// Dependencies:                                                              //
//                                                                            //
// Revision:                                                                  //
// Revision 0.01 - File Created                                               //
// Additional Comments:                                                       //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

//
// Build option
//
// Uncomment this line to build without wait state ability. Many FPGA 
// applications don't require wait states. This can save silicon area.
//
// Defining this option will cause the wait line to be ignored.
//
// `define NOWAIT

//
// Build option
//
// Uncomment this line to build without I/O instruction ability. An application
// may have memory mapped I/O only, and not require I/O instructions. This can
// save silicon area.
//
// Defining this option will cause I/O instructions to be treated as no-ops.
// alternately, you can modify what they do.
//
// `define NOIO

//
// CPU states
//










































//
// Register numbers
//










//
// ALU operations
//










//
// State macros
//

























module cpu8080(addr,     // Address out
               data,     // Data bus
               readmem,  // Memory read   
               writemem, // Memory write
               readio,   // Read I/O space
               writeio,  // Write I/O space
               intr,     // Interrupt request 
               inta,     // Interrupt request 
               waitr,    // Wait request
               reset,    // Reset
               clock);   // System clock

   output [15:0] addr;
   inout  [7:0] data;
   output readmem;
   output writemem;
   output readio;
   output writeio;
   input  intr;
   output inta;
   input  waitr;
   input  reset;
   input  clock;
    
   // Output or input lines that need to be registered
    
   reg           readmem;
   reg           writemem;
   reg    [15:0] pc;
   reg    [15:0] addr;
   reg           readio;
   reg           writeio;
   reg           inta;
   reg    [15:0] sp;
                     
   // Local registers
    
   reg    [5:0]  state;       // CPU state machine
   reg    [2:0]  regd;        // Destination register
   reg    [7:0]  datao;       // Data output register
   reg           dataeno;     // Enable output data
   reg    [15:0] waddrhold;   // address holding for write
   reg    [15:0] raddrhold;   // address holding for read
   reg    [7:0]  wdatahold;   // single byte write data holding
   reg    [7:0]  wdatahold2;  // single byte write data holding
   reg    [7:0]  rdatahold;   // single byte read data holding
   reg    [7:0]  rdatahold2;  // single byte read data holding
   reg    [1:0]  popdes;      // POP destination code
   reg    [5:0]  statesel;    // state map selector
   reg    [5:0]  nextstate;   // next state output
   reg           eienb;       // interrupt enable delay shift reg
   reg    [7:0]  opcode;      // opcode holding
   
   // Register file. Note that 3'b110 (6) is not used, and is the code for a
   // memory reference.
    
   reg    [7:0]  regfil[0:7];

   // The flags are represented individually

   reg           carry; // carry bit
   reg           auxcar; // auxiliary carry bit
   reg           sign; // sign bit
   reg           zero; // zero bit
   reg           parity; // parity bit
   reg           ei; // interrupt enable
   reg           intcyc; // in interrupt cycle

   // ALU communication

   wire   [7:0]  alures;  // result
   reg    [7:0]  aluopra; // left side operand
   reg    [7:0]  aluoprb; // right side operand
   reg           alucin;  // carry in
   wire          alucout; // carry out
   wire          alupar;  // parity out
   wire          aluaxc;  // auxiliary carry
   reg    [2:0]  alusel;  // alu operational select
    
   // Instantiate the ALU

   alu alu(alures, aluopra, aluoprb, alucin, alucout, aluzout, alusout, alupar,
           aluaxc, alusel);
   
   always @(posedge clock)
      if (reset) begin // syncronous reset actions
       
      state    <= 6'h01; // Clear CPU state to initial fetch
      pc       <= 0; // reset program counter to 1st location
      dataeno  <= 0; // get off the data bus
      readmem  <= 0; // all signals out false
      writemem <= 0;
      readio   <= 0;
      writeio  <= 0;
      inta     <= 0;
      intcyc   <= 0;
      ei       <= 1; // interrupts on by default
      eienb    <= 0;

   end else case (state)
       
      6'h01: begin // start of instruction fetch
       
         // if interrupt request is on, enter interrupt cycle, else exit it now
         if (intr&&ei) begin

            intcyc <= 1; // enter interrupt cycle
            inta   <= 1; // activate interrupt acknowledge
            ei     <= 0; // disable interrupts

         end else begin

            intcyc  <= 0; // leave interrupt cycle
            readmem <= 1; // activate instruction memory read

         end
            
         addr <= pc; // place current program count on output
         if (eienb) ei <=1; // process delayed interrupt enable
         eienb <=0; // reset interrupt enabler
         state <= 6'h02; // next state
       
      end

      6'h02: begin // wait

         state <= 6'h03; // next state

       end

      6'h03: begin // complete instruction memory read


         if (!waitr) 

            begin // no wait selected, otherwise cycle

            opcode <= data; // latch opcode
            readmem <= 0; // Deactivate instruction memory read
            inta <= 0; // and interrupt acknowledge
            state <= 6'h04; // next state

         end
   
      end
       
      6'h04: begin // complete instruction memory read
          
         // We split off the instructions into 4 groups. Most of the 8080
         // instructions are in the MOV and ACC operations class.
          
         case (opcode[7:6]) // Decode top level
          
            2'b00: begin // 00: Data transfers and others
             
               case (opcode[5:0]) // decode these instructions

                  6'b000000: begin // NOP

                     // yes, do nothing

                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b110111: begin // STC

                     carry <= 1; // set carry flag
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b111111: begin // CMC

                     carry <= ~carry; // complement carry flag
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b101111: begin // CMA

                     regfil[3'b111] <= ~regfil[3'b111]; // complement accumulator
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b100111: begin // DAA

                     // decimal adjust accumulator, or remove by carry any 
                     // results in nybbles greater than 9

                     if (regfil[3'b111][3:0] > 9 || auxcar)
                        { auxcar, regfil[3'b111] } <= regfil[3'b111]+8'h06;
                     state <= 6'h22; // finish DAA
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b000100, 6'b001100, 6'b010100, 6'b011100, 6'b100100, 
                  6'b101100, 6'b110100, 6'b111100, 6'b000101, 6'b001101, 
                  6'b010101, 6'b011101, 6'b100101, 6'b101101, 6'b110101, 
                  6'b111101: begin // INR/DCR

                     regd <= opcode[5:3]; // get source/destination reg
                     aluopra <= regfil[opcode[5:3]]; // load as alu a
                     aluoprb <= 1; // load 1 as alu b
                     if (opcode[0]) alusel <= 3'b010; // set subtract
                     else alusel <= 3'b000; // set add
                     if (opcode[5:3] == 3'b110) begin

                        raddrhold <= regfil[3'b100]<<8|regfil[3'b101];
                        statesel <= 60; // inc/dec m
                        state <= 6'h12; // read byte

                     end else state <= 6'h07; // go inr/dcr cycleback
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b000010, 6'b010010: begin // STAX

                     wdatahold <= regfil[3'b111]; // place A as source
                     if (opcode[4]) // use DE pair
                        waddrhold <= regfil[3'b010]<<8|regfil[3'b011];
                     else // use BC pair
                        waddrhold <= regfil[3'b000] << 8|regfil[3'b001];
                     statesel <= 1; // write byte
                     state <= 6'h0e;
                     pc <= pc+16'h1; // Next instruction byte
                    
                  end

                  6'b001010, 6'b011010: begin // LDAX

                     regd <= 3'b111; // set A as destination
                     if (opcode[4]) // use DE pair
                        raddrhold <= regfil[3'b010]<<8|regfil[3'b011];
                     else // use BC pair
                        raddrhold <= regfil[3'b000]<<8|regfil[3'b001];
                     statesel <= 2; // read byte to register
                     state <= 6'h12;
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b000111: begin // RLC

                     // rotate left circular
                     { carry, regfil[3'b111] } <= 
                        (regfil[3'b111] << 1)+regfil[3'b111][7];
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b010111: begin // RAL

                     // rotate left through carry
                     { carry, regfil[3'b111] } <= (regfil[3'b111] << 1)+carry;
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b001111: begin // RRC

                     // rotate right circular
                     regfil[3'b111] <= 
                        (regfil[3'b111] >> 1)+(regfil[3'b111][0] << 7);
                     carry <= regfil[3'b111][0];
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b011111: begin // RAR

                     // rotate right through carry
                     regfil[3'b111] <= (regfil[3'b111] >> 1)+(carry << 7);
                     carry <= regfil[3'b111][0];
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b001001: begin // DAD B

                     // add BC to HL
                     { carry, regfil[3'b100], regfil[3'b101] } <= 
                        (regfil[3'b100] << 8)+regfil[3'b101]+
                        (regfil[3'b000] << 8)+regfil[3'b001];
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b011001: begin // DAD D

                     // add DE to HL
                     { carry, regfil[3'b100], regfil[3'b101] } <= 
                        (regfil[3'b100] << 8)+regfil[3'b101]+
                        (regfil[3'b010] << 8)+regfil[3'b011];
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b101001: begin // DAD H

                     // add HL to HL
                     { carry, regfil[3'b100], regfil[3'b101] } <= 
                        (regfil[3'b100] << 8)+regfil[3'b101]+
                        (regfil[3'b100] << 8)+regfil[3'b101];
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b111001: begin // DAD SP

                     // add SP to HL
                     { carry, regfil[3'b100], regfil[3'b101] } <= 
                        (regfil[3'b100] << 8)+regfil[3'b101]+sp;
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b000011: begin // INX B

                     // increment BC, no flags set
                     regfil[3'b000] <= 
                        (((regfil[3'b000] << 8)+regfil[3'b001])+16'h1)>>8;
                     regfil[3'b001] <= 
                        ((regfil[3'b000] << 8)+regfil[3'b001])+16'h1;
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b010011: begin // INX D

                     // increment DE, no flags set
                     regfil[3'b010] <= 
                        (((regfil[3'b010] << 8)+regfil[3'b011])+16'h1)>>8;
                     regfil[3'b011] <= 
                        ((regfil[3'b010] << 8)+regfil[3'b011])+16'h1;
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b100011: begin // INX H

                     // increment HL, no flags set
                     regfil[3'b100] <= 
                        (((regfil[3'b100] << 8)+regfil[3'b101])+16'h1)>>8;
                     regfil[3'b101] <= 
                        ((regfil[3'b100] << 8)+regfil[3'b101])+16'h1;
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b110011: begin // INX SP

                     // increment SP, no flags set
                     sp <= sp + 16'b1;
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b001011: begin // DCX B

                     // decrement BC, no flags set
                     regfil[3'b000] <= 
                        (((regfil[3'b000] << 8)+regfil[3'b001])-16'h1)>>8;
                     regfil[3'b001] <= 
                        ((regfil[3'b000] << 8)+regfil[3'b001])-16'h1;
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b011011: begin // DCX D

                     // decrement DE, no flags set
                     regfil[3'b010] <= 
                        (((regfil[3'b010] << 8)+regfil[3'b011])-16'h1)>>8;
                     regfil[3'b011] <= 
                        ((regfil[3'b010] << 8)+regfil[3'b011])-16'h1;
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b101011: begin // DCX H

                     // decrement HL, no flags set
                     regfil[3'b100] <= 
                        (((regfil[3'b100] << 8)+regfil[3'b101])-16'h1)>>8;
                     regfil[3'b101] <= 
                        ((regfil[3'b100] << 8)+regfil[3'b101])-16'h1;
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+1'h1; // Next instruction byte

                  end

                  6'b111011: begin // DCX SP

                     // decrement SP, no flags set
                     sp <= sp-16'b1;
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b000001: begin // LXI B

                     raddrhold <= pc+16'h1; // pick up after instruction
                     statesel <= 4; // read double to BC
                     state <= 6'h12;
                     pc <= pc+16'h3; // skip

                  end

                  6'b010001: begin // LXI D

                     raddrhold <= pc+16'h1; // pick up after instruction
                     statesel <= 6; // read double to DE
                     state <= 6'h12;
                     pc <= pc+16'h3; // skip

                  end

                  6'b100001: begin // LXI H

                     raddrhold <= pc+16'h1; // pick up after instruction
                     statesel <= 8; // read double to HL
                     state <= 6'h12;
                     pc <= pc+16'h3; // skip

                  end

                  6'b110001: begin // LXI SP

                     raddrhold <= pc+16'h1; // pick up after instruction
                     statesel <= 10; // read double to SP
                     state <= 6'h12;
                     pc <= pc+16'h3; // skip

                  end

                  6'b000110, 6'b001110, 6'b010110, 6'b011110, 6'b100110, 
                  6'b101110, 6'b110110, 6'b111110: begin // MVI

                     // move immediate to register
                     regd <= opcode[5:3]; // set destination register
                     raddrhold <= pc+16'h1; // set pickup address
                     if (opcode[5:3] == 3'b110) begin // it's mvi m,imm

                        regd <= opcode[5:3]; // set destination register
                        // set destination address
                        waddrhold <= { regfil[3'b100], regfil[3'b101] };
                        statesel <= 12; // read byte and move to write

                     end else 
                        statesel <= 15; // read byte and move to register
                     state <= 6'h12;
                     pc <= pc+16'h2; // advance over byte

                  end

                  6'b110010: begin // STA

                     wdatahold <= regfil[3'b111]; // set write data
                     raddrhold <= pc+16'h1; // set read address
                     statesel <= 17; // perform sta
                     state <= 6'h12;
                     pc <= pc + 16'h3; // next

                  end

                  6'b111010: begin // LDA

                     raddrhold <= pc+16'h1; // set read address
                     regd <= 3'b111; // set destination
                     statesel <= 21; // perform lda
                     state <= 6'h12;
                     pc <= pc+16'h3; // next

                  end

                  6'b100010: begin // SHLD

                     wdatahold <= regfil[3'b101]; // set write data
                     wdatahold2 <= regfil[3'b100];
                     raddrhold <= pc+16'h1; // set read address
                     statesel <= 26; // perform SHLD
                     state <= 6'h12;
                     pc <= pc+16'h3; // skip

                  end

                  6'b101010: begin // LHLD

                     raddrhold <= pc+16'h1; // set read address
                     statesel <= 31; // perform LHLD
                     state <= 6'h12;
                     pc <= pc+16'h3; // skip

                  end

                  // the illegal opcodes behave as NOPs

                  6'b001000, 6'b010000, 6'b011000, 6'b100000, 6'b101000, 
                  6'b110000, 6'b110000: begin 

                     state <= 6'h01; // fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

               endcase

            end
             
            2'b01: begin // 01: MOV instruction
             
               // Check its the halt instruction, which occupies the invalid
               // "MOV M,M" instruction.
               if (opcode == 8'b01110110) state <= 6'h05;
               // Otherwise, the 01 prefix is single instruction format.
               else begin

                  // Format 01DDDSSS
   
                  // Check memory source, use state if so
                  if (opcode[2:0] == 3'b110) begin

                     // place hl as address
                     raddrhold <= regfil[3'b100]<<8|regfil[3'b101];
                     regd <= opcode[5:3]; // set destination
                     statesel <= 2; // read byte to register
                     state <= 6'h12;

                  // Check memory destination, use state if so
                  end else if (opcode[5:3] == 3'b110) begin

                     // place hl as address
                     waddrhold <= regfil[3'b100]<<8|regfil[3'b101];
                     wdatahold <= regfil[opcode[2:0]]; // place data to write
                     statesel <= 1; // write byte
                     state <= 6'h0e;

                  // otherwise simple register to register
                  end else begin

                     regfil[opcode[5:3]] <= regfil[opcode[2:0]];
                     state <= 6'h01; // Fetch next instruction

                  end

               end
               pc <= pc+16'h1; // Next instruction byte
             
            end
             
            2'b10: begin // 10: Reg or mem to accumulator ops
             
               // 10 prefix is single instruction format
               aluopra <= regfil[3'b111]; // load as alu a
               aluoprb <= regfil[opcode[2:0]]; // load as alu b
               alusel <= opcode[5:3]; // set alu operation from instruction
               alucin <= carry; // input carry
               if (opcode[2:0] == 3'b110) begin

                  // set read address
                  raddrhold <= regfil[3'b100]<<8|regfil[3'b101];
                  statesel <= 58; // alu from m
                  state <= 6'h12; // read byte

               end else
                  state <= 6'h06; // go to alu cycleback
               pc <= pc+16'h1; // Next instruction byte

            end
             
            2'b11: begin // 11: jmp/call and others
             
               case (opcode[5:0]) // decode these instructions

                  6'b000101, 6'b010101, 6'b100101, 6'b110101: begin // PUSH

                     waddrhold <= sp-16'h2; // write to stack
                     sp <= sp-16'h2; // pushdown stack
                     case (opcode[5:4]) // register set

                        2'b00: { wdatahold2, wdatahold } <= 
                                  { regfil[3'b000], regfil[3'b001] };
                        2'b01: { wdatahold2, wdatahold } <= 
                                  { regfil[3'b010], regfil[3'b011] };
                        2'b10: { wdatahold2, wdatahold } <= 
                                  { regfil[3'b100], regfil[3'b101] };
                        2'b11: { wdatahold2, wdatahold } <= 
                                  { regfil[3'b111], sign, zero, 1'b0, auxcar, 
                                    1'b0, parity, 1'b1, carry };

                     endcase
                     statesel <= 37; // write double byte
                     state <= 6'h0e;
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b000001, 6'b010001, 6'b100001, 6'b110001: begin // POP

                     popdes <= opcode[5:4]; // set destination
                     raddrhold <= sp; // read from stack
                     sp <= sp+16'h2; // pushup stack
                     statesel <= 39; // perform POP
                     state <= 6'h12;
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b101011: begin // XCHG

                     regfil[3'b010] <= regfil[3'b100];
                     regfil[3'b011] <= regfil[3'b101];
                     regfil[3'b100] <= regfil[3'b010];
                     regfil[3'b101] <= regfil[3'b011];
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b100011: begin // XTHL

                     raddrhold <= sp; // address SP for read
                     waddrhold <= sp; // address SP for write
                     wdatahold <= regfil[3'b101]; // set data is HL
                     wdatahold2 <= regfil[3'b100];
                     statesel <= 41; // perform XTHL
                     state <= 6'h12;
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b111001: begin // SPHL

                     sp <= { regfil[3'b100], regfil[3'b101] };
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b000110, 6'b001110, 6'b010110, 6'b011110, 6'b100110, 
                  6'b101110, 6'b110110, 
                  6'b111110: begin // immediate arithmetic to accumulator

                     aluopra <= regfil[3'b111]; // load as alu a
                     alusel <= opcode[5:3]; // set alu operation from instruction
                     alucin <= carry; // input carry
                     raddrhold <= pc+16'h1; // read at PC
                     statesel <= 45; // finish accumulator immediate
                     state <= 6'h12;
                     pc <= pc+16'h2; // skip immediate byte

                  end

                  6'b101001: begin // PCHL

                     state <= 6'h01; // Fetch next instruction
                     pc <= { regfil[3'b100], regfil[3'b101] };

                  end

                  6'b000011: begin // JMP

                     raddrhold <= pc+16'h1; // pick up jump address
                     statesel <= 46; // finish JMP
                     state <= 6'h12;
  
                  end

                  6'b000010, 6'b001010, 6'b010010, 6'b011010, 6'b100010, 
                  6'b101010, 6'b110010, 6'b111010: begin // Jcc

                     raddrhold <= pc+16'h1; // pick up jump address
                     statesel <= 46; // finish JMP
                     // choose continue or read according to condition
                     case (opcode[5:3]) // decode flag cases

                        3'b000: if (zero) state <= 6'h01;
                                else state <= 6'h12;
                        3'b001: if (!zero) state <= 6'h01;
                                else state <= 6'h12;
                        3'b010: if (carry) state <= 6'h01;
                                else state <= 6'h12;
                        3'b011: if (!carry) state <= 6'h01;
                                else state <= 6'h12;
                        3'b100: if (parity) state <= 6'h01;
                                else state <= 6'h12;
                        3'b101: if (!parity) state <= 6'h01;
                                else state <= 6'h12;
                        3'b110: if (sign) state <= 6'h01;
                                else state <= 6'h12;
                        3'b111: if (!sign) state <= 6'h01;
                                else state <= 6'h12;

                     endcase
                     pc <= pc+16'h3; // advance after jump for false

                  end

                  6'b001101: begin // CALL

                     raddrhold <= pc+16'h1; // pick up call address
                     waddrhold <= sp-16'h2; // place address on stack
                     // if interrupt cycle, use current pc, else use address
                     // after call
                     if (intcyc) { wdatahold2, wdatahold } <= pc;
                     else { wdatahold2, wdatahold } <= pc+16'h3;
                     statesel <= 48; // finish CALL
                     state <= 6'h12;

                  end

                  6'b000100, 6'b001100, 6'b010100, 6'b011100, 6'b100100, 
                  6'b101100, 6'b110100, 6'b111100: begin // Ccc

                     raddrhold <= pc+16'h1; // pick up call address
                     waddrhold <= sp-16'h2; // place address on stack
                     // of address after call
                     { wdatahold2, wdatahold } <= pc + 16'h3;
                     statesel <= 48; // finish CALL
                     // choose continue or read according to condition
                     case (opcode[5:3]) // decode flag cases

                        3'b000: if (zero) state <= 6'h01; 
                                else state <= 6'h12;
                        3'b001: if (!zero) state <= 6'h01;
                                else state <= 6'h12;
                        3'b010: if (carry) state <= 6'h01;
                                else state <= 6'h12;
                        3'b011: if (!carry) state <= 6'h01;
                                else state <= 6'h12;
                        3'b100: if (parity) state <= 6'h01;
                                else state <= 6'h12;
                        3'b101: if (!parity) state <= 6'h01;
                                else state <= 6'h12;
                        3'b110: if (sign) state <= 6'h01;
                                else state <= 6'h12;
                        3'b111: if (!sign) state <= 6'h01;
                                else state <= 6'h12;

                     endcase
                     pc <= pc+16'h3; // advance after jump for false

                  end

                  6'b001001: begin // RET

                     raddrhold <= sp; // read from stack
                     statesel <= 56; // finish RET
                     state <= 6'h12;

                  end

                  6'b000000, 6'b001000, 6'b010000, 6'b011000, 6'b100000, 
                  6'b101000, 6'b110000, 6'b111000: begin // Rcc

                     raddrhold <= sp; // read from stack
                     statesel <= 56; // finish JMP
                     // choose read or continue according to condition
                     case (opcode[5:3]) // decode flag cases

                        3'b000: if (zero) state <= 6'h01; 
                                else state <= 6'h12;
                        3'b001: if (!zero) state <= 6'h01;
                                else state <= 6'h12;
                        3'b010: if (carry) state <= 6'h01;
                                else state <= 6'h12;
                        3'b011: if (!carry) state <= 6'h01;
                                else state <= 6'h12;
                        3'b100: if (parity) state <= 6'h01;
                                else state <= 6'h12;
                        3'b101: if (!parity) state <= 6'h01;
                                else state <= 6'h12;
                        3'b110: if (sign) state <= 6'h01;
                                else state <= 6'h12;
                        3'b111: if (!sign) state <= 6'h01;
                                else state <= 6'h12;

                     endcase
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b000111, 6'b001111, 6'b010111, 6'b011111, 6'b100111, 
                  6'b101111, 6'b110111, 6'b111111: begin // RST

                     pc <= opcode & 8'b00111000; // place restart value in PC
                     waddrhold <= sp-16'h2; // place address on stack
                     // if interrupt cycle, use current pc, else use address
                     // after call
                     if (intcyc) { wdatahold2, wdatahold } <= pc;
                     else { wdatahold2, wdatahold } <= pc+16'h3;
                     { wdatahold2, wdatahold } <= pc+16'h1; // of address after call
                     sp <= sp-16'h2; // pushdown stack CNS
                     statesel <= 37; // finish RST
                     state <= 6'h0e; // write to stack

                  end

                  6'b111011: begin // EI

                     eienb <= 1'b1; // set delayed interrupt enable
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b110011: begin // DI

                     ei <= 1'b0;
                     state <= 6'h01; // Fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

                  6'b011011: begin // IN p


                     // perform input
                     raddrhold <= pc+1; // pick up byte I/O address
                     statesel <= 52; // finish IN
                     state <= 6'h12;
                     pc <= pc+16'h2; // advance over byte




       

                  end

                  6'b010011: begin // OUT p


                     // perform output
                     raddrhold <= pc+1; // pick up byte I/O address
                     statesel <= 53; // finish OUT
                     state <= 6'h12;
                     pc <= pc+16'h2; // advance over byte




       

                  end

                  // the illegal opcodes behave as NOPs

                  6'b001011, 6'b011001, 6'b011101, 6'b101101, 
                  6'b111101: begin

                     state <= 6'h01; // fetch next instruction
                     pc <= pc+16'h1; // Next instruction byte

                  end

               endcase

            end
            
         endcase
                
      end

      // Follow states. These state handlers implement the following cycles past
      // M1, or primary fetch state.
      
      //
      // single byte write, writes wdatahold to the waddrhold address
      //

      6'h0e: begin

         addr <= waddrhold; // place address on output
         waddrhold <= waddrhold + 1'b1; // next address
         datao <= wdatahold; // set data to output
         wdatahold <= wdatahold2; // next data
         dataeno <= 1; // enable output data
         state <= 6'h0f; // next state
         
      end

      6'h0f: begin // continue write #2

         writemem <= 1; // enable write memory data
         state <= 6'h10; // idle one cycle for write

      end

      6'h10: begin // continue write #3


         if (!waitr) 

            begin // no wait selected, otherwise cycle

            writemem <= 0; // disable write memory data
            state <= 6'h11; // idle hold time

         end

      end

      6'h11: begin // continue write #4

         dataeno <= 0; // disable output data
         state <= nextstate; // get next macro state
         statesel <= statesel+6'b1; // and index next in macro 

      end

      //
      // single byte read, reads rdatahold from the raddrhold address
      //

      6'h12: begin

         addr <= raddrhold; // place address on output
         raddrhold <= raddrhold + 16'h1; // next address
         if (intcyc) inta <= 1; // activate interrupt acknowledge
         else readmem <= 1; // activate memory read
         state <= 6'h13; // next state
         
      end

      6'h13: begin // continue read #2

         // wait one cycle
         state <= 6'h14; // next state

      end

      6'h14: begin // continue read #3


         if (!waitr) 

            begin // no wait selected, otherwise cycle

            rdatahold2 <= rdatahold; // shift data
            rdatahold <= data; // read new data
            readmem <= 0; // deactivate instruction memory read
            inta <= 0; // deactivate interrupt acknowledge
            state <= nextstate; // get next macro state
            statesel <= statesel+6'b1; // and index next in macro 

         end

      end

      6'h15: begin // finish POP instruction

         case (popdes) // register set

            2'b00: { regfil[3'b000], regfil[3'b001] } <= 
                      { rdatahold, rdatahold2 };
            2'b01: { regfil[3'b010], regfil[3'b011] } <= 
                      { rdatahold, rdatahold2 };
            2'b10: { regfil[3'b100], regfil[3'b101] } <= 
                      { rdatahold, rdatahold2 };
            2'b11: begin

               regfil[3'b111] <= rdatahold;
               sign   <= ((rdatahold2 >> 7)& 1'b1) ? 1'b1:1'b0;
               zero   <= ((rdatahold2 >> 6)& 1'b1) ? 1'b1:1'b0;
               auxcar <= ((rdatahold2 >> 4)& 1'b1) ? 1'b1:1'b0;
               parity <= ((rdatahold2 >> 2)& 1'b1) ? 1'b1:1'b0;
               carry  <= ((rdatahold2 >> 0)& 1'b1) ? 1'b1:1'b0;

            end

         endcase
         state <= 6'h01; // Fetch next instruction

      end

      6'h0d: begin // jump address

         state <= 6'h01; // and return to instruction fetch
         pc <= { rdatahold, rdatahold2 };

      end

      6'h23: begin // call address

         sp <= sp-16'h2; // pushdown stack
         state <= 6'h01; // and return to instruction fetch
         pc <= { rdatahold, rdatahold2 };

      end

      6'h24: begin // return from call

         sp <= sp+16'h2; // pushup stack
         state <= 6'h01; // and return to instruction fetch
         pc <= { rdatahold, rdatahold2 };

      end

 // if I/O instructions are to be included
      6'h16: begin // input single byte to A

         addr <= rdatahold; // place I/O address on address lines
         readio <= 1; // set read I/O
         state <= 6'h17; // continue

      end

      6'h17: begin // input single byte to A #2
         
         // wait one cycle
         state <= 6'h18; // continue

      end

      6'h18: begin // input single byte to A #3


         if (!waitr) 

            begin // no wait selected, otherwise cycle

            regfil[3'b111] <= data; // place input data
            readio <= 0; // clear read I/O
            state <= 6'h01; // Fetch next instruction

         end

      end

      6'h19: begin // output single byte from A

         addr <= rdatahold; // place address on output
         datao <= regfil[3'b111]; // set data to output
         dataeno <= 1; // enable output data
         state <= 6'h1a; // next state
         
      end

      6'h1a: begin // continue out #2

         writeio <= 1; // enable write I/O data
         state <= 6'h1b; // idle one cycle for write

      end

      6'h1b: begin // continue out #3


         if (!waitr) 

            begin // no wait selected, otherwise cycle

            writeio <= 0; // disable write I/O data
            state <= 6'h1c; // idle hold time

         end

      end

      6'h1c: begin // continue write #4

         dataeno <= 0; // disable output data
         state <= 6'h01; // Fetch next instruction

      end


      6'h05: begin // Halt waiting for interrupt

         // If there is an interrupt request and interrupts are enabled, then we
         // can leave halt. Otherwise we stay here.
         if (intr&&ei) state <= 6'h01; // Fetch next instruction
         else state <= 6'h05;

      end

      6'h1d: begin // move to register

         regfil[regd] <= rdatahold; // place data
         state <= nextstate; // get next macro state
         statesel <= statesel+6'b1; // and index next in macro 

      end

      6'h25: begin // move to alu a

         aluopra <= rdatahold; // place data
         state <= nextstate; // get next macro state
         statesel <= statesel+6'b1; // and index next in macro 

      end

      6'h26: begin // move to alu b

         aluoprb <= rdatahold; // place data
         state <= nextstate; // get next macro state
         statesel <= statesel+6'b1; // and index next in macro 

      end

      6'h06: begin // alu cycleback

         regfil[3'b111] <= alures; // place alu result back to A
         carry <= alucout; // place carry
         sign <= alusout; // place sign
         zero <= aluzout; // place zero
         parity <= alupar; // place parity
         auxcar <= aluaxc; // place auxiliary carry
         state <= 6'h01; // and return to instruction fetch

      end

      6'h07: begin // inr/dcr cycleback

         regfil[regd] <= alures; // place alu result back to source/dest
         sign <= alures[7]; // place sign
         zero <= aluzout; // place zero
         parity <= alupar; // place parity
         auxcar <= aluaxc; // place auxiliary carry
         state <= 6'h01; // and return to instruction fetch

      end

      6'h27: begin // inr/dcr cycleback to m

         waddrhold <= regfil[3'b100]<<8|regfil[3'b101]; // place address
         wdatahold <= alures; // place data to write
         sign <= alures[7]; // place sign
         zero <= aluzout; // place zero
         parity <= alupar; // place parity
         auxcar <= aluaxc; // place auxiliary carry
         state <= nextstate; // get next macro state
         statesel <= statesel+6'b1; // and index next in macro 

      end

      6'h08: begin // finish LXI B

         regfil[3'b000] <= rdatahold; // place upper
         regfil[3'b001] <= rdatahold2; // place lower
         state <= 6'h01; // and return to instruction fetch

      end

      6'h09: begin // finish LXI D

         regfil[3'b010] <= rdatahold; // place upper
         regfil[3'b011] <= rdatahold2; // place lower
         state <= 6'h01; // and return to instruction fetch

      end

      6'h0a: begin // finish LXI H

         regfil[3'b100] <= rdatahold; // place upper
         regfil[3'b101] <= rdatahold2; // place lower
         state <= 6'h01; // and return to instruction fetch

      end

      6'h0b: begin // finish LXI SP

         sp <= { rdatahold, rdatahold2 }; // place
         state <= 6'h01; // and return to instruction fetch

      end

      6'h1e: begin // move read to write

         wdatahold <= rdatahold; // move read to write data
         state <= nextstate; // get next macro state
         statesel <= statesel+6'b1; // and index next in macro

      end

      6'h1f: begin // move read data to write address

         waddrhold <= { rdatahold, rdatahold2 };
         state <= nextstate; // get next macro state
         statesel <= statesel+6'b1; // and index next in macro

      end

      6'h20: begin // move read data to read address

         raddrhold <= { rdatahold, rdatahold2 };
         state <= nextstate; // get next macro state
         statesel <= statesel+6'b1; // and index next in macro

      end

      6'h0c: begin // load HL from read data

         regfil[3'b101] <= rdatahold2; // low
         regfil[3'b100] <= rdatahold; // high
         state <= nextstate; // get next macro state
         statesel <= statesel+6'b1; // and index next in macro CNS

      end

      6'h21: begin

         aluoprb <= rdatahold; // load as alu b
         state <= 6'h06; // go to alu cycleback

      end

      6'h22: begin

         if (regfil[3'b111][7:4] > 9 || carry)
            { carry, regfil[3'b111] } <= regfil[3'b111]+8'h60;
         state <= 6'h01; // and return to instruction fetch

      end

      default: state <= 5'bx;

   endcase

   // Enable drive for data output
   assign data = dataeno ? datao: 8'bz;

   //
   // State macro generator
   //
   // This ROM contains series of state execution lists that perform various
   // tasks, usually involving reads or writes.
   //

   always @(statesel) case (statesel)

      // mac_writebyte: write a byte

       1: nextstate = 6'h01; // fetch next instruction

      // mac_readbtoreg: read a byte, place in register

       2: nextstate = 6'h1d; // move to register
       3: nextstate = 6'h01; // Fetch next instruction

      // mac_readdtobc: read double byte to BC

       4: nextstate = 6'h12; // get high byte
       5: nextstate = 6'h08; // place in BC

      // mac_readdtode: read double byte to DE

       6: nextstate = 6'h12; // get high byte
       7: nextstate = 6'h09; // place in DE

      // mac_readdtohl: read double byte to HL

       8: nextstate = 6'h12; // get high byte
       9: nextstate = 6'h0a; // place in HL

      // mac_readdtosp: read double byte to SP

      10: nextstate = 6'h12; // get high byte
      11: nextstate = 6'h0b; // place in SP

      // mac_readbmtw: read byte and move to write

      12: nextstate = 6'h1e; // move read to write 
      13: nextstate = 6'h0e; // write to destination
      14: nextstate = 6'h01; // Fetch next instruction

      // mac_readbmtr: read byte and move to register

      15: nextstate = 6'h1d; // place in register
      16: nextstate = 6'h01; // Fetch next instruction

      // mac_sta: STA

      17: nextstate = 6'h12; // read high byte
      18: nextstate = 6'h1f; // move read to write address
      19: nextstate = 6'h0e; // write to destination
      20: nextstate = 6'h01; // Fetch next instruction

      // mac_lda: LDA

      21: nextstate = 6'h12; // read high byte
      22: nextstate = 6'h20; // move read to write address
      23: nextstate = 6'h12; // read byte
      24: nextstate = 6'h1d; // move to register
      25: nextstate = 6'h01; // Fetch next instruction

      // mac_shld: SHLD

      26: nextstate = 6'h12; // read high byte
      27: nextstate = 6'h1f; // move read to write address
      28: nextstate = 6'h0e; // write to destination low
      29: nextstate = 6'h0e; // write to destination high
      30: nextstate = 6'h01; // Fetch next instruction

      // mac_lhld: LHLD

      31: nextstate = 6'h12; // read high byte
      32: nextstate = 6'h20; // move read to write address
      33: nextstate = 6'h12; // read byte low
      34: nextstate = 6'h12; // read byte high
      35: nextstate = 6'h0c; // move to register
      36: nextstate = 6'h01; // Fetch next instruction

      // mac_writedbyte: write double byte

      37: nextstate = 6'h0e; // double write
      38: nextstate = 6'h01; // then fetch

      // mac_pop: POP

      39: nextstate = 6'h12; // double it
      40: nextstate = 6'h15; // then finish

      // mac_xthl: XTHL

      41: nextstate = 6'h12; // double it
      42: nextstate = 6'h0e; // then write
      43: nextstate = 6'h0e; // double it
      44: nextstate = 6'h0a; // place word in hl

      // mac_accimm: accumulator immediate

      45: nextstate = 6'h21; // finish

      // mac_jmp: JMP

      46: nextstate = 6'h12; // double read
      47: nextstate = 6'h0d; // then go pc

      // mac_call: CALL

      48: nextstate = 6'h12; // double read
      49: nextstate = 6'h0e; // then write
      50: nextstate = 6'h0e; // double write
      51: nextstate = 6'h23; // then go to that

      // mac_in: IN

      52: nextstate = 6'h16; // go to IN after getting that

      // mac_out: OUT

      53: nextstate = 6'h19; // go to OUT after getting that

      // mac_rst: RST

      54: nextstate = 6'h0e; // double write
      55: nextstate = 6'h0d; // then go to that

      // mac_ret: RET

      56: nextstate = 6'h12; // double read
      57: nextstate = 6'h24; // then go to that

      // mac_alum: op a,m

      58: nextstate = 6'h26; // go move to alu a
      59: nextstate = 6'h06; // cycle back to acc

      // mac_idm: inc/dec m

      60: nextstate = 6'h25; // go move to alu b
      61: nextstate = 6'h27; // set up alu result
      62: nextstate = 6'h0e; // write it
      63: nextstate = 6'h01; // Fetch next instruction

      default nextstate = 6'bx; // other states never reached

   endcase

endmodule

//
// Alu module
//
// Finds arithmetic operations needed. Latches on the positive edge of the
// clock. There are 8 different types of operations, which come from bits
// 3-5 of the instruction.
//

module alu(res, opra, oprb, cin, cout, zout, sout, parity, auxcar, sel);

   input  [7:0] opra;   // Input A
   input  [7:0] oprb;   // Input B
   input        cin;    // Carry in
   output       cout;   // Carry out
   output       zout;   // Zero out
   output       sout;   // Sign out
   output       parity; // parity
   output       auxcar; // auxiliary carry
   input  [2:0] sel;    // Operation select
   output [7:0] res;    // Result of alu operation
   
   reg       cout;   // Carry out
   reg       zout;   // Zero out
   reg       sout;   // sign out
   reg       parity; // parity
   reg       auxcar; // auxiliary carry
   reg [7:0] resi;   // Result of alu operation intermediate
   reg [7:0] res;    // Result of alu operation

   always @(opra, oprb, cin, sel, res, resi) begin

      case (sel)
      
         3'b000: begin // add

            { cout, resi } = opra+oprb; // find result and carry
            // find auxiliary carry
            auxcar = (((opra[3:0]+oprb[3:0]) >> 4) & 8'b1) ? 1'b1 : 1'b0;

         end
         3'b001: begin // adc

            { cout, resi } = opra+oprb+cin; // find result and carry
            // find auxiliary carry
            auxcar = (((opra[3:0]+oprb[3:0]+cin) >> 4) & 8'b1) ? 1'b1 : 1'b0;

         end
         3'b010, 3'b111: begin // sub/cmp

            { cout, resi } = opra-oprb; // find result and carry
            // find auxiliary borrow
            auxcar = (((opra[3:0]-oprb[3:0]) >> 4) & 8'b1) ? 1'b1 : 1'b0;

         end
         3'b011: begin // sbb

            { cout, resi } = opra-oprb-cin; // find result and carry
            // find auxiliary borrow 
            auxcar = (((opra[3:0]-oprb[3:0]-cin >> 4)) & 8'b1) ? 1'b1 : 1'b0;

         end
         3'b100: begin // ana

            { cout, resi } = {1'b0, opra&oprb}; // find result and carry
            auxcar = 1'b0; // clear auxillary carry

          end
         3'b101: begin // xra

            { cout, resi } = {1'b0, opra^oprb}; // find result and carry
            auxcar = 1'b0; // clear auxillary carry

         end
         3'b110:  begin // ora

            { cout, resi } = {1'b0, opra|oprb}; // find result and carry
            auxcar = 1'b0; // clear auxillary carry

         end
                     
      endcase

      if (sel != 3'b111) res = resi; else res = opra;
      zout <= ~|resi; // set zero flag from result
      sout <= resi[7]; // set sign flag from result
      parity <= ~^resi; // set parity flag from result

   end

endmodule