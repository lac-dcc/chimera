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

module  rw_reg_inst
    (
    clks,
    reset,

    cpu_data_in,
    cpu_data_out,
    cpu_addr,
    cpu_wr,
    its_addr,
    dout
    );

////////////////////////////////////////////////////////////////////////////////
//  parameter declear
////////////////////////////////////////////////////////////////////////////////
parameter       VLD_WIDTH   = 32;
parameter       ADDR_WIDTH  = 13;
parameter       INIT_DATA   = 16'd0;
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
output  [(VLD_WIDTH-1):0]   dout;

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
reg     [(VLD_WIDTH-1):0]   rw_reg;
wire    [31:0]              cpu_data_out;
wire    [(VLD_WIDTH-1):0]   dout;
wire    [32:0]              temp_data;

////////////////////////////////////////////////////////////////////////////////
//  logic design begin
////////////////////////////////////////////////////////////////////////////////

//  address match
assign  addr_hit    = (cpu_addr == its_addr) ? 1'b1 : 1'b0;

//  write
always @ ( posedge clks or posedge reset )
    if( reset == 1'b1 )
        rw_reg  <= #UDLY INIT_DATA;
    else if( cpu_wr & addr_hit )
        rw_reg  <= #UDLY cpu_data_in[(VLD_WIDTH-1):0];

//  read
assign  temp_data   = { {(33-VLD_WIDTH){1'b0}},rw_reg };
buft32 u_buft32
    (
    .q      ( cpu_data_out      ),
    .d      ( temp_data[31:0]   )
    );

//  dout
assign  dout    = rw_reg;

endmodule
