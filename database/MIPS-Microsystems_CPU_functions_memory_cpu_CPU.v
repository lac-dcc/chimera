// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

module CPU(clk,reset,clk_ip,Pr_IP,Pr_RD,CPU_We,CPU_ADDR,CPU_WD,CPU_PC,t3);
//input
    input clk;
    input reset;
	input clk_ip;

    input [15:10] Pr_IP;
    input [31:0] Pr_RD;

//output
    output CPU_We;              //whether to modify peripheral devices

    output [31:0] CPU_ADDR;     //memory address to access 
    output [31:0] CPU_WD;       //word to write into memory
    output [31:0] CPU_PC;       //current PC
    output [31:0] t3;

    assign CPU_We=DMWe_M&&(!IRQ);

    assign CPU_ADDR=AO_M;       //not |4
    assign CPU_WD=RT_M;
    assign CPU_PC=PC;

//--------------------sub_modules--------------------//
//----------signals----------//
//ctrl signals
//Op
    wire [31:0] NPCOp_D,EXTOp_D,ALUOp_D,MDOp_D;
    wire [31:0] NPCOp_E,EXTOp_E,ALUOp_E,MDOp_E;
    wire [31:0] NPCOp_M,EXTOp_M,ALUOp_M,MDOp_M;
    wire [31:0] NPCOp_W,EXTOp_W,ALUOp_W,MDOp_W;
	
//Sel
    wire [31:0] ALU_B_Sel_D,RF_A3_Sel_D,RF_WD_Sel_D,PC_Sel_D;
    wire [31:0] ALU_B_Sel_E,RF_A3_Sel_E,RF_WD_Sel_E,PC_Sel_E;
    wire [31:0] ALU_B_Sel_M,RF_A3_Sel_M,RF_WD_Sel_M,PC_Sel_M;
    wire [31:0] ALU_B_Sel_W,RF_A3_Sel_W,RF_WD_Sel_W,PC_Sel_W;

    wire [31:0] RS_D_Sel;
    wire [31:0] RT_D_Sel;
    wire [31:0] RS_E_Sel;
    wire [31:0] RT_E_Sel;
	wire [31:0] RS_M_Sel;
    wire [31:0] RT_M_Sel;

    wire [31:0] RD_RAW_Sel_M;
	
//Judge
    wire stall,Ready_E;                         //stall
    wire equ,zero_greater,zero_equ,zero_less;   //cmp
    wire Busy,Start_E;                          //md
    wire IRQ,undef_D,CP0We_M,EXL_Clr_M,branch_W;//INT&EXC
    wire Start_M,branch_D;
	wire lwr_W,mfc0_M,eret_M;                   //special ins signals
    wire overflow,flow_sus_E;                   //overflow

    wire RFWe_D,DMWe_D,load_D,both_D,single_D,md_D,byte_op_D,half_op_D,unsigned_op_D;
    wire RFWe_E,DMWe_E,load_E,both_E,single_E,md_E,byte_op_E,half_op_E,unsigned_op_E;
    wire RFWe_M,DMWe_M,load_M,both_M,single_M,md_M,byte_op_M,half_op_M,unsigned_op_M;
    wire RFWe_W,DMWe_W,load_W,both_W,single_W,md_W,byte_op_W,half_op_W,unsigned_op_W;

//data signals
//instruction
    wire [31:0] Ins,Ins_D,Ins_E,Ins_M,Ins_W;

//forward data
    wire [31:0] RS_D,RS_E,RS_M;
    wire [31:0] RT_D,RT_E,RT_M;

//original data
//IF
    wire [31:0] RD1,RD2;
    wire [31:0] Ext,PC8;
    wire [6:2] ExcCode_IF;

//ID
    wire [31:0] PC,PC4,NPC,NextPC;
    wire [6:2] ExcCode_ID;

//EXE	
    wire [31:0] B,RST;
    wire [1:0] byte_addr;
    wire [31:0] HI,LO;
    wire [6:2] ExcCode_EXE;

//MEM
    wire [31:0] RD,RD_RAW;
    wire [31:0] CP0_RD;
    wire [31:0] EPC;
    wire [6:2] ExcCode_MEM;

