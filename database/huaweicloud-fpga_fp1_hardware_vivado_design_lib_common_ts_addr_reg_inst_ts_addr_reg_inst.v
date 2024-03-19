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

module  ts_addr_reg_inst
    (
    clks,                    //  i  1
    reset,                   //  i  1

    cpu_data_out,            //  o  16
    cpu_addr,                //  i  15
    cpu_rd,                  //  i  1
    cpu_rd_dly1,             //  i  1

    its_addr                 //  i  15
    );
////////////////////////////////////////////////////////////////////////////////
//  parameter declear
////////////////////////////////////////////////////////////////////////////////
localparam      UDLY        = 1;
parameter       ADDR_WIDTH  = 16;

////////////////////////////////////////////////////////////////////////////////
//  input and output declear
////////////////////////////////////////////////////////////////////////////////
input                       clks;
input                       reset;
output  [31:0]              cpu_data_out;
input   [(ADDR_WIDTH-1):0]  cpu_addr;
input                       cpu_rd;
input                       cpu_rd_dly1;
input   [(ADDR_WIDTH-1):0]  its_addr;

////////////////////////////////////////////////////////////////////////////////
//  wire and reg declear
////////////////////////////////////////////////////////////////////////////////
wire                        clks;
wire                        reset;
wire    [31:0]              cpu_data_out;
wire    [(ADDR_WIDTH-1):0]  cpu_addr;
wire                        cpu_rd;
wire                        cpu_rd_dly1;
wire    [(ADDR_WIDTH-1):0]  its_addr;

wire                        rd_faise_edge;
wire                        addr_hit;
reg     [15:0]              test_reg;

////////////////////////////////////////////////////////////////////////////////
//  logic design begin
////////////////////////////////////////////////////////////////////////////////

//  address match
assign  addr_hit    = (cpu_addr == its_addr) ? 1'b1 : 1'b0;

//  read fall edge
assign  rd_faise_edge  = (~cpu_rd) & cpu_rd_dly1;

//  lock rd addr
//  when rd_fall_edge and cpu_addr not data_test_addr, not addr_test_addr
//  then lock cpu_addr
always @ ( posedge clks or posedge reset )
    if( reset == 1'b1 )
        test_reg <= #UDLY 16'd0;
    else if (rd_faise_edge & (~addr_hit))
        test_reg <= #UDLY ~cpu_addr;

//  read
buft32 u_buft32
    (
    .q      ( cpu_data_out        ),
    .d      ( {test_reg,test_reg} )
    );

endmodule
