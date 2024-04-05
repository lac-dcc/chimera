//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2012 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//-----------------------------------------------------------------------------
//
// Project    : Virtex-7 FPGA Gen3 Integrated Block for PCI Express
// File       : pci_exp_usrapp_com.v
// Version    : 1.1
//--
//--------------------------------------------------------------------------------

`include "board_common.v"
`include "dut_defines.v"
`include "user_defines.v"

module pci_exp_usrapp_com ();


/* Local variables */

reg   [31:0]           rx_file_ptr;
reg   [7:0]            frame_store_rx[5119:0];
integer                frame_store_rx_idx;
reg   [31:0]           tx_file_ptr;
reg   [7:0]            frame_store_tx[5119:0];
integer                frame_store_tx_idx;

reg   [31:0]           log_file_ptr;
integer                _frame_store_idx;

event                  rcvd_cpld, rcvd_memrd, rcvd_memwr;
event                  rcvd_cpl, rcvd_memrd64, rcvd_memwr64;
event                  rcvd_msg, rcvd_msgd, rcvd_cfgrd0;
event                  rcvd_cfgwr0, rcvd_cfgrd1, rcvd_cfgwr1;
event                  rcvd_iord, rcvd_iowr;

  `include "crc_calc_functions.v"
//  reg [31:0]            error_file_ptr;
  reg [7:0]             tag_rcvd;
  reg [7:0]             byte_enables_rcvd;
  reg [31:0]            address_low_rcvd;
  reg [9:0]             length_rcvd;

  integer packet_rcvd_ch0 ;// packet count for Ch0 in received direction
  integer packet_rcvd_ch1 ;// packet count for Ch1 in received direction
  integer packet_rcvd_ch2 ;// packet count for Ch0 in received direction
  integer packet_rcvd_ch3 ;// packet count for Ch1 in received direction
  reg [15:0] seq_no_ch0;
  reg [15:0] seq_no_ch1;
  reg [15:0] seq_no_ch2;
  reg [15:0] seq_no_ch3;


initial begin
  packet_rcvd_ch0    = 0;
  packet_rcvd_ch1    = 0;
  packet_rcvd_ch2    = 0;
  packet_rcvd_ch3    = 0;
  seq_no_ch0 = 0;
  seq_no_ch1 = 0;
  seq_no_ch2 = 0;
  seq_no_ch3 = 0;

  frame_store_rx_idx = 0;
  frame_store_tx_idx = 0;

  rx_file_ptr = $fopen("rx.dat");

  if (!rx_file_ptr) begin

    $write("ERROR: Could not open rx.dat.\n");
    $finish;

  end

  tx_file_ptr = $fopen("tx.dat");

  if (!tx_file_ptr) begin

    $write("ERROR: Could not open tx.dat.\n");
    $finish;
  end
end

/*
 always@(rcvd_memrd)
  begin
    board.RP.rx_usrapp.m_axis_cq_tready = 1'b0 ;
    $display("[%t] Received Memory read at address = %h",$time,address_low_rcvd);
    $fdisplay(rx_file_ptr,"[%t] Received Memory read at address = %h",$time,address_low_rcvd);
    board.RP.tx_usrapp.TSK_BUILD_CPLD(address_low_rcvd, tag_rcvd, byte_enables_rcvd, length_rcvd);
    @(posedge board.RP.user_clk);
    board.RP.rx_usrapp.m_axis_cq_tready = #(1) 1'b1 ;

  end
*/

 always@(rcvd_memwr or rcvd_memwr64)
  begin
   if((address_low_rcvd >= `RXBUF0_BASE) && (address_low_rcvd <= `RXBUF3_LIMIT))
    begin
     $display("[%t] Packet Received in C2S direction at address = %h", $time,address_low_rcvd);
     $fdisplay(rx_file_ptr,"[%t] Packet Received in C2S direction at address = %h", $time,address_low_rcvd);
     board.RP.com_usrapp.TSK_CHECK_DATA(byte_enables_rcvd, length_rcvd, address_low_rcvd);
    end
  end

 always@(rcvd_memwr or rcvd_memwr64)
  begin
   if(address_low_rcvd == `MSI_MAR_LOW_ADRS)
   begin
    $display("[%t] Received MSI Interrupt", $time);
    //if({frame_store_rx[15],frame_store_rx[14], frame_store_rx[13], frame_store_rx[12]} == `MSI_MDR_DATA)
    if({frame_store_rx[19],frame_store_rx[18], frame_store_rx[17], frame_store_rx[16]} == `MSI_MDR_DATA)
      board.RP.tx_usrapp.TSK_INTR_HANDLER;
   end   
  end

  always @(posedge board.RP.cfg_msg_received)
  begin
    if (board.RP.cfg_msg_received_type == 4'd3)
    begin
      $display("[%t] Received Interrupt INTxA", $time);
      board.RP.tx_usrapp.TSK_INTR_HANDLER;
    end
  end

 always@(rcvd_memwr or rcvd_memwr64)
  begin
   if((address_low_rcvd >= `TXDESC0_BASE) && (address_low_rcvd <= `RXDESC3_LIMIT))
    begin
     $display("[%t] Received Descriptor Update at address = %h",$time, address_low_rcvd);
     $fdisplay(rx_file_ptr,"[%t] Received Descriptor Update",$time);
     board.RP.com_usrapp.TSK_CHECK_DESCRIPTOR(address_low_rcvd);
    end
  end


  /************************************************************
  Task : TSK_PARSE_FRAME
  Inputs : None
  Outputs : None
  Description : Parse frame data
  *************************************************************/

  task TSK_PARSE_FRAME;
  input    log_file;

  reg   [1:0]   fmt;
  reg   [4:0]   f_type;
  reg   [2:0]   traffic_class;
  reg     td;
  reg      ep;
  reg  [1:0]   attr;
  reg  [9:0]   length;
  reg     payload;
  reg  [15:0]   requester_id;
  reg  [15:0]   completer_id;
  reg  [7:0]   tag;
  reg  [7:0]   byte_enables;
  reg  [7:0]  message_code;
  reg  [31:0]   address_low;
  reg  [31:0]   address_high;
  reg  [9:0]   register_address;
  reg   [2:0]   completion_status;
  reg  [31:0]  _log_file_ptr;
  integer    _frame_store_idx;

  begin

  if (log_file == `RX_LOG)
    _log_file_ptr = rx_file_ptr;
  else
    _log_file_ptr = tx_file_ptr;

  if (log_file == `RX_LOG) begin

    _frame_store_idx = frame_store_rx_idx;
    frame_store_rx_idx = 0;

  end else begin

    _frame_store_idx = frame_store_tx_idx;
    frame_store_tx_idx = 0;

  end

//  if (log_file == `RX_LOG) begin

