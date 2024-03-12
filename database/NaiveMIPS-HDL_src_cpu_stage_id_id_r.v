`include "../defs.v"
module id_r(/*autoport*/
//output
            op,
            reg_s,
            reg_t,
            reg_d,
            shift,
            flag_unsigned,
//input
            inst);

input wire[31:0] inst;
output reg[7:0] op;
output wire[4:0] reg_s;
output wire[4:0] reg_t;
output wire[4:0] reg_d;
output wire[4:0] shift;
output reg flag_unsigned;

assign reg_s = inst[25:21];
assign reg_t = inst[20:16];
assign reg_d = inst[15:11];
assign shift = inst[10:6];

always @(*) begin
    flag_unsigned <= (inst[5:0]==6'h21) || //addu
        (inst[5:0]==6'h2b) || //sltu
        (inst[5:0]==6'h23) || //subu
        (inst[5:0]==6'h1b) || //divu
        (inst[5:0]==6'h19) || //multu
        (inst[5:0]==6'h01) || //maddu
        (inst[5:0]==6'h05); //msubu
end

always @(*) begin
    if(inst[31:26]==6'h00) begin //SPECIAL
        case(inst[5:0])
        6'h00: op <= `OP_SLL;
        6'h02: op <= `OP_SRL;
        6'h03: op <= `OP_SRA;
        6'h04: op <= `OP_SLLV;
        6'h06: op <= `OP_SRLV;
        6'h07: op <= `OP_SRAV;
        6'h08: op <= `OP_JR;
        6'h09: op <= `OP_JALR;
        6'h0a: op <= `OP_MOVZ;
        6'h0b: op <= `OP_MOVN;
        6'h0c: op <= `OP_SYSCALL;
        6'h0d: op <= `OP_BREAK;
        6'h0f: op <= `OP_SYNC;
        6'h10: op <= `OP_MFHI;
        6'h11: op <= `OP_MTHI;
        6'h12: op <= `OP_MFLO;
        6'h13: op <= `OP_MTLO;
        6'h18,6'h19: op <= `OP_MULT;
        6'h1a,6'h1b: op <= `OP_DIV;
        6'h20,6'h21: op <= `OP_ADD;
        6'h22,6'h23: op <= `OP_SUB;
        6'h24: op <= `OP_AND;
        6'h25: op <= `OP_OR;
        6'h26: op <= `OP_XOR;
        6'h27: op <= `OP_NOR;
        6'h2a,6'h2b: op <= `OP_SLT;
        default: op <= `OP_INVAILD;
        endcase
    end else if(inst[31:26]==6'h1c) begin //SPECIAL2
        case(inst[5:0])
        6'h01,6'h00: op <= `OP_MADD;
        6'h02: op <= `OP_MUL;
        6'h04,6'h05: op <= `OP_MSUB;
        6'h20: op <= `OP_CLZ;
        6'h21: op <= `OP_CLO;
        default: op <= `OP_INVAILD;
        endcase
    end else begin
        op <= `OP_INVAILD;
    end
end


endmodule