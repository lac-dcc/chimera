/********************MangoMIPS32*******************
Filename:   ALU_EX.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

module ALU_EX
(
    input  wire [`AddrBus] pc,
    input  wire [`ALUOp  ] aluop,
    input  wire [`DataBus] opr1,
    input  wire [`DataBus] opr2,
    input  wire [`DataBus] offset,

    output reg             div_start,
    output reg             div_signed,
    input  wire            div_ready,

    output reg  [`DataBus] alures,
    output reg             resnrdy,
    output wire [`DWord  ] mulhi,
    output wire [`DWord  ] mullo,
    output reg             mul_s,

    output reg             m_en,
    output reg  [`ByteWEn] m_wen, 
    output reg  [`AddrBus] m_vaddr,
    output reg  [`DataBus] m_wdata,
    output reg  [`AXISize] m_size,
    input  wire            wreg,
    output reg  [`ByteWEn] wregsel,

    input  wire            llbit_i,
    output reg             llb_wen,
    output reg             llbit_o,

    input  wire            usermode,
    input  wire [`ExcBus ] excp_i,
    output reg  [`ExcBus ] excp_o,
    output reg  [`TLBOp  ] tlbop,

    output wire            stallreq
);

    assign stallreq = div_start;

    // Signs
    wire opr1_s = opr1[31];
    wire opr2_s = opr2[31];
    wire res_s  = alures[31]; 

    wire [`Word] abs_opr1 = opr1_s ? ~opr1 + 32'd1 : opr1;
    wire [`Word] abs_opr2 = opr2_s ? ~opr2 + 32'd1 : opr2;
    wire opr_lt  = $signed(opr1) < $signed(opr2);
    wire opr_ltu = opr1 < opr2;
    wire opr_eq  = (opr1 ^ opr2) == `ZeroWord;

    // CLO/CLZ
    reg  [`Word] clzopr;
    reg  [`Word] clzres;

    always @(*) begin
        case (aluop)
            `ALU_CLO:  clzopr <= ~opr1;
            `ALU_CLZ:  clzopr <= opr1;
            default:   clzopr <= `ZeroWord;
        endcase

        casez (clzopr)
            32'b00000000000000000000000000000000: clzres <= 32;
            32'b00000000000000000000000000000001: clzres <= 31;
            32'b0000000000000000000000000000001?: clzres <= 30;
            32'b000000000000000000000000000001??: clzres <= 29;
            32'b00000000000000000000000000001???: clzres <= 28;
            32'b0000000000000000000000000001????: clzres <= 27;
            32'b000000000000000000000000001?????: clzres <= 26;
            32'b00000000000000000000000001??????: clzres <= 25;
            32'b0000000000000000000000001???????: clzres <= 24;
            32'b000000000000000000000001????????: clzres <= 23;
            32'b00000000000000000000001?????????: clzres <= 22;
            32'b0000000000000000000001??????????: clzres <= 21;
            32'b000000000000000000001???????????: clzres <= 20;
            32'b00000000000000000001????????????: clzres <= 19;
            32'b0000000000000000001?????????????: clzres <= 18;
            32'b000000000000000001??????????????: clzres <= 17;
            32'b00000000000000001???????????????: clzres <= 16;
            32'b0000000000000001????????????????: clzres <= 15;
            32'b000000000000001?????????????????: clzres <= 14;
            32'b00000000000001??????????????????: clzres <= 13;
            32'b0000000000001???????????????????: clzres <= 12;
            32'b000000000001????????????????????: clzres <= 11;
            32'b00000000001?????????????????????: clzres <= 10;
            32'b0000000001??????????????????????: clzres <=  9;
            32'b000000001???????????????????????: clzres <=  8;
            32'b00000001????????????????????????: clzres <=  7;
            32'b0000001?????????????????????????: clzres <=  6;
            32'b000001??????????????????????????: clzres <=  5;
            32'b00001???????????????????????????: clzres <=  4;
            32'b0001????????????????????????????: clzres <=  3;
            32'b001?????????????????????????????: clzres <=  2;
            32'b01??????????????????????????????: clzres <=  1;
            32'b1???????????????????????????????: clzres <=  0;
        endcase
    end

    // Multiply first stage
    reg [`Word] mopr1, mopr2;

    always @(*) begin
        case (aluop)
            `ALU_MUL,
            `ALU_MULT,
            `ALU_MADD,
            `ALU_MSUB: begin
                mopr1   <= abs_opr1;
                mopr2   <= abs_opr2;
                mul_s   <= opr1_s ^ opr2_s;
            end

            `ALU_MULTU,
            `ALU_MADDU,
            `ALU_MSUBU: begin
                mopr1 <= opr1;
                mopr2 <= opr2;
                mul_s <= `Zero;
            end

            default: begin
                mopr1 <= `ZeroWord;
                mopr2 <= `ZeroWord;
                mul_s <= `Zero;
            end
        endcase
    end
    
    assign mullo[31: 0] = mopr1[15: 0] * mopr2[15: 0];
    assign mullo[63:32] = mopr1[31:16] * mopr2[15: 0];
    assign mulhi[31: 0] = mopr1[15: 0] * mopr2[31:16];
    assign mulhi[63:32] = mopr1[31:16] * mopr2[31:16]; 

    // Divider
    always @(*) begin
        case (aluop)
            `ALU_DIV: begin
                div_signed <= `true;
                div_start  <= !div_ready;
            end

            `ALU_DIVU: begin
                div_signed <= `false;
                div_start  <= !div_ready;
            end

            default: begin
                div_signed <= `false;
                div_start  <= `false;
            end
        endcase
    end

    // Memory Data Prepare
    wire [`AddrBus] sl_addr = opr1 + offset;
    reg  [`ByteWEn] sel_l, sel_r;
    reg             exc_ade;
    wire            exc_user = usermode & sl_addr[31];

    always @(*) begin
        m_en     <= `false;
        m_wen    <= `WrDisable;
        m_vaddr  <= `ZeroWord;
        m_wdata  <= `ZeroWord;
        m_size   <= `ASize_Word;
        wregsel  <= {4{wreg}};
        llb_wen  <= `false;
        llbit_o  <= llbit_i;
        exc_ade  <= `false;

        case (aluop)
            `ALU_CACHE:begin
                m_en    <= `true;
                m_vaddr <= sl_addr;
                exc_ade <= exc_user;
            end

            `ALU_LB,
            `ALU_LBU:begin
                m_en    <= `true;
                m_vaddr <= sl_addr;
                m_size  <= `ASize_Byte;
                exc_ade <= exc_user;
            end

            `ALU_LH,
            `ALU_LHU: begin
                m_en    <= `true;
                m_vaddr <= sl_addr;
                m_size  <= `ASize_Half;
                exc_ade <= exc_user || sl_addr[0];
            end

            `ALU_LW:  begin
                m_en    <= `true;
                m_vaddr <= sl_addr;
                exc_ade <= exc_user || (sl_addr[1:0] != 2'b00);
            end

            `ALU_LWL: begin
                m_en    <= `true;
                m_vaddr <= sl_addr;
                wregsel <= sel_l;
                exc_ade <= exc_user;
            end

            `ALU_LWR: begin
                m_en    <= `true;
                m_vaddr <= sl_addr;
                wregsel <= sel_r;
                exc_ade <= exc_user;
            end

            `ALU_SB: begin
                m_en    <= `true;
                m_vaddr <= sl_addr;
                m_wdata <= {4{opr2[7:0]}};
                m_size  <= `ASize_Byte;
                exc_ade <= exc_user;
                case (sl_addr[1:0])
                    2'b00: m_wen <= 4'b0001;
                    2'b01: m_wen <= 4'b0010;
                    2'b10: m_wen <= 4'b0100;
                    2'b11: m_wen <= 4'b1000;
                endcase
            end

            `ALU_SH: begin
                m_en    <= `true;
                m_vaddr <= sl_addr;
                m_wdata <= {2{opr2[15:0]}};
                m_size  <= `ASize_Half;
                exc_ade <= exc_user || sl_addr[0];
                m_wen   <= sl_addr[1] ? 4'b1100 : 4'b0011;
            end

            `ALU_SW:  begin
                m_en     <= `true;
                m_vaddr <= sl_addr;
                m_wdata <= opr2;
                m_wen   <= 4'b1111;
                exc_ade <= exc_user || (sl_addr[1:0] != 2'b00);
            end

            `ALU_SWL: begin
                m_en    <= `true;
                m_vaddr <= {sl_addr[31:2], 2'b00};
                exc_ade <= exc_user;
                case (sl_addr[1:0])
                    2'b00: begin
                        m_wen   <= 4'b0001;
                        m_wdata <= {24'b0, opr2[31:24]};
                    end
                    2'b01: begin
                        m_wen   <= 4'b0011;
                        m_wdata <= {16'b0, opr2[31:16]};
                    end
                    2'b10: begin
                        m_wen   <= 4'b0111;
                        m_wdata <= { 8'b0, opr2[31: 8]};
                    end
                    2'b11: begin
                        m_wen   <= 4'b1111;
                        m_wdata <= opr2;
                    end
                endcase
            end

            `ALU_SWR: begin
                m_en    <= `true;
                m_vaddr <= {sl_addr[31:2], 2'b00};
                exc_ade <= exc_user;
                case (sl_addr[1:0])
                    2'b00: begin
                        m_wen   <= 4'b1111;
                        m_wdata <= opr2;
                    end
                    2'b01: begin
                        m_wen   <= 4'b1110;
                        m_wdata <= {opr2[23:0],  8'b0};
                    end    
                    2'b10: begin
                        m_wen   <= 4'b1100;
                        m_wdata <= {opr2[15:0], 16'b0};
                    end
                    2'b11: begin
                        m_wen   <= 4'b1000;
                        m_wdata <= {opr2[ 7:0], 24'b0};
                    end
                endcase
            end

            `ALU_LL: begin
                m_en    <= `true;
                m_vaddr <= sl_addr;
                llb_wen <= `true;
                llbit_o <= `One;
                exc_ade <= exc_user || (sl_addr[1:0] != 2'b00);
            end

            `ALU_SC: if(llbit_i) begin
                m_en    <= `true;
                m_vaddr <= sl_addr;
                m_wdata <= opr2;
                m_wen   <= 4'b1111;
                exc_ade <= exc_user || (sl_addr[1:0] != 2'b00);
            end
        endcase

        case (sl_addr[1:0])
            2'b00: begin sel_l <= 4'b1000; sel_r <= 4'b1111; end
            2'b01: begin sel_l <= 4'b1100; sel_r <= 4'b0111; end
            2'b10: begin sel_l <= 4'b1110; sel_r <= 4'b0011; end
            2'b11: begin sel_l <= 4'b1111; sel_r <= 4'b0001; end
        endcase
    end

    // Exception
    reg exc_ov, exc_tr;

    always @(*) begin
        case (aluop)
            `ALU_ADD: exc_ov <= (opr1_s &  opr2_s & ~res_s) | (~opr1_s & ~opr2_s & res_s);
            `ALU_SUB: exc_ov <= (opr1_s & ~opr2_s & ~res_s) | (~opr1_s &  opr2_s & res_s);
            default:  exc_ov <= `false;
        endcase

        case (aluop)
            `ALU_TGE:  exc_tr <= ~opr_lt;
            `ALU_TGEU: exc_tr <= ~opr_ltu;
            `ALU_TLT:  exc_tr <= opr_lt;
            `ALU_TLTU: exc_tr <= opr_ltu;
            `ALU_TEQ:  exc_tr <= opr_eq;
            `ALU_TNE:  exc_tr <= ~opr_eq;
            default:   exc_tr <= `false;
        endcase

        case (aluop)
            `ALU_TLBR:  tlbop <= `TOP_TLBR;
            `ALU_TLBWI: tlbop <= `TOP_TLBWI;
            `ALU_TLBWR: tlbop <= `TOP_TLBWR;
            `ALU_TLBP:  tlbop <= `TOP_TLBP;
            default:    tlbop <= `TOP_NOP;
        endcase
    end

    always @(*) begin
        excp_o             <= excp_i;
        excp_o[`Exc_Ov   ] <= exc_ov;
        excp_o[`Exc_Trap ] <= exc_tr;
        excp_o[`Exc_D_AdE] <= exc_ade;
    end

    // General
    always @(*) begin
        case (aluop)
            `ALU_SLL:  alures <= opr2 << opr1[4:0];
            `ALU_SRL:  alures <= opr2 >> opr1[4:0];
            `ALU_SRA:  alures <= ($signed(opr2)) >>> opr1[4:0];
            `ALU_ADD,
            `ALU_ADDU: alures <= opr1 + opr2;
            `ALU_SUB,
            `ALU_SUBU: alures <= opr1 - opr2;
            `ALU_AND:  alures <= opr1 & opr2;
            `ALU_OR:   alures <= opr1 | opr2;
            `ALU_XOR:  alures <= opr1 ^ opr2;
            `ALU_NOR:  alures <= ~(opr1 | opr2);
            `ALU_SLT:  alures <= opr_lt;
            `ALU_SLTU: alures <= opr_ltu;
            `ALU_MOV,
            `ALU_MTHI,
            `ALU_MTLO: alures <= opr1;
            `ALU_CLO,
            `ALU_CLZ:  alures <= clzres;
            `ALU_BAL:  alures <= pc + 32'd8;
            `ALU_SC:   alures <= {31'b0, llbit_i};
            `ALU_MTC0: alures <= opr2;
            default:   alures <= `ZeroWord;
        endcase

        case (aluop)
            `ALU_LB,
            `ALU_LBU,
            `ALU_LH,
            `ALU_LHU,
            `ALU_LW,
            `ALU_LWL,
            `ALU_LWR,
            `ALU_LL,
            `ALU_MFHI,
            `ALU_MFLO,
            `ALU_MFC0,
            `ALU_MUL: resnrdy <= `true;
            default:  resnrdy <= `false;
        endcase
    end

endmodule