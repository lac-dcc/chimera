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

module xge_sync_type0 # (
    parameter W = 32,
    parameter OUT_PRESET = 'b0
    ) (

    input                    clk_out,         // freq(clk_out) < freq(clk_in)
    input                    rst_out,

    input                    clk_in,
    input                    rst_in,

    input        [W-1:0]     in,
    output       [W-1:0]     out
    );

    // localparam
    localparam s0 = 9'b000000000;
    localparam s1 = 9'b000000001;
    localparam s2 = 9'b000000010;
    localparam s3 = 9'b000000100;
    localparam s4 = 9'b000001000;
    localparam s5 = 9'b000010000;
    localparam s6 = 9'b000100000;
    localparam s7 = 9'b001000000;
    localparam s8 = 9'b010000000;
    localparam s9 = 9'b100000000;

    //-------------------------------------------------------
    // Local a
    //-------------------------------------------------------
    reg          [8:0]       fsm_a;
    reg                      sync;
    reg          [W-1:0]     cross;

    //-------------------------------------------------------
    // Local b
    //-------------------------------------------------------
    reg          [8:0]       fsm_b;
    (* ASYNC_REG = "TRUE", SHREG_EXTRACT = "NO" *)reg sync_reg0;
    (* ASYNC_REG = "TRUE", SHREG_EXTRACT = "NO" *)reg sync_reg1;
    (* ASYNC_REG = "TRUE" *)reg [W-1:0] async;

    //-------------------------------------------------------
    // assigns
    //-------------------------------------------------------
    assign out = async;

    ////////////////////////////////////////////////
    // a
    ////////////////////////////////////////////////
    always @(posedge clk_in) begin

        if (rst_in) begin  // rst
            sync <= 1'b0;
            fsm_a <= s0;
        end
        
        else begin  // not rst

            sync <= 1'b0;

            case (fsm_a)

                s0 : fsm_a <= s1;

                s1 : begin
                    cross <= in;
                    fsm_a <= s2;
                end

                s2 : begin
                    sync <= 1'b1;
                    fsm_a <= s3;
                end

                s3 : begin
                    sync <= 1'b1;
                    fsm_a <= s4;
                end

                s4 : fsm_a <= s5;
                s5 : fsm_a <= s6;
                s6 : fsm_a <= s7;
                s7 : fsm_a <= s8;
                s8 : fsm_a <= s9;
                s9 : fsm_a <= s0;

            endcase
        end     // not rst
    end  //always

    ////////////////////////////////////////////////
    // b
    ////////////////////////////////////////////////
    always @(posedge clk_out) begin

        sync_reg0 <= sync;
        sync_reg1 <= sync_reg0;

        if (rst_out) begin  // rst
            fsm_b <= s0;
        end
        
        else begin  // not rst

            case (fsm_b)

                s0 : begin
                    sync_reg0 <= 1'b0;
                    sync_reg1 <= 1'b0;
                    async <= OUT_PRESET;
                    fsm_b <= s1;
                end

                s1 : begin
                    if (sync_reg1) begin
                        async <= cross;
                    end
                end

            endcase
        end     // not rst
    end  //always

endmodule // xge_sync_type0

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////