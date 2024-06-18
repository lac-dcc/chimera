// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : dma.v
//Title       : 
//Created     : 1999
//Description : DMA top level
//Notes       : The DMA will interface to both the Bridge and the AHB.  The DMA
//              control registers will be accessed via the AHB as they require 
//              32 bit accesses.
//              This module will instantiate each of the sub modules in the DMA.
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

`include   "dma_defs.v"             // DMA defines

//------------------------------------------------------------------------------
// Module Declaration
//------------------------------------------------------------------------------
//
module dma(
            hclk,                       // ahb system clock
            n_hreset,                    // ahb system reset
            // ahb interface slave signals 
            dma_hready,                 // hready output from slave
            dma_hresp,                  // hresp output from slave
            haddr,                      // input from master
            hsel,                       // input from master 
            htrans,                     // input from master
            hwrite,                     // input from master                
            hsize,                      // input from master
            hwdata,                     // input from master
            hburst,    // Burst type
            hprot,     // Protection control
            hmaster,   // Master select
            hmastlock, // Locked transfer
            hready_in,      // Transfer done

            dma_hrdata,                 // data output from slave
            // ahb interface master signals
            hrdata_dma,                 //
            hready_dma,
            hresp_dma,
            hgrant,
            dma_haddr,
            dma_htrans,
            dma_hwrite,
            dma_hsize,
            dma_hburst,
            dma_hprot,
            dma_hwdata,
            dma_hbusreq,
            dma_hlock,
            // apb interface master signals
            //pclk,
            //presetn,
            apb_request,
            dma_penable,
            dma_pwrite,
            dma_paddr,
            dma_pwdata,
            prdata,
            pready,
            // channel control lines
            data_av0,
            slot_av0,
            word_av0,
            data_av1,
            slot_av1,
            word_av1,
            data_av2,
            slot_av2,
            word_av2,
            byte_access,
            double_clk,
            dma_int,
	  //scan signals
            scan_en,      // Scan enable pin
            scan_in,    // Scan input for first chain
	    scan_out
            );

//==========================
// input/output declarations
//==========================

  input             hclk; //ahb clock
  input             n_hreset;//ahb reset
  output            dma_int;//dma interrupt output
// ahb interface slave signals
  input    [31:0]   haddr;  //ahb adress bus from mux
  input             hsel;   //dma select from decoder
  input     [1:0]   htrans; //ahb transfer type from mux
  input             hwrite; //ahb write enable from mux
  input     [2:0]   hsize;  //ahb transfer size from mux
  input    [31:0]   hwdata; //ahb write data bus from mux
  input     [2:0]   hburst;    // Burst type
  input     [3:0]   hprot;     // Protection control
  input     [3:0]   hmaster;   // Master select
  input             hmastlock; // Locked transfer
  input             hready_in;      // Transfer done
  output            dma_hready;//hready from dma to mux
  output    [1:0]   dma_hresp; //response from dma to mux
  output   [31:0]   dma_hrdata;//dma read data to mux
// ahb interface master signals
  input    [31:0]   hrdata_dma;//read data from mux to dma
  input             hready_dma;//ready signal from mux to dma
  input     [1:0]   hresp_dma; //response signal from mux to dma
  input             hgrant;    //bus grant from the arbiter
  output   [31:0]   dma_haddr; //dma ahb address bus
  output    [1:0]   dma_htrans;//dma ahb transfer type
  output            dma_hwrite;//dma ahb write enable
  output    [2:0]   dma_hsize; //dma ahb transfer size
  output    [2:0]   dma_hburst;//dma ahb burst type
  output    [3:0]   dma_hprot; //dma ahb protected transfer signal
  output   [31:0]   dma_hwdata;//dma ahb write data bus
  output            dma_hbusreq;//dma ahb bus request signal to arbiter
  output            dma_hlock;  //dma ahb locked transfer
// apb interface master signals
  //input             pclk;       //apb clock
  //input             presetn;    //apb reset
  output            apb_request;//dma apb request to bridge
  input    [15:0]   prdata;     //read data bus from apb mux
  input             pready;     //ready signal from apb mux
  output            dma_penable;//dma apb enable signal
  output            dma_pwrite; //dma apb write enable
  output   [19:0]   dma_paddr;  //dma apb address bus
  output   [15:0]   dma_pwdata; //dma apb write data bus
// channel controllines
  output            byte_access;//byte access output from dma
  input             double_clk;//ahb clk is twice freq of apb clk
  input             data_av0;//flow control input from uart 0
  input             slot_av0;//flow control input from uart 0
  input             word_av0;//flow control input from uart 0
  input             data_av1;//flow control input from uart 1
  input             slot_av1;//flow control input from uart 1
  input             word_av1;//flow control input from uart 1
  input             data_av2;//flow control input from uart 2
  input             slot_av2;//flow control input from uart 2
  input             word_av2;//flow control input from uart 2

//scan signals
  input             scan_en;    // Scan enable pin
  input             scan_in;  // Scan input for first chain
  output            scan_out;   // Scan out for chain 1

//------------------------------------------------------------------------------
// if the DMA is NOT black boxed 
//------------------------------------------------------------------------------
`ifndef FV_KIT_BLACK_BOX_DMA 

//==================
// wire declarations
//==================

  wire              hclk;//ahb clock
  wire              n_hreset;//ahb reset
// ahb interface slave signals
  wire     [31:0]   haddr;
  wire              hsel;
  wire      [1:0]   htrans;
  wire              hwrite;
  wire      [2:0]   hsize;
  wire     [31:0]   hwdata;
  wire              dma_hready;
  wire      [1:0]   dma_hresp;
  wire     [31:0]   dma_hrdata;
