/********************MangoMIPS32*******************
Filename:   Reg_EX_MEM.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

module Reg_EX_MEM
(
    input  wire            clk,
    input  wire            rst,
    input  wire            stall,
    input  wire            flush,

    input  wire [`AddrBus] ex_pc,
    input  wire [`ALUOp  ] ex_aluop, 
    input  wire [`CacheOp] ex_cacheop,
    input  wire [`DataBus] ex_alures,
    input  wire [`DWord  ] ex_mulhi,
    input  wire [`DWord  ] ex_mullo,
    input  wire            ex_mul_s,
    input  wire [`DWord  ] ex_divres,
    input  wire [`CP0Addr] ex_cp0sel,
    input  wire            ex_m_en,
    input  wire [`ByteWEn] ex_m_wen,
    input  wire [`AddrBus] ex_m_vaddr,
    input  wire [`DataBus] ex_m_wdata,
    input  wire [`AXISize] ex_m_size,
    input  wire [`ByteWEn] ex_wreg,
    input  wire [`RegAddr] ex_wraddr,
    input  wire            ex_llb_wen,
    input  wire            ex_llbit,
    input  wire [`ExcBus ] ex_excp,
    input  wire [`CPNum  ] ex_ecpnum,
    input  wire [`TLBOp  ] ex_tlbop,
    input  wire            ex_inslot,
    input  wire            ex_null,
    
    output reg  [`AddrBus] mem_pc,
    output reg  [`ALUOp  ] mem_aluop, 
    output reg  [`CacheOp] mem_cacheop,
    output reg  [`DataBus] mem_alures,
    output reg  [`DWord  ] mem_mulhi,
    output reg  [`DWord  ] mem_mullo,
    output reg             mem_mul_s,
    output reg  [`DWord  ] mem_divres,
    output reg  [`CP0Addr] mem_cp0sel,
    output reg             mem_m_en,
    output reg  [`ByteWEn] mem_m_wen,
    output reg  [`AddrBus] mem_m_vaddr,
    output reg  [`DataBus] mem_m_wdata,
    output reg  [`AXISize] mem_m_size,
    output reg  [`ByteWEn] mem_wreg,
    output reg  [`RegAddr] mem_wraddr,
    output reg             mem_llb_wen,
    output reg             mem_llbit,
    output reg  [`ExcBus ] mem_excp,
    output reg  [`CPNum  ] mem_ecpnum,
    output reg  [`TLBOp  ] mem_tlbop,
    output reg             mem_inslot,
    output reg             mem_null
);

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            mem_pc      <= `ZeroWord;
            mem_aluop   <= `ALU_NOP;
            mem_cacheop <= `COP_NOP;
            mem_alures  <= `ZeroWord;
            mem_mulhi   <= `ZeroDWord;
            mem_mullo   <= `ZeroDWord;
            mem_mul_s   <= `Zero;
            mem_divres  <= `ZeroDWord;
            mem_cp0sel  <= `CP0_ZeroReg;
            mem_m_en    <= `false;
            mem_m_wen   <= `WrDisable;
            mem_m_vaddr <= `ZeroWord;
            mem_m_wdata <= `ZeroWord;
            mem_m_size  <= `ASize_Word;
            mem_wreg    <= `WrDisable;
            mem_wraddr  <= `ZeroReg;
            mem_llb_wen <= `false;
            mem_llbit   <= `Zero;
            mem_excp    <= `Exc_NoExc;
            mem_ecpnum  <= `CP0;
            mem_tlbop   <= `TOP_NOP;
            mem_inslot  <= `false;
            mem_null    <= `true;
        end
        else begin
            case ({flush, stall})
                2'b10, 2'b11: begin
                    mem_pc      <= `ZeroWord;
                    mem_aluop   <= `ALU_NOP;
                    mem_cacheop <= `COP_NOP;
                    mem_alures  <= `ZeroWord;
                    mem_mulhi   <= `ZeroDWord;
                    mem_mullo   <= `ZeroDWord;
                    mem_mul_s   <= `Zero;
                    mem_divres  <= `ZeroDWord;
                    mem_cp0sel  <= `CP0_ZeroReg;
                    mem_m_en    <= `false;
                    mem_m_wen   <= `WrDisable;
                    mem_m_vaddr <= `ZeroWord;
                    mem_m_wdata <= `ZeroWord;
                    mem_m_size  <= `ASize_Word;
                    mem_wreg    <= `WrDisable;
                    mem_wraddr  <= `ZeroReg;
                    mem_llb_wen <= `false;
                    mem_llbit   <= `Zero;
                    mem_excp    <= `Exc_NoExc;
                    mem_ecpnum  <= `CP0;
                    mem_tlbop   <= `TOP_NOP;
                    mem_inslot  <= `false;
                    mem_null    <= `true;
                end
                2'b00: begin
                    mem_pc      <= ex_pc;
                    mem_aluop   <= ex_aluop;
                    mem_cacheop <= ex_cacheop;
                    mem_alures  <= ex_alures;
                    mem_mulhi   <= ex_mulhi;
                    mem_mullo   <= ex_mullo;
                    mem_mul_s   <= ex_mul_s;
                    mem_divres  <= ex_divres;
                    mem_cp0sel  <= ex_cp0sel;
                    mem_m_en    <= ex_m_en;
                    mem_m_wen   <= ex_m_wen;
                    mem_m_vaddr <= ex_m_vaddr;
                    mem_m_wdata <= ex_m_wdata;
                    mem_m_size  <= ex_m_size;
                    mem_wreg    <= ex_wreg;
                    mem_wraddr  <= ex_wraddr;
                    mem_llb_wen <= ex_llb_wen;
                    mem_llbit   <= ex_llbit;
                    mem_excp    <= ex_excp;
                    mem_ecpnum  <= ex_ecpnum;
                    mem_tlbop   <= ex_tlbop;
                    mem_inslot  <= ex_inslot;
                    mem_null    <= ex_null;
                end
            endcase
        end
    end

endmodule