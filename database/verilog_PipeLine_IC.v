// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module IC(op, func,rtype, lui, slti, ori, xori, addi, addiu, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, bgtz, bgez, bne, blez, j, jal, jr); //instruction classify
    input [5:0] op, func;
    output reg rtype, lui, slti, ori, xori, addi, addiu, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, bgtz, bgez, bne, blez, j, jal, jr;
    always @(op,func)
    begin //互斥
        //r
        rtype = 0;
        //i
        lui = 0;
        slti = 0;
        ori = 0;
        xori = 0;
        addi = 0;
        addiu = 0;
        lw = 0;
        sw = 0;
        lh = 0;
        lhu =0;
        sh = 0;
        lb = 0;
        lbu = 0;
        sb = 0;
        //i branch
        beq = 0;
        bgtz = 0;
        bgez = 0;
        bne = 0;
        blez = 0;
        //j
        j = 0;
        jal = 0;
        jr = 0; //r型特殊化
        case (op)
            6'b000000:
            begin
                if(func == 6'b001000) jr = 1;
                else  rtype = 1;
            end
            //i
            6'b001111: lui = 1;
            6'b001010: slti = 1;
            6'b001101: ori = 1;
            6'b001110: xori = 1;
            6'b001000: addi = 1;
            6'b001001: addiu = 1;
            6'b100011: lw = 1;
            6'b101011: sw = 1;
            6'b100001: lh = 1;
            6'b100101: lhu =1;
            6'b101001: sh = 1;
            6'b100000: lb = 1;
            6'b100100: lbu = 1;
            6'b101000: sb = 1;
            //i branch
            6'b000100: beq = 1;
            6'b000111: bgtz = 1;
            6'b000001: bgez = 1;
            6'b000101: bne = 1;
            6'b000110: blez = 1;
            //j
            6'b000010: j = 1;
            6'b000011: jal = 1;
            
            default://don't occur
            begin
                //r
                rtype = 0;
                //i
                lui = 0;
                slti = 0;
                ori = 0;
                xori = 0;
                addi = 0;
                addiu = 0;
                lw = 0;
                sw = 0;
                lh = 0;
                lhu =0;
                sh = 0;
                lb = 0;
                lbu = 0;
                sb = 0;
                //i branch
                beq = 0;
                bgtz = 0;
                bgez = 0;
                bne = 0;
                blez = 0;
                //j
                j = 0;
                jal = 0;
                jr = 0; //r型特殊化
            end
        endcase
    end

endmodule