//    $display("[%t] : TSK_PARSE_FRAME on Receive", $realtime);

//    end
//  else begin

//    $display("[%t] : TSK_PARSE_FRAME on Transmit", $realtime);

//    end          

  TSK_DECIPHER_FRAME (fmt, f_type, traffic_class, td, ep, attr, length, log_file);  

  // decode the packets received based on fmt and f_type

  casex({fmt, f_type})

    `PCI_EXP_MEM_READ32 : begin

      $fdisplay(_log_file_ptr, "[%t] : Memory Read-32 Frame \n", $time);
      payload = 0;
      TSK_3DW(fmt, f_type, traffic_class, td, ep, attr, length, payload, _frame_store_idx, _log_file_ptr, log_file);
      
      if (log_file == `RX_LOG)
        -> rcvd_memrd;
    end

    `PCI_EXP_IO_READ : begin

      $fdisplay(_log_file_ptr, "[%t] : IO Read Frame \n", $time);
      payload = 0;
      TSK_3DW(fmt, f_type, traffic_class, td, ep, attr, length, payload, _frame_store_idx, _log_file_ptr, log_file);

      if (log_file == `RX_LOG)
        -> rcvd_iord;
    end

    `PCI_EXP_CFG_READ0 : begin

      $fdisplay(_log_file_ptr, "[%t] : Config Read Type 0 Frame \n", $time);
      payload = 0;
      TSK_3DW(fmt, f_type, traffic_class, td, ep, attr, length, payload, _frame_store_idx, _log_file_ptr, log_file);

      if (log_file == `RX_LOG) 
        -> rcvd_cfgrd0;
    end

    `PCI_EXP_COMPLETION_WO_DATA: begin

      $fdisplay(_log_file_ptr, "[%t] : Completion Without Data Frame \n", $time);
      payload = 0;
      TSK_3DW(fmt, f_type, traffic_class, td, ep, attr, length, payload, _frame_store_idx, _log_file_ptr, log_file);

      if (log_file == `RX_LOG) 
        -> rcvd_cpl;
    end

    `PCI_EXP_MEM_READ64: begin

      $fdisplay(_log_file_ptr, "[%t] : Memory Read-64 Frame \n", $time);
      payload = 0;
      TSK_4DW(fmt, f_type, traffic_class, td, ep, attr, length, payload,  _frame_store_idx, _log_file_ptr, log_file);

      if (log_file == `RX_LOG) 
        -> rcvd_memrd64;
    end

    `PCI_EXP_MSG_NODATA: begin

      $fdisplay(_log_file_ptr, "[%t] : Message With No Data Frame \n", $time);
      payload = 0;
      TSK_4DW(fmt, f_type, traffic_class, td, ep, attr, length, payload,  _frame_store_idx, _log_file_ptr, log_file);

      if (log_file == `RX_LOG) 
        -> rcvd_msg;
    end

    `PCI_EXP_MEM_WRITE32: begin

      $fdisplay(_log_file_ptr, "[%t] : Memory Write-32 Frame \n", $time);
      payload = 1;
      TSK_3DW(fmt, f_type, traffic_class, td, ep, attr, length, payload, _frame_store_idx, _log_file_ptr, log_file);
      $fdisplay(_log_file_ptr, "\n");

      if (log_file == `RX_LOG) 
        -> rcvd_memwr;
    end

    `PCI_EXP_IO_WRITE: begin

      $fdisplay(_log_file_ptr, "[%t] : IO Write Frame \n", $time);
      payload = 1;
      TSK_3DW(fmt, f_type, traffic_class, td, ep, attr, length, payload, _frame_store_idx, _log_file_ptr, log_file);
      $fdisplay(_log_file_ptr, "\n");

      if (log_file == `RX_LOG) 
        -> rcvd_iowr;
    end

    `PCI_EXP_CFG_WRITE0: begin

      $fdisplay(_log_file_ptr, "[%t] : Config Write Type 0 Frame \n", $time);
      payload = 1;
      TSK_3DW(fmt, f_type, traffic_class, td, ep, attr, length, payload, _frame_store_idx, _log_file_ptr, log_file);
      $fdisplay(_log_file_ptr, "\n");

      if (log_file == `RX_LOG) 
        -> rcvd_cfgwr0;
    end

    `PCI_EXP_COMPLETION_DATA: begin

      $fdisplay(_log_file_ptr, "[%t] : Completion With Data Frame \n", $time);
      payload = 1;
      TSK_3DW(fmt, f_type, traffic_class, td, ep, attr, length, payload, _frame_store_idx, _log_file_ptr, log_file);
      $fdisplay(_log_file_ptr, "\n");

      if (log_file == `RX_LOG) 
        -> rcvd_cpld;
    end

    `PCI_EXP_MEM_WRITE64: begin

      $fdisplay(_log_file_ptr, "[%t] : Memory Write-64 Frame \n", $time);
      payload = 1;
      TSK_4DW(fmt, f_type, traffic_class, td, ep, attr, length, payload,  _frame_store_idx, _log_file_ptr, log_file);
      $fdisplay(_log_file_ptr, "\n");

      if (log_file == `RX_LOG) 
        -> rcvd_memwr64;
    end

    `PCI_EXP_MSG_DATA: begin

      $fdisplay(_log_file_ptr, "[%t] : Message With Data Frame \n", $time);
      payload = 1;
      TSK_4DW(fmt, f_type, traffic_class, td, ep, attr, length, payload,  _frame_store_idx, _log_file_ptr, log_file);
      $fdisplay(_log_file_ptr, "\n");

      if (log_file == `RX_LOG) 
        -> rcvd_msgd;
    end

    default: begin
      $fdisplay(_log_file_ptr, "[%t] : Not a valid frame \n", $time);
      $display(_log_file_ptr, "[%t] : Received an invalid frame \n", $time);
      $finish(2);
    end

  endcase
  end
  endtask // TSK_PARSE_FRAME

  /************************************************************
  Task : TSK_DECIPHER_FRAME
  Inputs : None
  Outputs : fmt, f_type, traffic_class, td, ep, attr, length
  Description : Deciphers frame
  *************************************************************/

  task TSK_DECIPHER_FRAME;
  output [1:0]   fmt;
  output [4:0]   f_type;
  output [2:0]   traffic_class;
  output     td;
  output     ep;
  output [1:0]   attr;
  output [9:0]   length;
  input    txrx;

  begin

    fmt = (txrx ? frame_store_tx[0] : frame_store_rx[0]) >> 5;
    f_type = txrx ? frame_store_tx[0] : frame_store_rx[0];
    traffic_class = (txrx ? frame_store_tx[1] : frame_store_rx[1]) >> 4;
    td = (txrx ? frame_store_tx[2] : frame_store_rx[2]) >> 7;
    ep = (txrx ? frame_store_tx[2] : frame_store_rx[2]) >> 6;
    attr = (txrx ? frame_store_tx[2] : frame_store_rx[2]) >> 4;
    length = (txrx ? frame_store_tx[2] : frame_store_rx[2]);
    length = (length << 8) | (txrx ? frame_store_tx[3] : frame_store_rx[3]);

  end

  endtask // TSK_DECIPHER_FRAME


  /************************************************************
  Task : TSK_3DW
  Inputs : fmt, f_type, traffic_class, td, ep, attr, length, 
  payload, _frame_store_idx
  Outputs : None
  Description : Gets variables and prints frame 
  *************************************************************/

  task TSK_3DW;
  input   [1:0]   fmt;
  input   [4:0]   f_type;
  input   [2:0]   traffic_class;
  input     td;
  input     ep;
  input   [1:0]   attr;
  input   [9:0]   length;
  input      payload;
  input  [31:0]  _frame_store_idx;
  input  [31:0]  _log_file_ptr;
  input     txrx;

  reg [15:0] requester_id;
  reg [7:0] tag;
  reg [7:0] byte_enables;
  reg [31:0] address_low;
  reg [15:0] completer_id;
  reg [9:0] register_address;
  reg [2:0] completion_status;
  reg [31:0] dword_data; // this will be used to recontruct bytes of data and sent to tx_app
 
  integer    _i;

  begin
    $fdisplay(_log_file_ptr, "\t Traffic Class: 0x%h", traffic_class);
    $fdisplay(_log_file_ptr, "\t TD: %h", td);
    $fdisplay(_log_file_ptr, "\t EP: %h", ep);
    $fdisplay(_log_file_ptr, "\t Attributes: 0x%h", attr);
    $fdisplay(_log_file_ptr, "\t Length: 0x%h", length);

    casex({fmt, f_type})

    `PCI_EXP_CFG_READ0, 
    `PCI_EXP_CFG_WRITE0: begin

      requester_id = txrx ? {frame_store_tx[4], frame_store_tx[5]} : {frame_store_rx[4], frame_store_rx[5]};
      tag = txrx ? frame_store_tx[6] : frame_store_rx[6];
      byte_enables = txrx ? frame_store_tx[7] : frame_store_rx[7];
      completer_id = {txrx ? frame_store_tx[8] : frame_store_rx[8], txrx ? frame_store_tx[9] : frame_store_rx[9]};
      register_address = txrx ? frame_store_tx[10] : frame_store_rx[10];
      register_address = (register_address << 8) | (txrx ? frame_store_tx[11] : frame_store_rx[11]);

      $fdisplay(_log_file_ptr, "\t Requester Id: 0x%h", requester_id);
      $fdisplay(_log_file_ptr, "\t Tag: 0x%h", tag);
      $fdisplay(_log_file_ptr, "\t Last and First Byte Enables: 0x%h", byte_enables);
      $fdisplay(_log_file_ptr, "\t Completer Id: 0x%h", completer_id);
      $fdisplay(_log_file_ptr, "\t Register Address: 0x%h \n", register_address);

      if (payload == 1) begin

        for (_i = 12; _i < _frame_store_idx; _i = _i + 1) begin

          $fdisplay(_log_file_ptr, "\t 0x%h", txrx ? frame_store_tx[_i] : frame_store_rx[_i]);

        end
      end
    end

    `PCI_EXP_COMPLETION_WO_DATA,
    `PCI_EXP_COMPLETION_DATA: begin

      completer_id = txrx ? {frame_store_tx[4], frame_store_tx[5]} : {frame_store_rx[4], frame_store_rx[5]};
      completion_status = txrx ? (frame_store_tx[6] >> 5) : (frame_store_rx[6] >> 5);
      requester_id = txrx ? {frame_store_tx[8], frame_store_tx[9]} : {frame_store_rx[8], frame_store_rx[9]};
      tag = txrx ? frame_store_tx[10] : frame_store_rx[10];
      $fdisplay(_log_file_ptr, "\t Completer Id: 0x%h", completer_id);
      $fdisplay(_log_file_ptr, "\t Completion Status: 0x%h", completion_status);
      $fdisplay(_log_file_ptr, "\t Requester Id: 0x%h ", requester_id);
      $fdisplay(_log_file_ptr, "\t Tag: 0x%h \n", tag);

      if (payload == 1) begin      
                                
         dword_data = 32'h0000_0000;
				
	 for (_i = 12; _i < _frame_store_idx; _i = _i + 1) begin
				    				    
		$fdisplay(_log_file_ptr, "\t 0x%h", txrx ? frame_store_tx[_i] : frame_store_rx[_i]);
		if (!txrx) begin // if we are called from rx
				       
			dword_data = dword_data >> 8; // build a dword to send to tx app
			dword_data = dword_data | {frame_store_rx[_i], 24'h00_0000}; 
		end  
	end
	`TX_TASKS.TSK_SET_READ_DATA(4'hf,dword_data); // send the data to the tx_app
      end
    
    
    end

    // memory reads, io reads, memory writes and io writes
    default: begin

      requester_id = txrx ? {frame_store_tx[4], frame_store_tx[5]} : {frame_store_rx[4], frame_store_rx[5]};
      tag = txrx ? frame_store_tx[6] : frame_store_rx[6];
      byte_enables = txrx ? frame_store_tx[7] : frame_store_rx[7];
      address_low = txrx ? frame_store_tx[8] : frame_store_rx[8];
      address_low = (address_low << 8) | (txrx ? frame_store_tx[9] : frame_store_rx[9]);
      address_low = (address_low << 8) | (txrx ? frame_store_tx[10] : frame_store_rx[10]);
      address_low = (address_low << 8) | (txrx ? frame_store_tx[11] : frame_store_rx[11]);
      $fdisplay(_log_file_ptr, "\t Requester Id: 0x%h", requester_id);
      $fdisplay(_log_file_ptr, "\t Tag: 0x%h", tag);
      $fdisplay(_log_file_ptr, "\t Last and First Byte Enables: 0x%h", byte_enables);
      $fdisplay(_log_file_ptr, "\t Address Low: 0x%h \n", address_low);
      if (!txrx) begin
        address_low_rcvd = address_low;
        tag_rcvd = tag;
        length_rcvd = length;
        byte_enables_rcvd = byte_enables;
      end
      if (payload == 1) begin

        for (_i = 12; _i < _frame_store_idx; _i = _i + 1) begin
  
          $fdisplay(_log_file_ptr, "\t 0x%h", (txrx ? frame_store_tx[_i] : frame_store_rx[_i]));
        end

      end
      
    end
  endcase 
  end
  endtask // TSK_3DW


  /************************************************************
  Task : TSK_4DW
  Inputs : fmt, f_type, traffic_class, td, ep, attr, length
  payload, _frame_store_idx
  Outputs : None
  Description : Gets variables and prints frame 
  *************************************************************/
  
  task TSK_4DW;
  input [1:0]   fmt;
  input [4:0]   f_type;
  input [2:0]   traffic_class;
  input         td;
  input     ep;
  input [1:0]   attr;
  input [9:0]   length;
  input      payload;
  input  [31:0]  _frame_store_idx;
  input  [31:0]  _log_file_ptr;
  input    txrx;
  
  reg [15:0]   requester_id;
  reg [7:0]   tag;
  reg [7:0]   byte_enables;
  reg [7:0]   message_code;
  reg [31:0]   address_high;
  reg [31:0]   address_low;
  reg [2:0]   msg_type;
  
  integer    _i;
  
  begin

    $fdisplay(_log_file_ptr, "\t Traffic Class: 0x%h", traffic_class);
    $fdisplay(_log_file_ptr, "\t TD: %h", td);
    $fdisplay(_log_file_ptr, "\t EP: %h", ep);
    $fdisplay(_log_file_ptr, "\t Attributes: 0x%h", attr);
    $fdisplay(_log_file_ptr, "\t Length: 0x%h", length);
  
    requester_id = txrx ? {frame_store_tx[4], frame_store_tx[5]} : {frame_store_rx[4], frame_store_rx[5]};
    tag = txrx ? frame_store_tx[6] : frame_store_rx[6];
    byte_enables = txrx ? frame_store_tx[7] : frame_store_rx[7];
    message_code = txrx ? frame_store_tx[7] : frame_store_rx[7];
    address_high = txrx ? frame_store_tx[8] : frame_store_rx[8];
    address_high = (address_high << 8) | (txrx ? frame_store_tx[9] : frame_store_rx[9]);
    address_high = (address_high << 8) | (txrx ? frame_store_tx[10] : frame_store_rx[10]);
    address_high = (address_high << 8) | (txrx ? frame_store_tx[11] : frame_store_rx[11]);
    address_low = txrx ? frame_store_tx[12] : frame_store_rx[12];
    address_low = (address_low << 8) | (txrx ? frame_store_tx[13] : frame_store_rx[13]);
    address_low = (address_low << 8) | (txrx ? frame_store_tx[14] : frame_store_rx[14]);
    address_low = (address_low << 8) | (txrx ? frame_store_tx[15] : frame_store_rx[15]);
    
    $fdisplay(_log_file_ptr, "\t Requester Id: 0x%h", requester_id);
    $fdisplay(_log_file_ptr, "\t Tag: 0x%h", tag);
    
    casex({fmt, f_type})
  
      `PCI_EXP_MEM_READ64,
      `PCI_EXP_MEM_WRITE64: begin
  
        $fdisplay(_log_file_ptr, "\t Last and First Byte Enables: 0x%h", byte_enables);
        $fdisplay(_log_file_ptr, "\t Address High: 0x%h", address_high);
        $fdisplay(_log_file_ptr, "\t Address Low: 0x%h \n", address_low);
      if (!txrx) begin
        address_low_rcvd = address_low;
        tag_rcvd = tag;
        length_rcvd = length;
        byte_enables_rcvd = byte_enables;
      end
        if (payload == 1) begin
  
          for (_i = 16; _i < _frame_store_idx; _i = _i + 1) begin
  
            $fdisplay(_log_file_ptr, "\t 0x%h", txrx ? frame_store_tx[_i] : frame_store_rx[_i]);
  
          end
        end
      end
    
      `PCI_EXP_MSG_NODATA,
      `PCI_EXP_MSG_DATA: begin
  
        msg_type = f_type;
        $fdisplay(_log_file_ptr, "\t Message Type: 0x%h", msg_type);
        $fdisplay(_log_file_ptr, "\t Message Code: 0x%h", message_code);
        $fdisplay(_log_file_ptr, "\t Address High: 0x%h", address_high);
        $fdisplay(_log_file_ptr, "\t Address Low: 0x%h \n", address_low);
  
        if (payload == 1) begin
  
          for (_i = 16; _i < _frame_store_idx; _i = _i + 1) begin
  
            $fdisplay(_log_file_ptr, "\t 0x%h", txrx ? frame_store_tx[_i] : frame_store_rx[_i]);
          end
        end
      end
    endcase
    end
  endtask // TSK_4DW

  
   /************************************************************
        Task : TSK_READ_DATA
        Inputs : None
        Outputs : None
        Description : Consume clocks.
   *************************************************************/

  task TSK_READ_DATA;
    input    last;
    input    txrx;
    input  [63:0]  trn_d;
    input    trn_rem;
    input    swap_data;

    integer   _i;
    reg  [7:0]  _byte;
    reg  [63:0]  _msk;
    reg  [3:0]  _rem;

    reg [63:0] tmp_data_swap;

    begin

      tmp_data_swap = {trn_d[7:0], trn_d[15:8], trn_d[23:16], trn_d[31:24], trn_d[39:32], trn_d[47:40], trn_d[55:48], trn_d[63:56]};

      _msk = 64'hff00000000000000;
      _rem = (last ? ((trn_rem == 1) ? 4 : 8) : 8);

      for (_i = 0; _i < _rem; _i = _i + 1) begin
        if (swap_data)
          _byte = (tmp_data_swap & (_msk >> (_i * 8))) >> (((7) - _i) * 8);
        else
          _byte = (trn_d & (_msk >> (_i * 8))) >> (((7) - _i) * 8);

        if (txrx) begin

          board.RP.com_usrapp.frame_store_tx[board.RP.com_usrapp.frame_store_tx_idx] = _byte;
          board.RP.com_usrapp.frame_store_tx_idx = board.RP.com_usrapp.frame_store_tx_idx + 1;

        end else begin

          board.RP.com_usrapp.frame_store_rx[board.RP.com_usrapp.frame_store_rx_idx] = _byte;
          board.RP.com_usrapp.frame_store_rx_idx = board.RP.com_usrapp.frame_store_rx_idx + 1;
        end

      end 
                end
   endtask // TSK_READ_DATA

   /************************************************************
        Task : TSK_READ_DATA_128
        Inputs : None
        Outputs : None
        Description : Consume clocks.
   *************************************************************/

  task TSK_READ_DATA_128;
    input    first;
    input    last;
    input    txrx;
    input  [127:0]  trn_d;
    input  [1:0]  trn_rem;
    integer   _i;
    reg  [7:0]  _byte;
    reg  [127:0]  _msk;
    reg  [4:0]  _rem;
    reg  [3:0]  _strt_pos;
                begin

      _msk =   128'hff000000000000000000000000000000;
      _rem = (trn_rem[1] ? (trn_rem[0] ? 4 : 8) : (trn_rem[0] ? 12 : 16)) ;
      _strt_pos = 4'd15;

      for (_i = 0; _i < _rem; _i = _i + 1) begin

        _byte = (trn_d & (_msk >> (_i * 8))) >> (((_strt_pos) - _i) * 8);

        if (txrx) begin

          board.RP.com_usrapp.frame_store_tx[board.RP.com_usrapp.frame_store_tx_idx] = _byte;
          board.RP.com_usrapp.frame_store_tx_idx = board.RP.com_usrapp.frame_store_tx_idx + 1;

        end else begin

          board.RP.com_usrapp.frame_store_rx[board.RP.com_usrapp.frame_store_rx_idx] = _byte;
          board.RP.com_usrapp.frame_store_rx_idx = board.RP.com_usrapp.frame_store_rx_idx + 1;
        end

      end 
                end
   endtask // TSK_READ_DATA_128

   /************************************************************
        Task : TSK_READ_DATA_256
        Inputs : None
        Outputs : None
        Description : Consume clocks.
   *************************************************************/

  task TSK_READ_DATA_256;
    input    first;
    input    last;
    input    txrx;
    input  [255:0]  trn_d;
    input  [2:0]  trn_rem;
    integer   _i;
    reg  [7:0]  _byte;
    reg  [255:0]  _msk;
    reg  [5:0]  _rem;
    reg  [4:0]  _strt_pos;
                begin

//      _msk = ((first && trn_rem[2]) ? 
//             (trn_rem[1] ? 256'h000000000000000000000000000000000000000000000000ff00000000000000 : 256'h00000000000000000000000000000000ff000000000000000000000000000000): 
//             (trn_rem[1] ? 256'h0000000000000000ff0000000000000000000000000000000000000000000000 : 256'hff00000000000000000000000000000000000000000000000000000000000000)); 

      _msk = 256'hff00000000000000000000000000000000000000000000000000000000000000;

       casex (trn_rem)
           3'b000 : _rem = 32;
           3'b001 : _rem = 28;
           3'b010 : _rem = 24;
           3'b011 : _rem = 20;
           3'b100 : _rem = 16;
           3'b101 : _rem = 12;
           3'b110 : _rem =  8;
           3'b111 : _rem =  4;
           default  : _rem = 32;
        endcase

      //_strt_pos = ((first && trn_rem[2]) ? (trn_rem[1] ? 4'd7 : 4'd15) : (trn_rem[1] ? 4'd23 : 4'd31));
      _strt_pos = 5'd31; //((first && trn_rem[2]) ? (trn_rem[1] ? 5'd23 : 5'd31) : (trn_rem[1] ? 5'd7 : 5'd15));

      for (_i = 0; _i < _rem; _i = _i + 1) begin

        _byte = (trn_d & (_msk >> (_i * 8))) >> (((_strt_pos) - _i) * 8);

        if (txrx) begin

          board.RP.com_usrapp.frame_store_tx[board.RP.com_usrapp.frame_store_tx_idx] = _byte;
          board.RP.com_usrapp.frame_store_tx_idx = board.RP.com_usrapp.frame_store_tx_idx + 1;

        end else begin

          board.RP.com_usrapp.frame_store_rx[board.RP.com_usrapp.frame_store_rx_idx] = _byte;
          board.RP.com_usrapp.frame_store_rx_idx = board.RP.com_usrapp.frame_store_rx_idx + 1;
        end

      end 
                end
   endtask // TSK_READ_DATA_256

`include "pci_exp_expect_tasks.v"

   /************************************************************
    Task : TSK_CHECK_DATA
    Inputs : byte_en,len,addr
    Outputs : None
    Description : checks data integrity
   *************************************************************/

 task TSK_CHECK_DATA;
  input [7:0] byte_en;
  input [9:0] len;
  input [31:0] addr;
 
  reg [31:0] buff_add;
  reg [6:0] lower_add;
  reg [11:0] byte_count;

  reg [5:0] jj;
  reg [11:0] ii;
//  reg [15:0] seq_no_ch0;
//  reg [15:0] seq_no_ch1;
//  reg [15:0] seq_no_ch2;
//  reg [15:0] seq_no_ch3;
  reg [15:0] channel;

  reg [31:0] crc_rcvd, crc_exp;

  integer kk;

  begin
   board.RP.tx_usrapp.TSK_VALID_DATA(byte_en, len, addr, buff_add, lower_add, byte_count);
 // for both channels it will not check the header, checks only payload data
     //jj = 26; // initial 12 bytes for 3DW PCIe header and 14 bytes for Ethernet header
     if ((buff_add >= `RXBUF0_BASE) && (buff_add <= `RXBUF0_LIMIT)) begin
      jj = 16;  //12; //-16 for 4DW header
      channel = 0;
     end  
     if ((buff_add >= `RXBUF1_BASE) && (buff_add <= `RXBUF1_LIMIT)) begin
      jj = 16;  //12;
      channel = 1;
     end  
     if ((buff_add >= `RXBUF2_BASE) && (buff_add <= `RXBUF2_LIMIT)) begin
      jj = 16;  //12;
      channel = 2;
     end  
     if ((buff_add >= `RXBUF3_BASE) && (buff_add <= `RXBUF3_LIMIT)) begin
      jj = 16;  //12;
      channel = 3;
     end  

     if(byte_en[0] == 1'b1)
      jj = jj; // initial 12 bytes for 3DW header 
     else if(byte_en[1] == 1'b1)
      jj = jj + 1;
     else if(byte_en[2] == 1'b1)
      jj = jj + 2;
     else if(byte_en[3] == 1'b1)
      jj = jj + 3;

    if (channel == 0) begin
      //- Though packet count starts from index 16, limit in for loop is
      //byte_count - 8 as comparison in else part uses index of +9 and +8 in
      //order to compare only payload without header.
  `ifndef NW_PATH_ENABLE          
      for( ii = jj; ii < (byte_count + 8 -1); ii = ii + 2 ) begin
       if({frame_store_rx[ii+1],frame_store_rx[ii]} == `MAX_BUFFER_LENGTH_CHNL0) begin
          seq_no_ch0 = {frame_store_rx[ii+3],frame_store_rx[ii+2]};
          crc_exp = nextCRC32_D32({frame_store_rx[ii], frame_store_rx[ii+1], frame_store_rx[ii+2], frame_store_rx[ii+3]},32'hFFFF_FFFF);
          crc_rcvd = {frame_store_rx[ii+7], frame_store_rx[ii+6], frame_store_rx[ii+5], frame_store_rx[ii+4]};
          $display("[%t] Packet Received on Channel-%h, Seq NO  = %h, CRC = %h",$time, channel, seq_no_ch0, crc_rcvd);
          if (crc_exp != crc_rcvd) begin
            $display("[%t] Error : CRC Mismatch on channel-0, expected CRC = %h", $time, crc_exp);
            $fdisplay(error_file_ptr, "[%t] Error : CRC Mismatch on channel-0, expected CRC = %h", $time, crc_exp);
          end
       end
       else begin
        if({frame_store_rx[ii+9],frame_store_rx[ii+8]} != seq_no_ch0) begin
          $fdisplay(error_file_ptr,"[%t] Error : Data Mismatch byte_count = %d expected data = %h received data = %h",$time, ii, seq_no_ch0,{frame_store_rx[ii+9],frame_store_rx[ii+8]});
          $display("[%t] Error : Data Mismatch on Channel 0 byte_count = %d expected data = %h received data = %h",$time, ii, seq_no_ch0,{frame_store_rx[ii+9],frame_store_rx[ii+8]});
        end  
       end
      end
    `else      
       $display("[%t] Packet Received on Channel-%h ",$time, channel);
       if({frame_store_rx[jj+12],frame_store_rx[jj+13]} == `MAX_BUFFER_LENGTH_CHNL0 - 'd14) begin
       $display("[%t] Ethernet frame payload size Received on Channel-%h = %h",$time, channel, {frame_store_rx[jj+13],frame_store_rx[jj+12]});
       end
       else begin
        jj = jj + 14;
        for( ii = jj; ii < (byte_count + 8 -1); ii = ii + 2 ) begin
          if (frame_store_rx[ii+1] != (frame_store_rx[ii] + 1'b1)) begin
          $fdisplay(error_file_ptr,"[%t] Error : Data Mismatch byte_count = %d expected data = %h received data = %h",$time, ii, (frame_store_rx[ii] + 1'b1),frame_store_rx[ii]);
          $display("[%t] Error : Data Mismatch on Channel 0 byte_count = %d expected data = %h received data = %h",$time, ii, frame_store_rx[ii] + 1'b1,frame_store_rx[ii]);
          end
       end
      end
   `endif       
    end

    if (channel == 1) begin
  `ifndef NW_PATH_ENABLE          
      for( ii = jj; ii < (byte_count + 8 -1); ii = ii + 2 ) begin
       if({frame_store_rx[ii+1],frame_store_rx[ii]} == `MAX_BUFFER_LENGTH_CHNL1) begin
          seq_no_ch1 = {frame_store_rx[ii+3],frame_store_rx[ii+2]};
          crc_exp = nextCRC32_D32({frame_store_rx[ii], frame_store_rx[ii+1],
          frame_store_rx[ii+2], frame_store_rx[ii+3]},32'hFFFF_FFFF);
          crc_rcvd = {frame_store_rx[ii+7], frame_store_rx[ii+6], frame_store_rx[ii+5], frame_store_rx[ii+4]};
          $display("[%t] Packet Received on Channel-%h, Seq NO  = %h, CRC = %h",$time, channel, seq_no_ch1, crc_rcvd );
          if (crc_exp != crc_rcvd) begin
            $display("[%t] Error : CRC Mismatch on channel-1, expected CRC = %h", $time, crc_exp);
            $fdisplay(error_file_ptr, "[%t] Error : CRC Mismatch on channel-1, expected CRC = %h", $time, crc_exp);
          end
       end
       else begin
        if({frame_store_rx[ii+9],frame_store_rx[ii+8]} != seq_no_ch1) begin
          $fdisplay(error_file_ptr,"[%t] Error : Data Mismatch byte_count = %d expected data = %h received data = %h",$time, ii, seq_no_ch1,{frame_store_rx[ii+9],frame_store_rx[ii+8]});
          $display("[%t] Error : Data Mismatch on Channel 1 byte_count = %d expected data = %h received data = %h",$time, ii, seq_no_ch1,{frame_store_rx[ii+9],frame_store_rx[ii+8]});
        end  
       end
      end
   `else       
       $display("[%t] Packet Received on Channel-%h ",$time, channel);
       if({frame_store_rx[jj+12],frame_store_rx[jj+13]} == `MAX_BUFFER_LENGTH_CHNL1 - 'd14) begin
       $display("[%t] Ethernet frame payload size Received on Channel-%h = %h",$time, channel, {frame_store_rx[jj+12],frame_store_rx[jj+13]});
       end
       else begin
        jj = jj + 14;
        for( ii = jj; ii < (byte_count + 8 -1); ii = ii + 2 ) begin
          if (frame_store_rx[ii+1] != (frame_store_rx[ii] + 1'b1)) begin
          $fdisplay(error_file_ptr,"[%t] Error : Data Mismatch byte_count = %d expected data = %h received data = %h",$time, ii, (frame_store_rx[ii] + 1'b1),frame_store_rx[ii]);
          $display("[%t] Error : Data Mismatch on Channel 1 byte_count = %d expected data = %h received data = %h",$time, ii, frame_store_rx[ii] + 1'b1,frame_store_rx[ii]);
          end
       end
      end
   `endif       
    end

    if (channel == 2) begin
  `ifndef NW_PATH_ENABLE          
      for( ii = jj; ii < (byte_count + 8 -1); ii = ii + 2 ) begin
       if({frame_store_rx[ii+1],frame_store_rx[ii]} == `MAX_BUFFER_LENGTH_CHNL2) begin
          seq_no_ch2 = {frame_store_rx[ii+3],frame_store_rx[ii+2]};
          crc_exp = nextCRC32_D32({frame_store_rx[ii], frame_store_rx[ii+1],
          frame_store_rx[ii+2], frame_store_rx[ii+3]},32'hFFFF_FFFF);
          crc_rcvd = {frame_store_rx[ii+7], frame_store_rx[ii+6], frame_store_rx[ii+5], frame_store_rx[ii+4]};
          $display("[%t] Packet Received on Channel-%h, Seq NO  = %h, CRC = %h",$time, channel, seq_no_ch2, crc_rcvd );
          if (crc_exp != crc_rcvd) begin
            $display("[%t] Error : CRC Mismatch on channel-2, expected CRC = %h", $time, crc_exp);
            $fdisplay(error_file_ptr, "[%t] Error : CRC Mismatch on channel-2, expected CRC = %h", $time, crc_exp);
          end
       end
       else begin
        if({frame_store_rx[ii+9],frame_store_rx[ii+8]} != seq_no_ch2) begin
          $fdisplay(error_file_ptr,"[%t] Error : Data Mismatch byte_count = %d expected data = %h received data = %h",$time, ii, seq_no_ch2,{frame_store_rx[ii+9],frame_store_rx[ii+8]});
          $display("[%t] Error : Data Mismatch on Channel 2 byte_count = %d expected data = %h received data = %h",$time, ii, seq_no_ch2,{frame_store_rx[ii+9],frame_store_rx[ii+8]});
        end  
       end
      end
   `else       
       $display("[%t] Packet Received on Channel-%h ",$time, channel);
       if({frame_store_rx[jj+12],frame_store_rx[jj+13]} == `MAX_BUFFER_LENGTH_CHNL2 - 'd14) begin
       $display("[%t] Ethernet frame payload size Received on Channel-%h = %h",$time, channel, {frame_store_rx[jj+12],frame_store_rx[jj+13]});
       end
       else begin
        jj = jj + 14;
        for( ii = jj; ii < (byte_count + 8 -1); ii = ii + 2 ) begin
          if (frame_store_rx[ii+1] != (frame_store_rx[ii] + 1'b1)) begin
          $fdisplay(error_file_ptr,"[%t] Error : Data Mismatch byte_count = %d expected data = %h received data = %h",$time, ii, (frame_store_rx[ii] + 1'b1),frame_store_rx[ii]);
          $display("[%t] Error : Data Mismatch on Channel 2 byte_count = %d expected data = %h received data = %h",$time, ii, frame_store_rx[ii] + 1'b1,frame_store_rx[ii]);
          end
       end
      end
   `endif       
    end

    if (channel == 3) begin
  `ifndef NW_PATH_ENABLE          
      for( ii = jj; ii < (byte_count + 8 -1); ii = ii + 2 ) begin
       if({frame_store_rx[ii+1],frame_store_rx[ii]} == `MAX_BUFFER_LENGTH_CHNL3) begin
          seq_no_ch3 = {frame_store_rx[ii+3],frame_store_rx[ii+2]};
          crc_exp = nextCRC32_D32({frame_store_rx[ii], frame_store_rx[ii+1],
          frame_store_rx[ii+2], frame_store_rx[ii+3]},32'hFFFF_FFFF);
          crc_rcvd = {frame_store_rx[ii+7], frame_store_rx[ii+6], frame_store_rx[ii+5], frame_store_rx[ii+4]};
          $display("[%t] Packet Received on Channel-%h, Seq NO  = %h, CRC = %h",$time, channel, seq_no_ch3, crc_rcvd );
          if (crc_exp != crc_rcvd) begin
            $display("[%t] Error : CRC Mismatch on channel-3, expected CRC = %h", $time, crc_exp);
            $fdisplay(error_file_ptr, "[%t] Error : CRC Mismatch on channel-3, expected CRC = %h", $time, crc_exp);
          end
       end
       else begin
        if({frame_store_rx[ii+9],frame_store_rx[ii+8]} != seq_no_ch3) begin
          $fdisplay(error_file_ptr,"[%t] Error : Data Mismatch byte_count = %d expected data = %h received data = %h",$time, ii, seq_no_ch3,{frame_store_rx[ii+9],frame_store_rx[ii+8]});
          $display("[%t] Error : Data Mismatch on Channel 3 byte_count = %d expected data = %h received data = %h",$time, ii, seq_no_ch3,{frame_store_rx[ii+9],frame_store_rx[ii+8]});
        end  
       end
      end
   `else       
       $display("[%t] Packet Received on Channel-%h ",$time, channel);
       if({frame_store_rx[jj+12],frame_store_rx[jj+13]} == `MAX_BUFFER_LENGTH_CHNL3 - 'd14) begin
       $display("[%t] Ethernet frame payload size Received on Channel-%h = %h",$time, channel, {frame_store_rx[jj+12],frame_store_rx[jj+13]});
       end
       else begin
        jj = jj + 14;
        for( ii = jj; ii < (byte_count + 8 -1); ii = ii + 2 ) begin
          if (frame_store_rx[ii+1] != (frame_store_rx[ii] + 1'b1)) begin
          $fdisplay(error_file_ptr,"[%t] Error : Data Mismatch byte_count = %d expected data = %h received data = %h",$time, ii, (frame_store_rx[ii] + 1'b1),frame_store_rx[ii]);
          $display("[%t] Error : Data Mismatch on Channel 3 byte_count = %d expected data = %h received data = %h",$time, ii, frame_store_rx[ii] + 1'b1,frame_store_rx[ii]);
          end
       end
      end
   `endif       
    end

   end
 endtask // TSK_CHECK_DATA

   /************************************************************
    Task : TSK_CHECK_DESCRIPTOR
    Inputs : addr
    Outputs : None
    Description : checks descriptor update 
   *************************************************************/
  task TSK_CHECK_DESCRIPTOR;

   input [31:0] addr;
   reg [19:0] byte_count_rcvd;
   reg [19:0] byte_count_ch0;
   reg [19:0] byte_count_ch1;
   reg [19:0] byte_count_ch2;
   reg [19:0] byte_count_ch3;
   reg [31:0] bd_addr;

    begin
     //- It is considered 4DW header here
     //byte_count_rcvd = {frame_store_rx[14][3:0], frame_store_rx[13],frame_store_rx[12]};
     byte_count_rcvd = {frame_store_rx[18][3:0], frame_store_rx[17],frame_store_rx[16]};

     if(frame_store_rx[19][0] != 1'b1)
      $fdisplay(error_file_ptr,"[%t]Error: No BD Update",$time);
     if(frame_store_rx[19][4] == 1'b1)
      $fdisplay(error_file_ptr,"[%t]Error: Descriptor completes due to an error",$time);

     if((addr >= `TXDESC0_BASE) && (addr <= `TXDESC0_LIMIT))
      begin
      $display("[%t] Received byte count update (S2C0) = %d", $time,byte_count_rcvd);
       bd_addr = addr >>2;
       if(byte_count_rcvd != board.RP.tx_usrapp.DESC_DATA[bd_addr + 4][19:0])
        $fdisplay(error_file_ptr,"[%t]Error: CH0 Byte count mismatch in TX BD update",$time);
      end

      else if((addr >= `TXDESC1_BASE) && (addr <= `TXDESC1_LIMIT))
       begin
      $display("[%t] Received byte count update (S2C1) = %d", $time,byte_count_rcvd);
  bd_addr = addr >>2;
        if(byte_count_rcvd != board.RP.tx_usrapp.DESC_DATA[bd_addr + 4][19:0])
        $fdisplay(error_file_ptr,"[%t]Error: CH1 Byte count mismatch in TX BD update",$time);
       end
      else if((addr >= `TXDESC2_BASE) && (addr <= `TXDESC2_LIMIT))
       begin
      $display("[%t] Received byte count update (S2C2) = %d", $time,byte_count_rcvd);
  bd_addr = addr >>2;
        if(byte_count_rcvd != board.RP.tx_usrapp.DESC_DATA[bd_addr + 4][19:0])
        $fdisplay(error_file_ptr,"[%t]Error: CH2 Byte count mismatch in TX BD update",$time);
       end
      else if((addr >= `TXDESC3_BASE) && (addr <= `TXDESC3_LIMIT))
       begin
      $display("[%t] Received byte count update (S2C3) = %d", $time,byte_count_rcvd);
  bd_addr = addr >>2;
        if(byte_count_rcvd != board.RP.tx_usrapp.DESC_DATA[bd_addr + 4][19:0])
        $fdisplay(error_file_ptr,"[%t]Error: CH3 Byte count mismatch in TX BD update",$time);
       end
      else
       begin
        $display("[%t] Received SOP update =  %h", $time,frame_store_rx[19][7]);
        $display("[%t] Received EOP update = %h", $time,frame_store_rx[19][6]);
        if((addr >= `RXDESC0_BASE) && (addr <= `RXDESC0_LIMIT))
          $display("[%t] Received byte count update (C2S0) = %d", $time,byte_count_rcvd);
        else if((addr >= `RXDESC1_BASE) && (addr <= `RXDESC1_LIMIT)) 
          $display("[%t] Received byte count update (C2S1) = %d", $time,byte_count_rcvd);
        else if((addr >= `RXDESC2_BASE) && (addr <= `RXDESC2_LIMIT)) 
          $display("[%t] Received byte count update (C2S2) = %d", $time,byte_count_rcvd);
        else if((addr >= `RXDESC3_BASE) && (addr <= `RXDESC3_LIMIT)) 
          $display("[%t] Received byte count update (C2S3) = %d", $time,byte_count_rcvd);


        if(frame_store_rx[19][7] == 1'b1)
        begin
          if((addr >= `RXDESC0_BASE) && (addr <= `RXDESC0_LIMIT))
          begin
            //$display("[%t] Received byte count update (C2S0) = %d", $time,byte_count_rcvd);
            byte_count_ch0 = byte_count_rcvd;
          end  
          else if((addr >= `RXDESC1_BASE) && (addr <= `RXDESC1_LIMIT)) 
          begin
            //$display("[%t] Received byte count update (C2S1) = %d", $time,byte_count_rcvd);
            byte_count_ch1 = byte_count_rcvd;
          end  
          else if((addr >= `RXDESC2_BASE) && (addr <= `RXDESC2_LIMIT)) 
          begin
            //$display("[%t] Received byte count update (C2S1) = %d", $time,byte_count_rcvd);
            byte_count_ch2 = byte_count_rcvd;
          end  
          else if((addr >= `RXDESC3_BASE) && (addr <= `RXDESC3_LIMIT)) 
          begin
            //$display("[%t] Received byte count update (C2S1) = %d", $time,byte_count_rcvd);
            byte_count_ch3 = byte_count_rcvd;
          end  
        end
        else
        begin
          if((addr >= `RXDESC0_BASE) && (addr <= `RXDESC0_LIMIT))
            byte_count_ch0 = byte_count_ch0 + byte_count_rcvd;
          else if((addr >= `RXDESC1_BASE) && (addr <= `RXDESC1_LIMIT))
            byte_count_ch1 = byte_count_ch1 + byte_count_rcvd;
          else if((addr >= `RXDESC2_BASE) && (addr <= `RXDESC2_LIMIT))
            byte_count_ch2 = byte_count_ch2 + byte_count_rcvd;
          else //if((addr >= `RXDESC3_BASE) && (addr <= `RXDESC3_LIMIT))
            byte_count_ch3 = byte_count_ch3 + byte_count_rcvd;
        end  

        if(frame_store_rx[19][6] == 1'b1) begin
         if((addr >= `RXDESC0_BASE) && (addr <= `RXDESC0_LIMIT) && (board.RP.tx_usrapp.dma_start_disabling_ch0 == 1'b0)) begin
           if(byte_count_ch0 != board.RP.tx_usrapp.BUFFER_LENGTH_CH0[packet_rcvd_ch0])
            $fdisplay(error_file_ptr,"[%t]Error :CH0 Byte count mismatch in RX BD update ",$time);
           packet_rcvd_ch0 = packet_rcvd_ch0 + 1;
         end
         else if((addr >= `RXDESC1_BASE) && (addr <= `RXDESC1_LIMIT) && (board.RP.tx_usrapp.dma_start_disabling_ch1 == 1'b0)) begin
          if(byte_count_ch1 != board.RP.tx_usrapp.BUFFER_LENGTH_CH1[packet_rcvd_ch1])
          begin
          $fdisplay(error_file_ptr,"[%t]Error :CH1 Byte count mismatch in RX BD update ",$time);
          $display("[%t]Error :CH1 Byte count mismatch in RX BD update\n",$time);
          $display("Error: expected count=%d, count received = %d\n",board.RP.tx_usrapp.BUFFER_LENGTH_CH1[packet_rcvd_ch1], byte_count_ch1);
          end
          packet_rcvd_ch1 = packet_rcvd_ch1 + 1;
         end
         else if((addr >= `RXDESC2_BASE) && (addr <= `RXDESC2_LIMIT) && (board.RP.tx_usrapp.dma_start_disabling_ch2 == 1'b0)) begin
          if(byte_count_ch2 != board.RP.tx_usrapp.BUFFER_LENGTH_CH2[packet_rcvd_ch2])
          begin
          $fdisplay(error_file_ptr,"[%t]Error :CH2 Byte count mismatch in RX BD update ",$time);
          $display("[%t]Error :CH2 Byte count mismatch in RX BD update\n",$time);
          $display("Error: expected count=%d, count received = %d\n",board.RP.tx_usrapp.BUFFER_LENGTH_CH2[packet_rcvd_ch2], byte_count_ch2);
          end
          packet_rcvd_ch2 = packet_rcvd_ch2 + 1;
         end
         else if((addr >= `RXDESC3_BASE) && (addr <= `RXDESC3_LIMIT) && (board.RP.tx_usrapp.dma_start_disabling_ch3 == 1'b0)) begin
          if(byte_count_ch3 != board.RP.tx_usrapp.BUFFER_LENGTH_CH3[packet_rcvd_ch3])
          begin
          $fdisplay(error_file_ptr,"[%t]Error :CH3 Byte count mismatch in RX BD update ",$time);
          $display("[%t]Error :CH3 Byte count mismatch in RX BD update\n",$time);
          $display("Error: expected count=%d, count received = %d\n",board.RP.tx_usrapp.BUFFER_LENGTH_CH3[packet_rcvd_ch3], byte_count_ch3);
          end
          packet_rcvd_ch3 = packet_rcvd_ch3 + 1;
         end
        end
       end
    end

 endtask //TSK_CHECK_DESCRIPTOR

endmodule // pci_exp_usrapp_com
