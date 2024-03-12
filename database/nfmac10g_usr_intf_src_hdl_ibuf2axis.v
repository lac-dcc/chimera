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

module ibuf2axis # (
    parameter AW = 10,
    parameter DW = 72
    ) (

    input                    clk,
    input                    rst,

    // AXIS
    output reg   [63:0]      tdat,
    output reg   [7:0]       tkep,
    output reg               tval,
    output reg               tlst,
    input                    trdy,

    // mac2ibuf
    input        [AW:0]      committed_prod,
    output       [AW:0]      committed_cons,

    // ibuf
    output       [AW-1:0]    rd_addr,
    input        [DW-1:0]    rd_data
    );

    // localparam
    localparam s0  = 10'b0000000000;
    localparam s1  = 10'b0000000001;
    localparam s2  = 10'b0000000010;
    localparam s3  = 10'b0000000100;
    localparam s4  = 10'b0000001000;
    localparam s5  = 10'b0000010000;
    localparam s6  = 10'b0000100000;
    localparam s7  = 10'b0001000000;
    localparam s8  = 10'b0010000000;
    localparam s9  = 10'b0100000000;
    localparam s10 = 10'b1000000000;

    //-------------------------------------------------------
    // Local ibuf2axis
    //-------------------------------------------------------   
    reg          [9:0]       fsm;
    reg          [AW:0]      rd_addr_i;
    reg          [AW:0]      diff, diff_end;
    reg          [AW:0]      sof_addr;
    reg          [DW-1:0]    ax_rd_data, ax2_rd_data;
    reg          [AW:0]      cons;
    reg                      updt_sof;

    //-------------------------------------------------------
    // assigns
    //-------------------------------------------------------
    assign rd_addr = rd_addr_i;
    assign committed_cons = sof_addr;

    ////////////////////////////////////////////////
    // Inbound ethernet frame to axis
    ////////////////////////////////////////////////
    always @(posedge clk) begin

        diff <= committed_prod + (~sof_addr) + 1;
        diff_end <= committed_prod + (~cons);

        if (tval && trdy) begin
            cons <= cons + 1;
        end

        updt_sof <= 1'b0;
        if (updt_sof) begin
            sof_addr <= cons;
        end

        if (rst) begin  // rst
            tval <= 1'b0;
            fsm <= s0;
        end
        
        else begin  // not rst

            case (fsm)

                s0 : begin
                    cons <= 'b0;
                    sof_addr <= 'b0;
                    rd_addr_i <= 'b0;
                    fsm <= s1;
                end

                s1 : begin // update diff
                    fsm <= s2;
                end

                s2 : begin
                    if (diff) begin
                        rd_addr_i <= rd_addr_i + 1;
                        fsm <= s3;
                    end
                end

                s3 : begin
                    rd_addr_i <= rd_addr_i + 1;
                    fsm <= s4;
                end

                s4 : begin
                    tdat <= get_tdata(rd_data);
                    tkep <= get_tkeep(rd_data);
                    tlst <= get_tlast(rd_data);
                    tval <= 1'b1;
                    rd_addr_i <= rd_addr_i + 1;
                    fsm <= s5;
                end

                s5 : begin
                    rd_addr_i <= rd_addr_i + 1;
                    ax_rd_data <= rd_data;
                    if (trdy) begin
                        tdat <= get_tdata(rd_data);
                        tkep <= get_tkeep(rd_data);
                        tlst <= get_tlast(rd_data);
                        if (tlst) begin
                            updt_sof <= 1'b1;
                        end
                        if (tlst && !(diff_end > 1)) begin
                            tval <= 1'b0;
                            fsm <= s9;
                        end
                    end
                    else begin
                        rd_addr_i <= rd_addr_i;
                        fsm <= s6;
                    end
                end

                s6 : begin
                    ax2_rd_data <= rd_data;
                    if (trdy) begin
                        tdat <= get_tdata(ax_rd_data);
                        tkep <= get_tkeep(ax_rd_data);
                        tlst <= get_tlast(ax_rd_data);
                        rd_addr_i <= rd_addr_i + 1;
                        if (tlst) begin
                            updt_sof <= 1'b1;
                        end
                        if (tlst && !(diff_end > 1)) begin
                            tval <= 1'b0;
                            fsm <= s9;
                        end
                        else begin
                            fsm <= s8;
                        end
                    end
                    else begin
                        fsm <= s7;
                    end
                end

                s7 : begin
                    if (trdy) begin
                        tdat <= get_tdata(ax_rd_data);
                        tkep <= get_tkeep(ax_rd_data);
                        tlst <= get_tlast(ax_rd_data);
                        rd_addr_i <= rd_addr_i + 1;
                        if (tlst) begin
                            updt_sof <= 1'b1;
                        end
                        if (tlst && !(diff_end > 1)) begin
                            tval <= 1'b0;
                            fsm <= s9;
                        end
                        else begin
                            fsm <= s8;
                        end
                    end
                    else begin
                        fsm <= s10;
                    end
                end

                s8 : begin
                    if (trdy) begin
                        tdat <= get_tdata(ax2_rd_data);
                        tkep <= get_tkeep(ax2_rd_data);
                        tlst <= get_tlast(ax2_rd_data);
                        rd_addr_i <= rd_addr_i + 1;
                        if (tlst) begin
                            updt_sof <= 1'b1;
                        end
                        if (tlst && !(diff_end > 1)) begin
                            tval <= 1'b0;
                            fsm <= s9;
                        end
                        else begin
                            fsm <= s5;
                        end
                    end
                    else begin
                        ax_rd_data <= ax2_rd_data;
                        fsm <= s6;
                    end
                end

                s9 : begin
                    rd_addr_i <= cons;
                    fsm <= s1;
                end

                s10 : begin
                    if (trdy) begin
                        tval <= 1'b0;
                        if (tlst) begin
                            updt_sof <= 1'b1;
                        end
                        fsm <= s9;
                    end
                end

            endcase
        end     // not rst
    end  //always

    ////////////////////////////////////////////////
    // get_tdata
    ////////////////////////////////////////////////
    function [63:0] get_tdata (
        input        [DW-1:0]    din
        );
    begin
        get_tdata = din[DW-1:DW-64];
    end
    endfunction // get_tdata

    ////////////////////////////////////////////////
    // get_tkeep
    ////////////////////////////////////////////////
    function [7:0] get_tkeep (
        input        [DW-1:0]    din
        );
    begin
        get_tkeep = {din[8:1], 1'b1};
    end
    endfunction // get_tkeep

    ////////////////////////////////////////////////
    // get_tlast
    ////////////////////////////////////////////////
    function get_tlast (
        input        [DW-1:0]    din
        );
    begin
        get_tlast = din[0];
    end
    endfunction // get_tlast

endmodule // ibuf2axis

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////