  
   //// Instruction classes
   parameter IC_ALU = 0;
   parameter IC_BRANCH = 1;
   parameter IC_IMMED = 2;
   parameter IC_FPREAD = 3;
   parameter IC_FPWRITE = 4;
   parameter IC_MEMREAD = 5;
   parameter IC_MEMWRITE = 6;
   parameter IC_STACK = 7;

   //// 5-bit opcodes

   // ALU
   parameter ALU_ADD = 0;
   parameter ALU_AND = 1;
   parameter ALU_OR =  2;
   parameter ALU_SHL = 3;
   parameter ALU_SHR = 4;

   parameter ALU_XOR = 5;

   parameter ALU_NOT = 6;

   parameter ALU_EQ = 7;

`ifdef ENABLE_IMUL
   parameter ALU_MUL = 8;
   parameter ALU_LE = 9;
   parameter ALU_LEQ = 10;
   parameter ALU_GE = 11;
   parameter ALU_GEQ = 12;
`endif
   parameter ALU_ASHR = 13;
   parameter ALU_SELECT = 14;

   parameter ALU_DBG = 15;


   
   // Branch
   parameter BR_JMP = 0;
   parameter BR_JMPR = 1;
   parameter BR_JMPC = 2;
   parameter BR_JMPRC = 3;
   parameter BR_JMPI = 4;
   parameter BR_JMPRI = 5;

   parameter BR_IRQACK = 6;

   parameter BR_NOP = 7;



   // Immed
   parameter PUSHSE = 0;
   parameter PUSH = 1;
   parameter PUSHL = 2;
   parameter PUSHH = 3;

   // Stack
   parameter PUSHSP = 0;
   parameter PUSHFP = 1;
   parameter PUSHPC = 2;

   parameter SETSP = 3;
   parameter SETFP = 4;
   parameter SETPC = 5;
   parameter SETFPREL = 6;

   parameter DUP = 7;
   parameter POP = 8;

   parameter SETCRITICAL = 9;
   parameter LIFTCRITICAL = 10;

   parameter SETPCSP = 11;

   parameter PUSHCARRY = 12;

   parameter PUSHCOUNTER = 13;

   parameter CUSTOMOP = 14;

   parameter SETCND = 15;

   // FPRead
   parameter READFP = 0;
   parameter READFPREL = 1;
   parameter READABS = 2;

   // FPWrite
   parameter WRITEFP = 0;
   parameter WRITEFPREL = 1;
   parameter WRITEABS = 2;
