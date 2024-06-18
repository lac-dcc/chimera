// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module IC(op, rtype, ori, addi, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, jump); //instruction classify
    input [5:0] op;
    output reg rtype, ori, addi, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, jump;
    always @(op)
    begin //互斥
        rtype = 0;
        ori = 0;
        addi = 0;
        lw = 0;
        sw = 0;
        lh = 0;
        lhu =0;
        sh = 0;
        lb = 0;
        lbu = 0;
        sb = 0;
        beq = 0;
        jump = 0;
        case (op)
            6'b000000: rtype = 1;
            6'b001101: ori = 1;
            6'b001000: addi = 1;
            6'b100011: lw = 1;
            6'b101011: sw = 1;
            6'b100001: lh = 0;
            6'b100101: lhu =0;
            6'b101001: sh = 0;
            6'b100000: lb = 0;
            6'b100100: lbu = 0;
            6'b101000: sb = 0;
            6'b000100: beq = 1;
            6'b000010: jump = 1;
            default://don't occur
            begin
                rtype = 0;
                ori = 0;
                addi = 0;
                lw = 0;
                sw = 0;
                lh = 0;
                lhu =0;
                sh = 0;
                lb = 0;
                lbu = 0;
                sb = 0;
                beq = 0;
                jump = 0;
            end
        endcase
    end

endmodule

