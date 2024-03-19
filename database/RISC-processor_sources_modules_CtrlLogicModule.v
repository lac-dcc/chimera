//emacsclient -n +[line number] [file name]
`timescale 1ns / 1ps

module CtrlLogicModule
  (
   input wire [5:0] OPCODE,
   input wire 	    RESET,
   input wire 	    Z,
   input wire 	    IRQ,
   input wire 	    pc_31,
  
   output reg [2:0] PCSEL,
   output reg 	    RA2SEL,
   output reg 	    ASEL,
   output reg 	    BSEL,
   output reg [1:0] WDSEL,
   output reg [5:0] ALUFN,
   output reg 	    WR,
   output reg 	    WERF,
   output reg 	    WASEL,
   output reg 	    MEMTYPE
   );

   reg [17:0] 	    opcodeROM [63:0];
   wire [5:0] 	    opcode_extended;

   assign opcode_extended = (~pc_31 & IRQ) ? 6'b000000 : OPCODE;
   
   initial begin
       WR = 0;
       WERF = 0;
       
       opcodeROM[6'b000000] = 18'b100000000010101100;   // STV
       opcodeROM[6'b000001] = 18'b000000101100000011;
       opcodeROM[6'b000010] = 18'b000001001100000011;
       opcodeROM[6'b000011] = 18'b000001101100000011;
       opcodeROM[6'b000100] = 18'b000010001100000011;
       opcodeROM[6'b000101] = 18'b000010101100000011;
       opcodeROM[6'b000110] = 18'b000011001100000011;
       opcodeROM[6'b000111] = 18'b000011101100000011;
       opcodeROM[6'b001000] = 18'b000100001100000011;
       opcodeROM[6'b001001] = 18'b000100101100000011;
       opcodeROM[6'b001010] = 18'b000101001100000011;
       opcodeROM[6'b001011] = 18'b000101101100000011;
       opcodeROM[6'b001100] = 18'b000110001100000011;
       opcodeROM[6'b001101] = 18'b000110101100000011;
       opcodeROM[6'b001110] = 18'b000111001100000011;
       opcodeROM[6'b001111] = 18'b000111101100000011;
       opcodeROM[6'b010000] = 18'b001000001100000011;
       opcodeROM[6'b010001] = 18'b001000101100000011;
       opcodeROM[6'b010010] = 18'b001001001100000011;
       opcodeROM[6'b010011] = 18'b001001101100000011;
       opcodeROM[6'b010100] = 18'b001010001100000011;
       opcodeROM[6'b010101] = 18'b001010101100000011;
       opcodeROM[6'b010110] = 18'b001011001100000011;
       opcodeROM[6'b010111] = 18'b001011101100000011;
       opcodeROM[6'b011000] = 18'b000000000000110010;   // LD
       opcodeROM[6'b011001] = 18'b000000000010101100;   // ST
       opcodeROM[6'b011010] = 18'b001101001100000011;   
       opcodeROM[6'b011011] = 18'b001101101000000010;   // JMP
       opcodeROM[6'b011100] = 18'b001110001100000011;
       opcodeROM[6'b011101] = 18'b001110111100000010;   // BEQ
       opcodeROM[6'b011110] = 18'b001111000000000010;   // BNE
       opcodeROM[6'b011111] = 18'b001110000001010010;   // LDR
       opcodeROM[6'b100000] = 18'b000000000000001010;   // ADD
       opcodeROM[6'b100001] = 18'b000000100000001010;   // SUB
       opcodeROM[6'b100010] = 18'b010001000000001010;   // MUL    
       opcodeROM[6'b100011] = 18'b010001100000001010;   // DIV
       opcodeROM[6'b100100] = 18'b011001100000001010;   // CMPEQ
       opcodeROM[6'b100101] = 18'b011010100000001010;   // CMPLT  
       opcodeROM[6'b100110] = 18'b011011100000001010;   // CMPLE
       opcodeROM[6'b100111] = 18'b010011101100000011;   
       opcodeROM[6'b101000] = 18'b001100000000001010;   // AND
       opcodeROM[6'b101001] = 18'b001111000000001010;   // OR
       opcodeROM[6'b101010] = 18'b001011000000001010;   // XOR
       opcodeROM[6'b101011] = 18'b010101101100000011;   
       opcodeROM[6'b101100] = 18'b010000000000001010;   // SHL
       opcodeROM[6'b101101] = 18'b010000100000001010;   // SHR
       opcodeROM[6'b101110] = 18'b010001100000001010;   // SRA
       opcodeROM[6'b101111] = 18'b010111101100000011;
       opcodeROM[6'b110000] = 18'b000000000000101010;   // ADDC
       opcodeROM[6'b110001] = 18'b000000100000101010;   // SUBC
       opcodeROM[6'b110010] = 18'b010001000000101010;   // MULC
       opcodeROM[6'b110011] = 18'b010001100000101010;   // DIVC
       opcodeROM[6'b110100] = 18'b011001100000101010;   // CMPEQC
       opcodeROM[6'b110101] = 18'b011010100000101010;   // CMPLTC
       opcodeROM[6'b110110] = 18'b011011100000101010;   // CMPLEC
       opcodeROM[6'b110111] = 18'b011011101100000011;
       opcodeROM[6'b111000] = 18'b001100000000101010;   // ANDC
       opcodeROM[6'b111001] = 18'b001111000000101010;   // ORC
       opcodeROM[6'b111010] = 18'b001011000000101010;   // XORC
       opcodeROM[6'b111011] = 18'b011101101100000011;   
       opcodeROM[6'b111100] = 18'b010000000000101010;   // SHLC
       opcodeROM[6'b111101] = 18'b010000100000101010;   // SHRC
       opcodeROM[6'b111110] = 18'b010001100000101010;   // SRAC
       opcodeROM[6'b111111] = 18'b011111101100000011;
       
   end

   // ROM description
   // <Mem-type><ALUFN-6><PCSEL-3><RA2SEL><ASEL><BSEL><WDSEL-2><WR><WERF><WASL>
   always @(opcode_extended, RESET, Z) begin
       #5
	 ALUFN = opcodeROM[opcode_extended][16:11];         
       RA2SEL = opcodeROM[opcode_extended][7];             // ✔
       ASEL = opcodeROM[opcode_extended][6];               
       BSEL = opcodeROM[opcode_extended][5];               // ✔
       WDSEL = opcodeROM[opcode_extended][4:3];            // ✔
       WR = (~RESET) & opcodeROM[opcode_extended][2];      // ✔
       WERF = (~RESET) & opcodeROM[opcode_extended][1];    // ✔
       WASEL = opcodeROM[opcode_extended][0];              
       MEMTYPE = opcodeROM[opcode_extended][17];

       // PCSEL logic for BEQ and BNE due to their dependence
       // on Z
       if (opcode_extended == 6'b011101) begin   // BEQ
	   PCSEL = {{2'b00}, {Z}};               
   end else if (opcode_extended == 6'b011110) begin // BNE
       PCSEL = {{2'b00}, {~Z}};               
	end else begin
	    PCSEL = opcodeROM[opcode_extended][10:8];
	end

   end // always @ (OPCODE, RESET, Z)
endmodule // CtrlLogicModule

