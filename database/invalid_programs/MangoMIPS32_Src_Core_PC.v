/********************MangoMIPS32*******************
Filename:   PC.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

module PC 
(
    input  wire            clk,
    input  wire            rst,
    input  wire            stall,
    input  wire            flush,
    input  wire [`AddrBus] flush_pc,
    input  wire            br_flag,
    input  wire [`AddrBus] br_addr,
    input  wire            usermode,
    input  wire            i_tlbr,
    input  wire            i_tlbi,
    
    output reg  [`AddrBus] pc,
    output wire [`AddrBus] pcp4,
    output reg  [`ExcBus ] excp,
    output reg             i_en
);

    assign pcp4 = pc + 32'd4;

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            pc   <= `ZeroWord;
            i_en <= `false;
        end
        else begin
            i_en <= `true;
            casez ({stall, br_flag, flush})
                3'b000: pc <= i_en ? pcp4 : `Reset_Entrance;
                3'b010: pc <= br_addr;
                3'b??1: pc <= flush_pc;
            endcase
        end
    end

    always @(*) begin
        excp <= 0;
        excp[`Exc_I_AdE ] <= (pc[1:0] != 2'b0) || (usermode && pc[31]);
        excp[`Exc_I_TLBR] <= i_tlbr;
        excp[`Exc_I_TLBI] <= i_tlbi;
    end

endmodule