// ahb interface master signals
  wire     [31:0]   hrdata_dma;
  wire              hready_dma;
  wire      [1:0]   hresp_dma;
  wire              hgrant;
  wire     [31:0]   dma_haddr;
  wire      [1:0]   dma_htrans;
  wire              dma_hwrite;
  wire      [2:0]   dma_hsize;
  wire      [2:0]   dma_hburst;
  wire      [3:0]   dma_hprot;
  wire     [31:0]   dma_hwdata;
  wire              dma_hbusreq;
  wire              dma_hlock;
// apb interface master signals
  //wire              pclk;
  //wire              presetn;
  wire              apb_request;
  wire     [15:0]   prdata;
  wire              pready;
  wire              dma_penable;
  wire              dma_pwrite;
  wire     [19:0]   dma_paddr;
  wire     [15:0]   dma_pwdata;
// channel control lines
  wire              apb_backoff;
  wire              byte_access;
  wire              double_clk;
// Flow control inputs APB only
  wire          data_av0;
  wire          slot_av0;
  wire          word_av0;
  wire          data_av1;
  wire          slot_av1;
  wire          word_av1;
  wire          data_av2;
  wire          slot_av2;
  wire          word_av2;

// interrupt status lines
  wire          dma_int;

`ifdef one_channel 
  wire    [1:0] int_mask;
  wire    [1:0] int_status;
//Binata
`else 
   `ifdef two_channel
   //`elseif two_channel 
     wire    [3:0] int_mask;
     wire    [3:0] int_status;
   `else 
      `ifdef three_channel
      //`elseif three_channel 
        wire    [5:0] int_mask;
        wire    [5:0] int_status; 
      `else  
        wire    [7:0] int_mask;  //interrupt mask register
        wire    [7:0] int_status;//interrupt status register
      `endif
   `endif
`endif

  wire          mask_en_sel;//mask enable strobe
  wire          mask_dis_sel;//mask disable strobe
  wire          int_sel;//interrupt status clear strobe

  wire   [31:0] write_data;//register write data

  wire          ahb_request;//channel ahb request
  wire          addr_drive;//address drive
  wire          data_drive;//data drive

  wire    [3:0] ahb_byte;//no. of ahb byte tranfer

//====================
// Channel connections
//====================

// Config register
  wire   [31:0] dma_tadd_ch0;//dma target address
  wire   [31:0] dma_sadd_ch0;//dma source address
  wire   [31:0] dma_buff_ch0;//dma buffer control
  wire   [31:0] dma_xfer_ch0;//dma transfer control
  wire   [31:0] dma_flow_ch0;//dma flow control
  wire   [31:0] taddr_ch0;//dma current target address
  wire   [31:0] saddr_ch0;//dma current source address
  wire   [31:0] buff_pos_ch0;//
  wire          ch0_taddr_sel;//dma target address write strobe
  wire          ch0_saddr_sel;//dma source address write strobe
  wire          ch0_buff_sel;//dma buffer control write strobe
  wire          ch0_trans_sel;//dma transfer control write strobe
  wire          ch0_flow_sel;//dma flow control write strobe
  wire          ch0_abort_sel;//dma abort strobe
  wire          ch0_pos_sel;//

  wire          ch0_ahb_req;//ahb request
  wire          ch0_apb_req;//apb request
  wire          ch0_apb_grant;//ch0 granted for apb 
  wire          ch0_ahb_grant;//ch0 granted for ahb
  wire   [31:0] ch0_haddr;//ahb address bus for ch0
  wire    [1:0] ch0_htrans;//ahb transfer type for ch0
  wire          ch0_hwrite;//ahb write for ch0
  wire    [2:0] ch0_hsize;//ahb size for ch0
  wire    [2:0] ch0_hburst;//ahb burst type for ch0
  wire    [3:0] ch0_hprot;//ch0 ahb protected transfer signal
  wire   [31:0] ch0_hwdata;//ch0 ahb write data bus
  wire   [31:0] hrdata_ch0;//read data from mux to ch0
  wire          ch0_penable;//apb enable signal for ch0
  wire          ch0_pwrite;//ch0 apb write enable
  wire   [19:0] ch0_paddr;//ch0 apb address bus
  wire   [15:0] ch0_pwdata;//ch0 apb write data bus
  wire          ch0_byte_access;//byte access for ch0
  wire   [15:0] prdata_ch0;//read data bus from apb mux
  wire          pready_ch0;//ready signal from apb mux
// Flow control inputs APB only
  wire          ch0_data_av;//flow control input from ch0
  wire          ch0_slot_av;//flow control input from ch0
  wire          ch0_word_av;//flow control input from ch0
// interrupt status lines
  wire          ch0_complete;//channel 0 transfer finished
  wire          ch0_abort;   //channel 0 transfer aborted

