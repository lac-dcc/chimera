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
`timescale 1ns / 100ps
//`default_nettype none
`define pr_err(msg) $display("Out-Chk: ERROR %s", msg);
`define pr(msg) $display("Out-Chk: INFO %s", msg);
`define pr_stat(msg, d) $display("Out-Chk: INFO %s: %d", msg, d);

module out_chk_rx (

    // Clks and resets
    input                    clk,
    input                    reset,
    input                    tx_dcm_locked,
    input                    rx_dcm_locked,

    // Rx AXIS
    input                    rx_axis_aresetn,
    input        [63:0]      rx_axis_tdata,
    input        [7:0]       rx_axis_tkeep,
    input                    rx_axis_tvalid,
    input                    rx_axis_tlast,
    input        [0:0]       rx_axis_tuser,

    // Sim info, stim_axis_tx
    input                    input_pkts_done,
    input        [63:0]      aborted_pkts,
    input        [63:0]      pushed_pkts,

    // Sim info, xgmii_connect
    input        [63:0]      pkts_detected,
    input        [63:0]      corrupted_pkts
    );

    `include "localparam.dat"
    `include "sim_stim.dat"
    `include "corr_pkt.dat"
    `include "disc_pkt.dat"

    localparam GOOD_PKT_CODE = 2'b11;
    localparam BAD_PKT_CODE = 2'b10;

    localparam MIN_BYTE_COUNT = 60;
    localparam WATCH_DOG_TIMEOUT = 100;

    localparam s0 = 8'b00000001;
    localparam s1 = 8'b00000010;
    localparam s2 = 8'b00000100;
    localparam s3 = 8'b00001000;
    localparam s4 = 8'b00010000;
    localparam s5 = 8'b00100000;
    localparam s6 = 8'b01000000;
    localparam s7 = 8'b10000000;

    //-------------------------------------------------------
    // Local rcv_pkts
    //-------------------------------------------------------
    reg          [63:0]      i, i_sof;
    integer                  aux;
    reg          [63:0]      good_pkts, bad_pkts;
    reg          [63:0]      pkt_idx_in;
    reg          [74:0]      dout[0:DATA_SIZE-1];
    reg          [1:0]       rcved_crc[0:PKT_COUNT-1];
    reg          [63:0]      byte_count;

    //-------------------------------------------------------
    // Local out_chk_rx
    //-------------------------------------------------------
    reg          [63:0]      out_fsm;
    reg          [63:0]      din_idx, dout_idx;
    reg          [63:0]      pkt_idx_out;
    reg          [63:0]      good_chked;
    reg          [63:0]      bad_chked;
    reg          [63:0]      watch_dog_timer;

    //-------------------------------------------------------
    // assigns
    //-------------------------------------------------------

    ////////////////////////////////////////////////
    // rcv_pkts
    ////////////////////////////////////////////////
    always @(posedge clk) begin
        if (reset || !tx_dcm_locked || !rx_dcm_locked || !rx_axis_aresetn) begin
            i <= 0;
            i_sof <= 0;
            pkt_idx_in <= 0;
            good_pkts = 0;
            bad_pkts = 0;
            byte_count = 0;
            for (aux = 0; aux < PKT_COUNT; aux = aux + 1) begin
                rcved_crc[aux] = 'b0;
            end
        end
        else begin
            if (rx_axis_tvalid) begin
                dout[i][0] = rx_axis_tvalid;
                dout[i][1] = rx_axis_tlast;
                dout[i][2] = rx_axis_tuser;
                dout[i][10:3] = rx_axis_tkeep;
                dout[i][74:11] = rx_axis_tdata;
                if (!is_tkeep_valid_val(dout[i])) begin
                    `pr_err("invalid tkeep")
                    $finish;
                end
                i <= i + 1;
                byte_count = calc_bytecount(dout[i], byte_count);
                if (rx_axis_tlast) begin
                    if (rx_axis_tuser[0]) begin // Good CRC
                        if (byte_count >= MIN_BYTE_COUNT) begin
                            byte_count = 0;
                            i_sof <= i + 1;
                            good_pkts = good_pkts + 1;
                            rcved_crc[pkt_idx_in] = GOOD_PKT_CODE;
                            pkt_idx_in <= pkt_idx_in + 1;
                            dout[i][74:11] = filter_tdata(dout[i]);
                        end
                        else begin
                            `pr_err("invalid frame size")
                            $finish;
                        end
                    end
                    else begin // bad crc
                        bad_pkts = bad_pkts + 1;
                        rcved_crc[pkt_idx_in] = BAD_PKT_CODE;
                        pkt_idx_in <= pkt_idx_in + 1;
                        i <= i_sof;
                    end
                end
            end
        end
    end

    ////////////////////////////////////////////////
    // out_chk_rx
    ////////////////////////////////////////////////
    always @(posedge clk) begin
        watch_dog_timer <= 'b0;

        if (reset || !tx_dcm_locked || !rx_dcm_locked || !rx_axis_aresetn) begin
            din_idx <= 0;
            dout_idx <= 0;
            pkt_idx_out <= 0;
            good_chked = 0;
            bad_chked = 0;
            out_fsm <= s0;
        end

        else begin

            case (out_fsm)

                s0 : begin
                    if (is_valid(din[din_idx])) begin
                        out_fsm <= s1;
                    end
                    else begin
                        if (din_idx >= DATA_SIZE) begin
                            out_fsm <= s1;
                        end
                        else begin
                            din_idx <= din_idx + 1;  // mind the gap
                        end
                    end
                end

                s1 : begin
                    if (pkt_idx_in > pkt_idx_out) begin // new pkt received
                        if (rcved_crc[pkt_idx_out] == GOOD_PKT_CODE) begin
                            if (corrupt_pkt[pkt_idx_out] || disc_pkt[pkt_idx_out]) begin
                                `pr_err("Expected BAD, received GOOD")
                                $finish;
                            end
                            else begin
                                out_fsm <= s2; // check that the received frame matches the input frame
                            end
                        end
                        else begin // a bad pkt was received
                            if (!corrupt_pkt[pkt_idx_out] && !disc_pkt[pkt_idx_out]) begin
                                `pr_err("Expected GOOD, received BAD")
                                $finish;
                            end
                            else begin
                                out_fsm <= s3; // skip input pkt
                            end
                        end
                    end
                    else if (pkt_idx_out == PKT_COUNT) begin
                        // sim finishes
                        if (bad_chked != (corrupted_pkts+aborted_pkts)) begin
                            `pr_err("Received BAD mismatches input BAD")
                            $finish;
                        end
                        else if (good_chked != (PKT_COUNT-bad_chked)) begin
                            `pr_err("Received GOOD mismatches input GOOD")
                            $finish;
                        end
                        else begin
                             out_fsm <= s4; // sim ok
                        end
                    end
                    else if (input_pkts_done) begin
                        watch_dog_timer <= watch_dog_timer + 1;
                        if (watch_dog_timer >= WATCH_DOG_TIMEOUT) begin
                            `pr_err("Sim hangs, not all pkts arrive")
                            $finish;
                        end
                    end
                end

                s2 : begin
                    if (is_valid(din[din_idx])) begin
                        if ((filter_tdata(din[din_idx]) == filter_tdata(dout[dout_idx])) &&
                            (get_tkeep(din[din_idx]) == get_tkeep(dout[dout_idx]))) begin
                            din_idx <= din_idx + 1;
                            dout_idx <= dout_idx + 1;
                            if (is_last(din[din_idx])) begin
                                if (is_last(dout[dout_idx])) begin
                                    good_chked = good_chked + 1;
                                    pkt_idx_out <= pkt_idx_out + 1;
                                    out_fsm <= s0;
                                end
                            end
                        end
                        else begin
                            `pr_err("Input and received pkt mismatches")
                            $finish;
                        end
                    end
                    else begin
                        `pr_err("Received pkt not valid")
                        $finish;
                    end
                end

                s3 : begin
                    if (is_valid(din[din_idx])) begin
                        din_idx <= din_idx + 1;
                        if (is_last(din[din_idx])) begin
                            bad_chked = bad_chked + 1;
                            pkt_idx_out <= pkt_idx_out + 1;
                            out_fsm <= s0;
                        end
                    end
                    else begin
                        bad_chked = bad_chked + 1;
                        pkt_idx_out <= pkt_idx_out + 1;
                        out_fsm <= s0;
                    end
                end

                s4 : begin
                    // sim ok
                    `pr_stat("Good frames received", good_chked)
                    `pr_stat("Bad frames received", bad_chked)
                    `pr("SIM OK")
                    $finish;
                end

            endcase
        end
    end

    ////////////////////////////////////////////////
    // get_tkeep
    ////////////////////////////////////////////////
    function [7:0] get_tkeep;
        input        [74:0]      d;
    begin
        get_tkeep = d[10:3];
    end
    endfunction

    ////////////////////////////////////////////////
    // get_tdata
    ////////////////////////////////////////////////
    function [7:0] get_tdata;
        input        [74:0]      d;
    begin
        get_tdata = d[74:11];
    end
    endfunction

    ////////////////////////////////////////////////
    // is_tkeep_valid_val
    ////////////////////////////////////////////////
    function is_tkeep_valid_val;
        input        [74:0]      d;
        integer                  i;
        reg                      flag;
        reg          [7:0]       tkeep;
        reg          [7:0]       ttest;
    begin
        flag = 0;
        tkeep = get_tkeep(d);
        ttest = 0;
        for (i = 0; i < 8; i = i + 1) begin
            ttest = {ttest[6:0], 1'b1};
            if (tkeep == ttest) begin
                flag = 1;
            end
        end

        is_tkeep_valid_val = flag;
    end
    endfunction

    ////////////////////////////////////////////////
    // calc_bytecount
    ////////////////////////////////////////////////
    function [63:0] calc_bytecount;
        input        [63:0]      d;
        input        [63:0]      byte_count;
        integer                  i;
        reg          [63:0]      aux;
        reg          [7:0]       tkeep;
    begin
        aux = 0;
        tkeep = get_tkeep(d);
        for (i = 0; i < 8; i = i + 1)
            if (tkeep[i])
                aux = aux + 1;

        calc_bytecount = byte_count + aux;
    end
    endfunction

    ////////////////////////////////////////////////
    // filter_tdata
    ////////////////////////////////////////////////
    function [63:0] filter_tdata;
        input        [74:0]      d;
        integer                  i;
        reg          [7:0]       tkeep;
        reg          [63:0]      tdata;
    begin
        tkeep = get_tkeep(d);
        tdata = get_tdata(d);
        case (tkeep)
            8'hFF: filter_tdata = tdata;
            8'h7F: filter_tdata = {8'b0, tdata[55:0]};
            8'h3F: filter_tdata = {16'b0, tdata[47:0]};
            8'h1F: filter_tdata = {24'b0, tdata[39:0]};
            8'h0F: filter_tdata = {32'b0, tdata[31:0]};
            8'h07: filter_tdata = {40'b0, tdata[23:0]};
            8'h03: filter_tdata = {48'b0, tdata[15:0]};
            8'h01: filter_tdata = {46'b0, tdata[7:0]};
        endcase
    end
    endfunction

    ////////////////////////////////////////////////
    // is_valid
    ////////////////////////////////////////////////
    function is_valid;
        input        [74:0]      d;
    begin
        if (d[0]) begin
            is_valid = 1'b1;
        end
        else begin
            is_valid = 1'b0;
        end
    end
    endfunction

    ////////////////////////////////////////////////
    // is_last
    ////////////////////////////////////////////////
    function is_last;
        input        [74:0]      d;
    begin
        if (d[1] && is_valid(d)) begin
            is_last = 1'b1;
        end
        else begin
            is_last = 1'b0;
        end
    end
    endfunction

endmodule // out_chk_rx

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////