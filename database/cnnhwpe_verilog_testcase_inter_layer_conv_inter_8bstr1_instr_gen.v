// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  instr_gen.v
// Module  name  :  instr_gen
// Created Time  :  2018/5/18 16:20:46
// Last Modified :  2018/5/19 20:51:49
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/18  chenhaoc
//
// ********************************************************

`include "hwpe_define.vh"
`define DLY 1
`timescale 1ns/10ps

module instr_gen();
integer instr_f;
integer Kernel_size;
integer Data_type;
integer Layer_type;
integer Kernel_333;
integer H;
integer W;
integer C;
integer K;
integer STRIDE;
integer N;
integer K_count ;
integer H_count ;
integer W_count ;
integer H_stride;
integer W_stride;
integer Conv_CH_count;
integer Conv_W_offset;
integer AccReg_shift;

reg [31:0] base_addr[0:7];
reg [6:0] funct7;
reg [6:0] opcode;
reg [4:0] rs1,rs2,rd;
reg xd,xs1,xs2;
wire [31:0] instr;
reg  [31:0] reset;
reg  [31:0] wcfg;
reg  [31:0] matrix;
reg  [31:0] cfg0,cfg1;
reg  [31:0] matrix_vrs1,matrix_vrs2;
integer row;
integer pe;
integer countH;
integer countW;
integer countK;

initial begin
    Kernel_size = 3;
    Data_type = 3;
    Layer_type = 0;
    Kernel_333 = 0;
    H = 10;
    W = 10;
    C = 32;
    K = 32;
    STRIDE = 1;
    N = 8;
    K_count  = K/16 ;
    H_count  = ((H-Kernel_size)/STRIDE+1)/4 ;
    W_count  = ((W-Kernel_size)/STRIDE+1)/2 ;
    H_stride = STRIDE*C*N/8;
    W_stride = H*C*STRIDE*N/8 ;
    Conv_CH_count = C*Kernel_size*N/64;
    Conv_W_offset = C*H*N/8;
    AccReg_shift = 24;

    base_addr[0]=0;
    // base_addr[1]=W_count*W_stride;
    base_addr[1]=`FMEM_ADDR2_START;
    base_addr[2]=H_count*H_stride;
    // base_addr[3]=W_count*W_stride+H_count*H_stride;
    base_addr[3]=`FMEM_ADDR2_START+H_count*H_stride;
    base_addr[4]=2*H_count*H_stride;
    // base_addr[5]=W_count*W_stride+2*H_count*H_stride;
    base_addr[5]=`FMEM_ADDR2_START+2*H_count*H_stride;
    base_addr[6]=3*H_count*H_stride;
    // base_addr[7]=W_count*W_stride+3*H_count*H_stride;
    base_addr[7]=`FMEM_ADDR2_START+3*H_count*H_stride;
    cfg0 = {Conv_W_offset[15:0],Conv_CH_count[15:0]};
    cfg1 = {9'b0,K_count[9:0],AccReg_shift[4:0],Kernel_333[0],
            Layer_type[0],Data_type[1:0],Kernel_size[3:0]};
    matrix_vrs1 = {W_count[15:0],H_count[15:0]};
    matrix_vrs2 = {W_stride[15:0],H_stride[15:0]};


    opcode = 7'b00_010_11;
    reset = {7'd64,5'b0,5'b0,3'b0,  5'b0,opcode};
    wcfg  = {7'd2, 5'b0,5'b0,3'b011,5'b0,opcode};
    matrix= {7'd4, 5'b0,5'b0,3'b011,5'b0,opcode};


    instr_f = $fopen("instr.txt");
    $fdisplay(instr_f,"%8h_%8h_%8h//reset",reset,0,0);
    $fdisplay(instr_f,"%8h_%8h_%8h//wcfg",wcfg,cfg0,cfg1);
    $fdisplay(instr_f,"%8h_%8h_%8h//wfad",wfad(0),base_addr[0],base_addr[1]);
    $fdisplay(instr_f,"%8h_%8h_%8h//wfad",wfad(2),base_addr[2],base_addr[3]);
    $fdisplay(instr_f,"%8h_%8h_%8h//wfad",wfad(4),base_addr[4],base_addr[5]);
    $fdisplay(instr_f,"%8h_%8h_%8h//wfad",wfad(6),base_addr[6],base_addr[7]);
    for(row=0;row<8;row=row+1)
        for(pe=0;pe<16;pe=pe+1)
            $fdisplay(instr_f,"%8h_%8h_%8h//wacc",wacc(row[4:0],pe[4:0]),0,0);
    $fdisplay(instr_f,"%8h_%8h_%8h//matrix",matrix,matrix_vrs1,matrix_vrs2);

    for(countK=0; countK<K_count; countK=countK+1)
        for(countW=0; countW<W_count; countW=countW+1)
            for(countH=0; countH<H_count; countH=countH+1)
                for(row=0;row<8;row=row+1)
                    for(pe=0;pe<16;pe=pe+1) begin
                        if(row==7&&pe==15&&~(countK==K_count-1&&countW==W_count-1&&countH==H_count-1))
                            $fdisplay(instr_f,"%8h_%8h_%8h//racc_en",racc({2'b10,row[2:0]},pe[4:0]),0,0);
                        else
                            $fdisplay(instr_f,"%8h_%8h_%8h//racc",racc(row[4:0],pe[4:0]),0,0);
                    end
    $fclose(instr_f);
    $stop;
end



assign instr[31:25] = funct7;
assign instr[24:20] = rs2;
assign instr[19:15] = rs1;
assign instr[11:7]  = rd;
assign instr[6:0]   = opcode;
assign instr[14]    = xd;
assign instr[13]    = xs1;
assign instr[12]    = xs2;



//funct7,rs2,rs1,xdxs1xs2,rd,opcode
function [31:0] wfad;
    input [4:0] addr_idx;
    begin
        wfad = {7'd1,5'b0,5'b0,3'b011,addr_idx,opcode};
    end
endfunction
//funct7,rs2,rs1,xdxs1xs2,rd,opcode
function [31:0] wacc;
    input [4:0] accreg_id;
    input [4:0] pe_id;
    begin
        wacc = {7'd8,pe_id,5'b0,3'b010,accreg_id,opcode};
    end
endfunction
//funct7,rs2,rs1,xdxs1xs2,rd,opcode
function [31:0] racc;
    input [4:0] accreg_id;
    input [4:0] pe_id;
    begin
        racc = {7'd16,pe_id,accreg_id,3'b100,5'b0,opcode};
    end
endfunction
//funct7,rs2,rs1,xdxs1xs2,rd,opcode
function [31:0] relu;
    input [4:0] accreg_id;
    begin
        relu = {7'd32,accreg_id,5'b0,3'b010,5'b0,opcode};
    end
endfunction
endmodule
