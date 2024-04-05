`include "../defs.v"
`default_nettype none
module id(/*autoport*/
//output
          op,
          op_type,
          reg_s,
          reg_t,
          reg_d,
          immediate,
          flag_unsigned,
//input
          inst,
          pc_value);

parameter WITH_CACHE = 1;
parameter WITH_TLB = 1;

input wire[31:0] inst;
input wire[31:0] pc_value;

output reg[7:0] op;
output reg[1:0] op_type;
output reg[4:0] reg_s;
output reg[4:0] reg_t;
output wire[4:0] reg_d;
output reg[15:0] immediate;
output reg flag_unsigned;

wire [7:0] id_i_op;
wire[4:0] id_i_reg_s;
wire[4:0] id_i_reg_t;
wire[15:0] id_i_immediate;
wire id_i_flag_unsigned;
id_i #(.WITH_TLB(WITH_TLB),.WITH_CACHE(WITH_CACHE)) id_i_inst(
    .op(id_i_op),
    .reg_s(id_i_reg_s),
    .reg_t(id_i_reg_t),
    .immediate(id_i_immediate),
    .flag_unsigned(id_i_flag_unsigned),
    .inst(inst)
);

wire [7:0] id_j_op;
wire [25:0] id_j_address;
id_j id_j_inst(
    .op(id_j_op),
    .address(id_j_address),
    .inst(inst)
);

wire [7:0] id_r_op;
wire[4:0] id_r_reg_s;
wire[4:0] id_r_reg_t;
wire[4:0] id_r_reg_d;
wire[4:0] id_r_shift;
wire id_r_flag_unsigned;
id_r id_r_inst(
    .op(id_r_op),
    .reg_s(id_r_reg_s),
    .reg_t(id_r_reg_t),
    .reg_d(id_r_reg_d),
    .shift(id_r_shift),
    .flag_unsigned(id_r_flag_unsigned),
    .inst(inst)
);

always @(*) begin
    if(id_i_op != `OP_INVAILD)
        op_type <= `OPTYPE_I;
    else if(id_r_op != `OP_INVAILD)
        op_type <= `OPTYPE_R;
    else if(id_j_op != `OP_INVAILD)
        op_type <= `OPTYPE_J;
    else
        op_type <= `OPTYPE_INVALID;
end

always @(*) begin
    case(op_type)
    `OPTYPE_I: begin
        
        op <= id_i_op;
        reg_s <= id_i_reg_s;
        reg_t <= id_i_reg_t;
        flag_unsigned <= id_i_flag_unsigned;
        immediate <= id_i_immediate;
    end
    `OPTYPE_R: begin
        op <= id_r_op;
        reg_s <= id_r_reg_s;
        reg_t <= id_r_reg_t;
        flag_unsigned <= id_r_flag_unsigned;
        immediate <= id_r_shift;
    end
    `OPTYPE_J: begin
        op <= id_j_op;
        reg_s <= 5'h0;
        reg_t <= 5'h0;
        flag_unsigned <= 1'b0;
        immediate <= 16'b0;
    end
    default: begin
        op <= `OP_INVAILD;
        reg_s <= 5'h0;
        reg_t <= 5'h0;
        flag_unsigned <= 1'b0;
        immediate <= 16'b0;
    end
    endcase
end

assign reg_d = id_r_reg_d;

endmodule