//write data
    wire [4:0] A3_E,A3_M,A3_W;
    wire [31:0] RF_WD_E,RF_WD_M,RF_WD_W;

//pip data
//D
    wire [31:0] PC_D;
    wire [6:2] ExcCode_D;
    wire BD_D;
    
//E
    wire [31:0] V1_E,V2_E,Ext_E,PC_E,PC8_E;
    wire [6:2] ExcCode_E;
    wire BD_E;
    
//M
    wire [31:0] V1_M,V2_M,AO_M,PC_M,PC8_M,HI_M,LO_M;
    wire [1:0] byte_addr_M;
    wire [6:2] ExcCode_M;
    wire BD_M;
    
//W
    wire [31:0] V1_W,V2_W,AO_W,RD_RAW_W,RD_W,CP0_RD_W,PC_W,PC8_W,HI_W,LO_W;
	wire [1:0] byte_addr_W;

//----------datapath----------//
//----------IF----------//
   
    ADD4 add4(.PC(PC),.PC4(PC4));
    
    IM im(.clk(clk_ip),.PC(PC),.Ins(Ins));

    PC pc(.clk(clk),.reset(reset),.stall(stall),.IRQ(IRQ),.eret_M(eret_M),.NPC(NextPC),.PC(PC));

    IF_EXC if_exc(.PC(PC),.ExcCode(ExcCode_IF));

//----------PIP_D----------//

    DReg dreg(
        .clk(clk),.reset(reset||IRQ||eret_M),.stall(stall),.branch(branch_D),
        .Ins(Ins),.PC(PC),
        .ExcCode(ExcCode_IF),
        .Ins_D(Ins_D),.PC_D(PC_D),
        .ExcCode_D(ExcCode_D),.BD_D(BD_D)
    );

//----------ID----------//
    
    CMP cmp(
        .D1(RS_D),.D2(RT_D),
        .equ(equ),
        .zero_greater(zero_greater),.zero_equ(zero_equ),.zero_less(zero_less)
    );

    EXT ext(.EXTOp(EXTOp_D),.Ins(Ins_D),.Ext(Ext));

    NPC npc(
        .NPCOp(NPCOp_D),
        .Ins(Ins_D),
        .PC(PC_D),.RS(RS_D),
        .equ(equ),
        .zero_greater(zero_greater),.zero_equ(zero_equ),.zero_less(zero_less),
        .NPC(NPC),.PC8(PC8)
    );

    RF rf(
        .clk(clk),.reset(reset),
        .RFWe(RFWe_W),
        .Ins(Ins_D),
        .A3(A3_W),.RF_WD(RF_WD_W),.WPC(PC_W),
        .RD1(RD1),.RD2(RD2),
        .t3(t3)
    );

    ID_EXC id_exc(.undef_D(undef_D),.ExcCode_D(ExcCode_D),.ExcCode(ExcCode_ID));

//----------PIP_E----------//

    EReg ereg(
        .clk(clk),.reset(reset||IRQ||eret_M),.stall(stall),
        .Ins(Ins_D),
        .V1(RS_D),.V2(RT_D),.Ext(Ext),
        .PC(PC_D),.PC8(PC8),
        .ExcCode(ExcCode_ID),.BD(BD_D),
        .Ins_E(Ins_E),.V1_E(V1_E),.V2_E(V2_E),.Ext_E(Ext_E),
        .PC_E(PC_E),.PC8_E(PC8_E),
        .ExcCode_E(ExcCode_E),.BD_E(BD_E)
    );

//----------EXE----------//

    ALU alu(
        .ALUOp(ALUOp_E),
        .Ins(Ins_E),
        .A(RS_E),.B(B),
        .RST(RST),
        .byte_addr(byte_addr),
        .overflow(overflow)
    );

    MD md(
        .clk(clk),.reset(reset),
        .MDOp(MDOp_E),
        .Start(Start_E),  //avoid rollback
		.IRQ(IRQ),
		.eret(eret_M),
        .A(RS_E),.B(RT_E),
        .Busy(Busy),
        .HI(HI),.LO(LO)
    );

    EXE_EXC exe_exc(.overflow(overflow),.flow_sus(flow_sus_E),.ExcCode_E(ExcCode_E),.ExcCode(ExcCode_EXE));

