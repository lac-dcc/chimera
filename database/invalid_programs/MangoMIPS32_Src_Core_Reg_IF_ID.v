/********************MangoMIPS32*******************
Filename:   Reg_IF_ID.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

module Reg_IF_ID
(
    input  wire            clk,
    input  wire            rst,
    input  wire            stall,
    input  wire            flush,
    input  wire            clrslot,

    input  wire [`AddrBus] if_pc,
    input  wire [`AddrBus] if_pcp4,
    input  wire [`DataBus] if_inst,
    input  wire [`ExcBus ] if_excp,
    input  wire            id_isbranch,


    output reg  [`AddrBus] id_pc,
    output reg  [`AddrBus] id_pcp4,
    output reg  [`DataBus] id_inst,
    output reg  [`ExcBus ] id_excp,
    output reg             id_inslot,
    output reg             id_null
);

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            id_pc     <= `ZeroWord;
            id_pcp4   <= `ZeroWord;
            id_inst   <= `ZeroWord;
            id_excp   <= `Exc_NoExc;
            id_inslot <= `false;
            id_null   <= `true;
        end
        else begin
            casez ({flush, stall, clrslot})
                3'b1??, 3'b001: begin
                    id_pc     <= `ZeroWord;
                    id_pcp4   <= `ZeroWord;
                    id_inst   <= `ZeroWord;
                    id_excp   <= `Exc_NoExc;
                    id_inslot <= `false;
                    id_null   <= `true;
                end
                3'b000: begin
                    id_pc     <= if_pc;
                    id_pcp4   <= if_pcp4;
                    id_inst   <= if_inst;
                    id_excp   <= if_excp;
                    id_inslot <= id_isbranch;
                    id_null   <= `false;
                end
            endcase
        end
    end

endmodule