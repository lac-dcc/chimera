`include "../defs.v"
`default_nettype none
module ex(/*autoport*/
//output
          mem_access_op,
          mem_access_sz,
          data_o,
          mem_addr,
          reg_addr,
          overflow,
          reg_hilo_o,
          we_hilo,
          stall,
          we_cp0,
          cp0_wr_addr,
          cp0_rd_addr,
          cp0_sel,
          syscall,
          break_inst,
          eret,
          we_tlb,
          is_priv_inst,
          probe_tlb,
          inv_wb_dcache,
          inv_icache,
          result_mult,
          sign_mult,
          we_hilo_mult,
//input
          clk,
          rst_n,
          exception_flush,
          op,
          op_type,
          address,
          reg_s,
          reg_t,
          reg_d,
          reg_s_value,
          reg_t_value,
          immediate,
          flag_unsigned,
          reg_hilo_value,
          reg_cp0_value);

input wire clk;
input wire rst_n;
input wire exception_flush;

input wire[7:0] op;
input wire[1:0] op_type;
input wire[31:0] address;
input wire[4:0] reg_s;
input wire[4:0] reg_t;
input wire[4:0] reg_d;
input wire[31:0] reg_s_value;
input wire[31:0] reg_t_value;
input wire[15:0] immediate;
input wire flag_unsigned;
input wire[63:0] reg_hilo_value;
input wire[31:0] reg_cp0_value;

output reg[1:0] mem_access_op;
output reg[2:0] mem_access_sz;
output reg[31:0] data_o;
output reg[31:0] mem_addr;
output reg[4:0] reg_addr;
output reg overflow;
output reg[63:0] reg_hilo_o;
output reg we_hilo;
output wire stall;
output reg we_cp0;
output reg[4:0] cp0_wr_addr;
output reg[4:0] cp0_rd_addr;
output reg[2:0] cp0_sel;
output wire syscall;
output wire break_inst;
output wire eret;
output wire we_tlb;
output reg is_priv_inst;
output wire probe_tlb;
output reg inv_wb_dcache;
output reg inv_icache;
output wire [63:0]result_mult;
output wire sign_mult;
output reg we_hilo_mult;

wire [31:0] tmp_clo, tmp_clz;
wire [31:0] tmp_sign_operand, tmp_add, tmp_sub;
wire [63:0] mul_result;
wire [31:0] signExtImm;
wire [31:0] zeroExtImm;

wire imm_s;

wire mul_done;

assign stall = !mul_done;

assign imm_s = immediate[15];
assign signExtImm = { imm_s,imm_s,imm_s,imm_s,imm_s,imm_s,imm_s,imm_s,imm_s,imm_s,imm_s,imm_s,imm_s,imm_s,imm_s,imm_s, 
                        immediate};