//----------PIP_M----------//

    MReg mreg(
        .clk(clk),.reset(reset||IRQ||eret_M),
        .Ins(Ins_E),
        .V1(RS_E),.V2(RT_E),.AO(RST),.byte_addr(byte_addr),.HI(HI),.LO(LO),
        .PC(PC_E),.PC8(PC8_E),
        .ExcCode(ExcCode_EXE),.BD(BD_E),
        .Ins_M(Ins_M),
        .V1_M(V1_M),.V2_M(V2_M),.AO_M(AO_M),.byte_addr_M(byte_addr_M),.HI_M(HI_M),.LO_M(LO_M),
        .PC_M(PC_M),.PC8_M(PC8_M),
        .ExcCode_M(ExcCode_M),.BD_M(BD_M)
    );

//----------MEM----------//

    DM dm(
        .clk(clk_ip),.reset(reset),
        .DMWe(DMWe_M&&(!IRQ)),
        .ADDR(AO_M),.DM_WD(RT_M),.WPC(PC_M),
        .byte_op(byte_op_M),.half_op(half_op_M),
        .byte_addr(byte_addr_M),
        .RD(RD)
    );

    CP0 cp0(
        .clk(clk),.reset(reset),
        .CP0We(CP0We_M),
        .EXL_Clr(EXL_Clr_M),
        .IP(Pr_IP),
        .ExcCode(ExcCode_MEM),.BD(BD_M),.Start(Start_M),
        .CP0_A1(Ins_M[15:11]),.CP0_A3(Ins_M[15:11]),.CP0_WD(RT_M),
        .PC_RAW(PC_M),
        .IRQ(IRQ),
        .CP0_RD(CP0_RD),.CP0_EPC(EPC)
    );

    MEM_EXC mem_exc(
        .load(load_M),.DMWe(DMWe_M),.mfc0(mfc0_M),
        .byte_op(byte_op_M),.half_op(half_op_M),
        .AO(AO_M),
        .ExcCode_M(ExcCode_M),
        .ExcCode(ExcCode_MEM)
	);

//----------PIP_W----------//

    WReg wreg(
        .clk(clk),.reset(reset||IRQ||eret_M),
        .Ins(Ins_M),.V1(RS_M),.V2(RT_M),.AO(AO_M),.byte_addr(byte_addr_M),.RD(RD_RAW),.HI(HI_M),.LO(LO_M),
        .PC(PC_M),.PC8(PC8_M),
        .CP0_RD(CP0_RD),
        .Ins_W(Ins_W),.V1_W(V1_W),.V2_W(V2_W),.AO_W(AO_W),.byte_addr_W(byte_addr_W),.RD_W(RD_RAW_W),.HI_W(HI_W),.LO_W(LO_W),
        .PC_W(PC_W),.PC8_W(PC8_W),
        .CP0_RD_W(CP0_RD_W)
    );

//----------WB----------//
//see RF in IF
    RDP rdp(
        .byte_op(byte_op_W),.half_op(half_op_W),.unsigned_op(unsigned_op_W),
        .lwr(lwr_W),
		.byte_addr(byte_addr_W),
        .RD_RAW(RD_RAW_W),
        .V2(V2_W),
		.RD(RD_W)
    );

//----------normal_MUX----------//

    MUX_PC mux_pc(.PC_Sel_D(PC_Sel_D),.PC_Sel_M(PC_Sel_M),.ADD4(PC4),.NPC(NPC),.EPC(EPC),.NextPC(NextPC));
    MUX_ALU_B mux_alu_b(.ALU_B_Sel(ALU_B_Sel_E),.RT(RT_E),.Ext(Ext_E),.B(B));
    MUX_RD_RAW mux_rd_raw(.RD_RAW_Sel(RD_RAW_Sel_M),.DM_RD(RD),.Pr_RD(Pr_RD),.RD_RAW(RD_RAW));