`ifdef one_channel
`else
// Config register
  wire   [31:0] dma_tadd_ch1;//dma target address
  wire   [31:0] dma_sadd_ch1;//dma source address
  wire   [31:0] dma_buff_ch1;//dma buffer control
  wire   [31:0] dma_xfer_ch1;//dma transfer control
  wire   [31:0] dma_flow_ch1;//dma flow control
  wire   [31:0] taddr_ch1;//dma current target address
  wire   [31:0] saddr_ch1;//dma current source address
  wire   [31:0] buff_pos_ch1;//
  wire          ch1_taddr_sel;//dma target address write strobe
  wire          ch1_saddr_sel;//dma source address write strobe
  wire          ch1_buff_sel;//dma buffer control write strobe
  wire          ch1_trans_sel;//dma transfer control write strobe
  wire          ch1_flow_sel;//dma flow control write strobe
  wire          ch1_abort_sel;//dma abort strobe
  wire          ch1_pos_sel;//

  wire          ch1_ahb_req;//ahb request
  wire          ch1_apb_req;//apb request
  wire          ch1_apb_grant;//ch1 granted for apb
  wire          ch1_ahb_grant;//ch1 granted for ahb
  wire   [31:0] ch1_haddr;//ahb address bus for ch1
  wire    [1:0] ch1_htrans;//ahb transfer type for ch1
  wire          ch1_hwrite;//ahb write for ch1
  wire    [2:0] ch1_hsize;//ahb size for ch1
  wire    [2:0] ch1_hburst;//ahb burst type for ch1
  wire    [3:0] ch1_hprot;//ch1 ahb protected transfer signal
  wire   [31:0] ch1_hwdata;//ch1 ahb write data bus
  wire   [31:0] hrdata_ch1;//read data from mux to ch1
  wire          ch1_penable;//apb enable signal for ch1
  wire          ch1_pwrite;//ch1 apb write enable
  wire   [19:0] ch1_paddr;//ch1 apb address bus
  wire   [15:0] ch1_pwdata;//ch1 apb write data bus
  wire          ch1_byte_access;//byte access for ch1
  wire   [15:0] prdata_ch1;//read data bus from apb mux
  wire          pready_ch1;//ready signal from apb mux
// Flow control inputs APB only
  wire          ch1_data_av;//flow control input from ch1
  wire          ch1_slot_av;//flow control input from ch1
  wire          ch1_word_av;//flow control input from ch1
// interrupt status lines
  wire          ch1_complete;//channel 0 transfer finished
  wire          ch1_abort;   //channel 0 transfer aborted

`ifdef two_channel
`else
// Config register
  wire   [31:0] dma_tadd_ch2;//dma target address
  wire   [31:0] dma_sadd_ch2;//dma source address
  wire   [31:0] dma_buff_ch2;//dma buffer control
  wire   [31:0] dma_xfer_ch2;//dma transfer control
  wire   [31:0] dma_flow_ch2;//dma flow control
  wire   [31:0] taddr_ch2;//dma current target address
  wire   [31:0] saddr_ch2;//dma current source address
  wire   [31:0] buff_pos_ch2;//
  wire          ch2_taddr_sel;//dma target address write strobe
  wire          ch2_saddr_sel;//dma source address write strobe
  wire          ch2_buff_sel;//dma buffer control write strobe
  wire          ch2_trans_sel;//dma transfer control write strobe
  wire          ch2_flow_sel;//dma flow control write strobe
  wire          ch2_abort_sel;//dma abort strobe
  wire          ch2_pos_sel;//

  wire          ch2_ahb_req;//ahb request
  wire          ch2_apb_req;//apb request
  wire          ch2_apb_grant;//ch2 granted for apb
  wire          ch2_ahb_grant;//ch2 granted for ahb
  wire   [31:0] ch2_haddr;//ahb address bus for ch2
  wire    [1:0] ch2_htrans;//ahb transfer type for ch2
  wire          ch2_hwrite;//ahb write for ch2
  wire    [2:0] ch2_hsize;//ahb size for ch2
  wire    [2:0] ch2_hburst;//ahb burst type for ch2
  wire    [3:0] ch2_hprot;//ch2 ahb protected transfer signal
  wire   [31:0] ch2_hwdata;//ch2 ahb write data bus
  wire   [31:0] hrdata_ch2;//read data from mux to ch2
  wire          ch2_penable;//apb enable signal for ch2
  wire          ch2_pwrite;//ch2 apb write enable
  wire   [19:0] ch2_paddr;//ch2 apb address bus
  wire   [15:0] ch2_pwdata;//ch2 apb write data bus
  wire          ch2_byte_access;//byte access for ch2
  wire   [15:0] prdata_ch2;//read data bus from apb mux
  wire          pready_ch2;//ready signal from apb mux
// Flow control inputs APB only
  wire          ch2_data_av;//flow control input from ch2
  wire          ch2_slot_av;//flow control input from ch2
  wire          ch2_word_av;//flow control input from ch2
// interrupt status lines
  wire          ch2_complete;//channel 0 transfer finished
  wire          ch2_abort;   //channel 0 transfer aborted

`ifdef three_channel
`else
// Config register
  wire   [31:0] dma_tadd_ch3;//dma target address
  wire   [31:0] dma_sadd_ch3;//dma source address
  wire   [31:0] dma_buff_ch3;//dma buffer control
  wire   [31:0] dma_xfer_ch3;//dma transfer control
  wire   [31:0] dma_flow_ch3;//dma flow control
  wire   [31:0] taddr_ch3;//dma current target address
  wire   [31:0] saddr_ch3;//dma current source address
  wire   [31:0] buff_pos_ch3;//
  wire          ch3_taddr_sel;//dma target address write strobe
  wire          ch3_saddr_sel;//dma source address write strobe
  wire          ch3_buff_sel;//dma buffer control write strobe
  wire          ch3_trans_sel;//dma transfer control write strobe
  wire          ch3_flow_sel;//dma flow control write strobe
  wire          ch3_abort_sel;//dma abort strobe
  wire          ch3_pos_sel;

  wire          ch3_ahb_req;//ahb request
  wire          ch3_apb_req;//apb request
  wire          ch3_apb_grant;//ch3 granted for apb
  wire          ch3_ahb_grant;//ch3 granted for ahb
  wire   [31:0] ch3_haddr;//ahb address bus for ch3
  wire    [1:0] ch3_htrans;//ahb transfer type for ch3
  wire          ch3_hwrite;//ahb write for ch3
  wire    [2:0] ch3_hsize;//ahb size for ch3
  wire    [2:0] ch3_hburst;//ahb burst type for ch3
  wire    [3:0] ch3_hprot;//ch3 ahb protected transfer signal
  wire   [31:0] ch3_hwdata;//ch3 ahb write data bus
  wire   [31:0] hrdata_ch3;//read data from mux to ch3
  wire          ch3_penable;//apb enable signal for ch3
  wire          ch3_pwrite;//ch3 apb write enable
  wire   [19:0] ch3_paddr;//ch3 apb address bus
  wire   [15:0] ch3_pwdata;//ch3 apb write data bus
  wire          ch3_byte_access;//byte access for ch3
  wire   [15:0] prdata_ch3;//read data bus from apb mux
  wire          pready_ch3;//ready signal from apb mux
