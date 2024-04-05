`define _CTRL_V_

`ifdef _DEFINES_V_
`else
    `include "defines.v"
`endif

module ctrl(
    input [31:0] Instr,
    input equal, greater, less,
    output DMWr,
    output RFWr,
    output [3:0] ALUOp,
    output [3:0] HiLoOp,
    output [2:0] DMEXTOp,
    output [1:0] EXTOp,
    output [1:0] NPCOp,
    output [1:0] WRSel,
    output [1:0] WDSel,
    output BSel, ASel, ALUoutSel,
    output CmpWithZero,
    output CP0_Wr,
    output Undefined,
    output isCalc_R, isCalc_I, isLoad, isStore, isBranch, isJal, isJr, isHiLo, isEret, isMtc0, isMfc0, isCalc_Overflow, isJump
);

    wire    special, add, addu, sub, subu, sll, srl, sra, sllv, srlv, srav, slt, sltu,
            addi, addiu, andi, ori, xori, lui, slti, sltiu,
            and_logic, or_logic, xor_logic, nor_logic,
            lb, lbu, lh, lhu, lw,
            sb, sh, sw,
            beq, bne, blez, bltz, bgez, bgtz,
            j, jal, jr, jalr,
            mult, multu, div, divu, mfhi, mflo, mthi, mtlo,
            mfc0, mtc0, eret;
    wire [4:0] RTcode, RScode;
    wire [5:0] opcode, funct;
    assign RTcode = Instr[20:16];
    assign RScode = Instr[25:21];
    assign opcode = Instr[31:26];
    assign funct = Instr[5:0];
     

//---------------------------------R_CALC TYPE---------------------------------  
    assign special  =   (opcode == 6'b000_000) ? 1'b1 : 1'b0;
    assign add      =   special && (funct == 6'b100_000) ? 1'b1 : 1'b0;
    assign addu     =   special && (funct == 6'b100_001) ? 1'b1 : 1'b0;
    assign sub      =   special && (funct == 6'b100_010) ? 1'b1 : 1'b0;
    assign subu     =   special && (funct == 6'b100_011) ? 1'b1 : 1'b0;
    assign sll      =   special && (funct == 6'b000_000) ? 1'b1 : 1'b0;
    assign srl      =   special && (funct == 6'b000_010) ? 1'b1 : 1'b0;
    assign sra      =   special && (funct == 6'b000_011) ? 1'b1 : 1'b0;
    assign sllv     =   special && (funct == 6'b000_100) ? 1'b1 : 1'b0;
    assign srlv     =   special && (funct == 6'b000_110) ? 1'b1 : 1'b0;
    assign srav     =   special && (funct == 6'b000_111) ? 1'b1 : 1'b0;
    assign slt      =   special && (funct == 6'b101_010) ? 1'b1 : 1'b0;
    assign sltu     =   special && (funct == 6'b101_011) ? 1'b1 : 1'b0;

//---------------------------------I_CALC TYPE---------------------------------  
    assign addi     =   (opcode == 6'b001_000) ? 1'b1 : 1'b0;
    assign addiu    =   (opcode == 6'b001_001) ? 1'b1 : 1'b0;
    assign andi     =   (opcode == 6'b001_100) ? 1'b1 : 1'b0;
    assign ori      =   (opcode == 6'b001_101) ? 1'b1 : 1'b0;
    assign xori     =   (opcode == 6'b001_110) ? 1'b1 : 1'b0;
    assign lui      =   (opcode == 6'b001_111) ? 1'b1 : 1'b0;
    assign slti     =   (opcode == 6'b001_010) ? 1'b1 : 1'b0;
    assign sltiu    =   (opcode == 6'b001_011) ? 1'b1 : 1'b0;

//---------------------------------R_LOGIC TYPE---------------------------------  
    assign and_logic    =   special && (funct == 6'b100_100) ? 1'b1 : 1'b0;
    assign or_logic     =   special && (funct == 6'b100_101) ? 1'b1 : 1'b0;
    assign xor_logic    =   special && (funct == 6'b100_110) ? 1'b1 : 1'b0;
    assign nor_logic    =   special && (funct == 6'b100_111) ? 1'b1 : 1'b0;

//---------------------------------LOAD TYPE---------------------------------
    assign lb       =   (opcode == 6'b100_000) ? 1'b1 : 1'b0;
    assign lbu      =   (opcode == 6'b100_100) ? 1'b1 : 1'b0;
    assign lh       =   (opcode == 6'b100_001) ? 1'b1 : 1'b0;
    assign lhu      =   (opcode == 6'b100_101) ? 1'b1 : 1'b0;
    assign lw       =   (opcode == 6'b100_011) ? 1'b1 : 1'b0;

//---------------------------------STORE TYPE---------------------------------
    assign sb       =   (opcode == 6'b101_000) ? 1'b1 : 1'b0;
    assign sh       =   (opcode == 6'b101_001) ? 1'b1 : 1'b0;
    assign sw       =   (opcode == 6'b101_011) ? 1'b1 : 1'b0;

//---------------------------------BRANCH TYPE---------------------------------
    assign beq      =   (opcode == 6'b000_100) ? 1'b1 : 1'b0;
    assign bne      =   (opcode == 6'b000_101) ? 1'b1 : 1'b0;
    assign blez     =   (opcode == 6'b000_110) ? 1'b1 : 1'b0;
    assign bltz     =   (opcode == 6'b000_001 && RTcode == 5'b00000) ? 1'b1 : 1'b0;
    assign bgez     =   (opcode == 6'b000_001 && RTcode == 5'b00001) ? 1'b1 : 1'b0;
    assign bgtz     =   (opcode == 6'b000_111) ? 1'b1 : 1'b0;

//---------------------------------JUMP TYPE---------------------------------
    assign j        =   (opcode == 6'b000_010) ? 1'b1 : 1'b0;
    assign jal      =   (opcode == 6'b000_011) ? 1'b1 : 1'b0;
    assign jalr     =   special && (funct == 6'b001_001) ? 1'b1 : 1'b0;
    assign jr       =   special && (funct == 6'b001_000) ? 1'b1 : 1'b0;

//---------------------------------HI_LO TYPE---------------------------------
    assign mult     =   special && (funct == 6'b011_000) ? 1'b1 : 1'b0;
    assign multu    =   special && (funct == 6'b011_001) ? 1'b1 : 1'b0;
    assign div      =   special && (funct == 6'b011_010) ? 1'b1 : 1'b0;
    assign divu     =   special && (funct == 6'b011_011) ? 1'b1 : 1'b0;
    assign mfhi     =   special && (funct == 6'b010_000) ? 1'b1 : 1'b0;
    assign mflo     =   special && (funct == 6'b010_010) ? 1'b1 : 1'b0;
    assign mthi     =   special && (funct == 6'b010_001) ? 1'b1 : 1'b0;
    assign mtlo     =   special && (funct == 6'b010_011) ? 1'b1 : 1'b0;

//---------------------------------EXC TYPE---------------------------------
    assign eret     =   (Instr == 32'h4200_0018) ? 1'b1 : 1'b0;
    assign mfc0     =   (opcode == 6'b010_000 && RScode == 5'b00000) ? 1'b1 : 1'b0;
    assign mtc0     =   (opcode == 6'b010_000 && RScode == 5'b00100) ? 1'b1 : 1'b0;
    

    assign DMWr =   sb||sh||sw  ?   1'b1 :
                                    1'b0;

    assign DMEXTOp =    lb      ?   `LB_EXT     :
                        lbu     ?   `LBU_EXT    :
                        lh      ?   `LH_EXT     :
                        lhu     ?   `LHU_EXT    :
                        lw      ?   `LW_EXT     :
                                    `NOP_FOR_DM_EXT;
    
    assign RFWr =   add||addu||sub||subu||sll||srl||sra||sllv||srlv||srav||slt||sltu||
                    addi||addiu||andi||ori||xori||lui||slti||sltiu||
                    and_logic||or_logic||xor_logic||nor_logic||
                    lb||lbu||lh||lhu||lw||
                    jal||jalr||
                    mfhi||mflo||mfc0    ?   1'b1 : 1'b0;
    
    assign ALUOp    =   add||addi       ?   `ADD_EXE     :
                        addu||addiu     ?   `ADDU_EXE    :
                        sub             ?   `SUB_EXE     :
                        subu            ?   `SUBU_EXE    :
                        and_logic||andi ?   `AND_EXE     :
                        or_logic||ori   ?   `OR_EXE      :
                        xor_logic||xori ?   `XOR_EXE     :
                        nor_logic       ?   `NOR_EXE     :
                        sll||sllv       ?   `SLL_EXE     :
                        srl||srlv       ?   `SRL_EXE     :
                        sra||srav       ?   `SRA_EXE     :
                        slt||slti       ?   `SLT_EXE     :
                        sltu||sltiu     ?   `SLTU_EXE    :
                                            `ADDU_EXE;


    assign EXTOp    =   andi||ori||xori                         ?   2'b00 :
                        lb||lbu||lh||lhu||lw||sb||sh||sw||
                        addi||addiu||slti||sltiu                ?   2'b01 :
                        lui                                     ?   2'b10 :
                                                                    2'b00;
    
    assign NPCOp    =   (beq&&equal)    ||  (bne&&~equal)   ||
                        (bgtz&&greater) ||  (bltz&&less)    ||
                        (bgez&&~less)   ||  (blez&&~greater)    ?   2'b01 :
                        jal||j                                  ?   2'b10 :
                        jr||jalr                                ?   2'b11 :
                                                                    2'b00;
    
    assign WRSel    =   add||addu||sub||subu||sll||srl||sra||sllv||srlv||srav||slt||sltu||
                        and_logic||or_logic||xor_logic||nor_logic||
                        jalr||mfhi||mflo||mthi||mtlo||
                        mult||multu||div||divu                  ?   2'b01 :
                        jal                                     ?   2'b10 :
                                                                    2'b00;
    
    assign WDSel    =   lb||lbu||lh||lhu||lw    ?   2'b01 :
                        jal||jalr               ?   2'b10 :
                        mfc0                    ?   2'b11 :
                                                    2'b00;

    assign ASel     =   sll||srl||sra           ?   1'b1 :
                                                    1'b0;
    
    assign BSel     =   andi||ori||xori||
                        lb||lbu||lh||lhu||lw||sb||sh||sw||
                        addi||addiu||slti||sltiu||lui       ?   1'b1 :
                                                                1'b0;
    
    assign ALUoutSel    =   mfhi || mflo    ?   1'b1    :
                                                1'b0;

    assign CmpWithZero  =   bgez||bgtz||blez||bltz          ?   1'b1    :
                                                                1'b0;

    assign HiLoOp       =   mult    ?   `MULT_OP    :
                            multu   ?   `MULTU_OP   :
                            div     ?   `DIV_OP     :
                            divu    ?   `DIVU_OP    :
                            mfhi    ?   `MFHI_OP    :
                            mflo    ?   `MFLO_OP    :
                            mthi    ?   `MTHI_OP    :
                            mtlo    ?   `MTLO_OP    :
                                        `NOP_FOR_HI_LO;


    assign isCalc_R =   add|addu|sub|subu|sll|srl|sra|sllv|srlv|srav|slt|sltu|
                        and_logic|or_logic|xor_logic|nor_logic|
                        mult|multu|div|divu|mfhi|mflo|mthi|mtlo;
    assign isCalc_I = addi|addiu|andi|ori|xori|lui|slti|sltiu;
    assign isLoad = lb | lbu | lh | lhu | lw;
    assign isStore = sb | sh | sw;
    assign isBranch = beq|bne|blez|bltz|bgez|bgtz;
    assign isJal = jal | jalr;
    assign isJr = jr | jalr;
    assign isHiLo = mult|multu|div|divu|mfhi|mflo|mthi|mtlo;
    assign isEret = eret;
    assign isMtc0 = mtc0;
    assign isMfc0 = mfc0;
    assign isCalc_Overflow = add | addi | sub;
    assign isJump = beq|bne|blez|bltz|bgez|bgtz|j|jal|jr|jalr;
    assign CP0_Wr = mtc0;
    assign Undefined = ~(add|addu|sub|subu|sll|srl|sra|sllv|srlv|srav|slt|sltu|
            addi|addiu|andi|ori|xori|lui|slti|sltiu|
            and_logic|or_logic|xor_logic|nor_logic|
            lb|lbu|lh|lhu|lw|
            sb|sh|sw|
            beq|bne|blez|bltz|bgez|bgtz|
            j|jal|jr|jalr|
            mult|multu|div|divu|mfhi|mflo|mthi|mtlo|
            mfc0|mtc0|eret);

endmodule