//E Decode
    MUX_RF_A3 mux_rf_a3_E(.RF_A3_Sel(RF_A3_Sel_E),.Ins(Ins_E),.A3(A3_E));
    MUX_RF_WD mux_rf_wd_E(.RF_WD_Sel(RF_WD_Sel_E),.AO(),.RD(),.PC8(PC8_E),.HI(),.LO(),.CP0_RD(),.RF_WD(RF_WD_E));

//M Decode
    MUX_RF_A3 mux_rf_a3_M(.RF_A3_Sel(RF_A3_Sel_M),.Ins(Ins_M),.A3(A3_M));
    MUX_RF_WD mux_rf_wd_M(.RF_WD_Sel(RF_WD_Sel_M),.AO(AO_M),.RD(),.PC8(PC8_M),.HI(HI_M),.LO(LO_M),.CP0_RD(),.RF_WD(RF_WD_M));

//W Decode
    MUX_RF_A3 mux_rf_a3_W(.RF_A3_Sel(RF_A3_Sel_W),.Ins(Ins_W),.A3(A3_W));
    MUX_RF_WD mux_rf_wd_W(.RF_WD_Sel(RF_WD_Sel_W),.AO(AO_W),.RD(RD_W),.PC8(PC8_W),.HI(HI_W),.LO(LO_W),.CP0_RD(CP0_RD_W),.RF_WD(RF_WD_W));

//----------forward_MUX----------//
//RS_D
    RS_D_MUX rs_d_mux(
        .RS_D_Sel(RS_D_Sel),
        .RD1(RD1),.RF_WD_E(RF_WD_E),.RF_WD_M(RF_WD_M),.RF_WD_W(RF_WD_W),
        .RS_D(RS_D)
    );

//RT_D
    RT_D_MUX rt_d_mux(
        .RT_D_Sel(RT_D_Sel),
        .RD2(RD2),.RF_WD_E(RF_WD_E),.RF_WD_M(RF_WD_M),.RF_WD_W(RF_WD_W),
        .RT_D(RT_D)
    );

//RS_E
    RS_E_MUX rs_e_mux(
        .RS_E_Sel(RS_E_Sel),
        .V1_E(V1_E),.RF_WD_M(RF_WD_M),.RF_WD_W(RF_WD_W),
        .RS_E(RS_E)
    );

//RT_E
    RT_E_MUX rt_e_mux(
        .RT_E_Sel(RT_E_Sel),
        .V2_E(V2_E),.RF_WD_M(RF_WD_M),.RF_WD_W(RF_WD_W),
        .RT_E(RT_E)
    );

//RS_M
	RS_M_MUX rs_m_mux(
        .RS_M_Sel(RS_M_Sel),
        .V1_M(V1_M),.RF_WD_W(RF_WD_W),
        .RS_M(RS_M)
    );

//RT_M
    RT_M_MUX rt_m_mux(
        .RT_M_Sel(RT_M_Sel),
        .V2_M(V2_M),.RF_WD_W(RF_WD_W),
        .RT_M(RT_M)
    );

