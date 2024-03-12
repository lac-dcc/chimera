`include "marco.h"
`include "opcode.h"

module mips(Clk, Rst);

    input Clk ; // clock 
    input Rst ; // reset

    /**
     * IF 
     */

    wire [`i32] pc  ;
    wire [`i32] npc ;
    wire [`i32] IR  ;
    wire [`i32] ADD4;

    wire [`i32]  IR_D;
    wire [`i32] PC4_D;
    wire [`i32]  IR_E;
    wire [`i32] PC4_E;
    wire [`i32]  RS_E;
    wire [`i32]  RT_E;
    wire [`i32] EXT_E;

    wire [`i32] SA;
    
    wire [`i32]  IR_M;
    wire [`i32] PC4_M;
    wire [`i32]  AO_M;
    wire [`i32]  RT_M; 
    wire [`i32]  IR_W;
    wire [`i32] PC4_W;
    wire [`i32]  AO_W;
    wire [`i32]  DR_W;

    assign PCWe = !(STALLCTRL.stall);

    PC PC(
        .Clk(Clk),
        .Rst(Rst),
        .We(PCWe),//PC.en = !stall
        .NPC(PCMUX.Q),
        .PC(pc)
    );
    
    assign ADD4 = pc + 4; 

    IM IM(pc[15:0],IR);

    MUX4 PCMUX(
        .in_0(ADD4),
        .in_1(npc),
        .in_2(MFRSD.Q),
        .A(IDCTRL.PCSel)
    );

    MUX #(64) FLUSHMUX(
        .in_0({IR,ADD4}),
        .in_1(64'b0),
        .A(IDCTRL.Flush)
    );
    
    /**
     * ID 
     */

    ForwardCTRL ForwardCTRL(
        .IR_D(IR_D),
        .IR_E(IR_E),
        .IR_M(IR_M),
        .IR_W(IR_W)
    );
    STALLCTRL STALLCTRL(
        .IR_D(IR_D),
        .IR_E(IR_E),
        .IR_M(IR_M)
    ); 

    assign IF_ID_We = !STALLCTRL.stall && IDCTRL.PCSel == 0;// cancel branch delay slot
    PLR #(64) IF_ID(
        .Clk(Clk),
        .Rst(Rst),
        .We(!STALLCTRL.stall),//IR@D.en = !stall
        .d(FLUSHMUX.Q),
        .q({
            IR_D,
            PC4_D
        })
    );

    MUX8 MFRSD(
        .in_0(RF.RD1),
        .in_1(PC4_E),
        .in_2(AO_M),
        .in_3(PC4_M),
        .in_4(WDMUX.Q),
        .A(ForwardCTRL.RSD)
    );

    MUX8 MFRTD(
        .in_0(RF.RD2),
        .in_1(PC4_E),
        .in_2(AO_M),
        .in_3(PC4_M),
        .in_4(WDMUX.Q),
        .A(ForwardCTRL.RTD)
    );


    RF RF(
        .Clk(Clk),
        .We(WBCTRL.RFWe),
        .A1(IR_D[`rs]),
        .A2(IR_D[`rt]),
        .A3(A3MUX.Q),
        .WD(WDMUX.Q)
    );

    CMP CMP(
        .D1(MFRSD.Q),
        .D2(MFRTD.Q),
        .Op(IDCTRL.CMPOp)
    );

    NPC NPC(
        .PC4(PC4_D),
        .i26(IR_D[`i26]),
        .Op(IDCTRL.NPCOp), 
        .npc(npc)
    );

    EXT EXT(
        .Op(IDCTRL.EXTOp),
        .in(IR_D[`i16])
    );

    //zero_extend
    zero_extend #(5,32) SA_EXT(.in(IR_D[`sa]));
    assign SA =  SA_EXT.out;//{{27{1'b0}},IR_D[`sa]} ;


    MUX RS_EMUX(
        .in_0(MFRSD.Q),
        .in_1(SA),
        .A(IDCTRL.RS_ESel)
    );
    IDCTRL IDCTRL(.IR(IR_D),.CMPOut(CMP.Q));
    
    /**
     * EX
     */

    assign  ID_EX_Rst = Rst || STALLCTRL.stall;
    PLR #(160) ID_EX(
        .Clk(Clk),
        .Rst(ID_EX_Rst),
        .We(1),
        .d({
            IR_D,
            PC4_D,
            RS_EMUX.Q,
            MFRTD.Q,
            EXT.out
        }),
        .q({
            IR_E,
            PC4_E,
            RS_E,
            RT_E,
            EXT_E
        })
    );

    MUX4 MFRSE(
        .in_0(RS_E),
        .in_1(AO_M),
        .in_2(PC4_M),
        .in_3(WDMUX.Q),
        .A(ForwardCTRL.RSE)
    );

    MUX4 MFRTE(
        .in_0(RT_E),
        .in_1(AO_M),
        .in_2(PC4_M),
        .in_3(WDMUX.Q),
        .A(ForwardCTRL.RTE)
    );

    MUX ALUBMUX(
        .in_0(EXT_E),
        .in_1(MFRTE.Q),
        .A(EXCTRL.ALUBSel)
    );

    ALU ALU(
        .A(MFRSE.Q),
        .B(ALUBMUX.Q),
        .Op(EXCTRL.ALUOp)
    );
    MULTIPLIER MULTIPLIER(
        .A(MFRSE.Q),
        .B(MFRTE.Q),
        .Op(EXCTRL.MULOp)
    );
    MUX4 AO_MMUX(
        .in_0(ALU.C),
        .in_1(MULTIPLIER.HI),
        .in_2(MULTIPLIER.LO),
        .A(EXCTRL.AOSel)
    );

    EXCTRL EXCTRL(.IR(IR_E));

    /**
     * MEM 
     */

    PLR #(128) EX_MEM(
        .Clk(Clk),
        .Rst(Rst),
        .We(1),
        .d({
            IR_E,
            PC4_E,
            AO_MMUX.Q,
            MFRTE.Q
        }),
        .q({
            IR_M,
            PC4_M,
            AO_M,
            RT_M
        })
    );

    MUX MFRTM(
        .in_0(RT_M),
        .in_1(WDMUX.Q),
        .A(ForwardCTRL.RTM)
    );
    MEMCTRL MEMCTRL(.IR(IR_M));
    DM DM(
        .Clk(Clk),
        .A(AO_M[11:0]),// byte address
        .WD(MFRTM.Q),
        .We(MEMCTRL.DMWe),
        .BE(MEMCTRL.BE)
    );


    /**
     * WB 
     */


    PLR #(128) MEM_WB(
        .Clk(Clk),
        .Rst(Rst),
        .We(1),
        .d({
            IR_M,
            PC4_M,
            AO_M,
            DM.RD
        }),
        .q({
            IR_W,
            PC4_W,
            AO_W,
            DR_W
        })
    );

    WBCTRL WBCTRL(.IR(IR_W));

    LDEXT LDEXT(
        .DR(DR_W),
        .Op(WBCTRL.LDEXTOp),
        .BE(WBCTRL.LDEXTBE)
    );
    MUX4 #(5) A3MUX(
        .in_0(IR_W[`rt]),
        .in_1(IR_W[`rd]),
        .in_2(5'b11111),
        .A(WBCTRL.A3Sel)
    );

    MUX4 WDMUX(
        .in_0(LDEXT.out),
        .in_1(AO_W),
        .in_2(PC4_W),
        .A(WBCTRL.WDSel)
    );
endmodule