assign zeroExtImm = { 16'b0, immediate};

assign tmp_sign_operand = (op_type==`OPTYPE_R ? reg_t_value : signExtImm);
assign tmp_add = reg_s_value + tmp_sign_operand;
assign tmp_sub = reg_s_value - tmp_sign_operand; //used by SLT/SLTI and SUB

assign syscall = op == `OP_SYSCALL;
assign break_inst = op == `OP_BREAK;
assign eret = op == `OP_ERET;
assign we_tlb = op == `OP_TLBWI;
assign probe_tlb = op == `OP_TLBP;

multi_cycle mul_instance(/*autoinst*/
           .result(mul_result),
           .result_mult(result_mult),
           .sign_mult(sign_mult),
           .flag_unsigned(flag_unsigned),
           .operand1(reg_s_value),
           .operand2(reg_t_value),
           .hilo_i(reg_hilo_value),
           .clk(clk),
           .rst_n(rst_n),
           .exception_flush(exception_flush),
           .op(op),
           .done(mul_done));

count_bit_word clo(/*autoinst*/
         .cnt(tmp_clo),
         .data(reg_s_value),
         .bit_i(1'b1));
count_bit_word clz(/*autoinst*/
         .cnt(tmp_clz),
         .data(reg_s_value),
         .bit_i(1'b0));

always @(*) begin
    overflow <= 1'b0;
    we_hilo <= 1'b0;
    we_hilo_mult <= 1'b0;
    reg_hilo_o <= 64'b0;
    we_cp0 <= 1'b0;
    cp0_rd_addr <= 5'b0;
    cp0_wr_addr <= 5'b0;
    cp0_sel <= 3'b0;
    case (op)
    `OP_ADD: begin
        if(!flag_unsigned && reg_s_value[31]==tmp_sign_operand[31] && (reg_s_value[31]^tmp_add[31])) begin
            overflow <= 1'b1;
            data_o <= 32'b0;
            reg_addr <= 5'b0;
        end else begin
            overflow <= 1'b0;
            data_o <= tmp_add;
            reg_addr <= (op_type==`OPTYPE_R) ? reg_d : reg_t;
        end
    end
    `OP_AND: begin
        data_o <= (op_type==`OPTYPE_R) ? reg_s_value&reg_t_value : reg_s_value&zeroExtImm;
        reg_addr <= (op_type==`OPTYPE_R) ? reg_d : reg_t;
    end
    `OP_BGEZAL,
    `OP_BLTZAL,
    `OP_JAL: begin
        data_o <= address;
        reg_addr <= 5'd31;
    end
    `OP_JALR: begin
        data_o <= address;
        reg_addr <= reg_d;
    end
    `OP_LB,`OP_LH,`OP_LL,`OP_LW,`OP_LWL,`OP_LWR: begin
        data_o <= reg_t_value;
        reg_addr <= reg_t;
    end
    `OP_LU: begin
        data_o <= {immediate, 16'b0};
        reg_addr <= reg_t;
    end
    `OP_NOR: begin
        data_o <= ~(reg_s_value|reg_t_value);
        reg_addr <= reg_d;
    end
    `OP_OR: begin
        data_o <= (op_type==`OPTYPE_R) ? reg_s_value|reg_t_value : reg_s_value|zeroExtImm;
        reg_addr <= (op_type==`OPTYPE_R) ? reg_d : reg_t;
    end
    `OP_XOR: begin
        data_o <= (op_type==`OPTYPE_R) ? reg_s_value^reg_t_value : reg_s_value^zeroExtImm;
        reg_addr <= (op_type==`OPTYPE_R) ? reg_d : reg_t;
    end
    `OP_SLT: begin
        if(flag_unsigned) begin
            data_o <= (reg_s_value < tmp_sign_operand) ? 32'b1 : 32'b0;
        end else if(reg_s_value[31] != tmp_sign_operand[31]) begin
            data_o <= reg_s_value[31] ? 32'b1 : 32'b0;
        end else begin
            data_o <= tmp_sub[31] ? 32'b1 : 32'b0;
        end
        reg_addr <= (op_type==`OPTYPE_R) ? reg_d : reg_t;
    end
    `OP_SLL: begin
        data_o <= reg_t_value<<immediate;
        reg_addr <= reg_d;
    end
    `OP_SRL: begin
        data_o <= reg_t_value>>immediate;
        reg_addr <= reg_d;
    end
    `OP_SB,`OP_SC,`OP_SH,`OP_SW,`OP_SWL,`OP_SWR: begin
        data_o <= reg_t_value;
        reg_addr <= reg_t;
    end
    `OP_SUB: begin
        if(!flag_unsigned && reg_s_value[31] == ~tmp_sign_operand[31] && (reg_s_value[31]^tmp_sub[31])) begin
            overflow <= 1'b1;
            data_o <= 32'b0;
            reg_addr <= 5'b0;
        end else begin
            overflow <= 1'b0;
            data_o <= tmp_sub;
            reg_addr <= reg_d;
        end
    end
    `OP_MFHI: begin
        data_o <= reg_hilo_value[63:32];
        reg_addr <= reg_d;
    end
    `OP_MFLO: begin
        data_o <= reg_hilo_value[31:0];
        reg_addr <= reg_d;
    end
    `OP_MTHI: begin
        reg_hilo_o <= {reg_s_value, reg_hilo_value[31:0]};
        we_hilo <= 1'b1;
        data_o <= 32'h0;
        reg_addr <= 5'h0;
    end
    `OP_MTLO: begin
        reg_hilo_o <= {reg_hilo_value[63:32],reg_s_value};
        we_hilo <= 1'b1;
        data_o <= 32'h0;
        reg_addr <= 5'h0;
    end
    `OP_MFC0: begin
        cp0_sel <= immediate[2:0];
        cp0_rd_addr <= reg_d;
        data_o <= reg_cp0_value;
        reg_addr <= reg_t;
    end
    `OP_MTC0: begin
        cp0_sel <= immediate[2:0];
        data_o <= reg_t_value;
        cp0_wr_addr <= reg_d;
        we_cp0 <= 1'b1;
        reg_addr <= 5'b0;
    end
    `OP_MULT: begin 
        we_hilo_mult <= 1'b1;
        we_hilo <= 1'b1;
        data_o <= 32'h0;
        reg_addr <= 5'h0;
    end
    `OP_MSUB,
    `OP_MADD,
    `OP_DIV: begin
        reg_hilo_o <= mul_result;
        we_hilo <= mul_done;
        data_o <= 32'h0;
        reg_addr <= 5'h0;
    end
    `OP_MUL: begin
        data_o <= mul_result[31:0];
        reg_addr <= mul_done ? reg_d : 5'h0;
    end
    `OP_SRA: begin
        data_o <= (reg_t_value>>immediate)|(reg_t_value[31] ? ~({32{1'b1}}>>immediate) : 32'h0);
        reg_addr <= reg_d;
    end
    `OP_SLLV: begin
        data_o <= reg_t_value<<reg_s_value[4:0];
        reg_addr <= reg_d;
    end
    `OP_SRLV: begin
        data_o <= reg_t_value>>reg_s_value[4:0];
        reg_addr <= reg_d;
    end
    `OP_SRAV: begin
        data_o <= (reg_t_value>>reg_s_value[4:0])|(reg_t_value[31] ? ~({32{1'b1}}>>reg_s_value[4:0]) : 32'h0);
        reg_addr <= reg_d;
    end
    `OP_CLO: begin
        data_o <= tmp_clo;
        reg_addr <= reg_d;
    end
    `OP_CLZ: begin
        data_o <= tmp_clz;
        reg_addr <= reg_d;
    end
    `OP_MOVN: begin
        if(reg_t_value == 32'b0) begin //change nothing
            data_o <= 32'b0;
            reg_addr <= 5'b0;
        end else begin
            data_o <= reg_s_value;
            reg_addr <= reg_d;
        end
    end
    `OP_MOVZ: begin
        if(reg_t_value == 32'b0) begin
            data_o <= reg_s_value;
            reg_addr <= reg_d;
        end else begin //change nothing
            data_o <= 32'b0;
            reg_addr <= 5'b0;
        end
    end
    default: begin
        data_o <= 32'h0;
        reg_addr <= 5'h0;
    end
    endcase
end

always @(*) begin
    case (op)
    `OP_CACHE: begin 
        mem_addr <= reg_s_value+signExtImm;
        mem_access_op <= `ACCESS_OP_D2R;
    end
    `OP_LB,
    `OP_LH,
    `OP_LWL,
    `OP_LWR,
    `OP_LL,
    `OP_LW: begin
        mem_addr <= reg_s_value+signExtImm;
        mem_access_op <= `ACCESS_OP_M2R;
     end
    `OP_SB,
    `OP_SH,
    `OP_SWL,
    `OP_SWR,
    `OP_SC,
    `OP_SW: begin
        mem_addr <= reg_s_value+signExtImm;
        mem_access_op <= `ACCESS_OP_R2M;
    end
    default: begin
        mem_addr <= 32'b0;
        mem_access_op <= `ACCESS_OP_D2R;
    end
    endcase
end

always @(*) begin
    case (op)
    `OP_LB,
    `OP_SB:
        mem_access_sz <= `ACCESS_SZ_BYTE;
    `OP_LH,
    `OP_SH:
        mem_access_sz <= `ACCESS_SZ_HALF;
    `OP_LWL,
    `OP_SWL:
        mem_access_sz <= `ACCESS_SZ_LEFT;
    `OP_LWR,
    `OP_SWR:
        mem_access_sz <= `ACCESS_SZ_RIGHT;
    default:
        mem_access_sz <= `ACCESS_SZ_WORD;
    endcase
end

always @(*) begin
    case (op)
    `OP_MFC0,
    `OP_MTC0,
    `OP_CACHE,
    `OP_WAIT,
    `OP_ERET,
    `OP_TLBP,
    `OP_TLBWI:
        is_priv_inst <= 1'b1;
    default:
        is_priv_inst <= 1'b0;
    endcase
end

always @(*) begin
    if(op == `OP_CACHE) begin 
        inv_icache <= (reg_t == 5'b00000 || reg_t == 5'b10000);
        inv_wb_dcache <= (reg_t == 5'b00001 || reg_t == 5'b10101);
    end else begin 
        inv_icache <= 1'b0;
        inv_wb_dcache <= 1'b0;
    end
end

endmodule