//----------CTRL----------//

    MAIN_CTRL main_ctrl_D(
        .Ins(Ins_D),
		.RD1(RS_D),.RD2(RT_D),
        .AO(),
        .NPCOp(NPCOp_D),.EXTOp(EXTOp_D),.ALUOp(ALUOp_D),.MDOp(MDOp_D),
        .RF_A3_Sel(RF_A3_Sel_D),.RF_WD_Sel(RF_WD_Sel_D),.ALU_B_Sel(ALU_B_Sel_D),.PC_Sel(PC_Sel_D),.RD_RAW_Sel(),
        .RFWe(RFWe_D),.DMWe(DMWe_D),.CP0We(),
        .load(load_D),.both(both_D),.single(single_D),
        .Ready_E(),
        .byte_op(byte_op_D),.half_op(half_op_D),
		.unsigned_op(unsigned_op_D),
        .Start(),.md(md_D),
		.lwr(),.mfc0(),.eret(),
        .undef(undef_D),.branch(branch_D),.flow_sus(),.EXL_Clr()
    );

    MAIN_CTRL main_ctrl_E(
        .Ins(Ins_E),
		.RD1(RS_E),.RD2(RT_E),
        .AO(),
        .NPCOp(NPCOp_E),.EXTOp(EXTOp_E),.ALUOp(ALUOp_E),.MDOp(MDOp_E),
        .RF_A3_Sel(RF_A3_Sel_E),.RF_WD_Sel(RF_WD_Sel_E),.ALU_B_Sel(ALU_B_Sel_E),.PC_Sel(PC_Sel_E),.RD_RAW_Sel(),
        .RFWe(RFWe_E),.DMWe(DMWe_E),.CP0We(),
        .load(load_E),.both(both_E),.single(single_E),
        .Ready_E(Ready_E),
        .byte_op(byte_op_E),.half_op(half_op_E),
		.unsigned_op(unsigned_op_E),
        .Start(Start_E),.md(md_E),
		.lwr(),.mfc0(),.eret(),
        .undef(),.branch(),.flow_sus(flow_sus_E),.EXL_Clr()
    );

    MAIN_CTRL main_ctrl_M(
        .Ins(Ins_M),
		.RD1(RS_M),.RD2(RT_M),
        .AO(AO_M),
        .NPCOp(NPCOp_M),.EXTOp(EXTOp_M),.ALUOp(ALUOp_M),.MDOp(MDOp_M),
        .RF_A3_Sel(RF_A3_Sel_M),.RF_WD_Sel(RF_WD_Sel_M),.ALU_B_Sel(ALU_B_Sel_M),.PC_Sel(PC_Sel_M),.RD_RAW_Sel(RD_RAW_Sel_M),
        .RFWe(RFWe_M),.DMWe(DMWe_M),.CP0We(CP0We_M),
        .load(load_M),.both(both_M),.single(single_M),
        .Ready_E(),
        .byte_op(byte_op_M),.half_op(half_op_M),
		.unsigned_op(unsigned_op_M),
        .Start(),.md(md_M),
		.lwr(),.mfc0(mfc0_M),.eret(eret_M),
        .undef(),.branch(),.flow_sus(),.EXL_Clr(EXL_Clr_M)
    );

    MAIN_CTRL main_ctrl_W(
        .Ins(Ins_W),
		.RD1(V1_W),.RD2(V2_W),
        .AO(),
        .NPCOp(NPCOp_W),.EXTOp(EXTOp_W),.ALUOp(ALUOp_W),.MDOp(MDOp_W),
        .RF_A3_Sel(RF_A3_Sel_W),.RF_WD_Sel(RF_WD_Sel_W),.ALU_B_Sel(ALU_B_Sel_W),.PC_Sel(PC_Sel_W),.RD_RAW_Sel(),
        .RFWe(RFWe_W),.DMWe(DMWe_W),.CP0We(),
        .load(load_W),.both(both_W),.single(single_W),
        .Ready_E(),
        .byte_op(byte_op_W),.half_op(half_op_W),
		.unsigned_op(unsigned_op_W),
        .Start(),.md(md_W),
		.lwr(lwr_W),.mfc0(),.eret(),
        .undef(),.branch(branch_W),.flow_sus(),.EXL_Clr()
    );

    HARZARD_CTRL harzard_ctrl(
        .A1_D(Ins_D[25:21]),.A2_D(Ins_D[20:16]),.ALU_B_Sel_D(ALU_B_Sel_D),.both_D(both_D),.single_D(single_D),.md_D(md_D),
        .A1_E(Ins_E[25:21]),.A2_E(Ins_E[20:16]),.A3_E(A3_E),.RFWe_E(RFWe_E),.Ready_E(Ready_E),.load_E(load_E),.Start(Start_E),.Busy(Busy),
        .A1_M(Ins_M[25:21]),.A2_M(Ins_M[20:16]),.A3_M(A3_M),.RFWe_M(RFWe_M),.load_M(load_M),
        .A3_W(A3_W),.RFWe_W(RFWe_W),
        .RS_D_Sel(RS_D_Sel),.RT_D_Sel(RT_D_Sel),.RS_E_Sel(RS_E_Sel),.RT_E_Sel(RT_E_Sel),.RS_M_Sel(RS_M_Sel),.RT_M_Sel(RT_M_Sel),
        .stall(stall)
    );

endmodule
