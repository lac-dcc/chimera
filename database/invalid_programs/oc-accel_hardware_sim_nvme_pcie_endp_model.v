// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
//
// Copyright 2016,2017 International Business Machines
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions AND
// limitations under the License.
//
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------

// Simulation endpoint model
//
// Connect DUT xilinx PCIe root port to Denali endpoint model
// using PIPE interface with hierarchical connection
// 
// NVMe model connection
// - uses PCIe PIPE interface to connect between
//   xilinx PCIe root port in DUT to cadence/denali NVMe model
// 
//                                  +---------------------------------------+
//     +----------------------+     |                                       |
//     |                      |     |                       +------------+  |
//     |            +------+  |     |  +------+   PCI       |            |  |
//     |   Root     | PIPE |  | <=> |  | PIPE |  <=======>  |  Endpoint  |  |
//     |   Complex  | MAC  |  |     |  | PHY  |   Express   |  NVMe      |  |
//     |            +------+  |     |  +------+             |  model     |  |
//     | DUT                  |     |                       +------------+  |
//     +----------------------+     | denali_model                          |
//                                  +---------------------------------------+

`timescale 1ns/1ps


module pcie_endp_model
  (
   // Xilinx root port PIPE interface 
   output [25:0] pipe_common_commands_in_rp,
   output [83:0] pipe_rx_0_rp,
   output [83:0] pipe_rx_1_rp,
   output [83:0] pipe_rx_2_rp,
   output [83:0] pipe_rx_3_rp,
   output [83:0] pipe_rx_4_rp,
   output [83:0] pipe_rx_5_rp,
   output [83:0] pipe_rx_6_rp,
   output [83:0] pipe_rx_7_rp,
  
   input  [16:0] pipe_common_commands_out_rp,
   input  [69:0] pipe_tx_0_rp,
   input  [69:0] pipe_tx_1_rp,
   input  [69:0] pipe_tx_2_rp,
   input  [69:0] pipe_tx_3_rp,
   input  [69:0] pipe_tx_4_rp,
   input  [69:0] pipe_tx_5_rp,
   input  [69:0] pipe_tx_6_rp,
   input  [69:0] pipe_tx_7_rp,

   input         sys_rst_n,
   input         nperst
   );

   localparam zero = 256'h0;

   parameter linkWidth = 4;
   parameter maxlinkWidth = 8;


   
   //--------------------------------------------------------------------//
   // Denali endpoint PIPE connections
   //--------------------------------------------------------------------//

`include "denaliPcieTypes.v"

   //      Driven by DUT
   wire [(32*maxlinkWidth-1):0] TxData;
   wire  [(4*maxlinkWidth-1):0] TxDataK;
   wire                         TxDetectRx;
   wire    [(maxlinkWidth-1):0] TxElecIdle;
   wire    [(maxlinkWidth-1):0] TxCompliance;
   wire    [(maxlinkWidth-1):0] RxPolarity;
   wire                         Reset_n;
   wire                  [15:0] PowerDown;
   wire                   [1:0] Rate;
   
   //      Driven by EP
   wire [(32*maxlinkWidth-1):0] RxData;
   wire  [(4*maxlinkWidth-1):0] RxDataK;
   wire    [(maxlinkWidth-1):0] RxValid;
   wire                         PhyStatus;
   wire    [(maxlinkWidth-1):0] RxElecIdle;
   wire  [(3*maxlinkWidth-1):0] RxStatus;
   wire    [(maxlinkWidth-1):0] TxStartBlock;
   wire    [(maxlinkWidth-1):0] RxStartBlock;
   wire    [(maxlinkWidth-1):0] TxDataValid;
   wire    [(maxlinkWidth-1):0] RxDataValid;
   wire  [(2*maxlinkWidth-1):0] TxSyncHeader;
   wire  [(2*maxlinkWidth-1):0] RxSyncHeader;
   
   //--------------------------------------------------------------------//
   // Xilinx root port PIPE interface
   //--------------------------------------------------------------------//
   wire                         PCLK;

   
   xil_sig2pipe xil_dut_pipe (
                              
     .xil_rx0_sigs(pipe_rx_0_rp),
     .xil_rx1_sigs(pipe_rx_1_rp),
     .xil_rx2_sigs(pipe_rx_2_rp),
     .xil_rx3_sigs(pipe_rx_3_rp),
     .xil_rx4_sigs(pipe_rx_4_rp),
     .xil_rx5_sigs(pipe_rx_5_rp),
     .xil_rx6_sigs(pipe_rx_6_rp),
     .xil_rx7_sigs(pipe_rx_7_rp),
     .xil_tx0_sigs(pipe_tx_0_rp),
     .xil_tx1_sigs(pipe_tx_1_rp),
     .xil_tx2_sigs(pipe_tx_2_rp),
     .xil_tx3_sigs(pipe_tx_3_rp),
     .xil_tx4_sigs(pipe_tx_4_rp),
     .xil_tx5_sigs(pipe_tx_5_rp),
     .xil_tx6_sigs(pipe_tx_6_rp),
     .xil_tx7_sigs(pipe_tx_7_rp),     
 
     .xil_common_commands(pipe_common_commands_out_rp),
      ///////////// do not modify above this line //////////
      //////////Connect the following pipe ports to BFM///////////////
     .pipe_clk(PCLK),                            // input to BFM  (pipe clock output)                 
     .pipe_tx_rate(Rate),                        // input to BFM  (rate)
     .pipe_tx_detect_rx(TxDetectRx),             // input to BFM  (Receiver Detect)  
     .pipe_tx_powerdown(PowerDown),              // input to BFM  (Powerdown)  
      // Pipe TX Interface	                  	
     .pipe_tx0_data(TxData[31:0]),               // input to BFM
     .pipe_tx1_data(TxData[63:32]),              // input to BFM
     .pipe_tx2_data(TxData[95:64]),              // input to BFM
     .pipe_tx3_data(TxData[127:96]),             // input to BFM
     .pipe_tx4_data(TxData[159:128]),            // input to BFM
     .pipe_tx5_data(TxData[191:160]),            // input to BFM
     .pipe_tx6_data(TxData[223:192]),            // input to BFM
     .pipe_tx7_data(TxData[255:224]),            // input to BFM
     .pipe_tx0_char_is_k(TxDataK[1:0]),          // input to BFM
     .pipe_tx1_char_is_k(TxDataK[5:4]),          // input to BFM
     .pipe_tx2_char_is_k(TxDataK[9:8]),          // input to BFM
     .pipe_tx3_char_is_k(TxDataK[13:12]),        // input to BFM
     .pipe_tx4_char_is_k(TxDataK[17:16]),        // input to BFM
     .pipe_tx5_char_is_k(TxDataK[21:20]),        // input to BFM
     .pipe_tx6_char_is_k(TxDataK[25:24]),        // input to BFM
     .pipe_tx7_char_is_k(TxDataK[29:28]),        // input to BFM
     .pipe_tx0_elec_idle(TxElecIdle[0]),         // input to BFM
     .pipe_tx1_elec_idle(TxElecIdle[1]),         // input to BFM
     .pipe_tx2_elec_idle(TxElecIdle[2]),         // input to BFM
     .pipe_tx3_elec_idle(TxElecIdle[3]),         // input to BFM
     .pipe_tx4_elec_idle(TxElecIdle[4]),         // input to BFM
     .pipe_tx5_elec_idle(TxElecIdle[5]),         // input to BFM
     .pipe_tx6_elec_idle(TxElecIdle[6]),         // input to BFM
     .pipe_tx7_elec_idle(TxElecIdle[7]),         // input to BFM
     .pipe_tx0_start_block(TxStartBlock[0]),     // input to BFM
     .pipe_tx1_start_block(TxStartBlock[1]),     // input to BFM
     .pipe_tx2_start_block(TxStartBlock[2]),     // input to BFM
     .pipe_tx3_start_block(TxStartBlock[3]),     // input to BFM
     .pipe_tx4_start_block(TxStartBlock[4]),     // input to BFM
     .pipe_tx5_start_block(TxStartBlock[5]),     // input to BFM
     .pipe_tx6_start_block(TxStartBlock[6]),     // input to BFM
     .pipe_tx7_start_block(TxStartBlock[7]),     // input to BFM
     .pipe_tx0_syncheader(TxSyncHeader[1:0]),    // input to BFM
     .pipe_tx1_syncheader(TxSyncHeader[3:2]),    // input to BFM
     .pipe_tx2_syncheader(TxSyncHeader[5:4]),    // input to BFM
     .pipe_tx3_syncheader(TxSyncHeader[7:6]),    // input to BFM
     .pipe_tx4_syncheader(TxSyncHeader[9:8]),    // input to BFM
     .pipe_tx5_syncheader(TxSyncHeader[11:10]),  // input to BFM
     .pipe_tx6_syncheader(TxSyncHeader[13:12]),  // input to BFM
     .pipe_tx7_syncheader(TxSyncHeader[15:14]),  // input to BFM
     .pipe_tx0_data_valid(TxDataValid[0]),       // input to BFM
     .pipe_tx1_data_valid(TxDataValid[1]),       // input to BFM
     .pipe_tx2_data_valid(TxDataValid[2]),       // input to BFM
     .pipe_tx3_data_valid(TxDataValid[3]),       // input to BFM
     .pipe_tx4_data_valid(TxDataValid[4]),       // input to BFM
     .pipe_tx5_data_valid(TxDataValid[5]),       // input to BFM
     .pipe_tx6_data_valid(TxDataValid[6]),       // input to BFM
     .pipe_tx7_data_valid(TxDataValid[7]),       // input to BFM
     // Pipe RX Interface
     .pipe_rx0_data(RxData[31:0]),               // output of BFM
     .pipe_rx1_data(RxData[63:32]),              // output of BFM
     .pipe_rx2_data(RxData[95:64]),              // output of BFM
     .pipe_rx3_data(RxData[127:96]),             // output of BFM
     .pipe_rx4_data(RxData[159:128]),            // output of BFM
     .pipe_rx5_data(RxData[191:160]),            // output of BFM
     .pipe_rx6_data(RxData[223:192]),            // output of BFM
     .pipe_rx7_data(RxData[255:224]),            // output of BFM
     .pipe_rx0_char_is_k(RxDataK[1:0]),          // output of BFM
     .pipe_rx1_char_is_k(RxDataK[5:4]),          // output of BFM
     .pipe_rx2_char_is_k(RxDataK[9:8]),          // output of BFM
     .pipe_rx3_char_is_k(RxDataK[13:12]),        // output of BFM
     .pipe_rx4_char_is_k(RxDataK[17:16]),        // output of BFM
     .pipe_rx5_char_is_k(RxDataK[21:20]),        // output of BFM
     .pipe_rx6_char_is_k(RxDataK[25:24]),        // output of BFM
     .pipe_rx7_char_is_k(RxDataK[29:28]),        // output of BFM
     .pipe_rx0_elec_idle(RxElecIdle[0]),         // output of BFM
     .pipe_rx1_elec_idle(RxElecIdle[1]),         // output of BFM
     .pipe_rx2_elec_idle(RxElecIdle[2]),         // output of BFM
     .pipe_rx3_elec_idle(RxElecIdle[3]),         // output of BFM
     .pipe_rx4_elec_idle(RxElecIdle[4]),         // output of BFM
     .pipe_rx5_elec_idle(RxElecIdle[5]),         // output of BFM
     .pipe_rx6_elec_idle(RxElecIdle[6]),         // output of BFM
     .pipe_rx7_elec_idle(RxElecIdle[7]),         // output of BFM
     .pipe_rx0_start_block(RxStartBlock[0]),     // output of BFM
     .pipe_rx1_start_block(RxStartBlock[1]),     // output of BFM
     .pipe_rx2_start_block(RxStartBlock[2]),     // output of BFM
     .pipe_rx3_start_block(RxStartBlock[3]),     // output of BFM
     .pipe_rx4_start_block(RxStartBlock[4]),     // output of BFM
     .pipe_rx5_start_block(RxStartBlock[5]),     // output of BFM
     .pipe_rx6_start_block(RxStartBlock[6]),     // output of BFM
     .pipe_rx7_start_block(RxStartBlock[7]),     // output of BFM
     .pipe_rx0_syncheader(RxSyncHeader[1:0]),    // output of BFM
     .pipe_rx1_syncheader(RxSyncHeader[3:2]),    // output of BFM
     .pipe_rx2_syncheader(RxSyncHeader[5:4]),    // output of BFM
     .pipe_rx3_syncheader(RxSyncHeader[7:6]),    // output of BFM
     .pipe_rx4_syncheader(RxSyncHeader[9:8]),    // output of BFM
     .pipe_rx5_syncheader(RxSyncHeader[11:10]),  // output of BFM
     .pipe_rx6_syncheader(RxSyncHeader[13:12]),  // output of BFM
     .pipe_rx7_syncheader(RxSyncHeader[15:14]),  // output of BFM
     .pipe_rx0_data_valid(RxDataValid[0]),       // output of BFM
     .pipe_rx1_data_valid(RxDataValid[1]),       // output of BFM
     .pipe_rx2_data_valid(RxDataValid[2]),       // output of BFM
     .pipe_rx3_data_valid(RxDataValid[3]),       // output of BFM
     .pipe_rx4_data_valid(RxDataValid[4]),       // output of BFM
     .pipe_rx5_data_valid(RxDataValid[5]),       // output of BFM
     .pipe_rx6_data_valid(RxDataValid[6]),       // output of BFM
     .pipe_rx7_data_valid(RxDataValid[7])        // output of BFM 
);

   // todo: check these
   assign PowerDown[1:0]             = pipe_tx_0_rp[41:40];
   assign TxDetectRx                 = pipe_common_commands_out_rp[0];
   assign Rate[1:0]                  = pipe_common_commands_out_rp[2:1];
   assign Reset_n                    = ~pipe_common_commands_out_rp[8];
   assign RxPolarity[7:0]            = 8'd0;
   assign TxCompliance[7:0]          = 8'd0;
   assign TxDataK[3:2]               = 2'b00;
   assign TxDataK[7:6]               = 2'b00;
   assign TxDataK[11:10]             = 2'b00;
   assign TxDataK[15:14]             = 2'b00;
   assign pipe_common_commands_in_rp = 26'b0;

   //------------------------------------------------
   // Denali NVMe endpoint model instance
   endp_4_pipe32 #(linkWidth) endp 
     (
      .TxData (TxData[(32*linkWidth-1):0]),           // input
      .TxDataK (TxDataK[(4*linkWidth-1):0]),          // input
      .RxData (RxData[(32*linkWidth-1):0]),           // output
      .RxDataK (RxDataK[(4*linkWidth-1):0]),          // output
      .TxDetectRx (TxDetectRx),                       // input
      .TxElecIdle (TxElecIdle[(linkWidth-1):0]),      // input
      .TxCompliance (TxCompliance[(linkWidth-1):0]),  // input
      .RxPolarity (RxPolarity[(linkWidth-1):0]),      // input
      .Reset_ (Reset_n),                              // input            
      .PowerDown (PowerDown[1:0]),                    // input
      .RxValid (RxValid[(linkWidth-1):0]),            // output
      .PhyStatus (PhyStatus),                         // output
      .RxElecIdle (RxElecIdle[(linkWidth-1):0]),      // output
      .RxStatus (RxStatus[(3*linkWidth-1):0]),        // output
      .PCLK (PCLK),                                   // inout (output) 125MHz for Gen1; 250 MHz for Gen2/3
      .Rate (Rate),                                   // input
      .TxStartBlock (TxStartBlock[(linkWidth-1):0]),  // input
      .RxStartBlock (RxStartBlock[(linkWidth-1):0]),  // output
      .TxDataValid (TxDataValid[(linkWidth-1):0]),    // input
      .RxDataValid (RxDataValid[(linkWidth-1):0]),    // output
      .TxSyncHeader (TxSyncHeader[(2*linkWidth-1):0]),// input
      .RxSyncHeader (RxSyncHeader[(2*linkWidth-1):0]) // output
      );
   
   // unused lanes not driven by EP
   generate if( maxlinkWidth>linkWidth) begin :unused_lanes
      assign RxData[(32*maxlinkWidth-1):(32*linkWidth)] = zero[(32*maxlinkWidth-1):(32*linkWidth)];
      assign RxDataK[(4*maxlinkWidth-1):(4*linkWidth)] = zero[(4*maxlinkWidth-1):(4*linkWidth)];
      assign RxValid[(maxlinkWidth-1):(linkWidth)] = zero[(maxlinkWidth-1):(linkWidth)];      
      assign RxElecIdle[(maxlinkWidth-1):(linkWidth)] = zero[(maxlinkWidth-1):(linkWidth)];
      assign RxStatus[(3*maxlinkWidth-1):(3*linkWidth)] = zero[(3*maxlinkWidth-1):(3*linkWidth)];
      assign RxStartBlock[(maxlinkWidth-1):(linkWidth)] = zero[(maxlinkWidth-1):(linkWidth)];
      assign RxDataValid[(maxlinkWidth-1):(linkWidth)] = zero[(maxlinkWidth-1):(linkWidth)];
      assign RxSyncHeader[(2*maxlinkWidth-1):(2*linkWidth)] = zero[(2*maxlinkWidth-1):(2*linkWidth)];
   end
   endgenerate
   
   defparam endp.interface_soma = "./denali/endp_4_pipe32.soma";
endmodule

