// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module CPU(clk, DataBusInA, DataBusInB,DataBusOut,AddressBusA, AddressBusB, ContralBus, init);
    input clk,init;
    input [31:0] DataBusInA, DataBusInB;
    output [31:0] DataBusOut;
    output [31:0] AddressBusA, AddressBusB;
    output [3:0] ContralBus;



    //IF
    wire ZF_EXE, SF_EXE;
    wire J_DEC,Jal_WB,Jr_DEC;
    wire BEQ_EXE, BGTZ_EXE, BGEZ_EXE, BNE_EXE, BLEZ_EXE;
    wire [15:0] imm_EXE;
    wire [25:0] target_J_DEC, target_Jal_WB;
    wire [31:0] REG_ADDRESS_DEC;

    reg pc_enable=1;


    //module IF(J, Jal, Jr,  BEQ, BGTZ, BGEZ, BNE, BLEZ, ZF, SF, clk, init,enable,imm, target_J, target_Jal, REG_ADDRESS, AddressBusA);
    IF If(.J(J_DEC), .Jal(Jal_WB), .Jr(Jr_DEC), .BEQ(BEQ_EXE), .BGTZ(BGTZ_EXE), .BGEZ(BGEZ_EXE), .BNE(BNE_EXE), .BLEZ(BLEZ_EXE), .ZF(ZF_EXE), .SF(SF_EXE), .clk(clk), .init(init), 
    .enable(pc_enable), .imm(imm_EXE), .target_J(target_J_DEC), .target_Jal(target_Jal_WB), .REG_ADDRESS(REG_ADDRESS_DEC), .AddressBusA(AddressBusA));

    // instruction 
    reg [31:0] IF_ID = 32'b0;

    reg IF_ID_enable=1;

    always @(negedge clk)
    begin
        #2;
        IF_ID <= IF_ID_enable?DataBusInA:IF_ID;
    end

   


    //ID
    reg [185:0] ID_EX = 186'b0 ;
    reg ID_EX_CLEAR=0; //同步清零
    

    //module Decoder(istruction, op, rs, rt, rd, shamt, funct, imm, addr);
    wire [5:0] op_DEC;
    wire [4:0] rs_DEC;
    wire [4:0] rt_DEC;
    wire [4:0] rd_DEC;
    wire [31:0] shamt_DEC; //0扩展->32位
    wire [5:0] func_DEC;
    wire [15:0] imm_DEC;
    Decoder decoder(.istruction(IF_ID), .op(op_DEC), .rs(rs_DEC), .rt(rt_DEC), .rd(rd_DEC), .shamt(shamt_DEC), .func(func_DEC), .imm(imm_DEC), .addr(target_J_DEC));

    //module CU(op, func, RegWrite,MemWrite,BEQ,BGTZ,BGEZ,BNE,BLEZ,J,Jal,Jr,Memrhalf,Memrbyte,MemExt,Rtype,RegDst_2b,ALUsrcB_2b, ImmExt_2b, RegWriteDataMUX_2b,ALUop_4b);
    //already J_DEC Jr_DEC
    wire RegWrite_DEC,MemWrite_DEC,BEQ_DEC,BGTZ_DEC,BGEZ_DEC,BNE_DEC,BLEZ_DEC,Jal_DEC,Memrhalf_DEC,Memrbyte_DEC,MemExt_DEC,Rtype_DEC;
    wire [1:0] RegDst_2b_DEC,ALUsrcB_2b_DEC, ImmExt_2b_DEC, CU_RegWriteDataMUX_2b_DEC;
    wire [3:0] CU_ALUop_4b_DEC;
    CU cu(.op(op_DEC), .func(func_DEC), .RegWrite(RegWrite_DEC),.MemWrite(MemWrite_DEC),.BEQ(BEQ_DEC),.BGTZ(BGTZ_DEC),.BGEZ(BGEZ_DEC),.BNE(BNE_DEC),.BLEZ(BLEZ_DEC),.J(J_DEC),.Jal(Jal_DEC),.Jr(Jr_DEC),.Memrhalf(Memrhalf_DEC),.Memrbyte(Memrbyte_DEC),.MemExt(MemExt_DEC),.Rtype(Rtype_DEC),.RegDst_2b(RegDst_2b_DEC),.ALUsrcB_2b(ALUsrcB_2b_DEC), .ImmExt_2b(ImmExt_2b_DEC), .RegWriteDataMUX_2b(CU_RegWriteDataMUX_2b_DEC),.ALUop_4b(CU_ALUop_4b_DEC));


    //module ALUContral(func, ALUop, ALUsrcA);
    wire [3:0] ALUC_ALUop_DEC;
    wire ALUC_ALUsrcA_DEC;
    wire [1:0] alu_RegWriteDataMUX_2b_DEC;
    ALUContral alu_contral(.func(func_DEC), .ALUop(ALUC_ALUop_DEC), .ALUsrcA(ALUC_ALUsrcA_DEC), .RegWriteDataMUX_2b(alu_RegWriteDataMUX_2b_DEC));

    wire [1:0] RegWriteDataMUX_2b_DEC;

    MUX2_2B mux2_2b_1(.A(CU_RegWriteDataMUX_2b_DEC),.B(alu_RegWriteDataMUX_2b_DEC),.S(Rtype_DEC),.Y(RegWriteDataMUX_2b_DEC));
    

    //MUX ALUc多路选择
    wire [3:0] ALUop_DEC;
    MUX2_4B mux2_4b_1(.A(CU_ALUop_4b_DEC),.B(ALUC_ALUop_DEC),.S(Rtype_DEC),.Y(ALUop_DEC));

    //RF 只要qa_b qb_b ； rw_w rd_w we_w是wb段的
    //module RF(ra,rb,rd,rw,we,qa,qb,clk,reset)
    wire [31:0] rf_qa_DEC, rf_qb_DEC;
    wire [4:0] rw_WB;
    wire [31:0] rf_rd_WB;
    reg RegWrite_WB=0;
    RF rf(.ra(rs_DEC), .rb(rt_DEC), .rd(rf_rd_WB), .rw(rw_WB), .we(RegWrite_WB), .qa(rf_qa_DEC), .qb(rf_qb_DEC), .clk(clk), .reset(init));

    assign REG_ADDRESS_DEC = rf_qa_DEC; //jr
    always @(negedge clk)
    begin
        #2;
        //                                   185     184:180 179:175 174:170   169:138   137:132   131:116     115:90        89           88         87       86      85      84       83      82    81      80       79            78          77        76        75:74          73:72           71:70               69:68           67:64     63:32      31:0                 
        ID_EX <= ID_EX_CLEAR?186'b0:{ALUC_ALUsrcA_DEC,rs_DEC, rt_DEC, rd_DEC, shamt_DEC, func_DEC, imm_DEC, target_J_DEC, RegWrite_DEC,MemWrite_DEC,BEQ_DEC,BGTZ_DEC,BGEZ_DEC,BNE_DEC,BLEZ_DEC,J_DEC,Jal_DEC,Jr_DEC,Memrhalf_DEC,Memrbyte_DEC,MemExt_DEC,Rtype_DEC,RegDst_2b_DEC,ALUsrcB_2b_DEC, ImmExt_2b_DEC, RegWriteDataMUX_2b_DEC,ALUop_DEC,rf_qa_DEC,rf_qb_DEC};
    end


    //EXE
    reg [218:0] EX_MEM=219'b0; 

    //MUX ALUsrcA多路选择 只有r型才会有shamt
    wire ALUsrcA_EXE;
    //                           ALUC_ALUsrcA     rtype 
    MUX2_1B mux2_1b_1(.A(1'b0),.B(ID_EX[185]),.S(ID_EX[76]),.Y(ALUsrcA_EXE));

 

    //module ImmExtend(imm, ImmExt, imm_ext);
    wire [31:0] imm_ext_EXE;
    //ImmExtend imm_extend(.imm(imm), .ImmExt(ImmExt), .imm_ext(imm_ext));
    ImmExtend imm_extend(.imm(ID_EX[131:116]), .ImmExt(ID_EX[71:70]), .imm_ext(imm_ext_EXE));


    //qa重定向
    wire [31:0] qa_EXE, ALU_OUT_MEM,temp1;
    wire qa_redirected_EXE_MEM, qa_redirected_MEM_WB;
    MUX2_32B mux2_32b_4(.A(ID_EX[63:32]), .B(rf_rd_WB), .S(qa_redirected_MEM_WB), .Y(temp1));
    MUX2_32B mux2_32b_2(.A(temp1), .B(ALU_OUT_MEM), .S(qa_redirected_EXE_MEM), .Y(qa_EXE));

    //ALU A 输入多路选择器
    wire [31:0] ALU_A_EXE;
    //MUX2_32B MUX2_32B_1(.A(rf_qa_exe), .B(shamt), .S(ALUsrcA), .Y(ALU_A));
    MUX2_32B mux2_32b_1(.A(qa_EXE), .B(ID_EX[169:138]), .S(ALUsrcA_EXE), .Y(ALU_A_EXE));


    //qb redirected
    wire [31:0] qb_EXE,temp2;
    wire qb_redirected_EXE_MEM,qb_redirected_MEM_WB;
    MUX2_32B mux2_32b_5(.A(ID_EX[31:0]), .B(rf_rd_WB), .S(qb_redirected_MEM_WB), .Y(temp2));
    MUX2_32B mux2_32b_3(.A(temp2), .B(ALU_OUT_MEM), .S(qb_redirected_EXE_MEM), .Y(qb_EXE));

    


    //ALU B 输入多路选择器
    wire [31:0] ALU_B_EXE;
    //MUX3_32B MUX3_32B_1(.A(rf_qb), .B(imm_ext), .C(32'b0).S(ALUsrcB), .Y(ALU_B));
    MUX3_32B mux3_32b_1(.A(qb_EXE), .B(imm_ext_EXE), .C(32'b0), .S(ID_EX[73:72]), .Y(ALU_B_EXE));

    //module ALU(A,B,ALUC,ZERO,OF,SF,OUT);
    wire [31:0] ALU_OUT_EXE;
    wire OF_EXE;
    ALU alu(.A(ALU_A_EXE), .B(ALU_B_EXE),.ALUC(ID_EX[67:64]),.ZERO(ZF_EXE),.OF(OF_EXE),.SF(SF_EXE),.OUT(ALU_OUT_EXE));

    //already
    // wire BEQ_EXE, BGTZ_EXE, BGEZ_EXE, BNE_EXE, BLEZ_EXE;
    // wire [15:0] imm_EXE;
    assign BEQ_EXE = ID_EX[87];
    assign BGTZ_EXE = ID_EX[86];
    assign BGEZ_EXE = ID_EX[85];
    assign BNE_EXE = ID_EX[84];
    assign BLEZ_EXE = ID_EX[83];
    assign imm_EXE = ID_EX[131:116];

    
    always @(negedge clk)
    begin
        ID_EX[63:32] = qa_EXE;
        ID_EX[31:0] = qb_EXE;
        #2;
        //           218   217:186    185:0
        EX_MEM <= {SF_EXE,ALU_OUT_EXE,ID_EX};
        
    end


    //EXE_MEM 冲突检测

    wire [4:0] rw_MEM;
    MUX3_5B mux3_5B_2(.A(EX_MEM[179:175]),.B(EX_MEM[174:170]),.C(5'd31),.S(EX_MEM[75:74]),.Y(rw_MEM));

    assign qa_redirected_EXE_MEM = EX_MEM[89]&&(rw_MEM!=5'b0)&&(rw_MEM==ID_EX[184:180]);

    assign qb_redirected_EXE_MEM = EX_MEM[89]&&(rw_MEM!=5'b0)&&(rw_MEM==ID_EX[179:175]);

    assign ALU_OUT_MEM = EX_MEM[217:186];


    reg [250:0] MEM_WB=251'b0;

    //MEM

    assign AddressBusB = EX_MEM[217:186];
    assign DataBusOut =  EX_MEM[31:0]; //qb_m
    //{MemWrite,Memrhalf, Memrbyte,MemExt}
    assign ContralBus = {EX_MEM[88],EX_MEM[79],EX_MEM[78],EX_MEM[77]};

    
    always @(negedge clk)
    begin
       #2; //等待DataBusInB
       //          250:219     218:0
       MEM_WB <= {DataBusInB, EX_MEM};
    end

    

    //WB
    
    //mux3_5B rf 目的寄存器多路选择器
    // MUX3_5B mux2_5B_1(.A(rt),.B(rd),.C($31),.S(RegDst),.Y(rw));

   
    MUX3_5B mux3_5B_1(.A(MEM_WB[179:175]),.B(MEM_WB[174:170]),.C(5'd31),.S(MEM_WB[75:74]),.Y(rw_WB));
    assign Jal_WB = MEM_WB[81];
    assign target_Jal_WB = MEM_WB[115:90];

    //memtoreg 
    //MUX2_32B mux2_32B_3(.A(ALU_OUT), .B(DataBusIn),.C(sf),.D(PC) .S(MemtoReg), .Y(rf_rd_w));
    //jal AddressBusA 需要暂停流水线
    //already
    // wire [4:0] rw_WB;
    // wire [31:0] rf_rd_WB;
    // reg RegWrite_WB=0;
    wire [31:0] next_pc;
    assign next_pc = AddressBusA + 4;
    MUX4_32B mux4_32b_1(.A(MEM_WB[217:186]), .B(MEM_WB[250:219]), .C({31'b0,MEM_WB[218]}), .D(next_pc), .S(MEM_WB[69:68]), .Y(rf_rd_WB));


    //redirected
    assign qa_redirected_MEM_WB = MEM_WB[89]&&(rw_WB!=5'b0)&&(rw_WB==ID_EX[184:180]);
    assign qb_redirected_MEM_WB = MEM_WB[89]&&(rw_WB!=5'b0)&&(rw_WB==ID_EX[179:175]);
    


    always @(negedge clk)
    begin
        #3;
        RegWrite_WB <= MEM_WB[89];
        
    end
    


    //load stop
    wire [4:0] rw_EXE;
    wire load_stop;
    MUX3_5B mux3_5B_3(.A(ID_EX[179:175]),.B(ID_EX[174:170]),.C(5'd31),.S(ID_EX[75:74]),.Y(rw_EXE));
    assign load_stop = (!ID_EX[68])&&ID_EX[68]&&(rw_EXE!=5'b0)&&(rw_EXE==rs_DEC||rw_EXE==rt_DEC);
    always @(load_stop)
    begin
        if(load_stop)
        begin
            pc_enable = 0;
            IF_ID_enable = 0;
            ID_EX_CLEAR = 1;
        end
        else
        begin
            pc_enable = 1;
            IF_ID_enable = 1;
            ID_EX_CLEAR = 0;
        end
    end

   

    //branch
    wire branch_stop;
    assign branch_stop = BEQ_DEC||BGTZ_DEC||BGEZ_DEC||BNE_DEC||BLEZ_DEC;
    integer state_b = 0;
    always @(branch_stop)
    begin
        if(branch_stop&&state_b==0)
        begin
            state_b = 1;
        end
    end
    
    always @(negedge clk)
    begin
        case(state_b)
        0:;
        1:
        begin
            pc_enable = 0;
            IF_ID_enable = 0;
            ID_EX_CLEAR = 1;
            state_b = 2;
        end
        2: state_b = 3;
        3: state_b = 4;
        4:
        begin
            ID_EX_CLEAR = 0;
            state_b = 5;
        end
        5:
        begin
            pc_enable = 1;
            IF_ID_enable = 1;
            ID_EX_CLEAR = 1;
            state_b = 6;
        end
        6:
        begin
            ID_EX_CLEAR = 0;
            state_b = 0;
        end
        default: state_b = 0;

        endcase
    end


    //J
    wire J_stop;
    assign J_stop = J_DEC;
    integer state_J = 0;
    always @(J_stop)
    begin
        if(J_stop&&state_J==0)
        begin
            state_J = 1;
        end
    end
    
    always @(negedge clk)
    begin
        case(state_J)
        0:;
        1:
        begin
            pc_enable = 0;
            IF_ID_enable = 0;
            ID_EX_CLEAR = 1;
            state_J = 2;
        end
        2: state_J = 3;
        3:
        begin
            pc_enable = 1;
            IF_ID_enable = 1;
            state_J = 4;
        end
        4:
        begin
            ID_EX_CLEAR = 0;
            state_J = 0;
        end
        default: state_J = 0;
       
        endcase
    end

    //Jal
    wire Jal_stop;
    assign Jal_stop = Jal_DEC;
    integer state_Jal = 0;
    always @(Jal_stop)
    begin
        if(Jal_stop&&state_Jal==0)
        begin
            state_Jal = 1;
        end
    end
    
    always @(negedge clk)
    begin
        case(state_Jal)
        0:;
        1:
        begin
            pc_enable = 0;
            IF_ID_enable = 0;
            state_Jal = 2;
        end
        2:
        begin
            ID_EX_CLEAR = 1;
            state_Jal = 3;
        end
        3: state_Jal = 4;
        4:
        begin
            pc_enable = 1;
            IF_ID_enable = 1;
            state_Jal = 5;
        end
        5:
        begin
            ID_EX_CLEAR = 0;
            state_Jal = 0;
        end
        default: state_Jal = 0;
       
        endcase
    end

    //stop jr
    wire Jr_stop;
    assign Jr_stop = Jr_DEC;
    integer state_Jr = 0;
    always @(Jr_stop)
    begin
        if(Jr_stop&&state_Jr==0)
        begin
            state_Jr = 1;
        end
    end
    
    always @(negedge clk)
    begin
        case(state_Jr)
        0:;
        1:
        begin
            pc_enable = 0;
            IF_ID_enable = 0;
            ID_EX_CLEAR = 1;
            state_Jr = 2;
        end
        2: state_Jr = 3;
        3: 
        begin
            pc_enable = 1;
            IF_ID_enable = 1;
            state_Jr = 4;
        end
        4:
        begin
           ID_EX_CLEAR = 0;
           state_Jr = 0;
        end
        default: state_Jr = 0;
       
        endcase
    end


endmodule
