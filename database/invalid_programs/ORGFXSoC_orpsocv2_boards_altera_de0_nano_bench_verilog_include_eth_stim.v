//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Ethernet MAC Stimulus                                       ////
////                                                              ////
////  Description                                                 ////
////  Ethernet MAC stimulus tasks. Taken from the project         ////
////  testbench in the ethmac core.                               ////
////                                                              ////
////  To Do:                                                      ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////      - Tadej Markovic, tadej@opencores.org                   ////
////      - Igor Mohor,     igorM@opencores.org                   ////
////      - Julius Baxter   julius.baxter@orsoc.se                ////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
`define TIME $display("Time: %0t", $time)

// Defines for ethernet test to trigger sending/receiving
// Is straight forward when using RTL design, but if using netlist then paths to
// the RX/TX enabled bits depend on synthesis tool, etc, but ones here appear to
// work with design put through Synplify, with hierarchy maintained.
`define ETH_TOP dut.ethmac0
`define ETH_BD_RAM_PATH `ETH_TOP.wishbone.bd_ram
`define ETH_MODER_PATH `ETH_TOP.ethreg1.MODER_0

`ifdef RTL_SIM
 `ifdef ethmac_IS_GATELEVEL
  `define ETH_MODER_TXEN_BIT `ETH_MODER_PATH.r_TxEn;
  `define ETH_MODER_RXEN_BIT `ETH_MODER_PATH.r_RxEn;
 `else
  `define ETH_MODER_TXEN_BIT `ETH_MODER_PATH.DataOut[1];
  `define ETH_MODER_RXEN_BIT `ETH_MODER_PATH.DataOut[0];
 `endif
`endif

`ifdef GATE_SIM
 `define ETH_MODER_TXEN_BIT `ETH_MODER_PATH.r_TxEn;
 `define ETH_MODER_RXEN_BIT `ETH_MODER_PATH.r_RxEn;