// Flow control inputs APB only
  wire          ch3_data_av;//flow control input from ch3
  wire          ch3_slot_av;//flow control input from ch3
  wire          ch3_word_av;//flow control input from ch3
// interrupt status lines
  wire          ch3_complete;//channel 0 transfer finished
  wire          ch3_abort; //channel 0 transfer aborted
`endif
`endif
`endif  

//==========================
// sub-module instantiations
//==========================

dma_ahb_config i_udma_config(
        .hclk           (hclk),
        .n_hreset       (n_hreset),
        .haddr          (haddr[19:0]),
        .hsel           (hsel),
        .htrans         (htrans),
        .hwrite         (hwrite),
        .hsize          (hsize),
        .hwdata         (hwdata),
        .hready_in      (hready_dma),
        .hready_out     (dma_hready),
        .hresp          (dma_hresp),
        .hrdata         (dma_hrdata),
        .write_data     (write_data),
        .ahb_byte       (ahb_byte),
        // channel 0 registers
        .dma_tadd_ch0   (dma_tadd_ch0),
        .dma_sadd_ch0   (dma_sadd_ch0),
        .dma_buff_ch0   (dma_buff_ch0),
        .dma_xfer_ch0   (dma_xfer_ch0),
        .dma_flow_ch0   (dma_flow_ch0),
        .taddr_ch0      (taddr_ch0),
        .saddr_ch0      (saddr_ch0),
        .buff_pos_ch0   (buff_pos_ch0),
        .ch0_taddr_sel  (ch0_taddr_sel),
        .ch0_saddr_sel  (ch0_saddr_sel),
        .ch0_buff_sel   (ch0_buff_sel),
        .ch0_trans_sel  (ch0_trans_sel),
        .ch0_flow_sel   (ch0_flow_sel),
        .ch0_abort_sel  (ch0_abort_sel),
        .ch0_pos_sel    (ch0_pos_sel),
`ifdef one_channel
`else
        // channel 1 registers
        .dma_tadd_ch1   (dma_tadd_ch1),
        .dma_sadd_ch1   (dma_sadd_ch1),
        .dma_buff_ch1   (dma_buff_ch1),
        .dma_xfer_ch1   (dma_xfer_ch1),
        .dma_flow_ch1   (dma_flow_ch1),
        .taddr_ch1      (taddr_ch1),
        .saddr_ch1      (saddr_ch1),
        .buff_pos_ch1   (buff_pos_ch1),
        .ch1_taddr_sel  (ch1_taddr_sel),
        .ch1_saddr_sel  (ch1_saddr_sel),
        .ch1_buff_sel   (ch1_buff_sel),
        .ch1_trans_sel  (ch1_trans_sel),
        .ch1_flow_sel   (ch1_flow_sel),
        .ch1_abort_sel  (ch1_abort_sel),
        .ch1_pos_sel    (ch1_pos_sel),
`ifdef two_channel
`else
        // channel 2 registers
        .dma_tadd_ch2   (dma_tadd_ch2),
        .dma_sadd_ch2   (dma_sadd_ch2),
        .dma_buff_ch2   (dma_buff_ch2),
        .dma_xfer_ch2   (dma_xfer_ch2),
        .dma_flow_ch2   (dma_flow_ch2),
        .taddr_ch2      (taddr_ch2),
        .saddr_ch2      (saddr_ch2),
        .buff_pos_ch2   (buff_pos_ch2),
        .ch2_taddr_sel  (ch2_taddr_sel),
        .ch2_saddr_sel  (ch2_saddr_sel),
        .ch2_buff_sel   (ch2_buff_sel),
        .ch2_trans_sel  (ch2_trans_sel),
        .ch2_flow_sel   (ch2_flow_sel),
        .ch2_abort_sel  (ch2_abort_sel),
        .ch2_pos_sel    (ch2_pos_sel),
`ifdef three_channel
`else
        // channel 3 registers
        .dma_tadd_ch3   (dma_tadd_ch3),
        .dma_sadd_ch3   (dma_sadd_ch3),
        .dma_buff_ch3   (dma_buff_ch3),
        .dma_xfer_ch3   (dma_xfer_ch3),
        .dma_flow_ch3   (dma_flow_ch3),
        .taddr_ch3      (taddr_ch3),
        .saddr_ch3      (saddr_ch3),
        .buff_pos_ch3   (buff_pos_ch3),
        .ch3_taddr_sel  (ch3_taddr_sel),
        .ch3_saddr_sel  (ch3_saddr_sel),
        .ch3_buff_sel   (ch3_buff_sel),
        .ch3_trans_sel  (ch3_trans_sel),
        .ch3_flow_sel   (ch3_flow_sel),
        .ch3_abort_sel  (ch3_abort_sel),
        .ch3_pos_sel    (ch3_pos_sel),
`endif
`endif
`endif
        // interrupt control registers
        .int_status     (int_status),
        .int_mask       (int_mask),
        .mask_en_sel    (mask_en_sel),
        .mask_dis_sel   (mask_dis_sel),
        .int_sel        (int_sel)
        );

