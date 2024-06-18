// This program was cloned from: https://github.com/Rohan7Gupta/pentaRV
// License: Apache License 2.0

`define     ADD          4'b0000    //add
`define     SLL          4'b0001    //sll   
`define     SLT          4'b0010    //slt   
`define     SLTU         4'b0011    //sltu    
`define     XOR          4'b0100    //xor   
`define     SRL          4'b0101    //srl   
`define     OR           4'b0110    //or  
`define     AND          4'b0111    //and
`define     SUB          4'b1000    //sub
`define     SRA          4'b1101    //sra

`define     LSB          3'b000
`define     LSH          3'b001
`define     LSW          3'b010
`define     LSBU         3'b100
`define     LSHU         3'b101

`define     BEQ          4'b0000
`define     BNE          4'b0001
`define     BLT          4'b0100
`define     BGE          4'b0101
`define     BLTU         4'b0110
`define     BGEU         4'b0111
`define     jal_jalr     4'b1111 //jal,jalr

`define     SB           3'b000
`define     SH           3'b001
`define     SW           3'b010

`define     ALUreg     7'b0110011  // rd <- rs1 OP rs2   
`define     ALUimm     7'b0010011  // rd <- rs1 OP Iimm
`define     Branch     7'b1100011  // if(rs1 OP rs2) PC<-PC+Bimm
`define     JALR       7'b1100111  // rd <- PC+4; PC<-rs1+Iimm
`define     JAL        7'b1101111  // rd <- PC+4; PC<-PC+Jimm
`define     AUIPC      7'b0010111  // rd <- PC + Uimm
`define     LUI        7'b0110111  // rd <- Uimm   
`define     Load       7'b0000011  // rd <- mem[rs1+Iimm]
`define     Store      7'b0100011  // mem[rs1+Simm] <- rs2
`define     SYSTEM     7'b1110011  // system operation 
