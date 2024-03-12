//
// Copyright (c) 2016 University of Cambridge All rights reserved.
//
// Author: Marco Forconesi
//
// This software was developed with the support of 
// Prof. Gustavo Sutter and Prof. Sergio Lopez-Buedo and
// University of Cambridge Computer Laboratory NetFPGA team.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA C.I.C. (NetFPGA) under one or more
// contributor license agreements.  See the NOTICE file distributed with this
// work for additional information regarding copyright ownership.  NetFPGA
// licenses this file to you under the NetFPGA Hardware-Software License,
// Version 1.0 (the "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at:
//
//   http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
//`default_nettype none

module xge_ibuf # (
    parameter  AW = 10,
    parameter  DW = 64
    ) ( 

    input      [AW-1:0]     a,
    input      [DW-1:0]     d,
    input      [AW-1:0]     dpra,
    input                   clk,
    input                   qdpo_clk,
    output reg [DW-1:0]     qdpo
    );

    //-------------------------------------------------------
    // Local port a
    //-------------------------------------------------------
    reg     [AW-1:0]     a_reg;
    reg     [DW-1:0]     d_reg;
    reg     [DW-1:0]     dpram[(2**AW)-1:0];

    //-------------------------------------------------------
    // Local port b
    //-------------------------------------------------------
    //reg     [AW-1:0]     dpra_reg;
    reg     [DW-1:0]     qdpo_reg;

    ////////////////////////////////////////////////
    // port a
    ////////////////////////////////////////////////
    always @(posedge clk) begin
        a_reg <= a;
        d_reg <= d;
        dpram[a_reg] <= d_reg;
    end  //always

    ////////////////////////////////////////////////
    // port b
    ////////////////////////////////////////////////
    always @(posedge qdpo_clk) begin
        qdpo_reg <= dpram[dpra];
        qdpo <= qdpo_reg;
    end  //always

endmodule // xge_ibuf

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////