dma_int_control i_udma_int_control(
        .hclk           (hclk),                       
        .n_hreset        (n_hreset),                    
        // register control signals (4 registers)
        .ahb_byte       (ahb_byte[0]),
        .mask_en_sel    (mask_en_sel),     // write to mask enable
        .mask_dis_sel   (mask_dis_sel),    // write to mask disable
        .int_sel        (int_sel),         // read of status reg (read clear)
        .write_data     (write_data[7:0]),      // data for writes 
// (assume word accesses)

        // dma status inputs
        .ch0_complete   (ch0_complete),
        .ch0_abort      (ch0_abort),
`ifdef one_channel
`else
        .ch1_complete   (ch1_complete),
        .ch1_abort      (ch1_abort),
`ifdef two_channel
`else
        .ch2_complete   (ch2_complete),
        .ch2_abort      (ch2_abort),  
`ifdef three_channel
`else
        .ch3_complete   (ch3_complete),
        .ch3_abort      (ch3_abort), 
`endif
`endif
`endif 
        // register outputs
        .int_mask       (int_mask),
        .int_status     (int_status),
        // interrupt output
        .dma_int        (dma_int)
        );


dma_ahb_master i_udma_ahb_ctrl(
        .hclk           (hclk),
        .n_hreset        (n_hreset),
        .hready         (hready_dma),
        .hgrant         (hgrant),
        .hbusreq        (dma_hbusreq),
        .hlock          (dma_hlock),
        .ahb_request    (ahb_request),
        .addr_drive     (addr_drive),
        .data_drive     (data_drive)
        );

dma_arbiter i_udma_arbiter(
        .hclk           (hclk),
        .n_hreset       (n_hreset),
        .hgrant         (hgrant),
        .hready         (hready_dma),
        .pready         (pready),
        .apb_request    (apb_request),
        .apb_backoff    (apb_backoff),
        .ch0_ahb_req    (ch0_ahb_req),
        .ch0_apb_req    (ch0_apb_req),
        .ch0_apb_grant  (ch0_apb_grant),
        .ch0_ahb_grant  (ch0_ahb_grant),
`ifdef one_channel
`else
        .ch1_ahb_req    (ch1_ahb_req),
        .ch1_apb_req    (ch1_apb_req),
        .ch1_apb_grant  (ch1_apb_grant),
        .ch1_ahb_grant  (ch1_ahb_grant),
`ifdef two_channel
`else
        .ch2_ahb_req    (ch2_ahb_req),
        .ch2_apb_req    (ch2_apb_req),
        .ch2_apb_grant  (ch2_apb_grant),
        .ch2_ahb_grant  (ch2_ahb_grant),
`ifdef three_channel
`else
        .ch3_ahb_req    (ch3_ahb_req),
        .ch3_apb_req    (ch3_apb_req),
        .ch3_apb_grant  (ch3_apb_grant),
        .ch3_ahb_grant  (ch3_ahb_grant),
`endif
`endif
`endif
        .ahb_request    (ahb_request),
        .addr_drive     (addr_drive),
        .data_drive     (data_drive)
        );

