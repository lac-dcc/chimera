// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

`include "M_MEM_ASYNC.v"
`include "M_MEM_SYNC.v"
`include "M_CONTROLLER.v"
`include "M_ALU_CONTROLLER.v"
`include "M_IF_ID_REG.v"
`include "M_ID_EX_REG.v"
`include "M_EX_MEM_REG.v"
`include "M_MEM_WB_REG.v"
`include "M_PC_REG.v"
`include "M_PC_ADDER.v"
`include "M_SLL2.v"
`include "M_MUX_2_DONTCARE.v"
`include "M_REG_FILE.v"
`include "M_MUX_2.v"
`include "M_SEXT_16.v"
`include "M_MUX_3_DONTCARE.v"
`include "M_ALU.v"
`include "M_HAZARD_UNIT.v"
`include "M_EQUAL.v"

module M_MIPS_CPU(
    input clk, 
    input reset,
    output[31:0] writedataM,
    output[31:0] aluoutM,
    output memwriteM,
    output[6:0] segment0,
    output[6:0] segment1,
    output[6:0] segment2,
    output[6:0] segment3,
    output[6:0] segment4,
    output[6:0] segment5
    );

    reg[31:0] count = 0;
    always@(posedge clk) begin
        count = count + 1;
        $display("**********************************************************");
        $display("Clock cycle: %d", count);
    end


    wire[31:0] pc, instr, readdata;
    wire[2:0] alucontrol;
    wire[5:0] op, funct;

    wire[1:0] aluop;
    wire branch;

    wire[4:0] writereg, writeregE;
    wire[31:0] pcnext, pcnextbr, pcplus4, pcbranch;
    wire[31:0] signimmD, signimmsh;
    wire[31:0] srca, srcb;
    wire[31:0] result;
    wire[31:0] instrD, instrE, instrM, instrW, pcplus4D;
    wire memtoreg, alusrc, regdst, regwrite, jump, zero;

    wire regwriteE, memtoregE, memwriteE, branchE;
    wire[2:0] alucontrolE;
    wire alusrcE, regdstE;
    wire[31:0] srcaE, writedataE, srcbE;
    wire[31:0] srcaMUX, writedataMUX;
    wire[4:0] rtE, rdE, rsE;
    wire[31:0] signimmE, pcplus4E;

    wire regwriteM, memtoregM, memwrite, branchM;
    wire zeroM;
    wire[31:0] aluout, writedata;
    wire[4:0] writeregM;
    wire[31:0] pcbranchM, pcbranchD;

    wire regwriteW;
    wire memtoregW;
    wire[31:0] aluoutW, readdataW;
    wire[4:0] writeregW;

    wire[1:0] forwardAE, forwardBE;

    wire stallF, stallD, flushE;

    wire equalD, pcsrcD;
    wire[31:0] srcaEQ, writedataEQ;


    // instantiate memories
    M_MEM_ASYNC #(.RAM_SIZE(64)) imem(clk, pc[7:2], instr);
    M_MEM_SYNC #(.RAM_SIZE(64)) dmem(clk, memwriteM, aluoutM, writedataM, readdata);
    
    
    // controller
    assign op = instrD[31:26];
    assign funct = instrD[5:0];
    M_CONTROLLER controller(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
    M_ALU_CONTROLLER  aluController(funct, aluop, alucontrol);

    // pipline registers
    M_IF_ID_REG ifIdReg(
        pcsrcD,
        stallD,
        clk,
        instr,
        pcplus4,
        instrD,
        pcplus4D
    );

    M_ID_EX_REG idExReg(
        flushE, 
        clk, 
        instrD[25:21], 
        instrD, 
        regwrite, 
        memtoreg, 
        memwrite, 
        alucontrol, 
        alusrc,
        regdst, 
        srca, 
        writedata, 
        instrD[20:16], 
        instrD[15:11], 
        signimmD,
        regwriteE, 
        memtoregE, 
        memwriteE, 
        alucontrolE,
        alusrcE,
        regdstE, 
        srcaMUX, 
        writedataMUX, 
        rtE, 
        rdE, 
        signimmE, 
        instrE, 
        rsE
    );

    M_EX_MEM_REG exMemReg(
        clk, 
        instrE, 
        regwriteE, 
        memtoregE, 
        memwriteE,
        aluout, 
        writedataE, 
        writeregE,
        regwriteM, 
        memtoregM, 
        memwriteM,
        aluoutM, 
        writedataM, 
        writeregM, 
        instrM
    );

    M_MEM_WB_REG memWbReg(
        clk, 
        instrM, 
        regwriteM, 
        memtoregM, 
        aluoutM, 
        readdata, 
        writeregM,
        regwriteW, 
        memtoregW, 
        aluoutW, 
        readdataW,
        writeregW, 
        instrW
    );

 

    // pc logic
    assign pcsrcD = equalD & branch;

    M_PC_REG #(32) pcreg(stallF, clk, reset, pcnext, pc);
    M_PC_ADDER pcadd1(pc, 32'b100, pcplus4);

    always@(negedge clk) 
        $display("current pc: %h", pc);

    // display branch prediction output for debuging
    always@(branch, pcsrcD) begin
        if(pcsrcD==1'b1) 
            $display("Branch is taken! Squashing instruction %h", instr);
        else if((pcsrcD!=1'b1) && (branch==1'b1)) 
            $display("Branch not taken");
    end

    M_SLL2 immsh(signimmD, signimmsh);
    M_PC_ADDER pcadd2(pcplus4D, signimmsh, pcbranchD);

    M_MUX_2_DONTCARE pcbrmux(pcplus4, pcbranchD, pcsrcD, pcnextbr);
    M_MUX_2_DONTCARE pcmux(pcnextbr, {pcplus4[31:28], instrD[25:0], 2'b00}, jump, pcnext);

    // register file logic
    M_REG_FILE rf(clk,
        regwriteW,
        instrD[25:21],
        instrD[20:16],
        writeregW,
        result,
        srca,
        writedata,
        segment0,
        segment1,
        segment2,
        segment3,
        segment4,
        segment5
    );
    M_MUX_2 #(5) wrmux(rtE, rdE, regdstE, writeregE);
    M_MUX_2 #(32) resmux(aluoutW, readdataW, memtoregW, result);
    M_SEXT_16 se(instrD[15:0], signimmD);

    // ALU logic
    M_MUX_3_DONTCARE muxsrca(srcaMUX, result, aluoutM, forwardAE, srcaE);
    M_MUX_3_DONTCARE muxwritedata(writedataMUX, result, aluoutM, forwardBE, writedataE);

    M_MUX_2 #(32) srcbmux(writedataE, signimmE, alusrcE, srcbE);
    M_ALU alu(srcaE, srcbE, alucontrolE, aluout);

    // hazard logic	  
    M_HAZARD_UNIT hazardunit(
        branch, 
        memtoregE, 
        memtoregM, 
        instrD[25:21], 
        instrD[20:16],
        regwriteE, 
        regwriteM, 
        regwriteW, 
        rsE, 
        rtE, 
        writeregE, 
        writeregM, 
        writeregW,
        forwardAE, 
        forwardBE,
        stallF, 
        stallD, 
        flushE,
        forwardAD, 
        forwardBD );

    // early branch logic 
    M_EQUAL equal(srcaEQ, writedataEQ, equalD);

    M_MUX_2_DONTCARE srcsEQMUX(srca, aluoutM, forwardAD, srcaEQ);
    M_MUX_2_DONTCARE writedataEQMUX(writedata, aluoutM, forwardBD, writedataEQ);



    always @(stallF, stallD, flushE) begin
        $display("stallF:%b", stallF);
        $display("stallD:%b", stallD);
        $display("flushE:%b", flushE);
    end

    always@(forwardAE) begin
        case(forwardAE)
            2'b01: $display("Forwarded %h to srcaE from MEM/WB stage", result);
            2'b10: $display("Forwarded %h to srcaE from EX/MEM stage", aluoutM);
        endcase
    end

    always @(forwardBE) begin
        case(forwardBE)
            2'b01: $display("Forwarded %h to writedataE from MEM/WB stage", result);
            2'b10: $display("Forwarded %h to writedataE from EX/MEM stage", aluoutM);
        endcase
    end

endmodule
