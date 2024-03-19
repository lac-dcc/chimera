//
//------------------------------------------------------------------------------
//     Copyright (c) 2017 Huawei Technologies Co., Ltd. All Rights Reserved.
//
//     This program is free software; you can redistribute it and/or modify
//     it under the terms of the Huawei Software License (the "License").
//     A copy of the License is located in the "LICENSE" file accompanying 
//     this file.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//     Huawei Software License for more details. 
//------------------------------------------------------------------------------


module  cnt32_reg_inst
    (
    clks,
    reset,

    cpu_data_out,
    cpu_addr,
    its_addr,
    cnt_reg_inc,
    cnt_reg_clr
    );

////////////////////////////////////////////////////////////////////////////////
//  parameter declear
////////////////////////////////////////////////////////////////////////////////
localparam      UDLY         = 1;
parameter       ADDR_WIDTH   = 13;

////////////////////////////////////////////////////////////////////////////////
//  input and output declear
////////////////////////////////////////////////////////////////////////////////
input                       clks;
input                       reset;
output  [31:0]              cpu_data_out;
input   [(ADDR_WIDTH-1):0]  cpu_addr;
input   [(ADDR_WIDTH-1):0]  its_addr;
input                       cnt_reg_inc;
input                       cnt_reg_clr;

////////////////////////////////////////////////////////////////////////////////
//  wire and reg declear
////////////////////////////////////////////////////////////////////////////////
wire                        clks;
wire                        reset;
wire    [(ADDR_WIDTH-1):0]  cpu_addr;
wire    [(ADDR_WIDTH-1):0]  its_addr;
wire                        cnt_reg_inc;
wire                        cnt_reg_clr;

wire    [31:0]              dout;
wire    [31:0]              cpu_data_out;

////////////////////////////////////////////////////////////////////////////////
//  logic design begin
////////////////////////////////////////////////////////////////////////////////

//  counter inst
count32  u_count32
    (
    .a_clr      ( reset         ),
    .s_clr      ( cnt_reg_clr   ),
    .clk        ( clks          ),
    .en         ( cnt_reg_inc   ),
    .d          ( dout          )
    );

//  read high 16bit
buft32 u0_buft32
    (
    .q          ( cpu_data_out  ),
    .d          ( dout[31:0]    )
    );

endmodule
