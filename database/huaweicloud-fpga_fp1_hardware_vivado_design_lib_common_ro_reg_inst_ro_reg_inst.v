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

module  ro_reg_inst
    (
    cpu_data_out,
    cpu_addr,
    its_addr,
    din
    );
////////////////////////////////////////////////////////////////////////////////
//  parameter declear
////////////////////////////////////////////////////////////////////////////////
parameter       VLD_WIDTH   = 32;
parameter       ADDR_WIDTH  = 13;
localparam      UDLY        = 1;

////////////////////////////////////////////////////////////////////////////////
//  input and output declear
////////////////////////////////////////////////////////////////////////////////
output  [31:0]              cpu_data_out;
input   [(ADDR_WIDTH-1):0]  cpu_addr;
input   [(ADDR_WIDTH-1):0]  its_addr;
input   [(VLD_WIDTH-1):0]   din;

////////////////////////////////////////////////////////////////////////////////
//  wire and reg declear
////////////////////////////////////////////////////////////////////////////////
wire    [(ADDR_WIDTH-1):0]  cpu_addr;
wire    [(ADDR_WIDTH-1):0]  its_addr;
wire    [(VLD_WIDTH-1):0]   din;

wire                        addr_hit;
wire    [31:0]              cpu_data_out;
wire    [32:0]              temp_data;

////////////////////////////////////////////////////////////////////////////////
//  logic design begin
////////////////////////////////////////////////////////////////////////////////

//  address match
assign  addr_hit    = (cpu_addr == its_addr) ? 1'b1 : 1'b0;

//  read
assign  temp_data   = { {(33-VLD_WIDTH){1'b0}},din };
buft32 u_buft32
    (
    .q      ( cpu_data_out      ),
    .d      ( temp_data[31:0]   )
    );

endmodule