dma_apb_mux i_udma_apb_mux(
        //.hclk           (hclk),     
        //.n_hreset        (n_hreset),  
        // apb interface master signals
        .dma_penable    (dma_penable),
        .dma_pwrite     (dma_pwrite),
        .dma_paddr      (dma_paddr),
        .dma_pwdata     (dma_pwdata),
        .byte_access    (byte_access),
        .prdata         (prdata),
        .pready         (pready),
`ifdef one_channel
`else
        // channel apb bus signals
        .ch1_penable    (ch1_penable),
        .ch1_pwrite     (ch1_pwrite),
        .ch1_paddr      (ch1_paddr),
        .ch1_pwdata     (ch1_pwdata),
        .ch1_byte_access(ch1_byte_access),
        .prdata_ch1     (prdata_ch1),
        .pready_ch1     (pready_ch1),
        // channel grant signal
        .ch1_apb_grant  (ch1_apb_grant),
`ifdef two_channel
`else
        // channel apb bus signals
        .ch2_penable    (ch2_penable),
        .ch2_pwrite     (ch2_pwrite),
        .ch2_paddr      (ch2_paddr),
        .ch2_pwdata     (ch2_pwdata),
        .ch2_byte_access(ch2_byte_access),
        .prdata_ch2     (prdata_ch2),
        .pready_ch2     (pready_ch2),
        // channel grant signal
        .ch2_apb_grant  (ch2_apb_grant),
`ifdef three_channel
`else
        // channel apb bus signals
        .ch3_penable    (ch3_penable),
        .ch3_pwrite     (ch3_pwrite),
        .ch3_paddr      (ch3_paddr),
        .ch3_pwdata     (ch3_pwdata),
        .ch3_byte_access(ch3_byte_access),
        .prdata_ch3     (prdata_ch3),
        .pready_ch3     (pready_ch3),
        // channel grant signal
        .ch3_apb_grant  (ch3_apb_grant),
`endif
`endif
`endif
        // channel apb bus signals
        .ch0_penable    (ch0_penable),
        .ch0_pwrite     (ch0_pwrite),
        .ch0_paddr      (ch0_paddr),
        .ch0_pwdata     (ch0_pwdata),
        .ch0_byte_access(ch0_byte_access),
        .prdata_ch0     (prdata_ch0),
        .pready_ch0     (pready_ch0),
        // channel grant signal
        .ch0_apb_grant  (ch0_apb_grant)
        );

dma_ahb_mux i_udma_ahb_mux(
        .hclk           (hclk),    
        .n_hreset       (n_hreset), 
        .hready_in      (hready_dma), 
        .haddr          (dma_haddr),
        .htrans         (dma_htrans),
        .hwrite         (dma_hwrite),
        .hsize          (dma_hsize),
        .hburst         (dma_hburst),
        .hprot          (dma_hprot),
        .hwdata         (dma_hwdata),
        .hrdata         (hrdata_dma),
        //.addr_drive     (addr_drive),
        //.data_drive     (data_drive),
`ifdef one_channel
`else
        // channel 1 connections
        .ch1_ahb_grant  (ch1_ahb_grant),
        .ch1_haddr      (ch1_haddr),
        .ch1_htrans     (ch1_htrans),
        .ch1_hwrite     (ch1_hwrite),
        .ch1_hsize      (ch1_hsize),
        .ch1_hburst     (ch1_hburst),
        .ch1_hprot      (ch1_hprot),
        .ch1_hwdata     (ch1_hwdata),
        .ch1_hrdata     (hrdata_ch1),
 `ifdef two_channel
`else
       // channel 2 connections
        .ch2_ahb_grant  (ch2_ahb_grant),
        .ch2_haddr      (ch2_haddr),
        .ch2_htrans     (ch2_htrans),
        .ch2_hwrite     (ch2_hwrite),
        .ch2_hsize      (ch2_hsize),
        .ch2_hburst     (ch2_hburst),
        .ch2_hprot      (ch2_hprot),
        .ch2_hwdata     (ch2_hwdata),
        .ch2_hrdata     (hrdata_ch2),
`ifdef three_channel
`else
        // channel 3 connections
        .ch3_ahb_grant  (ch3_ahb_grant),
        .ch3_haddr      (ch3_haddr),
        .ch3_htrans     (ch3_htrans),
        .ch3_hwrite     (ch3_hwrite),
        .ch3_hsize      (ch3_hsize),
        .ch3_hburst     (ch3_hburst),
        .ch3_hprot      (ch3_hprot),
        .ch3_hwdata     (ch3_hwdata),
        .ch3_hrdata     (hrdata_ch3),
`endif
`endif
`endif
        // channel 0 connections
        .ch0_ahb_grant  (ch0_ahb_grant),
        .ch0_haddr      (ch0_haddr),
        .ch0_htrans     (ch0_htrans),
        .ch0_hwrite     (ch0_hwrite),
        .ch0_hsize      (ch0_hsize),
        .ch0_hburst     (ch0_hburst),
        .ch0_hprot      (ch0_hprot),
        .ch0_hwdata     (ch0_hwdata),
        .ch0_hrdata     (hrdata_ch0)
        );

// flow control mux - as some channels have flow control and others do not
// it is possible to either tie of flow control to each channel or route the
// relative signals to the correct channels
// the flow control inputs are connected at the top level - one should be tied
// into active state.
// outputs are routed individually note. for reads data and word available is
// relevant for writes only slot available is used (would normally attach to
// fifo full)  --may need further fifo status....

