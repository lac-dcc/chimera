/********************MangoMIPS32*******************
Filename:   Reg_ID_EX.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

module Reg_ID_EX
(
    input  wire            clk,
    input  wire            rst,
    input  wire            stall,
    input  wire            flush,

    input  wire [`AddrBus] id_pc,
    input  wire [`ALUOp  ] id_aluop,
    input  wire [`CacheOp] id_cacheop,
    input  wire [`DataBus] id_opr1,
    input  wire [`DataBus] id_opr2,
    input  wire [`DataBus] id_offset,
    input  wire [`CP0Addr] id_cp0sel,
    input  wire            id_wreg,
    input  wire [`RegAddr] id_wraddr,
    input  wire [`ExcBus ] id_excp,
    input  wire [`CPNum  ] id_ecpnum,
    input  wire            id_inslot,
    input  wire            id_null,

    output reg  [`AddrBus] ex_pc,
    output reg  [`ALUOp  ] ex_aluop,
    output reg  [`CacheOp] ex_cacheop,
    output reg  [`DataBus] ex_opr1,
    output reg  [`DataBus] ex_opr2,
    output reg  [`DataBus] ex_offset,
    output reg  [`CP0Addr] ex_cp0sel,
    output reg             ex_wreg,
    output reg  [`RegAddr] ex_wraddr,
    output reg  [`ExcBus ] ex_excp,
    output reg  [`CPNum  ] ex_ecpnum,
    output reg             ex_inslot,
    output reg             ex_null
);

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            ex_pc      <= `ZeroWord;
            ex_aluop   <= `ALU_NOP;
            ex_cacheop <= `COP_NOP;
            ex_opr1    <= `ZeroWord;
            ex_opr2    <= `ZeroWord;
            ex_offset  <= `ZeroWord;
            ex_cp0sel  <= `CP0_ZeroReg;
            ex_wreg    <= `false;
            ex_wraddr  <= `ZeroReg;
            ex_excp    <= `Exc_NoExc;
            ex_ecpnum  <= `CP0;
            ex_inslot  <= `false;
            ex_null    <= `true;
        end
        else begin
            case ({flush, stall})
                2'b10, 2'b11: begin
                    ex_pc      <= `ZeroWord;
                    ex_aluop   <= `ALU_NOP;
                    ex_cacheop <= `COP_NOP;
                    ex_opr1    <= `ZeroWord;
                    ex_opr2    <= `ZeroWord;
                    ex_offset  <= `ZeroWord;
                    ex_cp0sel  <= `CP0_ZeroReg;
                    ex_wreg    <= `false;
                    ex_wraddr  <= `ZeroReg;
                    ex_excp    <= `Exc_NoExc;
                    ex_ecpnum  <= `CP0;
                    ex_inslot  <= `false;
                    ex_null    <= `true;
                end
                2'b00: begin
                    ex_pc      <= id_pc;
                    ex_aluop   <= id_aluop;
                    ex_cacheop <= id_cacheop;
                    ex_opr1    <= id_opr1;
                    ex_opr2    <= id_opr2;
                    ex_offset  <= id_offset;
                    ex_cp0sel  <= id_cp0sel;
                    ex_wreg    <= id_wreg;
                    ex_wraddr  <= id_wraddr;
                    ex_excp    <= id_excp;
                    ex_ecpnum  <= id_ecpnum;
                    ex_inslot  <= id_inslot;
                    ex_null    <= id_null;
                end
            endcase
        end
    end

endmodule