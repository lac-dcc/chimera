// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : dma_defs.v
//Title       : 
//Created     : 1999
//Description : DMA defines
//----------------------------------------------------------------------
//   Copyright 1999-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

//Comment out depending on the no of channels in the DMA and
//The type buffers in dma channel whether circular or incremental
//`define one_channel 
//`define two_channel 
`define three_channel 


// defines for flow control mux
//
`define source0               2'b01
`define source1               2'b10
`define source2               2'b11

`define dest0                 2'b01
`define dest1                 2'b10
`define dest2                 2'b11

// HSIZE transfer size signal encoding
//
`define sz_byte               3'b000
`define sz_half               3'b001
`define sz_word               3'b010

// HTRANS transfer type signal encoding
//
`define trn_idle              2'b00
`define trn_busy              2'b01
`define trn_nonseq            2'b10
`define trn_seq               2'b11

// HRESP transfer response signal encoding
//
`define rsp_okay              2'b00
`define rsp_error             2'b01
`define rsp_retry             2'b10
`define rsp_split             2'b11

// tx and RX channel state machine encoding
//
`define idle                  5'b00000
`define wait_for_write        5'b00100
`define read_ahb_main         5'b00101
`define read_ahb_addr         5'b00110
`define read_ahb_data         5'b00111
`define read_apb_hold         5'b10001
`define read_apb_main         5'b10010
`define read_apb_data         5'b10011
`define apb_data_transfer     5'b10100
`define xfer_finish           5'b11111

`define write_ahb_start       5'b00001
`define write_ahb_staddr      5'b00010
`define write_ahb_stdata      5'b00100
`define read_handover         5'b00101
`define wait_for_read         5'b00110
`define write_ahb_main        5'b00111
`define write_ahb_addr        5'b01000
`define write_ahb_data        5'b01010
`define write_apb_main        5'b10001
`define write_apb_data        5'b10010
`define write_xfer_finish     5'b11111

// Arbiter defines
//
`define ch0_apb               2'b00
`define ch1_apb               2'b01
`define ch2_apb               2'b10
`define ch3_apb               2'b11

`define ch0_check             4'b0000
`define ch0_reqst             4'b0001
`define ch0_grant             4'b0010
`define ch1_check             4'b0011
`define ch1_reqst             4'b0100
`define ch1_grant             4'b0101
`define ch2_check             4'b0110
`define ch2_reqst             4'b0111
`define ch2_grant             4'b1000
`define ch3_check             4'b1001
`define ch3_reqst             4'b1010
`define ch3_grant             4'b1011

// APB mux defines
//
`define channel0              4'b1000
`define channel1              4'b0100
`define channel2              4'b0010
`define channel3              4'b0001

// AHB mux defines
//
`define ch0_selected          4'b0001
`define ch1_selected          4'b0010
`define ch2_selected          4'b0100
`define ch3_selected          4'b1000

// grant state machine encoding
//
`define not_granted           2'b00
`define initial_grant         2'b01
`define grant                 2'b10
`define final_grant           2'b11

// Xfer Sizes
//
`define xsiz_8                2'h0
`define xsiz_16               2'h1
`define xsiz_32               2'h2

// Register address map for the config block
//
`define ch0_taddr             16'h0000
`define ch0_saddr             16'h0004
`define ch0_buff              16'h0008
`define ch0_trans             16'h000C
`define ch0_flow              16'h0010
`define ch0_ctadd             16'h0014
`define ch0_csadd             16'h0018
`define ch0_pbuff             16'h001C

`define ch1_taddr             16'h0020
`define ch1_saddr             16'h0024
`define ch1_buff              16'h0028
`define ch1_trans             16'h002C
`define ch1_flow              16'h0030
`define ch1_ctadd             16'h0034
`define ch1_csadd             16'h0038
`define ch1_pbuff             16'h003C

`define ch2_taddr             16'h0040
`define ch2_saddr             16'h0044
`define ch2_buff              16'h0048
`define ch2_trans             16'h004C
`define ch2_flow              16'h0050
`define ch2_ctadd             16'h0054
`define ch2_csadd             16'h0058
`define ch2_pbuff             16'h005C

`define ch3_taddr             16'h0060
`define ch3_saddr             16'h0064
`define ch3_buff              16'h0068
`define ch3_trans             16'h006C
`define ch3_flow              16'h0070
`define ch3_ctadd             16'h0074
`define ch3_csadd             16'h0078
`define ch3_pbuff             16'h007C

`define int_mask_en           16'h0080
`define int_mask_dis          16'h0084
`define int_mask              16'h0088
`define int_status            16'h008C
