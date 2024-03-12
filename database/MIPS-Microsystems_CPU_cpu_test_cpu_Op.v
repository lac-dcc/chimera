//NPCOp
`define PC_4 0
`define PC_beq 1
`define PC_jal 2
`define PC_jr 3
`define PC_bgez 4
`define PC_bne 5
`define PC_blez 6
`define PC_bltz 7
`define PC_bgtz 8

//EXTOp
`define zero_ext 0
`define sign_ext 1
`define rear_ext 2

//ALUOp
`define alu_add 0
`define alu_sub 1
`define alu_or 2
`define alu_slt 3
`define alu_sltu 4
`define alu_lb 5
`define alu_sll 6
`define alu_load_i 7
`define alu_and 8
`define alu_xor 9
`define alu_sllv 10
`define alu_sra 11
`define alu_srlv 12
`define alu_nor 13
`define alu_srav 14
`define alu_srl 15
`define alu_movz 16
`define alu_clz 17

//MDOp
`define mult 0
`define multu 1
`define div 2
`define divu 3
`define mthi 4
`define mtlo 5
`define madd 6
`define msub 7
`define maddu 8
`define msubu 9
