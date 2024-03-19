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

module  err_wc_reg_inst
    (
    clk,
    reset,
    cpu_data_out,
    cpu_data_in,
    cpu_addr,
    cpu_wr,
    its_addr,
    err_flag_in
    );

////////////////////////////////////////////////////////////////////////////////
//  parameter declear
////////////////////////////////////////////////////////////////////////////////
parameter       VLD_WIDTH   = 32;
parameter       ADDR_WIDTH  = 13;
localparam      UDLY        = 1;

////////////////////////////////////////////////////////////////////////////////
//  input and output declare
////////////////////////////////////////////////////////////////////////////////
input                       clk;
input                       reset;
output  [31:0]              cpu_data_out;
input   [31:0]              cpu_data_in;
input   [(ADDR_WIDTH-1):0]  cpu_addr;
input                       cpu_wr;
input   [(ADDR_WIDTH-1):0]  its_addr;
input   [(VLD_WIDTH-1):0]   err_flag_in;

////////////////////////////////////////////////////////////////////////////////
//  wire and reg declare
////////////////////////////////////////////////////////////////////////////////
wire                        clk;
wire                        reset;
wire    [31:0]              cpu_data_out;
wire    [31:0]              cpu_data_in;
wire    [(ADDR_WIDTH-1):0]  cpu_addr;
wire                        cpu_wr;
wire    [(ADDR_WIDTH-1):0]  its_addr;
wire    [(VLD_WIDTH-1):0]   err_flag_in;

wire                        addr_hit;
reg     [(VLD_WIDTH-1):0]   err_reg;
wire    [32:0]              temp_data;

////////////////////////////////////////////////////////////////////////////////
//  logic design begin
////////////////////////////////////////////////////////////////////////////////

//  address match
assign  addr_hit    = (cpu_addr == its_addr) ? 1'b1 : 1'b0;

always @ ( posedge clk or posedge reset )
    if( reset == 1'b1 )
        err_reg     <= #UDLY {VLD_WIDTH{1'b0}};
    else if((cpu_wr == 1'b1 ) & (addr_hit == 1'b1))
        err_reg     <= #UDLY ((~cpu_data_in) & err_reg) | err_flag_in;
    else
        err_reg     <= #UDLY err_reg | err_flag_in;

//  read
assign  temp_data   = { {(33-VLD_WIDTH){1'b0}},err_reg };

buft32 u_buft32
    (
    .q      ( cpu_data_out      ),
    .d      ( temp_data[31:0]   )
    );

endmodule
