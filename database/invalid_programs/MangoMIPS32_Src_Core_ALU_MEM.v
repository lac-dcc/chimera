/********************MangoMIPS32*******************
Filename:   ALU_MEM.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

module ALU_MEM
(
    input  wire [`ALUOp  ] aluop,
    input  wire [`DataBus] alures_i,
    input  wire [`DWord  ] mulhi,
    input  wire [`DWord  ] mullo,
    input  wire            mul_s,
    input  wire [`DWord  ] divres,
    input  wire [`DWord  ] hilo_i,
    input  wire [`CP0Addr] cp0sel,
    input  wire            exc_flag,

    output reg  [`DataBus] alures_o,
    output wire [`DataBus] mulres,
    output reg             hilo_wen,
    output reg  [`DWord  ] hilo_o,
    output reg             cp0_wen,
    output reg  [`CP0Addr] cp0_addr,
    output reg  [`DataBus] cp0_wdata,
    input  wire [`DataBus] cp0_rdata,
    output reg             resnrdy
);
    
    wire [47: 0 ] reslo = mullo[31:0] + (mullo[63:32] << 16);
    wire [47: 0 ] reshi = mulhi[31:0] + (mulhi[63:32] << 16);
    wire [`DWord] umres = reslo + (reshi << 16);
    wire [`DWord] smres = mul_s ? ~umres + 64'b1 : umres;

    assign mulres = smres;

    always @(*) begin
        alures_o  <= alures_i;
        cp0_addr  <= `CP0_ZeroReg;
        cp0_wen   <= `false;
        cp0_wdata <= `ZeroWord;

        case (aluop)
            `ALU_MFHI: alures_o <= hilo_i[`Hi];
            `ALU_MFLO: alures_o <= hilo_i[`Lo];

            `ALU_MFC0: begin
                cp0_addr <= cp0sel;
                alures_o <= cp0_rdata;
            end

            `ALU_MTC0: begin
                cp0_addr  <= cp0sel;
                cp0_wen   <= !exc_flag;
                cp0_wdata <= alures_i;
            end
        endcase

        case (aluop)
            `ALU_MTHI: begin
                hilo_wen <= `true;
                hilo_o   <= {alures_i, hilo_i[`Lo]};
            end

            `ALU_MTLO: begin
                hilo_wen <= `true;
                hilo_o   <= {hilo_i[`Hi], alures_i};
            end

            `ALU_MULT: begin
                hilo_wen <= `true;
                hilo_o   <= smres; 
            end

            `ALU_MULTU: begin
                hilo_wen <= `true;
                hilo_o   <= umres; 
            end

            `ALU_MADD: begin
                hilo_wen <= `true;
                hilo_o   <= hilo_i + smres; 
            end

            `ALU_MADDU: begin
                hilo_wen <= `true;
                hilo_o   <= hilo_i + umres; 
            end

            `ALU_MSUB: begin
                hilo_wen <= `true;
                hilo_o   <= hilo_i - smres; 
            end

            `ALU_MSUBU: begin
                hilo_wen <= `true;
                hilo_o   <= hilo_i - umres; 
            end

            `ALU_DIV,
            `ALU_DIVU: begin
                hilo_wen <= `true;
                hilo_o   <= divres;
            end

            default: begin
                hilo_wen <= `false;
                hilo_o   <= hilo_i;
            end
        endcase

        case (aluop)
            `ALU_MUL,
            `ALU_LB,
            `ALU_LBU,
            `ALU_LH,
            `ALU_LHU,
            `ALU_LW,
            `ALU_LWL,
            `ALU_LWR,
            `ALU_LL: resnrdy <= `true;
            default: resnrdy <= `false;
        endcase
    end

endmodule