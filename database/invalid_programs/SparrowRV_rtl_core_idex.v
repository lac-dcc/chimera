`include "defines.v"


//译码执行，组合逻辑
module idex(
    input wire clk,
    //读操作通道
        //inst
    input wire[`InstBus] inst_i,            //指令内容
    input wire[`InstAddrBus] pc_i,          //指令地址
        //reg
    input wire[`RegBus] reg_rdata1_i,       //读rs1数据
    input wire[`RegBus] reg_rdata2_i,       //读rs2数据
        //csr空间
    input wire[`RegBus] csr_rdata_i,        //读CSR寄存器数据
        //32位地址空间
    input wire[`MemBus] mem_rdata_i,        //读内存数据
        //div
    output reg[`RegBus] dividend_o,         //被除数rs1
    output reg[`RegBus] divisor_o,          //除数rs2
    output reg[2:0] div_op_o,               //除法指令标志
    output reg div_start_o,                 //除法运算开始标志
    input wire[`RegBus] div_result_i,       //除法运算结果
        //mult
    output reg mult_inst_o,                 //开始乘法

    //写操作通道
        //reg
    output reg[`RegAddrBus] reg_raddr1_o,   //读rs1地址
    output reg[`RegAddrBus] reg_raddr2_o,   //读rs2地址
    output reg[`RegBus] reg_wdata_o,        //写寄存器数据
    output reg reg_we_o,                    //是否要写通用寄存器
    output reg[`RegAddrBus] reg_waddr_o,    //写通用寄存器地址
        //csr空间
    output reg[`RegBus] csr_wdata_o,        //写CSR寄存器数据
    output reg csr_we_o,                    //写CSR寄存器请求
    output reg[`CsrAddrBus] csr_addr_o,     //访问CSR寄存器地址
        //32位地址空间
    output reg[`MemBus] mem_wdata_o,        //写内存数据
    output reg[`MemAddrBus] mem_addr_o,     //访问内存地址，复用读
    output reg mem_we_o,                    //写内存使能
    output reg[3:0] mem_wem_o,              //写内存掩码
    output reg mem_en_o,                    //访问内存使能，复用读
        //PC
    output reg[`InstAddrBus] pc_n_o,        //下一条指令地址
        //trap
    output reg ecall_o,                     //指令中断使能
    output reg ebreak_o,                    //指令中断使能
    output reg wfi_o,                       //中断等待使能
    output reg inst_err_o,                  //指令出错
    output reg idex_mret_o,                 //mret中断返回标志
    //直连输入通道
    input wire[`RegBus] mepc                //mepc寄存器

);