`endif

reg [15:0] eth_stim_rx_packet_length;
reg [7:0] st_data;
reg [31:0] lfsr;
integer lfsr_last_byte;

// Is number of ethernet packets to send if doing the eth-rx test.
parameter eth_stim_num_rx_only_num_packets = 500; // Set to 0 for continuous RX
parameter eth_stim_num_rx_only_packet_size = 512;
parameter eth_stim_num_rx_only_packet_size_change = 2'b01;  // 2'b01: Increment
parameter eth_stim_num_rx_only_packet_size_change_amount = 1;
parameter eth_stim_num_rx_only_IPG = 800000; // ns

// Do call/response test
reg eth_stim_do_rx_reponse_to_tx;
reg eth_stim_do_overflow_test;

  
parameter num_tx_bds = 16;
parameter num_tx_bds_mask = 4'hf;
parameter num_rx_bds = 16;
parameter num_rx_bds_mask = 4'hf;
parameter max_eth_packet_size = 16'h0600;

// If running eth-rxtxbig test (sending and receiving maximum packets), then
// set this parameter to the max packet size, otherwise min packet size
//parameter rx_while_tx_min_packet_size = max_eth_packet_size;
parameter rx_while_tx_min_packet_size = 32;

// Use the smallest possible IPG
parameter eth_stim_use_min_IPG = 0;
parameter eth_stim_IPG_delay_max = 500_000; // Maximum 500uS ga
//parameter eth_stim_IPG_delay_max = 100_000_000; // Maximum 100mS between packets
parameter eth_stim_IPG_min_10mb = 9600; // 9.6 uS
parameter eth_stim_IPG_min_100mb = 800; // 860+~100 = 960 nS 100MBit min IPG
parameter eth_stim_check_rx_packet_contents = 1;
parameter eth_stim_check_tx_packet_contents = 1;

parameter eth_inject_errors = 0;

// When running simulations where you don't want to feed packets to the design
// like this...
parameter eth_stim_disable_rx_stim = 0;

// Delay between seeing that the buffer descriptor for an RX packet says it's
// been received and ending up in the memory.
// For 25MHz sdram controller, use following:
//parameter  Td_rx_packet_check = (`BOARD_CLOCK_PERIOD * 2000);
// For 64MHz sdram controller, use following:
parameter  Td_rx_packet_check = (`BOARD_CLOCK_PERIOD * 500);



integer expected_rxbd;// init to 0
integer expected_txbd;

wire ethmac_rxen;
wire ethmac_txen;
assign ethmac_rxen = eth_stim_disable_rx_stim ? 0 : `ETH_MODER_RXEN_BIT;
assign ethmac_txen = `ETH_MODER_TXEN_BIT;

integer eth_rx_num_packets_sent = 0;
integer eth_rx_num_packets_checked = 0;
integer num_tx_packets = 1;

integer rx_packet_lengths [0:1023]; // Array of packet lengths


integer speed_loop;

// When txen is (re)enabled, the tx bd pointer goes back to 0
always @(posedge ethmac_txen)
  expected_txbd = 0;
   
   reg 	eth_stim_waiting;
   
initial 
  begin
     #1;
     //lfsr = 32'h84218421; // Init pseudo lfsr
     lfsr = 32'h00700001; // Init pseudo lfsr
     lfsr_last_byte = 0;
     
     eth_stim_waiting = 1;
     expected_rxbd = num_tx_bds; // init this here

     eth_stim_do_rx_reponse_to_tx = 0;
     eth_stim_do_overflow_test = 0;
     
     
     while (eth_stim_waiting) // Loop, waiting for enabling of MAC by software
       begin
	  #100;
	  // If RX enable and not TX enable...
	  if(ethmac_rxen === 1'b1 & !(ethmac_txen===1'b1))
	    begin
	       if (eth_inject_errors)
		 begin
		    do_rx_only_stim(16, 64, 0, 0);
		    do_rx_only_stim(128, 64, 1'b1, 8);
		    do_rx_only_stim(256, 64, 1'b1, 4);
		    eth_stim_waiting = 0;	    
		 end
	       else
		 begin
		    //do_rx_only_stim(eth_stim_num_rx_only_num_packets, 
		    //eth_stim_num_rx_only_packet_size, 0, 0);

		    // Call packet send loop directly. No error injection.
		    send_packet_loop(eth_stim_num_rx_only_num_packets, 
				     eth_stim_num_rx_only_packet_size, 
				     eth_stim_num_rx_only_packet_size_change,
				     eth_stim_num_rx_only_packet_size_change_amount,
				     eth_phy0.eth_speed,     // Speed
				     eth_stim_num_rx_only_IPG, // IPG
			       48'h0012_3456_789a, 48'h0708_090A_0B0C, 1, 
			       0, 0, 0);
		    
		    eth_stim_waiting = 0;	    
		 end
	    end // if (ethmac_rxen === 1'b1 & !(ethmac_txen===1'b1))
	  // If both RX and TX enabled
	  else if (ethmac_rxen === 1'b1 & ethmac_txen===1'b1)
	    begin
	       // Both enabled - let's wait for the first packet transmitted
	       // to see what stimulus we should provide
	       while (num_tx_packets==1)
		 #1000;

	       $display("* ethmac RX/TX test request: %x", eth_phy0.tx_mem[0]);
		 
	       // Check the first received byte's value
		 case (eth_phy0.tx_mem[0])
		   0:
		     begin
			// kickoff call/response here
			eth_stim_do_rx_reponse_to_tx = 1;
		     end
		   1:
		     begin
			// kickoff overflow test here
			eth_stim_do_overflow_test = 1;
		     end
		   default:
		     begin
			do_rx_while_tx_stim(1400);
		     end
		 endcase // case (eth_phy0.tx_mem[0])
	  
	       eth_stim_waiting = 0;
	    end
       end // while (eth_stim_waiting)     
     
  end // initial begin

   // Main Ethernet RX testing stimulus task.
   // Sends a set of packets at both speeds
   task do_rx_only_stim;
      input [31:0] num_packets;
      input [31:0] start_packet_size;      
      input 	   inject_errors;
      input [31:0] inject_errors_mod;
      
      begin
	 
	 for(speed_loop=1;speed_loop<3;speed_loop=speed_loop+1)
	   begin
	      
	      send_packet_loop(num_packets, start_packet_size, 2'b01, 1, 
			       speed_loop[0], 10000,
			       48'h0012_3456_789a, 48'h0708_090A_0B0C, 1, 
			       inject_errors, inject_errors_mod, 0);
	      
	   end
	 
      end
   endtask // do_rx_stim

   // Generate RX packets while there's TX going on
   // Sends a set of packets at both speeds
   task do_rx_while_tx_stim;
      input [31:0] num_packets;
      reg [31:0] IPG; // Inter-packet gap
      reg [31:0] packet_size;
      
      integer 	 j;      
      begin
	 
	 for(j=0;j<num_packets;j=j+1)
	   begin
	      // Determine delay between RX packets:
	      
	      if (eth_stim_use_min_IPG)
		begin
		   // Assign based on whether we're in 100mbit or 10mbit mode
		   IPG = eth_phy0.eth_speed ? eth_stim_IPG_min_100mb :
			 eth_stim_IPG_min_10mb;
		   // Add a little bit of variability
		   // Add up to 15
		   IPG = IPG + ($random & 32'h000000f);
		end
	      else
		begin
		   IPG = $random;
		   
		   while (IPG > eth_stim_IPG_delay_max)
		     IPG = IPG / 2;
		   
		   
		end
	      $display("do_rx_while_tx IPG = %0d", IPG);
	      // Determine size of next packet:
	      if (rx_while_tx_min_packet_size == max_eth_packet_size)
		// We want to transmit biggest packets possible, easy case
		packet_size = max_eth_packet_size - 4;
	      else
		begin			
		   // Constrained random sized packets
		   packet_size = $random;
		   
		   while (packet_size > (max_eth_packet_size-4))
		     packet_size = packet_size / 2;
		   
		   // Now divide by least significant bits of j
		   packet_size = packet_size / {29'd0,j[1:0],1'b1};
		   if (packet_size < 60)
		     packet_size = packet_size + 60;
		end
	      
	      $display("do_rx_while_tx packet_size = %0d", packet_size);
	      send_packet_loop(1, packet_size, 2'b01, 1, eth_phy0.eth_speed, 
			       IPG, 48'h0012_3456_789a, 
			       48'h0708_090A_0B0C, 1, 1'b0, 0, 0);

	      // If RX enable went low, wait for it go high again
	      if (ethmac_rxen===1'b0)
		begin
		   
		   while (ethmac_rxen===1'b0)
		     begin
			@(posedge ethmac_rxen);
			#10000;
		     end
		   
		   // RX disabled and when re-enabled we reset the buffer descriptor number
		   expected_rxbd = num_tx_bds;

		end
	      
	   end // for (j=0;j<num_packets;j=j+1)
      end
   endtask // do_rx_stim

   // Registers used in detecting transmitted packets
   reg eth_stim_tx_loop_keep_polling;
   reg [31:0] ethmac_txbd_lenstat, ethmac_last_txbd_lenstat;
   reg 	      eth_stim_detected_packet_tx;

   // If in call-response mode, whenever we receive a TX packet, we generate
   // one and send it back
   always @(negedge eth_stim_detected_packet_tx)
     begin
	if (eth_stim_do_rx_reponse_to_tx & ethmac_rxen)
	  // Continue if we are enabled
	  do_rx_response_to_tx();
     end

   // If in call-response mode, whenever we receive a TX packet, we generate
   // one and send it back
   always @(posedge eth_stim_do_overflow_test)
     begin
	  // Continue if we are enabled
	  do_overflow_stimulus();
     end
   
   // Generate RX packet in rsponse to TX packet
   task do_rx_response_to_tx;
      //input unused;
      
     reg [31:0] IPG; // Inter-packet gap
      reg [31:0] packet_size;
      
      integer 	 j;      
      begin

	 // Get packet size test wants us to send
	 packet_size = {eth_phy0.tx_mem[0],eth_phy0.tx_mem[1],
			eth_phy0.tx_mem[2],eth_phy0.tx_mem[3]};
	 

	 IPG = {eth_phy0.tx_mem[4],eth_phy0.tx_mem[5],
		eth_phy0.tx_mem[6],eth_phy0.tx_mem[7]};
	 
	 
	 $display("do_rx_response_to_tx IPG = %0d", IPG);
	 if (packet_size == 0)
	   begin			
	      // Constrained random sized packets
	      packet_size = $random;
	      
	      while (packet_size > (max_eth_packet_size-4))
		packet_size = packet_size / 2;
	      
	      if (packet_size < 60)
		packet_size = packet_size + 60;
	   end
	 
	 $display("do_rx_response_to_tx packet_size = %0d", packet_size);
	 send_packet_loop(1, packet_size, 2'b01, 1, eth_phy0.eth_speed, 
			  IPG, 48'h0012_3456_789a, 
			  48'h0708_090A_0B0C, 1, 1'b0, 0, 0);
	 
	 // If RX enable went low, wait for it go high again
	 if (ethmac_rxen===1'b0)
	   begin
	      
	      while (ethmac_rxen===1'b0)
		begin
		   @(posedge ethmac_rxen);
		   #10000;
		end
	      
	      // RX disabled and when re-enabled we reset the buffer 
	      // descriptor number
	      expected_rxbd = num_tx_bds;

	   end

      end
   endtask // do_rx_response_to_tx


   // Generate RX packet in rsponse to TX packet
   task do_overflow_stimulus;
      //input unused;
      reg [31:0] IPG; // Inter-packet gap
      reg [31:0] packet_size;
      
      integer 	 j;
      
      begin

	 // Maximum packet size
	 packet_size = 1500;
	 
	 // Minimum IPG
	 IPG = eth_stim_IPG_min_100mb;
	 
	 $display("do_overflow_stimulus IPG = %0d", IPG);
	
	 
	 $display("do_overflow_stimulus packetsize = %0d", packet_size);

	 send_packet_loop(num_rx_bds, packet_size, 2'b01, 1, 
			  eth_phy0.eth_speed, 
			  IPG, 48'h0012_3456_789a, 
			  48'h0708_090A_0B0C, 1, 1'b0, 0, 0);

	 // This one should cause overflow, don't check it gets there OK
	 send_packet_loop(1, packet_size, 2'b01, 1, 
			  eth_phy0.eth_speed, 
			  IPG, 48'h0012_3456_789a, 
			  48'h0708_090A_0B0C, 1, 1'b0, 0, 1);

	 // Wind back expected RXBD number
	 if (expected_rxbd == num_tx_bds)
	   expected_rxbd = num_tx_bds + num_rx_bds - 1;
	 else
	   expected_rxbd = expected_rxbd - 1;

	 // This one should cause overflow, don't check it gets there OK
	 send_packet_loop(1, packet_size, 2'b01, 1, 
			  eth_phy0.eth_speed, 
			  IPG, 48'h0012_3456_789a, 
			  48'h0708_090A_0B0C, 1, 1'b0, 0, 1);

	 // Wind back expected RXBD number
	 if (expected_rxbd == num_tx_bds)
	   expected_rxbd = num_tx_bds + num_rx_bds - 1;
	 else
	   expected_rxbd = expected_rxbd - 1;


	 // This one should cause overflow, don't check it gets there OK
	 send_packet_loop(1, packet_size, 2'b01, 1, 
			  eth_phy0.eth_speed, 
			  IPG, 48'h0012_3456_789a, 
			  48'h0708_090A_0B0C, 1, 1'b0, 0, 1);

	 // Wind back expected RXBD number
	 if (expected_rxbd == num_tx_bds)
	   expected_rxbd = num_tx_bds + num_rx_bds - 1;
	 else
	   expected_rxbd = expected_rxbd - 1;

	 
	 // This one should cause overflow, don't check it gets there OK
	 send_packet_loop(1, packet_size, 2'b01, 1, 
			  eth_phy0.eth_speed, 
			  IPG, 48'h0012_3456_789a, 
			  48'h0708_090A_0B0C, 1, 1'b0, 0, 1);
	 
	 // Wind back expected RXBD number
	 if (expected_rxbd == num_tx_bds)
	   expected_rxbd = num_tx_bds + num_rx_bds - 1;
	 else
	   expected_rxbd = expected_rxbd - 1;


	 // Wait until a buffer descriptor becomes available
	 while(`ETH_TOP.wishbone.RxBDRead==1'b1)
	   #1000;
	 
	 $display("%t: RxBDRead gone low",$time);
	 #10000;

	 
	 
	 send_packet_loop(1, packet_size, 2'b01, 1, eth_phy0.eth_speed, 
			  IPG, 48'h0012_3456_789a, 
			  48'h0708_090A_0B0C, 1, 1'b0, 0, 0);
	 
	 
	 // If RX enable went low, wait for it go high again
	 if (ethmac_rxen===1'b0)
	   begin
	      
	      while (ethmac_rxen===1'b0)
		begin
		   @(posedge ethmac_rxen);
		   #10000;
		end
	      
	      // RX disabled and when re-enabled we reset the buffer 
	      // descriptor number
	      expected_rxbd = num_tx_bds;

	   end

      end
   endtask // do_overflow_stimulus
   
   //
   // always@() to check the TX buffer descriptors
   //
   always @(posedge ethmac_txen)
     begin
	 ethmac_last_txbd_lenstat = 0;	 
	 eth_stim_tx_loop_keep_polling=1;
	 // Wait on the TxBD Ready bit
	 while(eth_stim_tx_loop_keep_polling)
	   begin
	      #10;
	      get_bd_lenstat(expected_txbd, ethmac_txbd_lenstat);
	      // Check if we've finished transmitting this BD
	      if (!ethmac_txbd_lenstat[15] & ethmac_last_txbd_lenstat[15])
		// Falling edge of TX BD Ready
		eth_stim_detected_packet_tx = 1;

	      ethmac_last_txbd_lenstat = ethmac_txbd_lenstat;
	      
	      // If TX en goes low then exit
	      if (!ethmac_txen)
		eth_stim_tx_loop_keep_polling = 0;
	      else if (eth_stim_detected_packet_tx)
		begin
		   // Wait until the eth_phy has finished receiving it
		   while (eth_phy0.mtxen_i === 1'b1)
		     #10;
		   
		   $display("(%t) Check TX packet: bd %d: 0x%h",$time,
			    expected_txbd, ethmac_txbd_lenstat);

		   // Check the TXBD, see if the packet transmitted OK
		   if (ethmac_txbd_lenstat[8] | ethmac_txbd_lenstat[3])
		     begin
			// Error occured
			`TIME;
			$display("*E TX Error of packet %0d detected.", 
				 num_tx_packets);
			$display(" TX BD %0d = 0x%h", expected_txbd,
				 ethmac_txbd_lenstat);
			if (ethmac_txbd_lenstat[8])
			  $display(" Underrun in MAC during TX");
			if (ethmac_txbd_lenstat[3])
			  $display(" Retransmission limit hit");
			
			$finish;
		     end
		   else
		     begin
			// Packet was OK, let's compare the contents we 
			// received with those that were meant to be transmitted
			if (eth_stim_check_tx_packet_contents)
			  begin
			     check_tx_packet(expected_txbd);
			     expected_txbd = (expected_txbd + 1) & 
					     num_tx_bds_mask;
			     num_tx_packets = num_tx_packets + 1;
			     eth_stim_detected_packet_tx = 0;
			  end			
		     end
		end
	   end // while (eth_stim_tx_loop_keep_polling)
     end // always @ (posedge ethmac_txen)
   


   //
   // Check packet TX'd by MAC was good
   // 
   task check_tx_packet;
      input [31:0] tx_bd_num;
      
      reg [31:0]   tx_bd_addr;
      reg [7:0]    phy_byte;
      
      reg [31:0]   txpnt_wb; // Pointer in array to where data should be
      reg [24:0]   txpnt_sdram; // Index in array of shorts for data in SDRAM 
                                // part
      reg [21:0]   buffer;
      reg [7:0]    destram_byte;
      reg [31:0]   tx_len_bd;
      
      integer 	   i,j;
      integer 	   failure;
      begin
	 failure = 0;
	
	 get_bd_lenstat(tx_bd_num, tx_len_bd);
	
	 tx_len_bd = {15'd0,tx_len_bd[31:16]};
	 
	 // Check, if length didn't have to be padded, that
	 // amount transmitted was correct
	 if ((tx_len_bd > 60)&(tx_len_bd != (eth_phy0.tx_len-4)))
	   begin
	      $display("*E TX packet sent length, %0d != length in TX BD, %0d",
		       eth_phy0.tx_len-4, tx_len_bd);
	      #100;
	      $finish;
	   end
	 
	 get_bd_addr(tx_bd_num, tx_bd_addr);
	 
	 // We're never going to be using more than about 256K of receive buffer
	 // so let's lop off the top bit of the address pointer - we only want
	 // the offset from the base of the memory bank
	 txpnt_wb = {14'd0,tx_bd_addr[17:0]};
	 txpnt_sdram = tx_bd_addr[24:0];
	 
	 // Variable we'll use for index in the PHY's TX buffer
	 buffer = 0; // Start of TX data
`ifdef RAM_WB
	 for (i=0;i<tx_len_bd;i=i+1)
	   begin
	      //$display("Checking address in tx bd 0x%0h",txpnt_sdram);
	      
	      destram_byte = dut.ram_wb0.ram_wb_b3_0.get_byte(txpnt_sdram);
	      
	      phy_byte = eth_phy0.tx_mem[buffer];
		   
	      // Debugging output
	      //$display("txpnt_sdram = 0x%h, destram_byte = 0x%h, buffer = 0x%h,
	      //phy_byte = 0x%h", txpnt_sdram,  destram_byte, buffer, phy_byte);
	      
	      if (phy_byte !== destram_byte)
		begin
		   `TIME;		  
		   $display("*E Wrong byte (%d) of TX packet! ram = %h, phy = %h",buffer, destram_byte, phy_byte);
		   failure = 1;
		end
	      
	      buffer = buffer + 1;
	      
	      txpnt_sdram = txpnt_sdram+1;
	      
	   end // for (i=0;i<tx_len_bd;i=i+1)
`else	 
 `ifdef VERSATILE_SDRAM
	 for (i=0;i<tx_len_bd;i=i+1)
	   begin
	      //$display("Checking address in tx bd 0x%0h",txpnt_sdram);
	      
	      sdram0.get_byte(txpnt_sdram,destram_byte);

	      phy_byte = eth_phy0.tx_mem[buffer];
	      // Debugging output
	      //$display("txpnt_sdram = 0x%h, destram_byte = 0x%h, buffer = 0x%h, phy_byte = 0x%h", txpnt_sdram,  destram_byte, buffer, phy_byte);
	      if (phy_byte !== destram_byte)
		begin
		   `TIME;		  
		   $display("*E Wrong byte (%d) of TX packet! ram = %h, phy = %h",buffer, destram_byte, phy_byte);
		   failure = 1;
		end
	      
	      buffer = buffer + 1;
	      
	      txpnt_sdram = txpnt_sdram+1;
	      
	   end // for (i=0;i<tx_len_bd;i=i+1)
	 
 `else // !`ifdef VERSATILE_SDRAM
	 
	 $display("eth_stim.v: CANNOT INSPECT RAM. PLEASE CONFIGURE CORRECTLY");
	 $display("RAM pointer for BD is 0x%h, bank offset we'll use is 0x%h",
		  tx_bd_addr, txpnt_wb);
	 $finish;

 `endif // !`ifdef VERSATILE_SDRAM
`endif // !`ifdef RAM_WB	 
	   
	 if (failure)
	   begin
	      #100
		`TIME;	     
	      $display("*E Error transmitting packet %0d (%0d bytes). Finishing simulation", num_tx_packets, tx_len_bd);
	      get_bd_lenstat(tx_bd_num, tx_len_bd);	     
	      $display("   TXBD lenstat: 0x%0h",tx_len_bd);  
	      $display("   TXBD address: 0x%0h",tx_bd_addr); 
	      $finish;
	   end
	 else
	   begin
	      #1 $display( "(%0t)(%m) TX packet %0d: %0d bytes in memory OK!",$time,num_tx_packets, tx_len_bd);
	      
	   end

	 
      end
   endtask // check_tx_packet


   // Local buffer of "sent" data to the ethernet MAC, we will check against
   // Size of our local buffer in bytes
   parameter eth_rx_sent_circbuf_size = (16*1024);
   parameter eth_rx_sent_circbuf_size_mask = eth_rx_sent_circbuf_size - 1;
   integer eth_rx_sent_circbuf_fill_ptr = 0;
   integer eth_rx_sent_circbuf_read_ptr = 0;
   // The actual buffer
   reg [7:0] eth_rx_sent_circbuf [0:eth_rx_sent_circbuf_size-1];

   
   //
   // Task to send a set of packets
   //
   task send_packet_loop;
      input [31:0] num_packets;
      input [31:0] length;
      input [1:0]  length_change; // 0 = none, 1 = incr, 2 = decrement
      input [31:0] length_change_size; // Size to change by
      input 	   speed;
      input [31:0] back_to_back_delay; // #delay setting between packets
      input [47:0] dst_mac;
      input [47:0] src_mac;
      input 	   random_fill;
      input 	   random_errors;
      input [31:0] random_error_mod;   
      input 	   dont_confirm_rx;
      integer 	   j, k;
      reg 	   error_this_time;
      integer 	   error_type; // 0 = rxerr, 1=bad preamble 2=bad crc 3=TODO
      reg [31:0]   rx_bd_lenstat;
      begin
	 error_type = 0;
	 error_this_time = 0;

	 if (num_packets == 0)
	   // Loop forever when num_packets is 0
	   num_packets = 32'h7fffffff;
	 
	 
	 if (speed & !(eth_phy0.control_bit14_10[13] === 1'b1))
	   begin
              // write to phy's control register for 100Mbps
	      eth_phy0.control_bit14_10 = 5'b01000; // bit 13 set - speed 100
	      // Swapping speeds, give some delay
	      #10000;
	   end
	 else if (!speed & !(eth_phy0.control_bit14_10[13] === 1'b0))
	   begin
	      eth_phy0.control_bit14_10 = 5'b00000; // bit 13 reset - speed 10
	      // Swapping speeds, give some delay
	      #10000;
	   end

	 eth_phy0.control_bit8_0   = 9'h1_00;
	 
	 for(j=0;j<num_packets | length <32;j=j+1)
	   begin
	      eth_stim_rx_packet_length = length[15:0]; // Bytes
	      st_data = 8'h0F;
	      
	      // setup RX packet in buffer - length is without CRC
	      set_rx_packet(0, eth_stim_rx_packet_length, 1'b0, dst_mac, 
			    src_mac, 16'h0D0E, st_data, random_fill);
	      
	      set_rx_addr_type(0, dst_mac, src_mac, 16'h0D0E);

	      // Error type 2 is cause CRC error
	      append_rx_crc(0, eth_stim_rx_packet_length, 1'b0, 
			    (error_type==2));
	      
	      if (error_this_time)
		begin
		   if (error_type == 0)
		     // RX ERR assert during transmit
		     eth_phy0.send_rx_packet(64'h0055_5555_5555_5555, 4'h7, 
					     8'hD5, 0, 
					     eth_stim_rx_packet_length+4, 
					     1'b0, 1'b1);
		   else if (error_type == 1)
		     // Incorrect preamble
		     eth_phy0.send_rx_packet(64'h0055_5f55_5555_5555, 4'h7, 
					     8'hD5, 0, 
					     eth_stim_rx_packet_length+4, 
					     1'b0, 1'b0);
		   else
		     // Normal datapacket
		     eth_phy0.send_rx_packet(64'h0055_5555_5555_5555, 4'h7, 
					     8'hD5, 0, 
					     eth_stim_rx_packet_length+4, 
					     1'b0, 1'b0);
		end
	      else
		eth_phy0.send_rx_packet(64'h0055_5555_5555_5555, 4'h7, 8'hD5, 
					0, eth_stim_rx_packet_length+4, 1'b0, 
					1'b0);


	      // if RX enable still set (might have gone low during this packet
	      if (ethmac_rxen)
		begin
		   if (error_this_time || dont_confirm_rx) begin
		     // Put in dummy length, checking function will skip...
		     rx_packet_lengths[(eth_rx_num_packets_sent& 12'h3ff)]=32'heeeeeeee;

		      for(k=0;k<length;k=k+1)
		      // skip data  in verify buffer
			eth_rx_sent_circbuf_read_ptr = (eth_rx_sent_circbuf_read_ptr+1)& 
						       eth_rx_sent_circbuf_size_mask;
		      
		   end
		   else
		     rx_packet_lengths[(eth_rx_num_packets_sent & 12'h3ff)] = length;
		   
		   eth_rx_num_packets_sent = eth_rx_num_packets_sent + 1;

		end // if (ethmac_rxen)
	      else
		begin
		   // Force the loop to finish up		   
		   j = num_packets;		   
		end
		   
	      
	      // Inter-packet gap
	      #back_to_back_delay;
	      
	      // Update length
	      if (length_change == 2'b01)
		length = length + length_change_size;
	      
	      if ((length_change == 2'b10) && 
		  ((length - length_change_size) > 32))
		length = length - length_change_size;

	      // Increment error type
	      if (error_this_time)
		error_type = error_type + 1;
	      if (error_type > 3)
		error_type = 0;
	      

	      // Check if we should put in an error this time
	      if (j%random_error_mod == 0)
		error_this_time = 1;
	      else
		error_this_time = 0;
	     
	      eth_phy0.rx_err(0);

	      // Now wait to check if we have filled up all the RX BDs and
	      // the this packet would start writing over them. Only really an
	      // issue when doing minimum IPG tests.
	      while(((eth_rx_num_packets_sent+1) - eth_rx_num_packets_checked) 
		    == num_rx_bds)
		#100;
	      
	      
	   end // for (j=0;j<num_packets | length <32;j=j+1)
      end
   endtask // send_packet_loop
   
   /*   
    TASKS for set and check RX packets:
    -----------------------------------
    set_rx_packet 
    (rxpnt[31:0], len[15:0], plus_nibble, d_addr[47:0], s_addr[47:0], type_len[15:0], start_data[7:0]);
    check_rx_packet 
    (rxpnt_phy[31:0], rxpnt_wb[31:0], len[15:0], plus_nibble, successful_nibble, failure[31:0]);
    */
   task set_rx_packet;
      input  [31:0] rxpnt; // pointer to place in in the phy rx buffer we'll start at
      input [15:0]  len;
      input         plus_dribble_nibble; // if length is longer for one nibble
      input [47:0]  eth_dest_addr;
      input [47:0]  eth_source_addr;
      input [15:0]  eth_type_len;
      input [7:0]   eth_start_data;
      input 	    random_fill;
      integer       i, sd;
      reg [47:0]    dest_addr;
      reg [47:0]    source_addr;
      reg [15:0]    type_len;
      reg [21:0]    buffer;
      reg           delta_t;
      
      begin
	 buffer = rxpnt[21:0];
	 dest_addr = eth_dest_addr;
	 source_addr = eth_source_addr;
	 type_len = eth_type_len;
	 sd = eth_start_data;
	 delta_t = 0;
	 for(i = 0; i < len; i = i + 1) 
	   begin
	      if (i < 6)
		begin
		   eth_phy0.rx_mem[buffer] = dest_addr[47:40];
		   dest_addr = dest_addr << 8;
		end
	      else if (i < 12)
		begin
		   eth_phy0.rx_mem[buffer] = source_addr[47:40];
		   source_addr = source_addr << 8;
		end
	      else if (i < 14)
		begin
		   eth_phy0.rx_mem[buffer] = type_len[15:8];
		   type_len = type_len << 8;
		end
	      else
		begin
		   if (random_fill)
		     begin
			if (lfsr_last_byte == 0)
			  eth_phy0.rx_mem[buffer] = lfsr[15:8];
			if (lfsr_last_byte == 1)
			  eth_phy0.rx_mem[buffer] = lfsr[23:16];
			if (lfsr_last_byte == 2)
			  eth_phy0.rx_mem[buffer] = lfsr[31:24];
			if (lfsr_last_byte == 3)
			  begin
			     eth_phy0.rx_mem[buffer] = lfsr[7:0];
			     lfsr = {lfsr[30:0],(((lfsr[31] ^ lfsr[6]) ^ 
						  lfsr[5]) ^ lfsr[1])};
			     lfsr_last_byte =  0;
			  end
			else
			  lfsr_last_byte = lfsr_last_byte + 1;
			
		     end // if (random_fill)		   
		   else
		     eth_phy0.rx_mem[buffer] = sd[7:0];
		   sd = sd + 1;
		end // else: !if(i < 14)

	      // Update our local buffer
	      eth_rx_sent_circbuf[eth_rx_sent_circbuf_fill_ptr]
		= eth_phy0.rx_mem[buffer];
	      eth_rx_sent_circbuf_fill_ptr = (eth_rx_sent_circbuf_fill_ptr+1)& 
					     eth_rx_sent_circbuf_size_mask;
	      
	      buffer = buffer + 1;
	   end // for (i = 0; i < len; i = i + 1)
	 
	 delta_t = !delta_t;
	 if (plus_dribble_nibble)
	   eth_phy0.rx_mem[buffer] = {4'h0, 4'hD /*sd[3:0]*/};
	 delta_t = !delta_t;
      end
   endtask // set_rx_packet




   task set_rx_addr_type;
      input  [31:0] rxpnt;
      input [47:0]  eth_dest_addr;
      input [47:0]  eth_source_addr;
      input [15:0]  eth_type_len;
      integer       i;
      reg [47:0]    dest_addr;
      reg [47:0]    source_addr;
      reg [15:0]    type_len;
      reg [21:0]    buffer;
      reg           delta_t;
      begin
	 buffer = rxpnt[21:0];
	 dest_addr = eth_dest_addr;
	 source_addr = eth_source_addr;
	 type_len = eth_type_len;
	 delta_t = 0;
	 for(i = 0; i < 14; i = i + 1) 
	   begin
	      if (i < 6)
		begin
		   eth_phy0.rx_mem[buffer] = dest_addr[47:40];
		   dest_addr = dest_addr << 8;
		end
	      else if (i < 12)
		begin
		   eth_phy0.rx_mem[buffer] = source_addr[47:40];
		   source_addr = source_addr << 8;
		end
	      else // if (i < 14)
		begin
		   eth_phy0.rx_mem[buffer] = type_len[15:8];
		   type_len = type_len << 8;
		end
	      buffer = buffer + 1;
	   end
	 delta_t = !delta_t;
      end
   endtask // set_rx_addr_type


   // Check if we're using a synthesized version of eth module
`ifdef ethmac_IS_GATELEVEL

   // Get the length/status register of the ethernet buffer descriptor
   task get_bd_lenstat;
      input [31:0] bd_num;// Number of ethernet BD to check
      output [31:0] bd_lenstat;
 `ifdef ACTEL      
      reg [8:0]    tmp;
      integer 	   raddr;      
 `endif
      begin
 `ifdef ACTEL
	 
	 // Pull from the Actel memory model
	 raddr = `ETH_BD_RAM_PATH.\mem_tile.I_1 .get_address((bd_num*2));
	 
	 tmp = `ETH_BD_RAM_PATH.\mem_tile.I_1 .MEM_512_9[(raddr*2)];
	 bd_lenstat[8:0] = tmp[8:0];
	 
	 tmp = `ETH_BD_RAM_PATH.\mem_tile.I_1 .MEM_512_9[(raddr*2)+1];
	 bd_lenstat[17:9] = tmp[8:0];	 

	 raddr = `ETH_BD_RAM_PATH.\mem_tile_0.I_1 .get_address((bd_num*2));
	 
	 tmp = `ETH_BD_RAM_PATH.\mem_tile_0.I_1 .MEM_512_9[(raddr*2)];
	 bd_lenstat[26:18] = tmp[8:0];
	 
	 tmp = `ETH_BD_RAM_PATH.\mem_tile_0.I_1 .MEM_512_9[(raddr*2)+1];
	 bd_lenstat[31:27] = tmp[4:0];	 

	 //$display("(%t) read eth bd lenstat %h",$time, bd_lenstat);
 `endif
      end
   endtask // get_bd_lenstat
   
   // Get the length/status register of the ethernet buffer descriptor
   task get_bd_addr;
      input [31:0] bd_num;// Number of the ethernet BD to check
      output [31:0] bd_addr;
 `ifdef ACTEL      
      reg [8:0]    tmp;
      integer 	    raddr;
 `endif
      begin
 `ifdef ACTEL
	 // Pull from the Actel memory model
	 raddr = `ETH_BD_RAM_PATH.\mem_tile.I_1 .get_address((bd_num*2)+1);

	 tmp = `ETH_BD_RAM_PATH.\mem_tile.I_1 .MEM_512_9[(raddr*2)];
	 bd_addr[8:0] = tmp[8:0];

	 tmp = `ETH_BD_RAM_PATH.\mem_tile.I_1 .MEM_512_9[(raddr*2)+1];
	 bd_addr[17:9] = tmp[8:0];	 

	 raddr = `ETH_BD_RAM_PATH.\mem_tile_0.I_1 .get_address((bd_num*2)+1);

	 tmp = `ETH_BD_RAM_PATH.\mem_tile_0.I_1 .MEM_512_9[(raddr*2)];
	 bd_addr[26:18] = tmp[8:0];

	 tmp = `ETH_BD_RAM_PATH.\mem_tile_0.I_1 .MEM_512_9[(raddr*2)+1];
	 bd_addr[31:27] = tmp[4:0];	 

	 //$display("(%t) read eth bd%d addr %h",$time,bd_num, bd_addr);
 `endif
      end
   endtask // get_bd_addr

`else // !`ifdef ethmac_IS_GATELEVEL
  
   // Get the length/status register of the ethernet buffer descriptor
   task get_bd_lenstat;
      input [31:0] bd_num;// Number of ethernet BD to check
      output [31:0] bd_lenstat;
      begin
	 bd_lenstat = `ETH_BD_RAM_PATH.mem[(bd_num*2)];
      end
   endtask // get_bd_lenstat
   
   // Get the length/status register of the ethernet buffer descriptor
   task get_bd_addr;
      input [31:0] bd_num;// Number of the ethernet BD to check
      output [31:0] bd_addr;
      begin
	 bd_addr = `ETH_BD_RAM_PATH.mem[((bd_num*2)+1)];
	 //$display("(%t) read eth bd%d addr %h",$time,bd_num, bd_addr);
      end
   endtask // get_bd_addr
`endif

   // Always block triggered by finishing of transmission of new packet from 
   // send_packet_loop
   integer eth_rx_packet_length_to_check;
   
   always @*
     begin
	// Loop here until:
	// 1 - packets sent is not equal to packets checked (ie. some to check)
	// 2 - we're explicitly disabled for some reason
	// 3 - Receive has been disabled in the MAC
	while((eth_rx_num_packets_sent == eth_rx_num_packets_checked) || 
	      !eth_stim_check_rx_packet_contents || !(ethmac_rxen===1'b1))
	  #1000;

	eth_rx_packet_length_to_check 
	  = rx_packet_lengths[(eth_rx_num_packets_checked & 12'h3ff)];
	
	if ( eth_rx_packet_length_to_check !==  32'heeeeeeee)
	  check_rx_packet(expected_rxbd, 0, eth_rx_packet_length_to_check);
	
	eth_rx_num_packets_checked = eth_rx_num_packets_checked + 1;
	
	expected_rxbd = expected_rxbd + 1;
	
	// Wrap
	if (expected_rxbd == (num_tx_bds + num_rx_bds))
	  expected_rxbd = num_tx_bds;
     end
   
   task check_rx_packet;
      
      input [31:0] rx_bd_num;          
      input [31:0] rxpnt_phy; // Pointer in array of data in PHY
      input [31:0] len;
      
      reg [31:0]   rx_bd_lenstat;
      reg [31:0]   rx_bd_addr;
      reg [7:0]    phy_byte;
      
      reg [31:0]   rxpnt_wb; // Pointer in array to where data should be
      reg [24:0]   rxpnt_sdram; // byte address from CPU in RAM
      reg [15:0]   sdram_short;
      reg [7:0]    destram_byte;
      
      integer 	   i;
      integer 	   failure;
      
      begin

	 failure = 0;
	 	
	 // Wait until the buffer descriptor indicates the packet has been 
	 // received...
	 get_bd_lenstat(rx_bd_num, rx_bd_lenstat);
	 while (rx_bd_lenstat & 32'h00008000)// Check Empty bit
	   begin
	      #10;
	      get_bd_lenstat(rx_bd_num, rx_bd_lenstat);
	      //$display("(%t) check_rx_packet: poll bd %d: 0x%h",$time,
	        //        rx_bd_num, rx_bd_lenstat);
	   end
	 

	 // Delay some time - takes a bit for the Wishbone FSM to pipe out the
	 // packet over Wishbone and into whatever memory it's going into
	 #Td_rx_packet_check;
	
	 // Ok, buffer filled, let's get its offset in memory
	 get_bd_addr(rx_bd_num, rx_bd_addr);

	 $display("(%t) Check RX packet: bd %d: 0x%h, addr 0x%h",$time,
		  rx_bd_num, rx_bd_lenstat, rx_bd_addr);

	 
	 // We're never going to be using more than about 256KB of receive buffer
	 // so let's lop off the top bit of the address pointer - we only want
	 // the offset from the base of the memory bank
	 
	 rxpnt_wb = {14'd0,rx_bd_addr[17:0]};
	 rxpnt_sdram = rx_bd_addr[24:0];
	 
	 
`ifdef RAM_WB
	 for (i=0;i<len;i=i+1)
	   begin

	      destram_byte = dut.ram_wb0.ram_wb_b3_0.get_byte(rxpnt_sdram);

	      phy_byte = eth_rx_sent_circbuf[eth_rx_sent_circbuf_read_ptr];

	      if (phy_byte !== destram_byte)
		begin
		   $display("*E Wrong byte (%5d) of RX packet %5d! phy = %h, ram = %h",
			    i, eth_rx_num_packets_checked, phy_byte, destram_byte);
		   failure = 1;
		end

	      eth_rx_sent_circbuf_read_ptr = (eth_rx_sent_circbuf_read_ptr+1)& 
					     eth_rx_sent_circbuf_size_mask;

	      rxpnt_sdram = rxpnt_sdram+1;
	      
	   end
`else	 	 	 
 `ifdef VERSATILE_SDRAM
	 // We'll look inside the SDRAM array
	 // Hard coded for the SDRAM buffer area to be from the halfway mark in
	 // memory (so starting in Bank2)
	 // We'll be passed the offset from the beginning of the buffer area
	 // in rxpnt_wb. This value will be in bytes.
	 
	 //$display("RAM pointer for BD is 0x%h, SDRAM addr is 0x%h", rx_bd_addr, rxpnt_sdram);


	 for (i=0;i<len;i=i+1)
	   begin

	      sdram0.get_byte(rxpnt_sdram,destram_byte);	      

	      phy_byte = eth_rx_sent_circbuf[eth_rx_sent_circbuf_read_ptr];//phy_rx_mem[buffer]; //eth_phy0.rx_mem[buffer];

	      if (phy_byte !== destram_byte)
		begin
//		   `TIME;		  
		   $display("*E Wrong byte (%5d) of RX packet %5d! phy = %h, ram = %h",
			    i, eth_rx_num_packets_checked, phy_byte, destram_byte);
		   failure = 1;
		end

	      eth_rx_sent_circbuf_read_ptr = (eth_rx_sent_circbuf_read_ptr+1)& 
					     eth_rx_sent_circbuf_size_mask;

	      rxpnt_sdram = rxpnt_sdram+1;
	      
	   end // for (i=0;i<len;i=i+2)
 `else

	 $display("eth_stim.v: CANNOT INSPECT RAM. PLEASE CONFIGURE CORRECTLY");
	 $display("RAM pointer for BD is 0x%h, bank offset we'll use is 0x%h",
		  rx_bd_addr, rxpnt_wb);
	 $finish;
	 
 `endif // !`ifdef VERSATILE_SDRAM
`endif // !`ifdef RAM_WB
	 

	 if (failure)
	   begin
	      #100
		`TIME;	     
	      $display("*E Recieved packet %0d, length %0d bytes, had an error. Finishing simulation.", eth_rx_num_packets_checked, len);
	      $finish;
	   end
	 else
	   begin
	      #1 $display( "(%0t)(%m) RX packet %0d: %0d bytes in memory OK!",$time,eth_rx_num_packets_checked, len);
	      
	   end
      end
   endtask // check_rx_packet
   
   
   //////////////////////////////////////////////////////////////
   // Ethernet CRC Basic tasks
   //////////////////////////////////////////////////////////////

   task append_rx_crc;
      input  [31:0] rxpnt_phy; // source
      input [15:0]  len; // length in bytes without CRC
      input         plus_dribble_nibble; // if length is longer for one nibble
      input         negated_crc; // if appended CRC is correct or not
      reg [31:0]    crc;
      reg [7:0]     tmp;
      reg [31:0]    addr_phy;
      reg           delta_t;
      begin
	 addr_phy = rxpnt_phy + len;
	 delta_t = 0;
	 // calculate CRC from prepared packet
	 paralel_crc_phy_rx(rxpnt_phy, {16'h0, len}, plus_dribble_nibble, crc);
	 if (negated_crc)
	   crc = ~crc;
	 delta_t = !delta_t;

	 if (plus_dribble_nibble)
	   begin
	      tmp = eth_phy0.rx_mem[addr_phy];
	      eth_phy0.rx_mem[addr_phy]     = {crc[27:24], tmp[3:0]};
	      eth_phy0.rx_mem[addr_phy + 1] = {crc[19:16], crc[31:28]};
	      eth_phy0.rx_mem[addr_phy + 2] = {crc[11:8], crc[23:20]};
	      eth_phy0.rx_mem[addr_phy + 3] = {crc[3:0], crc[15:12]};
	      eth_phy0.rx_mem[addr_phy + 4] = {4'h0, crc[7:4]};
	   end
	 else
	   begin
	      eth_phy0.rx_mem[addr_phy]     = crc[31:24];
	      eth_phy0.rx_mem[addr_phy + 1] = crc[23:16];
	      eth_phy0.rx_mem[addr_phy + 2] = crc[15:8];
	      eth_phy0.rx_mem[addr_phy + 3] = crc[7:0];
	   end
      end
   endtask // append_rx_crc

   task append_rx_crc_delayed;
      input  [31:0] rxpnt_phy; // source
      input [15:0]  len; // length in bytes without CRC
      input         plus_dribble_nibble; // if length is longer for one nibble
      input         negated_crc; // if appended CRC is correct or not
      reg [31:0]    crc;
      reg [7:0]     tmp;
      reg [31:0]    addr_phy;
      reg           delta_t;
      begin
	 addr_phy = rxpnt_phy + len;
	 delta_t = 0;
	 // calculate CRC from prepared packet
	 paralel_crc_phy_rx(rxpnt_phy+4, {16'h0, len}-4, plus_dribble_nibble, crc);
	 if (negated_crc)
	   crc = ~crc;
	 delta_t = !delta_t;

	 if (plus_dribble_nibble)
	   begin
	      tmp = eth_phy0.rx_mem[addr_phy];
	      eth_phy0.rx_mem[addr_phy]     = {crc[27:24], tmp[3:0]};
	      eth_phy0.rx_mem[addr_phy + 1] = {crc[19:16], crc[31:28]};
	      eth_phy0.rx_mem[addr_phy + 2] = {crc[11:8], crc[23:20]};
	      eth_phy0.rx_mem[addr_phy + 3] = {crc[3:0], crc[15:12]};
	      eth_phy0.rx_mem[addr_phy + 4] = {4'h0, crc[7:4]};
	   end
	 else
	   begin
	      eth_phy0.rx_mem[addr_phy]     = crc[31:24];
	      eth_phy0.rx_mem[addr_phy + 1] = crc[23:16];
	      eth_phy0.rx_mem[addr_phy + 2] = crc[15:8];
	      eth_phy0.rx_mem[addr_phy + 3] = crc[7:0];
	   end
      end
   endtask // append_rx_crc_delayed


   // paralel CRC calculating for PHY RX
   task paralel_crc_phy_rx;
      input  [31:0] start_addr; // start address
      input [31:0]  len; // length of frame in Bytes without CRC length
      input         plus_dribble_nibble; // if length is longer for one nibble
      output [31:0] crc_out;
      reg [21:0]    addr_cnt; // only 22 address lines
      integer       word_cnt;
      integer       nibble_cnt;
      reg [31:0]    load_reg;
      reg           delta_t;
      reg [31:0]    crc_next;
      reg [31:0]    crc;
      reg           crc_error;
      reg [3:0]     data_in;
      integer       i;
      begin
	 #1 addr_cnt = start_addr[21:0];
	 word_cnt = 24; // 27; // start of the frame - nibble granularity (MSbit first)
	 crc = 32'hFFFF_FFFF; // INITIAL value
	 delta_t = 0;
	 // length must include 4 bytes of ZEROs, to generate CRC
	 // get number of nibbles from Byte length (2^1 = 2)
	 if (plus_dribble_nibble)
	   nibble_cnt = ((len + 4) << 1) + 1'b1; // one nibble longer
	 else
	   nibble_cnt = ((len + 4) << 1);
	 // because of MAGIC NUMBER nibbles are swapped [3:0] -> [0:3]
	 load_reg[31:24] = eth_phy0.rx_mem[addr_cnt];
	 addr_cnt = addr_cnt + 1;
	 load_reg[23:16] = eth_phy0.rx_mem[addr_cnt];
	 addr_cnt = addr_cnt + 1;
	 load_reg[15: 8] = eth_phy0.rx_mem[addr_cnt];
	 addr_cnt = addr_cnt + 1;
	 load_reg[ 7: 0] = eth_phy0.rx_mem[addr_cnt];
	 addr_cnt = addr_cnt + 1;
	 while (nibble_cnt > 0)
	   begin
	      // wait for delta time
	      delta_t = !delta_t;
	      // shift data in

	      if(nibble_cnt <= 8) // for additional 8 nibbles shift ZEROs in!
		data_in[3:0] = 4'h0;
	      else

		data_in[3:0] = {load_reg[word_cnt], load_reg[word_cnt+1], load_reg[word_cnt+2], load_reg[word_cnt+3]};
	      crc_next[0]  = (data_in[0] ^ crc[28]);
	      crc_next[1]  = (data_in[1] ^ data_in[0] ^ crc[28]    ^ crc[29]);
	      crc_next[2]  = (data_in[2] ^ data_in[1] ^ data_in[0] ^ crc[28]  ^ crc[29] ^ crc[30]);
	      crc_next[3]  = (data_in[3] ^ data_in[2] ^ data_in[1] ^ crc[29]  ^ crc[30] ^ crc[31]);
	      crc_next[4]  = (data_in[3] ^ data_in[2] ^ data_in[0] ^ crc[28]  ^ crc[30] ^ crc[31]) ^ crc[0];
	      crc_next[5]  = (data_in[3] ^ data_in[1] ^ data_in[0] ^ crc[28]  ^ crc[29] ^ crc[31]) ^ crc[1];
	      crc_next[6]  = (data_in[2] ^ data_in[1] ^ crc[29]    ^ crc[30]) ^ crc[ 2];
	      crc_next[7]  = (data_in[3] ^ data_in[2] ^ data_in[0] ^ crc[28]  ^ crc[30] ^ crc[31]) ^ crc[3];
	      crc_next[8]  = (data_in[3] ^ data_in[1] ^ data_in[0] ^ crc[28]  ^ crc[29] ^ crc[31]) ^ crc[4];
	      crc_next[9]  = (data_in[2] ^ data_in[1] ^ crc[29]    ^ crc[30]) ^ crc[5];
	      crc_next[10] = (data_in[3] ^ data_in[2] ^ data_in[0] ^ crc[28]  ^ crc[30] ^ crc[31]) ^ crc[6];
	      crc_next[11] = (data_in[3] ^ data_in[1] ^ data_in[0] ^ crc[28]  ^ crc[29] ^ crc[31]) ^ crc[7];
	      crc_next[12] = (data_in[2] ^ data_in[1] ^ data_in[0] ^ crc[28]  ^ crc[29] ^ crc[30]) ^ crc[8];
	      crc_next[13] = (data_in[3] ^ data_in[2] ^ data_in[1] ^ crc[29]  ^ crc[30] ^ crc[31]) ^ crc[9];
	      crc_next[14] = (data_in[3] ^ data_in[2] ^ crc[30]    ^ crc[31]) ^ crc[10];
	      crc_next[15] = (data_in[3] ^ crc[31])   ^ crc[11];
	      crc_next[16] = (data_in[0] ^ crc[28])   ^ crc[12];
	      crc_next[17] = (data_in[1] ^ crc[29])   ^ crc[13];
	      crc_next[18] = (data_in[2] ^ crc[30])   ^ crc[14];
	      crc_next[19] = (data_in[3] ^ crc[31])   ^ crc[15];
	      crc_next[20] =  crc[16];
	      crc_next[21] =  crc[17];
	      crc_next[22] = (data_in[0] ^ crc[28])   ^ crc[18];
	      crc_next[23] = (data_in[1] ^ data_in[0] ^ crc[29]    ^ crc[28]) ^ crc[19];
	      crc_next[24] = (data_in[2] ^ data_in[1] ^ crc[30]    ^ crc[29]) ^ crc[20];
	      crc_next[25] = (data_in[3] ^ data_in[2] ^ crc[31]    ^ crc[30]) ^ crc[21];
	      crc_next[26] = (data_in[3] ^ data_in[0] ^ crc[31]    ^ crc[28]) ^ crc[22];
	      crc_next[27] = (data_in[1] ^ crc[29])   ^ crc[23];
	      crc_next[28] = (data_in[2] ^ crc[30])   ^ crc[24];
	      crc_next[29] = (data_in[3] ^ crc[31])   ^ crc[25];
	      crc_next[30] =  crc[26];
	      crc_next[31] =  crc[27];

	      crc = crc_next;
	      crc_error = crc[31:0] != 32'hc704dd7b;  // CRC not equal to magic number
	      case (nibble_cnt)
		9: crc_out = {!crc[24], !crc[25], !crc[26], !crc[27], !crc[28], !crc[29], !crc[30], !crc[31],
			      !crc[16], !crc[17], !crc[18], !crc[19], !crc[20], !crc[21], !crc[22], !crc[23],
			      !crc[ 8], !crc[ 9], !crc[10], !crc[11], !crc[12], !crc[13], !crc[14], !crc[15],
			      !crc[ 0], !crc[ 1], !crc[ 2], !crc[ 3], !crc[ 4], !crc[ 5], !crc[ 6], !crc[ 7]};
		default: crc_out = crc_out;
	      endcase
	      // wait for delta time
	      delta_t = !delta_t;
	      // increment address and load new data
	      if ((word_cnt+3) == 7)//4)
		begin
		   // because of MAGIC NUMBER nibbles are swapped [3:0] -> [0:3]
		   load_reg[31:24] = eth_phy0.rx_mem[addr_cnt];
		   addr_cnt = addr_cnt + 1;
		   load_reg[23:16] = eth_phy0.rx_mem[addr_cnt];
		   addr_cnt = addr_cnt + 1;
		   load_reg[15: 8] = eth_phy0.rx_mem[addr_cnt];
		   addr_cnt = addr_cnt + 1;
		   load_reg[ 7: 0] = eth_phy0.rx_mem[addr_cnt];
		   addr_cnt = addr_cnt + 1;
		end
	      // set new load bit position
	      if((word_cnt+3) == 31)
		word_cnt = 16;
	      else if ((word_cnt+3) == 23)
		word_cnt = 8;
	      else if ((word_cnt+3) == 15)
		word_cnt = 0;
	      else if ((word_cnt+3) == 7)
		word_cnt = 24;
	      else
		word_cnt = word_cnt + 4;// - 4;
	      // decrement nibble counter
	      nibble_cnt = nibble_cnt - 1;
	      // wait for delta time
	      delta_t = !delta_t;
	   end // while
	 #1;
      end
   endtask // paralel_crc_phy_rx
   


   