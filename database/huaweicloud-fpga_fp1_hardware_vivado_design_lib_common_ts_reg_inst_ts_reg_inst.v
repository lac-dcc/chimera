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

module  ts_reg_inst
    (
    clks,
    reset,

    cpu_data_in,
    cpu_data_out,
    cpu_addr,
    cpu_wr,
    its_addr
    );
////////////////////////////////////////////////////////////////////////////////
//  parameter declear
////////////////////////////////////////////////////////////////////////////////
parameter       ADDR_WIDTH  = 16;
localparam      UDLY        = 1;

////////////////////////////////////////////////////////////////////////////////
//  input and output declear
////////////////////////////////////////////////////////////////////////////////
input                       clks;
input                       reset;
input   [31:0]              cpu_data_in;
output  [31:0]              cpu_data_out;
input   [(ADDR_WIDTH-1):0]  cpu_addr;
input                       cpu_wr;
input   [(ADDR_WIDTH-1):0]  its_addr;

////////////////////////////////////////////////////////////////////////////////
//  wire and reg declear
////////////////////////////////////////////////////////////////////////////////
wire                        clks;
wire                        reset;
wire    [31:0]              cpu_data_in;
wire    [(ADDR_WIDTH-1):0]  cpu_addr;
wire                        cpu_wr;
wire    [(ADDR_WIDTH-1):0]  its_addr;

wire                        addr_hit;
wire    [31:0]              cpu_data_out;
reg     [31:0]              test_reg;

////////////////////////////////////////////////////////////////////////////////
//  logic design begin
////////////////////////////////////////////////////////////////////////////////

//  address match
assign  addr_hit    = (cpu_addr == its_addr) ? 1'b1 : 1'b0;

//  write
always @ ( posedge clks or posedge reset )
    if( reset == 1'b1 )
        test_reg    <= #UDLY 32'd0;
    else if( cpu_wr & addr_hit )
        test_reg    <= #UDLY (~cpu_data_in);

//  read
buft32 u_buft32
    (
    .q      ( cpu_data_out  ),
    .d      ( test_reg      )
    );

endmodule
