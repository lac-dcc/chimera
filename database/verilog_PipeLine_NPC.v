// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module NPC(J, Jal, Jr,  BEQ, BGTZ, BGEZ, BNE, BLEZ, target_J, target_Jal, REG_ADDRESS, ZF, SF, imm, pc, clk, init, enable);
    input J, Jal, Jr, BEQ, BGTZ, BGEZ, BNE, BLEZ, ZF, SF, clk, init, enable;
    input [15:0] imm;
    input [25:0] target_J, target_Jal;
    input [31:0] REG_ADDRESS;
    output reg [31:0] pc;

    always @(init) begin //初始化 第一个字为nop指令
        pc = init?-32'h4:pc;
    end

    always @(negedge clk) begin
        #1;
        if(!enable)
        begin
            pc = pc;
        end
        else
        begin
            pc = pc + 4;
            if(J)
            begin
                pc = {pc[31:28],target_J,2'b00};
            end
            else if(Jal)
            begin
                pc = {pc[31:28],target_Jal,2'b00};
            end
            else if(Jr)
            begin
                pc = REG_ADDRESS;
            end
            else
            begin
                if((BEQ && ZF)||(BGTZ && !SF && !ZF)||(BGEZ && !SF)||(BNE && !ZF)||(BLEZ &&(SF||(!SF && ZF))))
                begin
                    pc = pc + {{14{imm[15]}},imm,2'b00}; //符号扩展
                end
            end
        end
    end
endmodule