//指令
wire [6:0] opcode = inst_i[6:0];
wire [2:0] funct3 = inst_i[14:12];
wire [6:0] funct7 = inst_i[31:25];
wire [4:0] rd = inst_i[11:7];//访问地址
wire [`RegBus] zimm = {27'h0 , inst_i[19:15]};//用于CSR的立即数扩展
wire signed[`RegBus] imm12i= {{20{inst_i[31]}} , inst_i[31:20]};//有符号12位立即数扩展，I type，addi,lb,lh,jalr
wire signed[`RegBus] imm12s= {{20{inst_i[31]}} , inst_i[31:25] , inst_i[11:7]};//有符号12位立即数扩展，S type，sb,sh
wire signed[`RegBus] imm12b= {{20{inst_i[31]}} , inst_i[7], inst_i[30:25], inst_i[11:8], 1'b0};//有符号12位立即数扩展，B type，beq
wire [`RegBus] imm20u= {inst_i[31:12] , 12'h0};//20位立即数左移12位，U type，lui,auipc
wire signed[`RegBus] imm20j= {{12{inst_i[31]}}, inst_i[19:12], inst_i[20], inst_i[30:21], 1'b0};//有符号20位立即数扩展，J type，jal
wire [4:0]shamt = inst_i[24:20];//rs2位置的立即数

//复用运算单元
//加法器
reg [`RegBus] add1_in1;//加法器1输入1
reg [`RegBus] add1_in2;//加法器1输入2
wire [`RegBus] add1_res = add1_in1 + add1_in2;//加法器1结果
reg [`RegBus] add2_in1;//加法器2输入1
reg [`RegBus] add2_in2;//加法器2输入2
wire [`RegBus] add2_res = add2_in1 + add2_in2;//加法器2结果
//乘法器
reg signed[32:0] mul_in1,mul_in1r;//乘法器有符号33位输入1
reg signed[32:0] mul_in2,mul_in2r;//乘法器有符号33位输入2
wire signed[65:0]mul_res;//乘法器有符号66位结果
`ifdef SGCY_MUL
assign mul_res=mul_in1*mul_in2;
`else 
assign mul_res=mul_in1r*mul_in2r;
always @(posedge clk) begin
    mul_in1r <= mul_in1;
    mul_in2r <= mul_in2;
end
`endif

wire [`RegBus]mul_resl=mul_res[31: 0];//乘法器低32位结果
wire [`RegBus]mul_resh=mul_res[63:32];//乘法器高32位结果
//比较器r，(in1 >= in2) ? 1 : 0
reg [`RegBus] opr_in1;//比较器输入1
reg [`RegBus] opr_in2;//比较器输入2
wire opr_sres = $signed(opr_in1) >= $signed(opr_in2);//有符号数比较，in1 >= in2
wire opr_ures = opr_in1 >= opr_in2;// 无符号数比较，in1 >= in2
wire opr_eres = (opr_in1 == opr_in2);//相等
//比较器i，(in1 >= in2) ? 1 : 0
reg [`RegBus] opi_in1;//比较器输入1
reg [`RegBus] opi_in2;//比较器输入2
wire opi_sres = $signed(opi_in1) >= $signed(opi_in2);//有符号数比较，in1 >= in2
wire opi_ures = opi_in1 >= opi_in2;// 无符号数比较，in1 >= in2
//PC+4
wire [`InstAddrBus] pc_n4 = pc_i + 4;
//PC+imm12b
wire [`InstAddrBus] pc_n12b = pc_i + imm12b;

// 执行
always @ (*) begin
    //外部接口
    dividend_o = reg_rdata1_i;     //被除数直连
    divisor_o = reg_rdata2_i;      //除数直连
    div_op_o = funct3;       //除法指令直连
    div_start_o = 0;    //除法运算开始标志
    reg_wdata_o = {32{1'bx}};    //写寄存器数据
    reg_we_o = 0;       //是否要写通用寄存器
    reg_waddr_o = {5{1'bx}};    //写通用寄存器地址
    csr_wdata_o = {32{1'bx}};    //写CSR寄存器数据
    csr_we_o = 0;       //写CSR寄存器请求
    csr_addr_o = {12{1'bx}};     //访问CSR寄存器地址
    mem_wdata_o = {32{1'bx}};    //写内存数据
    mem_addr_o = {32{1'bx}};     //访问内存地址，复用读
    mem_we_o = 0;       //写内存使能
    mem_wem_o = 4'h0;   //写内存掩码
    mem_en_o = 0;       //访问内存使能，复用读
    pc_n_o = 0;         //下一条指令地址
    ecall_o = 0;        //指令中断使能
    ebreak_o = 0;       //指令中断使能
    wfi_o = 0;          //中断等待使能
    inst_err_o = 0;     //指令出错
    idex_mret_o = 0;
    mult_inst_o = 0;    //当前为乘法指令
    //复用运算单元
    add1_in1 = {32{1'bx}};       //加法器1输入1
    add1_in2 = {32{1'bx}};       //加法器1输入2
    add2_in1 = {32{1'bx}};       //加法器2输入1
    add2_in2 = {32{1'bx}};       //加法器2输入2
    opr_in1 = reg_rdata1_i;   //比较器r输入1
    opr_in2 = reg_rdata2_i;   //比较器r输入2
    opi_in1 = reg_rdata1_i;   //比较器i输入1
    opi_in2 = imm12i;         //比较器i输入1
    //读寄存器
    reg_raddr1_o = inst_i[19:15];   //读rs1地址
    reg_raddr2_o = inst_i[24:20];   //读rs2地址
    case (opcode)
        `INST_TYPE_I: begin
            case (funct3)
                `INST_ADDI: begin//rs1+imm
                    add1_in1 = reg_rdata1_i;
                    add1_in2 = imm12i;
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    reg_wdata_o = add1_res;
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_SLTI: begin//有符号(rs1 < imm)?1:0
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    reg_wdata_o = {31'h0 , (~opi_sres)};
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_SLTIU: begin//无符号(rs1 < imm)?1:0
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    reg_wdata_o = {31'h0 , (~opi_ures)};
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_XORI: begin//rs1^imm
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    reg_wdata_o = reg_rdata1_i ^ imm12i;
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_ORI: begin//rs1|imm
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    reg_wdata_o = reg_rdata1_i | imm12i;

                    pc_n_o = pc_n4;//PC+4
                end
                `INST_ANDI: begin//rs1&imm
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    reg_wdata_o = reg_rdata1_i & imm12i;
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_SLLI: begin//左移
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    reg_wdata_o = reg_rdata1_i << imm12i[4:0];
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_SRI: begin//右移
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    if (inst_i[30] == 1'b1) begin//SRAI算术右移
                        reg_wdata_o = (reg_rdata1_i >> shamt) | ({32{reg_rdata1_i[31]}} & (~(32'hffffffff >> shamt)));
                    end else begin//SRLI普通右移
                        reg_wdata_o = reg_rdata1_i >> shamt;
                    end
                    pc_n_o = pc_n4;//PC+4
                end
                default: begin
                    inst_err_o = 1;     //指令出错
                end
            endcase
        end

        `INST_TYPE_R_M: begin
            case (funct7)
                7'b0000000: begin
                    case (funct3)
                        `INST_ADD: begin
                            add1_in1 = reg_rdata1_i;
                            add1_in2 = reg_rdata2_i;
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = add1_res;
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_SLL: begin//左移
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = reg_rdata1_i << reg_rdata2_i[4:0];
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_SLT: begin//有符号(rs1 < rs2)?1:0
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = {31'h0 , (~opr_sres)};
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_SLTU: begin//无符号(rs1 < rs2)?1:0
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = {31'h0 , (~opr_ures)};
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_XOR: begin//rs1^rs2
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = reg_rdata1_i ^ reg_rdata2_i;
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_SRL: begin//普通右移
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = reg_rdata1_i >> reg_rdata2_i[4:0];
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_OR: begin//rs1|rs2
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = reg_rdata1_i | reg_rdata2_i;
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_AND: begin//rs1&rs2
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = reg_rdata1_i & reg_rdata2_i;
                            pc_n_o = pc_n4;//PC+4
                        end
                        default: begin
                            inst_err_o = 1;     //指令出错
                        end
                    endcase
                end
                7'b0100000: begin
                    case (funct3)
                        `INST_SUB: begin
                            add1_in1 = reg_rdata1_i;
                            add1_in2 = reg_rdata2_i;
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = reg_rdata1_i - reg_rdata2_i;
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_SRA: begin//算术右移
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = (reg_rdata1_i >> reg_rdata2_i[4:0]) | ({32{reg_rdata1_i[31]}} & (~(32'hffffffff >> reg_rdata2_i[4:0])));
                            pc_n_o = pc_n4;//PC+4
                        end
                    endcase
                end
`ifdef RV32_M_ISA
                7'b0000001: begin
                    case (funct3)
                        `INST_MUL: begin//rs1*rs2的低32位
                            `ifdef SGCY_MUL
                            mult_inst_o = 0;
                            `else 
                            mult_inst_o = 1;
                            `endif
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = mul_resl;
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_MULHU: begin//无符号rs1*rs2的高32位
                            `ifdef SGCY_MUL
                            mult_inst_o = 0;
                            `else 
                            mult_inst_o = 1;
                            `endif
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = mul_resh;
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_MULH: begin//有符号rs1*rs2的高32位
                            `ifdef SGCY_MUL
                            mult_inst_o = 0;
                            `else 
                            mult_inst_o = 1;
                            `endif
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = mul_resh;
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_MULHSU: begin//有符号rs1*无符号rs2的高32位
                            `ifdef SGCY_MUL
                            mult_inst_o = 0;
                            `else 
                            mult_inst_o = 1;
                            `endif
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = mul_resh;
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_DIV: begin//除法，多周期，等结果
                            div_start_o = 1;
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = div_result_i;
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_DIVU: begin//除法，多周期，等结果
                            div_start_o = 1;
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = div_result_i;
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_REM: begin//除法，多周期，等结果
                            div_start_o = 1;
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = div_result_i;
                            pc_n_o = pc_n4;//PC+4
                        end
                        `INST_REMU: begin//除法，多周期，等结果
                            div_start_o = 1;
                            reg_we_o = 1;
                            reg_waddr_o = rd;
                            reg_wdata_o = div_result_i;
                            pc_n_o = pc_n4;//PC+4
                        end
                        default: begin
                            inst_err_o = 1;     //指令出错
                        end
                    endcase
                end
`endif
                default: inst_err_o = 1;     //指令出错
            endcase
        end

        `INST_TYPE_L: begin
            mem_addr_o = reg_rdata1_i + imm12i;//访问内存地址，复用读
            case (funct3)
                `INST_LB: begin//多周期，等数据
                    mem_we_o = 0;//写内存使能
                    mem_en_o = 1;//访问内存使能，复用读
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    case (mem_addr_o[1:0])
                        2'b00: begin
                            reg_wdata_o = {{24{mem_rdata_i[7]}}, mem_rdata_i[7:0]};//符号扩展
                        end
                        2'b01: begin
                            reg_wdata_o = {{24{mem_rdata_i[15]}}, mem_rdata_i[15:8]};
                        end
                        2'b10: begin
                            reg_wdata_o = {{24{mem_rdata_i[23]}}, mem_rdata_i[23:16]};
                        end
                        default: begin
                            reg_wdata_o = {{24{mem_rdata_i[31]}}, mem_rdata_i[31:24]};
                        end
                    endcase
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_LH: begin//多周期，等数据
                    mem_we_o = 0;//写内存使能
                    mem_en_o = 1;//访问内存使能，复用读
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    if (mem_addr_o[1:0] == 2'b0) begin
                        reg_wdata_o = {{16{mem_rdata_i[15]}}, mem_rdata_i[15:0]};
                    end else begin
                        reg_wdata_o = {{16{mem_rdata_i[31]}}, mem_rdata_i[31:16]};
                    end
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_LW: begin//多周期，等数据
                    mem_we_o = 0;//写内存使能
                    mem_en_o = 1;//访问内存使能，复用读
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    reg_wdata_o = mem_rdata_i;
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_LBU: begin//多周期，等数据
                    mem_we_o = 0;//写内存使能
                    mem_en_o = 1;//访问内存使能，复用读
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    case (mem_addr_o[1:0])
                        2'b00: begin
                            reg_wdata_o = {24'h0, mem_rdata_i[7:0]};//高位补0
                        end
                        2'b01: begin
                            reg_wdata_o = {24'h0, mem_rdata_i[15:8]};
                        end
                        2'b10: begin
                            reg_wdata_o = {24'h0, mem_rdata_i[23:16]};
                        end
                        default: begin
                            reg_wdata_o = {24'h0, mem_rdata_i[31:24]};
                        end
                    endcase
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_LHU: begin//多周期，等数据
                    mem_we_o = 0;//写内存使能
                    mem_en_o = 1;//访问内存使能，复用读
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    if (mem_addr_o[1:0] == 2'b0) begin
                        reg_wdata_o = {16'h0, mem_rdata_i[15:0]};
                    end else begin
                        reg_wdata_o = {16'h0, mem_rdata_i[31:16]};
                    end
                    pc_n_o = pc_n4;//PC+4
                end
                default: begin
                    inst_err_o = 1;     //指令出错
                end
            endcase
        end

        `INST_TYPE_S: begin
            mem_addr_o = reg_rdata1_i + imm12s;//访问内存地址，复用读
            case (funct3)
                `INST_SB: begin
                    mem_we_o = 1;//写内存使能
                    mem_en_o = 1;//访问内存使能，复用读
                    case (mem_addr_o[1:0])
                        2'b00: begin
                            mem_wdata_o = {24'h0, reg_rdata2_i[7:0]};
                            mem_wem_o = 4'b0001;   //写内存掩码
                        end
                        2'b01: begin
                            mem_wdata_o = {16'h0, reg_rdata2_i[7:0] , 8'h0};
                            mem_wem_o = 4'b0010;   //写内存掩码
                        end
                        2'b10: begin
                            mem_wdata_o = {8'h0, reg_rdata2_i[7:0] , 16'h0};
                            mem_wem_o = 4'b0100;   //写内存掩码
                        end
                        2'b11: begin
                            mem_wdata_o = {reg_rdata2_i[7:0] , 24'h0};
                            mem_wem_o = 4'b1000;   //写内存掩码
                        end
                    endcase
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_SH: begin
                    mem_we_o = 1;//写内存使能
                    mem_en_o = 1;//访问内存使能，复用读
                    if (mem_addr_o[1:0]==2'b00) begin
                            mem_wdata_o = {16'h0, reg_rdata2_i[15:0]};
                            mem_wem_o = 4'b0011;   //写内存掩码
                    end else begin
                            mem_wdata_o = {reg_rdata2_i[15:0],16'h0};
                            mem_wem_o = 4'b1100;   //写内存掩码
                    end
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_SW: begin
                    mem_we_o = 1;//写内存使能
                    mem_en_o = 1;//访问内存使能，复用读
                    mem_wdata_o = reg_rdata2_i;
                    mem_wem_o = 4'b1111;   //写内存掩码
                    pc_n_o = pc_n4;//PC+4
                end
                default: begin
                    inst_err_o = 1;     //指令出错
                end
            endcase
        end

        `INST_TYPE_B: begin
            case (funct3)
                `INST_BEQ: begin
                    pc_n_o = opr_eres? pc_n12b : pc_n4;
                end
                `INST_BNE: begin
                    pc_n_o = (~opr_eres)? pc_n12b : pc_n4;
                end
                `INST_BLT: begin
                    pc_n_o = (~opr_sres)? pc_n12b : pc_n4;
                end
                `INST_BGE: begin
                    pc_n_o = opr_sres? pc_n12b : pc_n4;
                end
                `INST_BLTU: begin
                    pc_n_o = (~opr_ures)? pc_n12b : pc_n4;
                end
                `INST_BGEU: begin
                    pc_n_o = opr_ures? pc_n12b : pc_n4;
                end
                default: begin
                    inst_err_o = 1;     //指令出错
                end
            endcase
        end
        `INST_JAL: begin
            add1_in1 = pc_i;
            add1_in2 = 4;
            reg_we_o = 1;
            reg_waddr_o = rd;
            reg_wdata_o = add1_res;//rd=pc+4
            add2_in1 = pc_i;
            add2_in2 = imm20j;
            pc_n_o = add2_res;//PC=pc+imm20j
        end
        `INST_JALR: begin
            add1_in1 = pc_i;
            add1_in2 = 4;
            reg_we_o = 1;
            reg_waddr_o = rd;
            reg_wdata_o = add1_res;//rd=pc+4
            add2_in1 = reg_rdata1_i;
            add2_in2 = imm12i;
            pc_n_o = add2_res;//PC=rs1+imm12i
        end
        `INST_LUI: begin//rd=imm<<12
            reg_we_o = 1;
            reg_waddr_o = rd;
            reg_wdata_o = imm20u;
            pc_n_o = pc_n4;//PC+4
        end
        `INST_AUIPC: begin//rd=PC+(imm<<12)
            reg_we_o = 1;
            reg_waddr_o = rd;
            add1_in1 = pc_i;
            add1_in2 = imm20u;
            reg_wdata_o = add1_res;
            pc_n_o = pc_n4;//PC+4
        end
        `INST_NOP_OP: begin
            pc_n_o = pc_n4;//PC+4
        end
        `INST_FENCE: begin
            pc_n_o = pc_n4;//PC+4
        end

        `INST_SYS: begin
            case (funct3)
                `INST_CSRRW: begin
                    csr_wdata_o = reg_rdata1_i;//CSR[imm]=rs1
                    csr_we_o = 1;       //写CSR寄存器请求
                    csr_addr_o = imm12i;    //访问CSR寄存器地址
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    reg_wdata_o = csr_rdata_i;//rd=CSR[imm]
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_CSRRS: begin
                    csr_wdata_o = reg_rdata1_i | csr_rdata_i;//CSR[imm]=rs1|CSR[imm]
                    csr_we_o = (reg_raddr1_o==5'h0)?0:1;       //写CSR寄存器请求
                    csr_addr_o = imm12i;    //访问CSR寄存器地址
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    reg_wdata_o = csr_rdata_i;//rd=CSR[imm]
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_CSRRC: begin
                    csr_wdata_o = (~reg_rdata1_i) & csr_rdata_i;//CSR[imm]=~rs1&CSR[imm]
                    csr_we_o = (reg_raddr1_o==5'h0)?0:1;       //写CSR寄存器请求
                    csr_addr_o = imm12i;    //访问CSR寄存器地址
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    reg_wdata_o = csr_rdata_i;//rd=CSR[imm]
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_CSRRWI: begin
                    csr_wdata_o = zimm;//CSR[imm]=zimm
                    csr_we_o = 1;       //写CSR寄存器请求
                    csr_addr_o = imm12i;    //访问CSR寄存器地址
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    reg_wdata_o = csr_rdata_i;//rd=CSR[imm]
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_CSRRSI: begin
                    csr_wdata_o = zimm | csr_rdata_i;//CSR[imm]=zimm|CSR[imm]
                    csr_we_o = (zimm[4:0]==5'h0)?0:1;       //写CSR寄存器请求
                    csr_addr_o = imm12i;    //访问CSR寄存器地址
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    reg_wdata_o = csr_rdata_i;//rd=CSR[imm]
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_CSRRCI: begin
                    csr_wdata_o = (~zimm) & csr_rdata_i;//CSR[imm]=~zimm&CSR[imm]
                    csr_we_o = (zimm[4:0]==5'h0)?0:1;       //写CSR寄存器请求
                    csr_addr_o = imm12i;    //访问CSR寄存器地址
                    reg_we_o = 1;
                    reg_waddr_o = rd;
                    reg_wdata_o = csr_rdata_i;//rd=CSR[imm]
                    pc_n_o = pc_n4;//PC+4
                end
                `INST_SI: begin
                    case (inst_i[31:15])
                        `INST_ECALL: begin
                            ecall_o = 1;
                            pc_n_o = pc_i;
                        end
                        `INST_EBREAK: begin
                            ebreak_o = 1;
                            pc_n_o = pc_i;
                        end
                        `INST_MRET: begin//中断返回
                            csr_wdata_o = {csr_rdata_i[31:8],1'b0,csr_rdata_i[6:4],csr_rdata_i[7],csr_rdata_i[2:0]};//MIE=MPIE,MPIE=0
                            csr_we_o = 1;       //写CSR寄存器请求
                            csr_addr_o = `CSR_MSTATUS;    //访问CSR mstatus
                            pc_n_o = mepc;
                            idex_mret_o = 1;
                        end
                        `INST_WFI: begin//等待中断
                            wfi_o = 1;
                            pc_n_o = pc_i;
                        end
                        default : inst_err_o = 1;     //指令出错
                    endcase
                end
                default: begin
                    inst_err_o = 1;     //指令出错
                end
            endcase
        end
        default: begin
            inst_err_o = 1;     //指令出错
        end
    endcase
end

always @(*) begin
    case (funct3)
`ifdef RV32_M_ISA
        `INST_MUL: begin//rs1*rs2的低32位
            mul_in1 = {reg_rdata1_i[31] , reg_rdata1_i};
            mul_in2 = {reg_rdata2_i[31] , reg_rdata2_i};
        end
        `INST_MULHU: begin//无符号rs1*rs2的高32位
            mul_in1 = {1'b0 , reg_rdata1_i};//符号位扩展
            mul_in2 = {1'b0 , reg_rdata2_i};//符号位扩展
        end
        `INST_MULH: begin//有符号rs1*rs2的高32位
            mul_in1 = {reg_rdata1_i[31] , reg_rdata1_i};
            mul_in2 = {reg_rdata2_i[31] , reg_rdata2_i};
        end
        `INST_MULHSU: begin//有符号rs1*无符号rs2的高32位
            mul_in1 = {reg_rdata1_i[31] , reg_rdata1_i};
            mul_in2 = {1'b0 , reg_rdata2_i};
        end 
`endif
        default: begin
            mul_in1 = 0;
            mul_in2 = 0;
        end
    endcase

end
endmodule