dma_flow_mux i_udma_flow(
        .hclk           (hclk),
        .n_hreset       (n_hreset),
        .write_data     (write_data),
        .ahb_byte       (ahb_byte),
        // flow control inputs (three possibilities in this setup)
        .data_av0       (data_av0),
        .slot_av0       (slot_av0),
        .word_av0       (word_av0),
        .data_av1       (data_av1),
        .slot_av1       (slot_av1),
        .word_av1       (word_av1),
        .data_av2       (data_av2),
        .slot_av2       (slot_av2),
        .word_av2       (word_av2),
`ifdef one_channel
`else
        .dma_flow_ch1   (dma_flow_ch1),
        .ch1_flow_sel   (ch1_flow_sel),
        // outputs
        .ch1_data_av    (ch1_data_av),
        .ch1_slot_av    (ch1_slot_av),
        .ch1_word_av    (ch1_word_av),
`ifdef two_channel
`else
        .dma_flow_ch2   (dma_flow_ch2),
        .ch2_flow_sel   (ch2_flow_sel),
        // outputs
        .ch2_data_av    (ch2_data_av),
        .ch2_slot_av    (ch2_slot_av),
        .ch2_word_av    (ch2_word_av),
`ifdef three_channel
`else
        .dma_flow_ch3   (dma_flow_ch3),
        .ch3_flow_sel   (ch3_flow_sel),
        // outputs
        .ch3_data_av    (ch3_data_av),
        .ch3_slot_av    (ch3_slot_av),
        .ch3_word_av    (ch3_word_av),
`endif
`endif
`endif
        .dma_flow_ch0   (dma_flow_ch0),
        .ch0_flow_sel   (ch0_flow_sel),
        // outputs
        .ch0_data_av    (ch0_data_av),
        .ch0_slot_av    (ch0_slot_av),
        .ch0_word_av    (ch0_word_av)
        );

//==============================
// instantiation of dma channels
//==============================

dma_channel i_udma_ch0(
        .hclk           (hclk),
        .n_hreset       (n_hreset),
        .write_data     (write_data),
        .ahb_byte       (ahb_byte),
        .dma_tadd       (dma_tadd_ch0),
        .dma_sadd       (dma_sadd_ch0),
        .dma_buff       (dma_buff_ch0),
        .dma_xfer       (dma_xfer_ch0),
        .taddr          (taddr_ch0),
        .saddr          (saddr_ch0),
        .buff_pos       (buff_pos_ch0),
        .taddr_sel      (ch0_taddr_sel),
        .saddr_sel      (ch0_saddr_sel),
        .buff_sel       (ch0_buff_sel),
        .trans_sel      (ch0_trans_sel),
        .abort_sel      (ch0_abort_sel),
        .pos_sel        (ch0_pos_sel),
        .ahb_req        (ch0_ahb_req),
        .apb_req        (ch0_apb_req),
        .ahb_grant      (ch0_ahb_grant),
        .apb_grant      (ch0_apb_grant),
// ahb address/data control
        .haddr          (ch0_haddr),
        .htrans         (ch0_htrans),
        .hwrite         (ch0_hwrite),
        .hsize          (ch0_hsize),
        .hburst         (ch0_hburst),
        .hprot          (ch0_hprot),
        .hwdata         (ch0_hwdata),
        .hready         (hready_dma),
        .hresp          (hresp_dma),
        .hrdata         (hrdata_ch0),
// apb address/data control
        //.pclk           (pclk),
        //.presetn        (presetn),
        .paddr          (ch0_paddr),
        .pwrite         (ch0_pwrite),
        .pwdata         (ch0_pwdata),
        .penable        (ch0_penable),
        .byte_access    (ch0_byte_access),
        .pready         (pready_ch0),
        .prdata         (prdata_ch0),
        .apb_backoff    (apb_backoff),
        .data_available (ch0_data_av),
        .slot_available (ch0_slot_av),
        .word_available (ch0_word_av),
        .double_clk     (double_clk),
// status outputs
        .complete       (ch0_complete),
        .abort          (ch0_abort)
        );

`ifdef one_channel
`else
dma_channel i_udma_ch1(
        .hclk           (hclk),
        .n_hreset       (n_hreset),
        .write_data     (write_data),
        .ahb_byte       (ahb_byte),
        .dma_tadd       (dma_tadd_ch1),
        .dma_sadd       (dma_sadd_ch1),
        .dma_buff       (dma_buff_ch1),
        .dma_xfer       (dma_xfer_ch1),
        .taddr          (taddr_ch1),
        .saddr          (saddr_ch1),
        .buff_pos       (buff_pos_ch1),
        .taddr_sel      (ch1_taddr_sel),
        .saddr_sel      (ch1_saddr_sel),
        .buff_sel       (ch1_buff_sel),
        .trans_sel      (ch1_trans_sel),
        .abort_sel      (ch1_abort_sel),
        .pos_sel        (ch1_pos_sel),
        .ahb_req        (ch1_ahb_req),
        .apb_req        (ch1_apb_req),
        .ahb_grant      (ch1_ahb_grant),
        .apb_grant      (ch1_apb_grant),
// address/data control
        .haddr          (ch1_haddr),
        .htrans         (ch1_htrans),
        .hwrite         (ch1_hwrite),
        .hsize          (ch1_hsize),
        .hburst         (ch1_hburst),
        .hprot          (ch1_hprot),
        .hwdata         (ch1_hwdata),
        .hready         (hready_dma),
        .hresp          (hresp_dma),
        .hrdata         (hrdata_ch1),
// apb address/data control
        //.pclk           (pclk),
        //.presetn        (presetn),
        .paddr          (ch1_paddr),
        .pwrite         (ch1_pwrite),
        .pwdata         (ch1_pwdata),
        .penable        (ch1_penable),
        .byte_access    (ch1_byte_access),
        .pready         (pready_ch1),
        .prdata         (prdata_ch1),
        .apb_backoff    (apb_backoff),
        .data_available (ch1_data_av),
        .slot_available (ch1_slot_av),
        .word_available (ch1_word_av),
        .double_clk     (double_clk),
// status outputs
        .complete       (ch1_complete),
        .abort          (ch1_abort)
        );

`ifdef two_channel
`else
dma_channel i_udma_ch2(
        .hclk           (hclk),
        .n_hreset       (n_hreset),
        .write_data     (write_data),
        .ahb_byte       (ahb_byte),
        .dma_tadd       (dma_tadd_ch2),
        .dma_sadd       (dma_sadd_ch2),
        .dma_buff       (dma_buff_ch2),
        .dma_xfer       (dma_xfer_ch2),
        .taddr          (taddr_ch2),
        .saddr          (saddr_ch2),
        .buff_pos       (buff_pos_ch2),
        .taddr_sel      (ch2_taddr_sel),
        .saddr_sel      (ch2_saddr_sel),
        .buff_sel       (ch2_buff_sel),
        .trans_sel      (ch2_trans_sel),
        .abort_sel      (ch2_abort_sel),
        .pos_sel        (ch2_pos_sel),
        .ahb_req        (ch2_ahb_req),
        .apb_req        (ch2_apb_req),
        .ahb_grant      (ch2_ahb_grant),
        .apb_grant      (ch2_apb_grant),
// address/data control
        .haddr          (ch2_haddr),
        .htrans         (ch2_htrans),
        .hwrite         (ch2_hwrite),
        .hsize          (ch2_hsize),
        .hburst         (ch2_hburst),
        .hprot          (ch2_hprot),
        .hwdata         (ch2_hwdata),
        .hready         (hready_dma),
        .hresp          (hresp_dma),
        .hrdata         (hrdata_ch2),
// apb address/data control
        //.pclk           (pclk),
        //.presetn        (presetn),
        .paddr          (ch2_paddr),
        .pwrite         (ch2_pwrite),
        .pwdata         (ch2_pwdata),
        .penable        (ch2_penable),
        .byte_access    (ch2_byte_access),
        .pready         (pready_ch2),
        .prdata         (prdata_ch2),
        .apb_backoff    (apb_backoff),
        .data_available (ch2_data_av),
        .slot_available (ch2_slot_av),
        .word_available (ch2_word_av),
        .double_clk     (double_clk),
// status outputs
        .complete       (ch2_complete),
        .abort          (ch2_abort)
        );

`ifdef three_channel
`else
dma_channel i_udma_ch3(
        .hclk           (hclk),
        .n_hreset       (n_hreset),
        .write_data     (write_data),
        .ahb_byte       (ahb_byte),
        .dma_tadd       (dma_tadd_ch3),
        .dma_sadd       (dma_sadd_ch3),
        .dma_buff       (dma_buff_ch3),
        .dma_xfer       (dma_xfer_ch3),
        .taddr          (taddr_ch3),
        .saddr          (saddr_ch3),
        .buff_pos       (buff_pos_ch3),
        .taddr_sel      (ch3_taddr_sel),
        .saddr_sel      (ch3_saddr_sel),
        .buff_sel       (ch3_buff_sel),
        .trans_sel      (ch3_trans_sel),
        .abort_sel      (ch3_abort_sel),
        .pos_sel        (ch3_pos_sel),
        .ahb_req        (ch3_ahb_req),
        .apb_req        (ch3_apb_req),
        .ahb_grant      (ch3_ahb_grant),
        .apb_grant      (ch3_apb_grant),
// address/data control
        .haddr          (ch3_haddr),
        .htrans         (ch3_htrans),
        .hwrite         (ch3_hwrite),
        .hsize          (ch3_hsize),
        .hburst         (ch3_hburst),
        .hprot          (ch3_hprot),
        .hwdata         (ch3_hwdata),
        .hready         (hready_dma),
        .hresp          (hresp_dma),
        .hrdata         (hrdata_ch3),
// apb address/data control
        //.pclk           (pclk),
        //.presetn        (presetn),
        .paddr          (ch3_paddr),
        .pwrite         (ch3_pwrite),
        .pwdata         (ch3_pwdata),
        .penable        (ch3_penable),
        .byte_access    (ch3_byte_access),
        .pready         (pready_ch3),
        .prdata         (prdata_ch3),
        .apb_backoff    (apb_backoff),
        .data_available (ch3_data_av),
        .slot_available (ch3_slot_av),
        .word_available (ch3_word_av),
        .double_clk     (double_clk),
// status outputs
        .complete       (ch3_complete),
        .abort          (ch3_abort)
        );
`endif
`endif
`endif

`else 
//------------------------------------------------------------------------------
// if the DMA is black boxed 
//------------------------------------------------------------------------------

  wire              hclk; //ahb clock
  wire              n_hreset;//ahb reset
  reg               dma_int;//dma interrupt reg   
// ahb interface slave signals
  wire     [31:0]   haddr;  //ahb adress bus from mux
  wire              hsel;   //dma select from decoder
  wire      [1:0]   htrans; //ahb transfer type from mux
  wire              hwrite; //ahb write enable from mux
  wire      [2:0]   hsize;  //ahb transfer size from mux
  wire     [31:0]   hwdata; //ahb write data bus from mux
  wire      [2:0]   hburst;    // Burst type
  wire      [3:0]   hprot;     // Protection control
  wire      [3:0]   hmaster;   // Master select
  wire              hmastlock; // Locked transfer
  wire              hready_in;      // Transfer done
  reg               dma_hready;//hready from dma to mux
  reg       [1:0]   dma_hresp; //response from dma to mux
  reg      [31:0]   dma_hrdata;//dma read data to mux
// ahb interface master signals
  wire     [31:0]   hrdata_dma;//read data from mux to dma
  wire              hready_dma;//ready signal from mux to dma
  wire      [1:0]   hresp_dma; //response signal from mux to dma
  wire              hgrant;    //bus grant from the arbiter
  reg      [31:0]   dma_haddr; //dma ahb address bus
  reg       [1:0]   dma_htrans;//dma ahb transfer type
  reg               dma_hwrite;//dma ahb write enable
  reg       [2:0]   dma_hsize; //dma ahb transfer size
  reg       [2:0]   dma_hburst;//dma ahb burst type
  reg       [3:0]   dma_hprot; //dma ahb protected transfer signal
  reg      [31:0]   dma_hwdata;//dma ahb write data bus
  reg               dma_hbusreq;//dma ahb bus request signal to arbiter
  reg               dma_hlock;  //dma ahb locked transfer
// apb interface master signals
  //wire              pclk;       //apb clock
  //wire              presetn;    //apb reset
  reg               apb_request;//dma apb request to bridge
  wire     [15:0]   prdata;     //read data bus from apb mux
  wire              pready;     //ready signal from apb mux
  reg               dma_penable;//dma apb enable signal
  reg               dma_pwrite; //dma apb write enable
  reg      [19:0]   dma_paddr;  //dma apb address bus
  reg      [15:0]   dma_pwdata; //dma apb write data bus
// channel controllines
  reg               byte_access;//byte access reg    from dma
  wire              double_clk;//ahb clk is twice freq of apb clk
  wire              data_av0;//flow control wire  from uart 0
  wire              slot_av0;//flow control wire  from uart 0
  wire              word_av0;//flow control wire  from uart 0
  wire              data_av1;//flow control wire  from uart 1
  wire              slot_av1;//flow control wire  from uart 1
  wire              word_av1;//flow control wire  from uart 1
  wire              data_av2;//flow control wire  from uart 2
  wire              slot_av2;//flow control wire  from uart 2
  wire              word_av2;//flow control wire  from uart 2

//scan signals
  wire              scan_en;    // Scan enable pin
  wire              scan_in;  // Scan wire  for first chain
  reg               scan_out;   // Scan out for chain 1


`endif
//------------------------------------------------------------------------------
// black boxed defines 
//------------------------------------------------------------------------------



endmodule
