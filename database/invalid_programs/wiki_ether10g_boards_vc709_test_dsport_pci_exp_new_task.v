/*******************************************************************************
** © Copyright 2009 - 2010 Xilinx, Inc. All rights reserved.
** This file contains confidential and proprietary information of Xilinx, Inc. and 
** is protected under U.S. and international copyright and other intellectual property laws.
*******************************************************************************
**   ____  ____ 
**  /   /\/   / 
** /___/  \  /   Vendor: Xilinx 
** \   \   \/    
**  \   \        
**  /   /          
** /___/   /\     
** \   \  /  \   7-Series PCIe-10GDMA-DDR3-XAUI Targeted Reference Design
**  \___\/\___\ 
** 
**  Device: xc6vlx240t
**  Version: 1.2
**  Reference: UG372
**     
*******************************************************************************
**
**  Disclaimer: 
**
**    This disclaimer is not a license and does not grant any rights to the materials 
**              distributed herewith. Except as otherwise provided in a valid license issued to you 
**              by Xilinx, and to the maximum extent permitted by applicable law: 
**              (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, 
**              AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, 
**              INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR 
**              FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether in contract 
**              or tort, including negligence, or under any other theory of liability) for any loss or damage 
**              of any kind or nature related to, arising under or in connection with these materials, 
**              including for any direct, or any indirect, special, incidental, or consequential loss 
**              or damage (including loss of data, profits, goodwill, or any type of loss or damage suffered 
**              as a result of any action brought by a third party) even if such damage or loss was 
**              reasonably foreseeable or Xilinx had been advised of the possibility of the same.


**  Critical Applications:
**
**    Xilinx products are not designed or intended to be fail-safe, or for use in any application 
**    requiring fail-safe performance, such as life-support or safety devices or systems, 
**    Class III medical devices, nuclear facilities, applications related to the deployment of airbags,
**    or any other applications that could lead to death, personal injury, or severe property or 
**    environmental damage (individually and collectively, "Critical Applications"). Customer assumes 
**    the sole risk and liability of any use of Xilinx products in Critical Applications, subject only 
**    to applicable laws and regulations governing limitations on product liability.

**  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.

*******************************************************************************/
//-----------------------------------------------------------------------------
// This file is a part of pci_exp_usrapp_tx.v
//-------------------------------------------------------------------------

reg [31:0] DESC_DATA [1023:0]; // stores descriptor data
reg [19:0] BUFFER_LENGTH_CH0 [30:0]; // stores buffer length for chnl0
reg [19:0] BUFFER_LENGTH_CH1 [30:0]; // stores buffer length for chnl1
reg [19:0] BUFFER_LENGTH_CH2 [30:0]; // stores buffer length for chnl1
reg [19:0] BUFFER_LENGTH_CH3 [30:0]; // stores buffer length for chnl1
reg [31:0] BUFFER_ADDRESS_CH0 [30:0]; // stores buffer address for chnl0
reg [31:0] BUFFER_ADDRESS_CH1 [30:0]; // stores buffer address for chnl1  
reg [31:0] BUFFER_ADDRESS_CH2 [30:0]; // stores buffer address for chnl1  
reg [31:0] BUFFER_ADDRESS_CH3 [30:0]; // stores buffer address for chnl1  
reg [31:0] DMA_OFFSET_C2S [3:0]; // DMA engine offset from base address in C2S direction
reg [31:0] DMA_OFFSET_S2C [3:0]; // DMA engine offset from base address in S2C direction
integer chnl0_index; // packet index for channel 0
integer chnl1_index; // packet index for channel 1 
integer chnl2_index; // packet index for channel 1 
integer chnl3_index; // packet index for channel 1 
reg [31:0] C2S_SW_DESC_CH0; // Stores the Software descriptor pointer for CH0 in C2S direction 
reg [31:0] S2C_SW_DESC_CH0; // Stores the Software descriptor pointer for CH0 in S2C direction 
reg [31:0] C2S_SW_DESC_CH1; // Stores the Software descriptor pointer for CH1 in C2S direction 
reg [31:0] S2C_SW_DESC_CH1; // Stores the Software descriptor pointer for CH1 in S2C direction 
reg [31:0] C2S_SW_DESC_CH2; // Stores the Software descriptor pointer for CH1 in C2S direction 
reg [31:0] S2C_SW_DESC_CH2; // Stores the Software descriptor pointer for CH1 in S2C direction 
reg [31:0] C2S_SW_DESC_CH3; // Stores the Software descriptor pointer for CH1 in C2S direction 
reg [31:0] S2C_SW_DESC_CH3; // Stores the Software descriptor pointer for CH1 in S2C direction 
reg inter_processed_flag; // flag for interrupt processing
reg [31:0] error_file_ptr; // point to error.dat
reg [31:0] rx_file_ptr;  // pointer to rx.dat
reg [31:0] tx_file_ptr;  // pointer to tx.dat
reg dma_disabled_flag_ch0; // set high when DMA is disabled
reg dma_disabled_flag_ch1; // set high when DMA is disabled
reg dma_disabled_flag_ch2; // set high when DMA is disabled
reg dma_disabled_flag_ch3; // set high when DMA is disabled
reg dma_start_disabling_ch0; // set high when DMA starts disable
reg dma_start_disabling_ch1; // set high when DMA starts disable
reg dma_start_disabling_ch2; // set high when DMA starts disable
reg dma_start_disabling_ch3; // set high when DMA starts disable
reg DMA_DISABLE_FLAG; // set high to disable the DMA;
initial begin 
  chnl0_index = 0;
  chnl1_index = 0;
  chnl2_index = 0;
  chnl3_index = 0;
  inter_processed_flag = 1'b1;
  dma_start_disabling_ch0 = 1'b0;
  dma_start_disabling_ch1 = 1'b0;
  dma_start_disabling_ch2 = 1'b0;
  dma_start_disabling_ch3 = 1'b0;
  DMA_DISABLE_FLAG = 1'b0;
  error_file_ptr =  $fopen("error.dat");
    if (!error_file_ptr) begin
       $write("ERROR: Could not open error.dat.\n");
       $finish;
    end

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

`ifdef CH0
  dma_disabled_flag_ch0 = 1'b0;
`else
  dma_disabled_flag_ch0 = 1'b1;
`endif

`ifdef CH1
  dma_disabled_flag_ch1 = 1'b0;
`else
  dma_disabled_flag_ch1 = 1'b1;
`endif

`ifdef CH2
  dma_disabled_flag_ch2 = 1'b0;
`else
  dma_disabled_flag_ch2 = 1'b1;
`endif

`ifdef CH3
  dma_disabled_flag_ch3 = 1'b0;
`else
  dma_disabled_flag_ch3 = 1'b1;
`endif

end

 /************************************************************
 Task : TSK_SYSTEM_CONFIG
 Description : Configures System, it does following:
  o Initialize the system, waits for Link up and sends SSPL message
  o Sets descriptors for both channels
  o Programs command register. If LEGACY_INTR is defined, it enables SERR and program interrupt line
  o Reads the BARs and programs them
  o Reads the DUT capabilities and programs the required fields.
 *************************************************************/

 task TSK_SYSTEM_CONFIG;
  reg [31:0] read_data;
  reg [31:0] config_addr;
  reg [31:0] addr;
  reg stop;
  reg [15:0] dcr_value;
  
  begin
  stop = 1'b0;
  TSK_SYSTEM_INITIALIZATION;
  `ifdef CH0
    TSK_DESC_DATA(`TXDESC0_BASE, `CH0_S2C_BD_COUNT, `TXBUF0_BASE);
  `endif
  `ifdef CH1
    TSK_DESC_DATA(`TXDESC1_BASE, `CH1_S2C_BD_COUNT, `TXBUF1_BASE);
  `endif  
  `ifdef CH2
    TSK_DESC_DATA(`TXDESC2_BASE, `CH2_S2C_BD_COUNT, `TXBUF2_BASE);
  `endif  
  `ifdef CH3
    TSK_DESC_DATA(`TXDESC3_BASE, `CH3_S2C_BD_COUNT, `TXBUF3_BASE);
  `endif  
  `ifdef CH0
    TSK_DESC_DATA(`RXDESC0_BASE, `CH0_C2S_BD_COUNT, `RXBUF0_BASE);
  `endif  
  `ifdef CH1
    TSK_DESC_DATA(`RXDESC1_BASE, `CH1_C2S_BD_COUNT, `RXBUF1_BASE);
  `endif  
  `ifdef CH2
    TSK_DESC_DATA(`RXDESC2_BASE, `CH2_C2S_BD_COUNT, `RXBUF2_BASE);
  `endif  
  `ifdef CH3
    TSK_DESC_DATA(`RXDESC3_BASE, `CH3_C2S_BD_COUNT, `RXBUF3_BASE);
  `endif  

  TSK_BAR_INIT;
  TSK_TX_CLK_EAT(50);

 `ifdef LEGACY_INTR
     $fdisplay(tx_file_ptr,"[%t]Enable SERR", $time);
     $display("[%t]Enable SERR", $time);
     TSK_TX_TYPE0_CONFIGURATION_WRITE(DEFAULT_TAG, 12'h4, 32'h0000_0147, 4'b0011);
     DEFAULT_TAG = DEFAULT_TAG + 1;
     TSK_TX_CLK_EAT(50);
     $fdisplay(tx_file_ptr,"[%t]Program interrupt line", $time);
     $display("[%t]Program interrupt line", $time);
     TSK_TX_TYPE0_CONFIGURATION_WRITE(DEFAULT_TAG, 12'h3C, 32'h0000_0001, 4'b0001);
     DEFAULT_TAG = DEFAULT_TAG + 1;
     TSK_TX_CLK_EAT(50);
  `else
     $fdisplay(tx_file_ptr,"[%t]PCIe CFG: program Command Register with value = %h", $time,32'h0000_0407);
     $display("[%t]PCIe CFG: program Command Register with value = %h", $time,32'h0000_0407);
     TSK_TX_TYPE0_CONFIGURATION_WRITE(DEFAULT_TAG, 12'h4, 32'h0000_0407, 4'b0011);
     DEFAULT_TAG = DEFAULT_TAG + 1;
     TSK_TX_CLK_EAT(50);
  `endif

  TSK_TX_CLK_EAT(10);
// reading dut capability pointer
  $fdisplay(tx_file_ptr,"[%t] Reading DUT capability pointer", $time);
  $display("[%t] Reading DUT capability pointer", $time);
  TSK_TX_TYPE0_CONFIGURATION_READ(DEFAULT_TAG, 12'h34, 4'hF);
  DEFAULT_TAG = DEFAULT_TAG + 1;
  TSK_WAIT_FOR_READ_DATA;
   read_data = P_READ_DATA;
   if(read_data[7:0] ==0)
    $fdisplay(error_file_ptr,"[%t]Capability pointer is null", $time);
   else 
    config_addr = {24'h0010_00 , read_data[7:0]};

   while(!stop) begin
     $display("[%t] Reading DUT capabilities ", $time);
     $fdisplay(tx_file_ptr,"[%t] Reading DUT capability ", $time);
     TSK_TX_TYPE0_CONFIGURATION_READ(DEFAULT_TAG, config_addr[11:0], 4'hF);
     DEFAULT_TAG = DEFAULT_TAG + 1;
     TSK_WAIT_FOR_READ_DATA;
     TSK_TX_CLK_EAT(50);
     read_data = P_READ_DATA;
      if(read_data[7:0] == 8'h01)
       begin
        $display("[%t] Power Management Capability Found at offset = 0x%h ", $time, config_addr[7:0]);
        stop = (read_data[15:8] == 8'h00) ? 1'b1 : 1'b0;
        config_addr = {24'h0010_00, read_data[15:8]};
       end
      else if(read_data[7:0] == 8'h05)
       begin
        $display("[%t] MSI Capability Found ", $time);
        stop = (read_data[15:8] == 8'h00) ? 1'b1 : 1'b0;
        addr = config_addr;
        config_addr = {24'h0010_00, read_data[15:8]};
    // MSI capability programming
      `ifndef LEGACY_INTR
        $fdisplay(tx_file_ptr,"[%t] MSI capability programming", $time);
        $display("[%t] MSI capability programming", $time);
         TSK_TX_TYPE0_CONFIGURATION_WRITE(DEFAULT_TAG, addr[11:0], 32'h0081_0005, 4'b1100); 
         DEFAULT_TAG = DEFAULT_TAG + 1;
         TSK_TX_CLK_EAT(50);
         TSK_TX_TYPE0_CONFIGURATION_WRITE(DEFAULT_TAG, (addr[11:0] + 12'h4),`MSI_MAR_LOW_ADRS , 4'b1111);
         DEFAULT_TAG = DEFAULT_TAG + 1;
         TSK_TX_CLK_EAT(50);
         TSK_TX_TYPE0_CONFIGURATION_WRITE(DEFAULT_TAG, (addr[11:0] + 12'h8),32'h0 , 4'b1111);
         DEFAULT_TAG = DEFAULT_TAG + 1;
         TSK_TX_CLK_EAT(50);
         TSK_TX_TYPE0_CONFIGURATION_WRITE(DEFAULT_TAG, (addr[11:0] + 12'hC),`MSI_MDR_DATA , 4'b1111);
         DEFAULT_TAG = DEFAULT_TAG + 1;
         TSK_TX_CLK_EAT(50);
      `endif    
       end
       else if(read_data[7:0] == 8'h10) //add other capability here
        begin
         $display( "[%t] PCI Express Capability Found at offset = 0x%h ", $time, config_addr[7:0]);
         //stop = (read_data[15:8] == 8'h00) ? 1'b1 : 1'b0;
         //- We do not discover all possibilities beyond, this task
         //certainly can be improved to do that and recognize all possible
         //capabilities
         stop = 1'b1 ;
         addr = config_addr;
         config_addr = {32'h0, 24'h0010_00, read_data[15:8]};
         TSK_DCR_CONFIG(dcr_value,`DUT_MPS,`DUT_MRRS);
         $display("[%t] PCIe CFG: PCIe capability programming",$time);
         $fdisplay(tx_file_ptr,"[%t] PCIe CFG: PCIe capability programming",$time);
         TSK_TX_TYPE0_CONFIGURATION_WRITE(DEFAULT_TAG, (addr[11:0] + 12'h8), {16'h0, dcr_value} , 4'b0011);
         DEFAULT_TAG = DEFAULT_TAG + 1;
         TSK_TX_CLK_EAT(50);
         TSK_TX_TYPE0_CONFIGURATION_READ(DEFAULT_TAG, (addr[11:0] + 12'h4), 4'hF);
         DEFAULT_TAG = DEFAULT_TAG + 1;
         TSK_WAIT_FOR_READ_DATA;
         TSK_TX_CLK_EAT(50);
         read_data = P_READ_DATA;
          //if(read_data[2:0] != dcr_value[7:5])
          //$display("Info : Value of MPS programmed in device control register is different from MPS advertised in device capability register.");
        end
     end
 
  end
 endtask // TSK_SYSTEM_CONFIG

 /************************************************************
 Task : TSK_DESC_DATA
 Inputs : start_addr, num_bd, start_buff_addr
 Outputs : Descriptor data
 Description : Generates descriptor data for all channels, it does following:
  o For channel0 S2C direction buffer length is random.
  o For channel0 C2S direction buffer length is MAX_BUFFER_LENGTH_CHNL0 
  o For channel1 S2C and C2S direction buffer length is MAX_BUFFER_LENGTH_CHNL1
  o Generates Descriptor data with these constraints and puts them in DESC_DATA register
 *************************************************************/
 
 task TSK_DESC_DATA;
   input [31:0] start_addr;
   input [4:0] num_bd;
   input [31:0] start_buff_addr;
   integer i_;
   reg [19:0] length ;
   reg [31:0] buff_addr;
   reg [31:0] next_bd_addr;
   reg [31:0] start_bd_addr;
   begin
   buff_addr = start_buff_addr;
   next_bd_addr = start_addr;
   start_bd_addr = start_addr>>2; // converting byte address to DW address
   if(num_bd  > `MAX_BD) begin
     $fdisplay(error_file_ptr,"[%t]Error:Descriptor count exceeds the limit, terminating simulation...",$time);
     $finish();
   end
   else begin
    for(i_ = 0; i_< num_bd; i_ = i_ + 1) begin
      next_bd_addr = next_bd_addr + 'd32 ;
   
       DESC_DATA[start_bd_addr + 8*i_] = 32'h0;
       DESC_DATA[start_bd_addr + 8*i_ + 1] = 32'h0;
       DESC_DATA[start_bd_addr + 8*i_ + 2] = 32'h0;
       DESC_DATA[start_bd_addr + 8*i_ + 3] = 32'h0;
       DESC_DATA[start_bd_addr + 8*i_ + 4] = 32'h0;
       DESC_DATA[start_bd_addr + 8*i_ + 5] = buff_addr;
       DESC_DATA[start_bd_addr + 8*i_ + 6] = 32'h0;
       DESC_DATA[start_bd_addr + 8*i_ + 7] = next_bd_addr; // next_buff_addr

       if(start_addr == `TXDESC0_BASE)begin 
        //length = 78 + ({$random} % 1400);  // 14B header - 64B min payload 
        length = `MAX_BUFFER_LENGTH_CHNL0;
        $display("INFO: CH0 Frame Payload Length = %d",length);
        BUFFER_LENGTH_CH0[i_] = length;
        BUFFER_ADDRESS_CH0[i_] = buff_addr;
        S2C_SW_DESC_CH0 = next_bd_addr;
        DESC_DATA[start_bd_addr + 8*i_][19:0] = length;
          //-Length in User control
        DESC_DATA[start_bd_addr + 8*i_ + 1][19:0] = length;
        DESC_DATA[start_bd_addr + 8*i_ + 4][31:30] = 2'b11; //sop , eop
       end
       else if(start_addr == `RXDESC0_BASE) begin
         length = `MAX_BUFFER_LENGTH_CHNL0;
         C2S_SW_DESC_CH0 = next_bd_addr;
       end  
       else if(start_addr == `TXDESC1_BASE) begin
         //length = 78 + ({$random} % 1400);  // 14B header - 64B min payload 
         length = `MAX_BUFFER_LENGTH_CHNL1;
         $display("INFO: CH1 Frame Payload Length = %d",length);
         BUFFER_LENGTH_CH1[i_] = length;
         BUFFER_ADDRESS_CH1[i_] = buff_addr;
         S2C_SW_DESC_CH1 = next_bd_addr;
         DESC_DATA[start_bd_addr + 8*i_][19:0] = length;
          //-Length in User control
         DESC_DATA[start_bd_addr + 8*i_ + 1][19:0] = length;
         DESC_DATA[start_bd_addr + 8*i_ + 4][31:30] = 2'b11; //sop , eop
       end
       else if(start_addr == `RXDESC1_BASE) begin
         length = `MAX_BUFFER_LENGTH_CHNL1;
         C2S_SW_DESC_CH1 = next_bd_addr;
       end  
       else if(start_addr == `TXDESC2_BASE) begin
         //length = 78 + ({$random} % 1400);  // 14B header - 64B min payload 
         length = `MAX_BUFFER_LENGTH_CHNL2;
         $display("INFO: CH2 Frame Payload Length = %d",length);
         BUFFER_LENGTH_CH2[i_] = length;
         BUFFER_ADDRESS_CH2[i_] = buff_addr;
         S2C_SW_DESC_CH2 = next_bd_addr;
         DESC_DATA[start_bd_addr + 8*i_][19:0] = length;
          //-Length in User control
         DESC_DATA[start_bd_addr + 8*i_ + 1][19:0] = length;
         DESC_DATA[start_bd_addr + 8*i_ + 4][31:30] = 2'b11; //sop , eop
       end
       else if(start_addr == `RXDESC2_BASE) begin
         length = `MAX_BUFFER_LENGTH_CHNL2;
         C2S_SW_DESC_CH2 = next_bd_addr;
       end  
       else if(start_addr == `TXDESC3_BASE) begin
         //length = 78 + ({$random} % 1400);  // 14B header - 64B min payload 
         length = `MAX_BUFFER_LENGTH_CHNL3;
         $display("INFO: CH3 Frame Payload Length = %d",length);
         BUFFER_LENGTH_CH3[i_] = length;
         BUFFER_ADDRESS_CH3[i_] = buff_addr;
         S2C_SW_DESC_CH3 = next_bd_addr;
         DESC_DATA[start_bd_addr + 8*i_][19:0] = length;
          //-Length in User control
         DESC_DATA[start_bd_addr + 8*i_ + 1][19:0] = length;
         DESC_DATA[start_bd_addr + 8*i_ + 4][31:30] = 2'b11; //sop , eop
       end
       else if(start_addr == `RXDESC3_BASE) begin
         length = `MAX_BUFFER_LENGTH_CHNL3;
         C2S_SW_DESC_CH3 = next_bd_addr;
       end  
       
       DESC_DATA[start_bd_addr + 8*i_ + 4][19:0] = length;  // length
       buff_addr = buff_addr + `MAX_ETH_SIZE;
     end    
    end 
  end
  endtask // TSK_DESC_DATA   


 /************************************************************
 Task : TSK_BUILD_CPLD
 Inputs : address_low, tag, byte_en, length
 Description : Build CPLD on MRD for chnl0 and chnl1, it does following:
 o  Depending on address_low it transmits either Descriptor or data buffer
 o  Keeps track of packet when both channels are active.
 *************************************************************/
 
 task TSK_BUILD_CPLD;

  input [31:0] address_low; // address of the read request
  input [7:0] tag; // tag of the request
  input [7:0] byte_en; // byte enable of the request
  input [9:0] length;  // length of request

  reg [31:0] buff_addr; // address from data to read from buffer
  reg [6:0] lower_add_cpl; // lower byte address of starting byte of completion 
  reg [11:0] byte_count;  // total number byte
  reg [31:0] payload_len_ch0; // total payload length that has been transfered
  reg [31:0] payload_len_ch1;
  reg [31:0] payload_len_ch2;
  reg [31:0] payload_len_ch3;

  reg [11:0]  length_in_bytes;

  reg [31:0] payload_sent_ch0;
  reg [31:0] payload_sent_ch1;
  reg [31:0] payload_sent_ch2;
  reg [31:0] payload_sent_ch3;
  reg first_rd_ch0;
  reg first_rd_ch1;
  reg first_rd_ch2;
  reg first_rd_ch3;

  begin

    //- Convert from DW to bytes
   length_in_bytes = length * 4;

   TSK_VALID_DATA(byte_en, length, address_low, buff_addr,lower_add_cpl, byte_count); 

    first_rd_ch0 = 1'b0;
    first_rd_ch1 = 1'b0;
    first_rd_ch2 = 1'b0;
    first_rd_ch3 = 1'b0;

//   $display("DEBUG: length_in_bytes = %d; address_low = %h; byte_count = %d\n",length_in_bytes, address_low, byte_count);
   //- Initialize payload counts whenever it is start of new packet fetch
   if(buff_addr == BUFFER_ADDRESS_CH0[chnl0_index]) begin
    payload_sent_ch0 = 0;
    first_rd_ch0 = 1'b1;
   end
   
   if(buff_addr == BUFFER_ADDRESS_CH1[chnl1_index]) begin
    payload_sent_ch1 = 0;
    first_rd_ch1 = 1'b1;
   end
   
   if(buff_addr == BUFFER_ADDRESS_CH2[chnl2_index]) begin
    payload_sent_ch2 = 0;
    first_rd_ch2 = 1'b1;
   end

   if(buff_addr == BUFFER_ADDRESS_CH3[chnl3_index]) begin
    payload_sent_ch3 = 0;
    first_rd_ch3 = 1'b1;
   end

   if((address_low >= `TXDESC0_BASE) && (address_low <= `RXDESC3_LIMIT)) begin
     board.RP.tx_usrapp.TSK_TX_DESC(tag, address_low);
     end

   if((address_low >= `TXBUF0_BASE) && (address_low <= `TXBUF0_LIMIT)) begin
    $display("[%t] Buffer fetched in S2C direction for APP-0", $time);
//    $display("DEBUG: buff_addr = %h\n",buff_addr);
//    $display("DEBUG: buffer_len = %d, buffer_adrs = %h\n",BUFFER_LENGTH_CH0[chnl0_index], BUFFER_ADDRESS_CH0[chnl0_index]);
    if(byte_count == BUFFER_LENGTH_CH0[chnl0_index]) begin
      board.RP.tx_usrapp.TSK_SPLIT_CPLD(length, tag, 32'h0, byte_count, lower_add_cpl, 0, first_rd_ch0);
      chnl0_index = chnl0_index +1;
    end  
    else if(buff_addr == BUFFER_ADDRESS_CH0[chnl0_index]) begin
      board.RP.tx_usrapp.TSK_SPLIT_CPLD(length, tag, 32'h0, byte_count, lower_add_cpl, 0, first_rd_ch0);
      
      //payload_len_ch0 = byte_count;
      if (byte_en[7:4] == 4'hF)
        payload_len_ch0 = length_in_bytes;
      else
          //- hold the address offset 4 bytes (1 DW) lesser
        payload_len_ch0 = length_in_bytes - 4;
      payload_sent_ch0 = payload_sent_ch0 + byte_count;
    end  
    else begin
//      $display("DEBUG: payload_len_ch0 = %d\n",payload_len_ch0);
      board.RP.tx_usrapp.TSK_SPLIT_CPLD(length, tag, payload_len_ch0, byte_count, lower_add_cpl, 0, first_rd_ch0);
      //payload_len_ch0 = payload_len_ch0 + byte_count;
      if (byte_en[7:4] == 4'hF)
        payload_len_ch0 = payload_len_ch0 + length_in_bytes;
      else
          //- hold the address offset 4 bytes (1 DW) lesser
        payload_len_ch0 = payload_len_ch0 + (length_in_bytes - 4);
        
      payload_sent_ch0 = payload_sent_ch0 + byte_count;
      
       if(payload_sent_ch0 == BUFFER_LENGTH_CH0[chnl0_index]) begin
        chnl0_index = chnl0_index + 1;
       end 
    end    
   end // ch0 

   if((address_low >= `TXBUF1_BASE) && (address_low <= `TXBUF1_LIMIT)) begin
    $display("[%t] Buffer fetched in S2C direction for APP-1", $time);
    //if(byte_count == `MAX_BUFFER_LENGTH_CHNL1) begin 
    if(byte_count == BUFFER_LENGTH_CH1[chnl1_index]) begin
      board.RP.tx_usrapp.TSK_SPLIT_CPLD(length, tag, 32'h0, byte_count, lower_add_cpl, 1, first_rd_ch1);
      chnl1_index = chnl1_index +1;
    end  
    else if(buff_addr == BUFFER_ADDRESS_CH1[chnl1_index]) begin
      board.RP.tx_usrapp.TSK_SPLIT_CPLD(length, tag, 32'h0, byte_count, lower_add_cpl, 1, first_rd_ch1);
      //payload_len_ch1 = byte_count;
      if (byte_en[7:4] == 4'hF)
        payload_len_ch1 = length_in_bytes;
      else
          //- hold the address offset 4 bytes (1 DW) lesser
        payload_len_ch1 = length_in_bytes - 4;
      payload_sent_ch1 = payload_sent_ch1 + byte_count;
    end  
    else begin
      board.RP.tx_usrapp.TSK_SPLIT_CPLD(length, tag, payload_len_ch1, byte_count, lower_add_cpl, 1, first_rd_ch1);
      //payload_len_ch1 = payload_len_ch1 + byte_count;
        if (byte_en[7:4] == 4'hF)
          payload_len_ch1 = payload_len_ch1 + length_in_bytes;
        else
            //- hold the address offset 4 bytes (1 DW) lesser
          payload_len_ch1 = payload_len_ch1 + (length_in_bytes - 4);

      payload_sent_ch1 = payload_sent_ch1 + byte_count;

       if(payload_sent_ch1 == BUFFER_LENGTH_CH1[chnl1_index]) begin
        chnl1_index = chnl1_index + 1;
       end 
    end    
   end // ch1 

   if((address_low >= `TXBUF2_BASE) && (address_low <= `TXBUF2_LIMIT)) begin
    $display("[%t] Buffer fetched in S2C direction for APP-2", $time);
    if(byte_count == BUFFER_LENGTH_CH2[chnl2_index]) begin
      board.RP.tx_usrapp.TSK_SPLIT_CPLD(length, tag, 32'h0, byte_count, lower_add_cpl, 2, first_rd_ch2);
      chnl2_index = chnl2_index +1;
    end  
    else if(buff_addr == BUFFER_ADDRESS_CH2[chnl2_index]) begin
      board.RP.tx_usrapp.TSK_SPLIT_CPLD(length, tag, 32'h0, byte_count, lower_add_cpl, 2, first_rd_ch2);
      
      //payload_len_ch0 = byte_count;
      if (byte_en[7:4] == 4'hF)
        payload_len_ch2 = length_in_bytes;
      else
          //- hold the address offset 4 bytes (1 DW) lesser
        payload_len_ch2 = length_in_bytes - 4;
      payload_sent_ch2 = payload_sent_ch2 + byte_count;
    end  
    else begin
//      $display("DEBUG: payload_len_ch0 = %d\n",payload_len_ch0);
      board.RP.tx_usrapp.TSK_SPLIT_CPLD(length, tag, payload_len_ch2, byte_count, lower_add_cpl, 2, first_rd_ch2);
      //payload_len_ch0 = payload_len_ch0 + byte_count;
      if (byte_en[7:4] == 4'hF)
        payload_len_ch2 = payload_len_ch2 + length_in_bytes;
      else
          //- hold the address offset 4 bytes (1 DW) lesser
        payload_len_ch2 = payload_len_ch2 + (length_in_bytes - 4);
        
      payload_sent_ch2 = payload_sent_ch2 + byte_count;
      
       if(payload_sent_ch2 == BUFFER_LENGTH_CH2[chnl2_index]) begin
        chnl2_index = chnl2_index + 1;
       end 
    end    
   end // ch2 

   if((address_low >= `TXBUF3_BASE) && (address_low <= `TXBUF3_LIMIT)) begin
    $display("[%t] Buffer fetched in S2C direction for APP-3", $time);
    if(byte_count == BUFFER_LENGTH_CH3[chnl3_index]) begin
      board.RP.tx_usrapp.TSK_SPLIT_CPLD(length, tag, 32'h0, byte_count, lower_add_cpl, 3, first_rd_ch3);
      chnl3_index = chnl3_index +1;
    end  
    else if(buff_addr == BUFFER_ADDRESS_CH3[chnl3_index]) begin
      board.RP.tx_usrapp.TSK_SPLIT_CPLD(length, tag, 32'h0, byte_count, lower_add_cpl, 3, first_rd_ch3);
      
      //payload_len_ch0 = byte_count;
      if (byte_en[7:4] == 4'hF)
        payload_len_ch3 = length_in_bytes;
      else
          //- hold the address offset 4 bytes (1 DW) lesser
        payload_len_ch3 = length_in_bytes - 4;
      payload_sent_ch3 = payload_sent_ch3 + byte_count;
    end  
    else begin
//      $display("DEBUG: payload_len_ch0 = %d\n",payload_len_ch0);
      board.RP.tx_usrapp.TSK_SPLIT_CPLD(length, tag, payload_len_ch3, byte_count, lower_add_cpl, 3, first_rd_ch3);
      //payload_len_ch0 = payload_len_ch0 + byte_count;
      if (byte_en[7:4] == 4'hF)
        payload_len_ch3 = payload_len_ch3 + length_in_bytes;
      else
          //- hold the address offset 4 bytes (1 DW) lesser
        payload_len_ch3 = payload_len_ch3 + (length_in_bytes - 4);
        
      payload_sent_ch3 = payload_sent_ch3 + byte_count;
      
       if(payload_sent_ch3 == BUFFER_LENGTH_CH3[chnl3_index]) begin
        chnl3_index = chnl3_index + 1;
       end 
    end    
   end // ch3 


  end
 endtask //TSK_BUILD_CPLD

 
 /************************************************************
 Task : TSK_SPLIT_CPLD
 Inputs : length, tag, payload_addr, byte_count, lower_addr, chnl_no
 Description : This task splits completions based on RCB of RP, it does following:
 o  RCB value is a define parameter in dut_defines.v, its value should be changed depending on Root Port parameter setting. 
 o  Checks if read length is greater than RCB, if yes then split the read request on multiples of RCB

 *************************************************************/
 
task TSK_SPLIT_CPLD;
 input [9:0] length; // total length in DW requested
 input [7:0] tag;  // tag of the request
 input [31:0] payload_addr; // address of data to be read from buffer 
 input [11:0] byte_count; // total bytes
 input [6:0] lower_addr; // lower byte address of starting byte of completion
 input [31:0] chnl_no; // Channel number
 input data_format;

 reg [9:0] len_;
 reg [11:0] byte_count_;
 reg [31:0] pay_add_ ;
 reg [6:0] low_addr_;
 integer count_;
 
   begin
 len_ = length;
 count_ = 0;
 byte_count_ = byte_count;
 pay_add_ = payload_addr;
 
     while(len_) 
      begin
       count_ = count_ + 1;
        if(count_ == 1)
         low_addr_ = lower_addr;
        else 
         low_addr_ = 7'h0;

      if (len_ >= `DUT_MPS) begin
        /* When length > MPS, it requires split completions. Thats when we
   * check for address and RCB considerations.
         */ 
        if ((pay_add_ % `RP_RCB) == 0)  //- address integral multiple of RCB
        begin
          board.RP.tx_usrapp.TSK_TX_COMPLETION_DATA(tag,3'b000,(`DUT_MPS>>2),byte_count_,low_addr_,3'b000,1'b0,pay_add_,chnl_no, {1'b1, data_format});
          len_ = len_ - `DUT_MPS;
          byte_count_ = byte_count_ - `DUT_MPS;
          pay_add_ = pay_add_ + `DUT_MPS;
        end
        else
        begin
          board.RP.tx_usrapp.TSK_TX_COMPLETION_DATA(tag,3'b000,((pay_add_ % `RP_RCB)>>2),byte_count_,low_addr_,3'b000,1'b0,pay_add_,chnl_no, {1'b1,data_format});
          len_ = len_ - ((pay_add_ % `RP_RCB)>>2);
          byte_count_ = byte_count_ - (pay_add_ % `RP_RCB);
          pay_add_ = pay_add_ + (pay_add_ % `RP_RCB);
        end
      end
      else begin
        board.RP.tx_usrapp.TSK_TX_COMPLETION_DATA(tag,3'b000,len_,byte_count_,low_addr_, 3'b000,1'b0, pay_add_, chnl_no, {1'b1,data_format});
        len_ = 0;
        count_ = 0;
       end
     end
  end
 
 endtask //TSK_SPLIT_CPLD

 /************************************************************
 Task : TSK_TX_DESC
 Inputs : tag_, addr_
 Description : This task transmits descriptor, it does following:
  o Reads data from DESC_DATA register and transmits TLP on trn.
 *************************************************************/
 
  task TSK_TX_DESC;
   input [7:0]  tag_;
   input [31:0] address_;
   integer _j;
   integer _k;
   reg [6:0] lower_addr_;
   reg [31:0] addr_;  // address of data to be read from descriptor buffer
   
    begin
       addr_ = address_>>2; // byte address to DW address 
       
       lower_addr_ = address_[6:0];

       _k = 0; 

       for (_j = 0; _j <= 7; _j = _j + 1) begin
         DATA_STORE_CC[_k + 0] = DESC_DATA[addr_ + _j][7:0];
         DATA_STORE_CC[_k + 1] = DESC_DATA[addr_ + _j][15:8];
         DATA_STORE_CC[_k + 2] = DESC_DATA[addr_ + _j][23:16];
         DATA_STORE_CC[_k + 3] = DESC_DATA[addr_ + _j][31:24];
         _k = _k + 4;
       end 
       
       TSK_TX_COMPLETION_DATA(tag_, 3'b000, 10'h8, 12'd32, lower_addr_, 3'b000,
                                   1'b0, 32'd0, 0, 2'b00);

        end
    endtask //TSK_TX_DESC 

 /************************************************************
 Task : TSK_VALID_DATA
 Inputs : byte_en_, length_, address_
 Outputs : buff_addr, lower_add, byte_count
 Description : this task calculates different fields in cpld header, it does following:
 o  Calculates the byte count, buff_addr(address of data in data buffer) and lower_addr(lower bytes of address) depending on byte enable value
 *************************************************************/
 
 task TSK_VALID_DATA;

  input [7:0] byte_en_;
  input [9:0] length_;
  input [31:0] address_;

  output [31:0] buff_addr; // address from where data to be read
  output [6:0] lower_add; // lower bytes of address
  output [11:0] byte_count; // byte count 

  begin
    //- buffer address remains the same irrespective of the byte enable
    //fields
    buff_addr = address_;
    
  if(byte_en_[0] == 1'b1) begin
    //buff_addr = address_;
    byte_count = 4*length_;
    lower_add = {buff_addr[6:2], 2'b00};
  end  
  else if(byte_en_[1] == 1'b1) begin
    //buff_addr = address_ + 1;
    byte_count = 4*length_ - 1;
    lower_add = {buff_addr[6:2], 2'b01};
  end  
  else if(byte_en_[2] == 1'b1) begin
    //buff_addr = address_ + 2;
    byte_count = 4*length_ - 2 ;
    lower_add = {buff_addr[6:2], 2'b10};
  end  
  else if(byte_en_[3] == 1'b1) begin
    //buff_addr = address_ +3;
    byte_count = 4*length_ - 3;
    lower_add = {buff_addr[6:2], 2'b11};
  end  
   
 // for 1DW read request
  if(length_ == 1'b1) begin
   if(byte_en_[3:0] == 4'h1)
    byte_count = 1;
   else if(byte_en_[3:0] == 4'h3)
    byte_count = 2;
   else if(byte_en_[3:0] == 4'h7)
    byte_count = 3;
   else if(byte_en_[3:0] == 4'hF)
    byte_count = 4;
   end 

  if(byte_en_[7] == 1'b1) begin
    byte_count = byte_count;
  end  
  else if(byte_en_[6] == 1'b1) begin
    byte_count = byte_count - 1;
  end  
  else if(byte_en_[5] == 1'b1) begin
    byte_count = byte_count - 2 ;
  end  
  else if(byte_en_[4] == 1'b1) begin
    byte_count = byte_count - 3;
  end  

  end
 endtask // TSK_VALID_DATA

 /************************************************************
 Task : TSK_TX_MEMORY_WRITE_1DW
 Inputs : tag_, tc_,  addr_, data_
 Description : generates memory write TLP with 1DW data.
 *************************************************************/
 
 task TSK_TX_MEMORY_WRITE_1DW;
    input    [7:0]    tag_;
    input    [2:0]    tc_;
    input    [31:0]    addr_;
    input    [31:0]  data_; // data to be write

      begin


      DATA_STORE[0] = data_[7:0];
      DATA_STORE[1] = data_[15:8];
      DATA_STORE[2] = data_[23:16];
      DATA_STORE[3] = data_[31:24];
      DATA_STORE[4] = 8'd0;
      DATA_STORE[5] = 8'd0;
      DATA_STORE[6] = 8'd0;
      DATA_STORE[7] = 8'd0;
      DATA_STORE[8] = 8'd0;
      DATA_STORE[9] = 8'd0;
      DATA_STORE[10] = 8'd0;
      DATA_STORE[11] = 8'd0;
      DATA_STORE[12] = 8'd0;
      DATA_STORE[13] = 8'd0;
      DATA_STORE[14] = 8'd0;
      DATA_STORE[15] = 8'd0;

      TSK_TX_MEMORY_WRITE_32(tag_, tc_, 10'd1, addr_, 4'h0, 4'hF, 1'b0);

        end
    endtask // TSK_TX_MEMORY_WRITE_1DW


 /************************************************************
 Task : TSK_BYTE_SWAP
 Inputs : data_in
 Outputs : data_out
 Description : Swaps input data
 *************************************************************/
 
 task TSK_BYTE_SWAP;
  input [31:0] data_in;
  output [31:0] data_out;

  begin
   data_out = {data_in[7:0], data_in[15:8], data_in[23:16], data_in[31:24]};
  end
 endtask // TSK_BYTE_SWAP 

 /************************************************************
 Task : TSK_DCR_CONFIG
 Inputs : mps_val, mrrs_val
 Outputs : dcr_value
 Description : Configures DCR value(mps, mrs)
 *************************************************************/
 

task TSK_DCR_CONFIG;

    output [15:0] dcr_value;
    input [11:0] mps_val;
    input [11:0] mrrs_val;
    reg [2:0] mps;
    reg [2:0] mrs;

     begin
        if (mps_val == 1024)
          mps = 3'b011;
        if (mps_val == 512)
          mps = 3'b010;
        else if (mps_val == 256)
          mps = 3'b001;
        else  
          mps = 3'b000;
  
        if (mrrs_val == 1024)
          mrs = 3'b011;
        if (mrrs_val == 512)
          mrs = 3'b010;
        else if (mrrs_val == 256)
          mrs = 3'b001;
        else
          mrs = 3'b000;
          
      // all other bits  are set to default values
        dcr_value = {1'b0,mrs,4'b1000,mps,1'b1,4'b0000};
      end
  endtask // TSK_DCR_CONFIG

 /************************************************************
 Task : TSK_INIT_DMA
 Description : Initializes the DMA,it does following:
  o Programs the Reg_Next_Desc_ptr for channel0 in S2C direction with TXDESC0_BASE
  o Programs the Reg_Next_Desc_ptr for channel0 in C2S direction with RXDESC0_BASE
  o Programs the Reg_Next_Desc_ptr for channel1 in S2C direction with TXDESC1_BASE
  o Programs the Reg_Next_Desc_ptr for channel1 in C2S direction with RXDESC1_BASE
  o Enables the DMA engines 
  o Programs the Reg_SW_Desc_ptr for channel0 in S2C direction with S2C_SW_DESC_CH0
  o Programs the Reg_SW_Desc_ptr for channel0 in C2S direction with C2S_SW_DESC_CH0
  o Programs the Reg_SW_Desc_ptr for channel1 in S2C direction with S2C_SW_DESC_CH1
  o Programs the Reg_SW_Desc_ptr for channel1 in C2S direction with C2S_SW_DESC_CH1
 *************************************************************/
 
 task TSK_INIT_DMA;
  input [31:0] chnl_no;
  reg [31:0] s2c_desc_base;
  reg [31:0] c2s_desc_base;
  reg [31:0] s2c_sw_desc;
  reg [31:0] c2s_sw_desc;

   begin 
    s2c_desc_base = (chnl_no == 0) ? `TXDESC0_BASE : 
      ((chnl_no == 1) ? `TXDESC1_BASE : ((chnl_no == 2) ? `TXDESC2_BASE :
          `TXDESC3_BASE));
    c2s_desc_base = (chnl_no == 0) ? `RXDESC0_BASE : 
     ( (chnl_no == 1) ? `RXDESC1_BASE : ((chnl_no == 2) ? `RXDESC2_BASE :
                  `RXDESC3_BASE));

    s2c_sw_desc = (chnl_no == 0) ? S2C_SW_DESC_CH0 : 
        ((chnl_no == 1) ? S2C_SW_DESC_CH1 : ((chnl_no == 2) ? S2C_SW_DESC_CH2 :
            S2C_SW_DESC_CH3));

    c2s_sw_desc = (chnl_no == 0) ? C2S_SW_DESC_CH0 : 
        ((chnl_no == 1) ? C2S_SW_DESC_CH1 : ((chnl_no == 2) ? C2S_SW_DESC_CH2 :
          C2S_SW_DESC_CH3)); 
   
    // Program Reg_Next_Desc_Ptr 
    $display("[%t] DMA Config: Programming Reg_Next_Desc_Ptr for APP-%d in S2C direction with value = %h", $time, chnl_no, s2c_desc_base);
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, (`DMA_OFFSET_ADRS + DMA_OFFSET_S2C[chnl_no] + `DMA_REG_NEXT_DESC_PTR), s2c_desc_base);
    DEFAULT_TAG = DEFAULT_TAG + 1;
    
    $display("[%t] DMA Config: Programming Reg_Next_Desc_Ptr for APP-%d in C2S direction with value = %h", $time, chnl_no, c2s_desc_base);
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, (`DMA_OFFSET_ADRS + DMA_OFFSET_C2S[chnl_no] + `DMA_REG_NEXT_DESC_PTR), c2s_desc_base);
    DEFAULT_TAG = DEFAULT_TAG + 1;
    TSK_TX_CLK_EAT(50);

    $display("[%t] DMA Config: Programming Sw_Desc_ptr for APP-%d in S2C direction with value = %h", $time, chnl_no, s2c_desc_base);
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, (`DMA_OFFSET_ADRS + DMA_OFFSET_S2C[chnl_no] + `DMA_REG_SW_DESC_PTR), s2c_desc_base);
    DEFAULT_TAG = DEFAULT_TAG + 1;

    $display("[%t] DMA Config: Programming Sw_Desc_ptr for APP-%d in C2S direction with value = %h", $time, chnl_no, c2s_desc_base);
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, (`DMA_OFFSET_ADRS + DMA_OFFSET_C2S[chnl_no] + `DMA_REG_SW_DESC_PTR), c2s_desc_base);
    DEFAULT_TAG = DEFAULT_TAG + 1;
    TSK_TX_CLK_EAT(50);

    // Enable DMA engine
    $display("[%t] DMA Config: Enabling S2C DMA engine for APP-%d ", $time,chnl_no);
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, (`DMA_OFFSET_ADRS + DMA_OFFSET_S2C[chnl_no] + `DMA_CNTRL_REG), 32'h0000_0101);
    DEFAULT_TAG = DEFAULT_TAG + 1;

    $display("[%t] DMA Config: Enabling C2S DMA engine for APP-%d ", $time,chnl_no);
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, (`DMA_OFFSET_ADRS + DMA_OFFSET_C2S[chnl_no] + `DMA_CNTRL_REG), 32'h0000_0101);
    DEFAULT_TAG = DEFAULT_TAG + 1;
  // program Last_Desc_Ptr
    $display("[%t] DMA Config: Programming Sw_Desc_ptr for APP-%d in S2C direction with value = %h", $time, chnl_no, s2c_sw_desc);
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, (`DMA_OFFSET_ADRS + DMA_OFFSET_S2C[chnl_no] + `DMA_REG_SW_DESC_PTR), s2c_sw_desc);
    DEFAULT_TAG = DEFAULT_TAG + 1;

    $display("[%t] DMA Config: Programming Sw_Desc_ptr for APP-%d in C2S direction with value = %h", $time,chnl_no, c2s_sw_desc);
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, (`DMA_OFFSET_ADRS + DMA_OFFSET_C2S[chnl_no] + `DMA_REG_SW_DESC_PTR), c2s_sw_desc);
    DEFAULT_TAG = DEFAULT_TAG + 1;
    TSK_TX_CLK_EAT(50);

   end

 endtask //TSK_INIT_DMA  


 /************************************************************
 Task : TSK_DMA_CONFIG
 Description : Read DMA capabilites adn Enables interrupts,it does following:
 o  Reads the DMA capabilities 
 o  Enables interrupts
 *************************************************************/
 task TSK_DMA_CONFIG;
 
 reg [31:0] addr;
 reg [31:0] data;
  begin
   // reading DMA capabilities
    TSK_READ_DMA_CAPABILITY(16'h0000);
    TSK_TX_CLK_EAT(50);
    TSK_READ_DMA_CAPABILITY(16'h2000);
    TSK_TX_CLK_EAT(50);
    addr = `DMA_OFFSET_ADRS + `DMA_COMMON_REG_BASE + `DMA_COMMON_CNTRL_STS_OFFSET;
    data = 32'h0000_0011;
    $display("[%t] DMA Config: Enabling Interrupts", $time);
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, addr, data);
    DEFAULT_TAG = DEFAULT_TAG + 1;
    TSK_TX_CLK_EAT(50);
 end
 endtask //TSK_DMA_CONFIG


 /************************************************************
 Task : TSK_READ_DMA_CAPABILITY
 Description : Reads DMA capabilities, it does following:
 *************************************************************/
 

 task TSK_READ_DMA_CAPABILITY;
  input [15:0] start_offset;
  integer ii;
  reg [15:0] dma_offset;
  reg [31:0] addr;

  begin
    for(ii =0 ; ii<=3; ii=ii+1) // only for 4 engines
     begin
      dma_offset = start_offset + (ii*16'h0100);
      addr = `DMA_OFFSET_ADRS + dma_offset;
      $display("[%t] Reading DMA capabilities at address = %h",$time, addr);
      $fdisplay(tx_file_ptr,"[%t] Reading DMA capabilities at address = %h",$time, addr);
      TSK_TX_MEMORY_READ_32_1DW(addr);

      if(P_READ_DATA[0]) // if present bit is set
       begin
        if(P_READ_DATA[5:4] == 2'b00)
         $fdisplay(error_file_ptr,"[%t]Error: Block DMA is selected",$time);
        else if(P_READ_DATA[5:4] == 2'b01)
         $display("[%t] Packet DMA is selected", $time);
        $display("[%t] Performance Scaling factor = %0x\n", $time, P_READ_DATA[31:30]);
        if(P_READ_DATA[1])
        begin
          $display("[%t] Found C2S Engine", $time);
          DMA_OFFSET_C2S[ii] = dma_offset;
        end  
        else
        begin
          $display("[%t] Found S2C Engine", $time);
          DMA_OFFSET_S2C[ii] = dma_offset;
        end  

        TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, addr + 32'h10, 32'h0);
        DEFAULT_TAG = DEFAULT_TAG + 1;
        TSK_TX_CLK_EAT(50);
       end   
       else
         $display("[%t] Engine not present", $time);

      end   
  end
 endtask //TSK_READ_DMA_CAPABILITY 

 /************************************************************
 Task : TSK_INTR_HANDLER
 Description : Handels recevied interrupts, it does following:
  o On receiving interrupts it reads Control status register
  o Determines which channel caused the interrupt
 *************************************************************/

 task TSK_INTR_HANDLER;
 
  reg [31:0] addr;
  reg [31:0] wr_data;
 
  begin
   inter_processed_flag = 1'b0;
   $fdisplay(rx_file_ptr,"[%t] Interrupt Received ",$time);
   $display("[%t] Interrupt Received ",$time);
    addr = `DMA_OFFSET_ADRS + `DMA_COMMON_REG_BASE + `DMA_COMMON_CNTRL_STS_OFFSET;
    TSK_TX_MEMORY_READ_32_1DW(addr);

    // Disable interrupts
   $fdisplay(tx_file_ptr,"[%t] Disabling interrupt ",$time);
   $display("[%t] Disabling interrupt ",$time);
    addr = `DMA_OFFSET_ADRS + `DMA_COMMON_REG_BASE + `DMA_COMMON_CNTRL_STS_OFFSET;
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, addr,{P_READ_DATA[31:1],1'b0});
    DEFAULT_TAG = DEFAULT_TAG + 1;
    TSK_TX_CLK_EAT(50);

   if(P_READ_DATA[16] == 1'b1) begin
      $display("[%t] CH0 S2C Engine caused INTR", $time);
      addr = `DMA_OFFSET_ADRS + DMA_OFFSET_S2C[0] + `DMA_ENGN_CTRL;
      TSK_RD_INTR_STATUS(addr);
   end
   else if (P_READ_DATA[24] == 1'b1) begin
     $display("[%t] CH0 C2S Engine caused INTR", $time);
     addr = `DMA_OFFSET_ADRS + DMA_OFFSET_C2S[0] + `DMA_ENGN_CTRL;
     TSK_RD_INTR_STATUS(addr);
   end 
   else if (P_READ_DATA[17] == 1'b1) begin 
     $display("[%t] CH1 S2C Engine caused INTR", $time);
     addr = `DMA_OFFSET_ADRS + DMA_OFFSET_S2C[1] + `DMA_ENGN_CTRL;
     TSK_RD_INTR_STATUS(addr);
   end
   else if(P_READ_DATA[25])begin
      $display("[%t] CH1 C2S Engine caused INTR", $time);
      addr = `DMA_OFFSET_ADRS + DMA_OFFSET_C2S[1] + `DMA_ENGN_CTRL;
      TSK_RD_INTR_STATUS(addr);
   end
   else if (P_READ_DATA[18] == 1'b1) begin 
     $display("[%t] CH2 S2C Engine caused INTR", $time);
     addr = `DMA_OFFSET_ADRS + DMA_OFFSET_S2C[2] + `DMA_ENGN_CTRL;
     TSK_RD_INTR_STATUS(addr);
   end
   else if(P_READ_DATA[26])begin
      $display("[%t] CH2 C2S Engine caused INTR", $time);
      addr = `DMA_OFFSET_ADRS + DMA_OFFSET_C2S[2] + `DMA_ENGN_CTRL;
      TSK_RD_INTR_STATUS(addr);
   end
   else if (P_READ_DATA[19] == 1'b1) begin 
     $display("[%t] CH3 S2C Engine caused INTR", $time);
     addr = `DMA_OFFSET_ADRS + DMA_OFFSET_S2C[3] + `DMA_ENGN_CTRL;
     TSK_RD_INTR_STATUS(addr);
   end
   else if(P_READ_DATA[27])begin
      $display("[%t] CH3 C2S Engine caused INTR", $time);
      addr = `DMA_OFFSET_ADRS + DMA_OFFSET_C2S[3] + `DMA_ENGN_CTRL;
      TSK_RD_INTR_STATUS(addr);
   end
    
    addr = `DMA_OFFSET_ADRS + `DMA_COMMON_REG_BASE + `DMA_COMMON_CNTRL_STS_OFFSET;
    TSK_TX_MEMORY_READ_32_1DW(addr);

    // Enable interrupts
    addr = `DMA_OFFSET_ADRS + `DMA_COMMON_REG_BASE + `DMA_COMMON_CNTRL_STS_OFFSET;
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, addr,{P_READ_DATA[31:1], 1'b1});
    DEFAULT_TAG = DEFAULT_TAG + 1;
    TSK_TX_CLK_EAT(50);

    inter_processed_flag = 1'b1;
 end
  endtask //TSK_INTR_HANDLER

 /************************************************************
 Task : TSK_RD_INTR_STATUS
 Description: It does the following:
 o  Reads register at input address
 o  Acknowledge the interrupt.
 *************************************************************/

 task TSK_RD_INTR_STATUS ;
    input [31:0] Adrs;

    reg [31:0] addr;
    reg [31:0] reg_value;
    reg [31:0] wr_data;
    begin
    addr = Adrs;

    TSK_TX_MEMORY_READ_32_1DW(addr);
    
    if (P_READ_DATA[1])
    begin
      TSK_GETWR_DATA(P_READ_DATA,wr_data);
      //- Acknowledge interrupt
      TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, addr,{P_READ_DATA | wr_data});
      DEFAULT_TAG = DEFAULT_TAG + 1;
      TSK_TX_CLK_EAT(50);
        
      TSK_TX_MEMORY_READ_32_1DW(addr);
    end  
    else
      $display("[%t] False Interrupt Alarm!", $time);
   end 
  endtask // TSK_RD_INTR_STATUS



 /************************************************************
   Function: TSK_GETWR_DATA 
  Description: Returns a write mask for a given interrupt register value
  Basically returns locations where '1' is to be written to ack the
  interrupt
 ************************************************************/
  task TSK_GETWR_DATA ;
  
  input [31:0] regval;
  output [31:0] wr_data;

   begin
    wr_data = 32'h0000_0002;
    if (regval[2])
    begin
      $display("[%t] INTR: Descriptor Completed", $time);
      wr_data = wr_data | 32'h0000_0004;
    end
    else if (regval[3])
    begin
      $fdisplay(error_file_ptr,"[%t]INTR: Descriptor Alignment Error",$time);
      wr_data = wr_data | 32'h0000_0008;
    end  
    else if (regval[4])  
    begin
      $fdisplay(error_file_ptr,"[%t]INTR: Descriptor Fetch Error",$time);
      wr_data = wr_data | 32'h0000_0010;
    end  
    else if (regval[5])  
    begin
      $fdisplay(error_file_ptr,"[%t]INTR: SW Abort Error",$time);
      wr_data = wr_data | 32'h0000_0020;
    end  
 end   

  endtask //TSK_GETWR_DATA

 /************************************************************
 Task : TSK_TX_MEMORY_READ_32_1DW
 Inputs : addr
 Description : generates 1DW memory read request 
 *************************************************************/
 
 task TSK_TX_MEMORY_READ_32_1DW;
  input [31:0] addr;
  
  begin
   TSK_TX_MEMORY_READ_32(DEFAULT_TAG, DEFAULT_TC, 10'h1, addr, 4'h0, 4'hF);
   DEFAULT_TAG = DEFAULT_TAG + 1;
   TSK_WAIT_FOR_READ_DATA;
   TSK_TX_CLK_EAT(50);
  end 

 endtask // TSK_TX_MEMORY_READ_32_1DW

 /************************************************************
 TASK: TSK_DISABLE_DMA
 Input: DMA_REG_BASE
 Description : disables DMA, it does following:
 ************************************************************/
 task TSK_DISABLE_DMA;
   
   input [31:0] DMA_REG_BASE;

   reg [31:0] addr;
   reg [31:0] reg_value;
   reg [31:0] dma_offset;
   reg stop;
   
   begin

    if(DMA_REG_BASE ==`CH0_S2C_REG_BASE) begin
     $fdisplay(tx_file_ptr,"[%t] Disabling  S2C0 DMA Engine",$time);
     $display("[%t] Disabling  S2C0 DMA ",$time);
     dma_offset = DMA_OFFSET_S2C[0]; 
    end 
    else if(DMA_REG_BASE ==`CH0_C2S_REG_BASE)begin
     $fdisplay(tx_file_ptr,"[%t] Disabling C2S0  DMA Engine",$time);
     $display("[%t] Disabling C2S0  DMA ",$time);
     dma_offset = DMA_OFFSET_C2S[0]; 
    end 
    else if(DMA_REG_BASE ==`CH1_S2C_REG_BASE)begin
     $fdisplay(tx_file_ptr,"[%t] Disabling  S2C1 DMA Engine",$time);
     $display("[%t] Disabling  S2C1 DMA ",$time);
     dma_offset = DMA_OFFSET_S2C[1]; 
    end 
    else if(DMA_REG_BASE ==`CH1_C2S_REG_BASE)begin
     $fdisplay(tx_file_ptr,"[%t] Disabling  C2S1 DMA Engine",$time);
     $display("[%t] Disabling  C2S1 DMA ",$time);
     dma_offset = DMA_OFFSET_C2S[1]; 
    end  
    else if(DMA_REG_BASE ==`CH2_S2C_REG_BASE)begin
     $fdisplay(tx_file_ptr,"[%t] Disabling  S2C2 DMA Engine",$time);
     $display("[%t] Disabling  S2C2 DMA ",$time);
     dma_offset = DMA_OFFSET_S2C[2]; 
    end 
    else if(DMA_REG_BASE ==`CH2_C2S_REG_BASE)begin
     $fdisplay(tx_file_ptr,"[%t] Disabling  C2S2 DMA Engine",$time);
     $display("[%t] Disabling  C2S2 DMA ",$time);
     dma_offset = DMA_OFFSET_C2S[2]; 
    end  
    else if(DMA_REG_BASE ==`CH3_S2C_REG_BASE)begin
     $fdisplay(tx_file_ptr,"[%t] Disabling  S2C3 DMA Engine",$time);
     $display("[%t] Disabling  S2C3 DMA ",$time);
     dma_offset = DMA_OFFSET_S2C[3]; 
    end 
    else if(DMA_REG_BASE ==`CH3_C2S_REG_BASE)begin
     $fdisplay(tx_file_ptr,"[%t] Disabling  C2S3 DMA Engine",$time);
     $display("[%t] Disabling  C2S3 DMA ",$time);
     dma_offset = DMA_OFFSET_C2S[3]; 
    end  

    $fdisplay(tx_file_ptr,"[%t] Disabling interrupt ",$time);
    $display("[%t] Disabling interrupt ",$time);
    TSK_TX_MEMORY_READ_32_1DW(`DMA_OFFSET_ADRS + dma_offset + `DMA_CNTRL_REG);
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, (`DMA_OFFSET_ADRS + dma_offset + `DMA_CNTRL_REG), {P_READ_DATA[31:1], 1'b0});
    DEFAULT_TAG = DEFAULT_TAG + 1;
    TSK_TX_CLK_EAT(50);

    stop = 1'b0;
    addr = `DMA_OFFSET_ADRS + DMA_REG_BASE + `DMA_ENGN_CTRL;

    TSK_TX_MEMORY_READ_32_1DW(addr);
    reg_value = P_READ_DATA;

    //- DMA Enable = 0, DMA Reset Request = 1
    reg_value = (reg_value | 32'h0000_4000) & 32'hFFFF_FEFF;
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, addr, reg_value);
    DEFAULT_TAG = DEFAULT_TAG + 1;

    //- Poll DMA_Running and DMA_Reset_Request till they clear
    $display("[%t] Poll DMA_Running and DMA_Reset_Request till they clear", $time);
    $fdisplay(tx_file_ptr,"[%t] Poll DMA_Running and DMA_Reset_Request till they clear", $time);
    while (!stop)
     begin
      TSK_TX_MEMORY_READ_32_1DW(addr);
      reg_value = P_READ_DATA;
      TSK_TX_CLK_EAT(50);
      if((reg_value[10] | reg_value[14]) == 1'b0)
       stop = 1;
     end
    
    //- Write to DMA_Reset
    $display("[%t] Writing to DMA_Reset", $time);
    $fdisplay(tx_file_ptr,"[%t] Writing to DMA_Reset", $time);
    reg_value = reg_value | 32'h0000_8000;
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, addr, reg_value);
    DEFAULT_TAG = DEFAULT_TAG + 1;

   // - Check bit self-clearing 
    $display("[%t] Wait for DMA_Reset bit to self-clear", $time); 
    $fdisplay(tx_file_ptr,"[%t] Wait for DMA_Reset bit to self-clear", $time); 
    TSK_TX_CLK_EAT(50);
    TSK_TX_MEMORY_READ_32_1DW(addr);
    reg_value = P_READ_DATA;
  end
 endtask //  TSK_DISABLE_DMA

 always@(posedge board.RP.user_clk)
    begin
    `ifdef CH0
     if((board.RP.com_usrapp.packet_rcvd_ch0 == packet_trans_ch0) && (inter_processed_flag == 1'b1))
       dma_start_disabling_ch0 = 1'b1;
    `else   
       dma_start_disabling_ch0 = 1'b1;
    `endif   

    `ifdef CH1
     if((board.RP.com_usrapp.packet_rcvd_ch1 == packet_trans_ch1) && (inter_processed_flag == 1'b1)) 
       dma_start_disabling_ch1 = 1'b1;
    `else
       dma_start_disabling_ch1 = 1'b1;
    `endif   

    `ifdef CH2
     if((board.RP.com_usrapp.packet_rcvd_ch2 == packet_trans_ch2) && (inter_processed_flag == 1'b1)) 
       dma_start_disabling_ch2 = 1'b1;
    `else
       dma_start_disabling_ch2 = 1'b1;
    `endif   

    `ifdef CH3
     if((board.RP.com_usrapp.packet_rcvd_ch3 == packet_trans_ch3) && (inter_processed_flag == 1'b1)) 
       dma_start_disabling_ch3 = 1'b1;
    `else
       dma_start_disabling_ch3 = 1'b1;
    `endif   

     if((dma_start_disabling_ch0 ==1'b1) && (dma_start_disabling_ch1==1'b1) &&
        (dma_start_disabling_ch2 ==1'b1) && (dma_start_disabling_ch3==1'b1)) 
     begin
      if(DMA_DISABLE_FLAG == 1'b1) begin
     // DMA interrupts disabling
     `ifdef CH0

       TSK_DISABLE_DMA(`CH0_S2C_REG_BASE);
       TSK_TX_CLK_EAT(50);
       TSK_DISABLE_DMA(`CH0_C2S_REG_BASE);
       inter_processed_flag = 1'b0;
       dma_disabled_flag_ch0 = 1'b1;
     `endif  

     // DMA interrupts disabling
     `ifdef CH1

       TSK_DISABLE_DMA(`CH1_S2C_REG_BASE);
       TSK_TX_CLK_EAT(50);
       TSK_DISABLE_DMA(`CH1_C2S_REG_BASE);
       inter_processed_flag = 1'b0;
       dma_disabled_flag_ch1 = 1'b1;
     `endif  

     `ifdef CH2

       TSK_DISABLE_DMA(`CH2_S2C_REG_BASE);
       TSK_TX_CLK_EAT(50);
       TSK_DISABLE_DMA(`CH2_C2S_REG_BASE);
       inter_processed_flag = 1'b0;
       dma_disabled_flag_ch2 = 1'b1;
     `endif  

     `ifdef CH3

       TSK_DISABLE_DMA(`CH3_S2C_REG_BASE);
       TSK_TX_CLK_EAT(50);
       TSK_DISABLE_DMA(`CH3_C2S_REG_BASE);
       inter_processed_flag = 1'b0;
       dma_disabled_flag_ch3 = 1'b1;
     `endif  

      DMA_DISABLE_FLAG = 1'b0;
    end   
     else begin
     dma_disabled_flag_ch0 = 1'b1;
     dma_disabled_flag_ch1 = 1'b1;
     dma_disabled_flag_ch2 = 1'b1;
     dma_disabled_flag_ch3 = 1'b1;
     end
    end 
   end   

 always@(posedge board.RP.user_clk)
  begin
   if((dma_disabled_flag_ch0 ==1'b1) && (dma_disabled_flag_ch1 == 1'b1) &&
    (dma_disabled_flag_ch2 ==1'b1) && (dma_disabled_flag_ch3 == 1'b1)) 
   begin
    TSK_TX_CLK_EAT(200);
    $display("===========================================");
    $display("\t \t Simulation Summary \n");
 `ifdef CH0
    if (break_loop == 1) begin
      TSK_TX_MEMORY_READ_32_1DW(`DUT_BADDR_LOWER + `RAWDATA_CHK0_STATUS);
      $display("[%t] CH0 Hardware Checker Mismatch Status = %0b", $time, P_READ_DATA);
    end
    $display("[%t] Total Packets Transmitted over Network Path 0 (APP-0) = %0d", $time,packet_trans_ch0);
    $display("[%t] Total Descriptors Used in S2C Direction (APP-0) = %0d", $time,`CH0_S2C_BD_COUNT);
    $display("[%t] Total Packets Received over Network Path 0 (APP-0) = %0d", $time,chnl0_index);
 `endif
 
 `ifdef CH1
    if (break_loop == 1) begin
      TSK_TX_MEMORY_READ_32_1DW(`DUT_BADDR_LOWER + `RAWDATA_CHK1_STATUS);
      $display("[%t] CH1 Hardware Checker Mismatch Status = %0b", $time, P_READ_DATA);
    end
    $display("[%t] Total Packets Transmitted over Network Path 1 (APP-1) = %0d", $time,packet_trans_ch1);
    $display("[%t] Total Descriptors Used in S2C Direction (APP-1) = %0d", $time,`CH1_S2C_BD_COUNT);
    $display("[%t] Total Packets Received over Network Path 1 (APP-1) = %0d", $time,chnl1_index);
 `endif

 `ifdef CH2
    $display("[%t] Total Packets Transmitted over Network Path 2 (APP-2) = %0d", $time,packet_trans_ch2);
    $display("[%t] Total Descriptors Used in S2C Direction (APP-2) = %0d", $time,`CH2_S2C_BD_COUNT);
    $display("[%t] Total Packets Received over Network Path 2 (APP-2) = %0d", $time,chnl2_index);
 `endif
 `ifdef CH3
    $display("[%t] Total Packets Transmitted over Network Path 3 (APP-3) = %0d", $time,packet_trans_ch3);
    $display("[%t] Total Descriptors Used in S2C Direction (APP-3) = %0d", $time,`CH3_S2C_BD_COUNT);
    $display("[%t] Total Packets Received over Network Path 3 (APP-3) = %0d", $time,chnl3_index);
 `endif

    $display("\n\t \t End of Simulation \t \t");
    $display("===========================================");
    $finish(2);
   end 
 end   

 /************************************************************
 Task : TSK_PACKET_SPANNING
 Inputs : span_count
 Description : Spans a packet over multiple Descriptors.
 *************************************************************/

 task TSK_PACKET_SPANNING;
  input [3:0] span_count;
  input [31:0] chnl_id;
  
  reg [19:0] length;
  reg [31:0] buff_addr;
  reg [3:0] count;
  reg [31:0] bd_addr;
  reg [19:0] length_span;
  integer ii;
  reg [31:0] s2c_sw_desc_ch;
  integer tmp_var;
 
  begin
  if (chnl_id == 0)
  begin
   s2c_sw_desc_ch = `TXDESC0_BASE;
   bd_addr = `TXDESC0_BASE >>2; // converting byte to DW
   packet_trans_ch0 = `CH0_S2C_BD_COUNT/span_count;
   tmp_var = `CH0_S2C_BD_COUNT/span_count;
  end
  else if (chnl_id == 1)
  begin
   s2c_sw_desc_ch = `TXDESC1_BASE;
   bd_addr = `TXDESC1_BASE >>2; // converting byte to DW
   packet_trans_ch1 = `CH1_S2C_BD_COUNT/span_count;
   tmp_var = `CH1_S2C_BD_COUNT/span_count;
  end
  else if (chnl_id == 2)
  begin
   s2c_sw_desc_ch = `TXDESC2_BASE;
   bd_addr = `TXDESC2_BASE >>2; // converting byte to DW
   packet_trans_ch2 = `CH2_S2C_BD_COUNT/span_count;
   tmp_var = `CH2_S2C_BD_COUNT/span_count;
  end
  else //if (chnl_id == 3)
  begin
   s2c_sw_desc_ch = `TXDESC3_BASE;
   bd_addr = `TXDESC3_BASE >>2; // converting byte to DW
   packet_trans_ch3 = `CH3_S2C_BD_COUNT/span_count;
   tmp_var = `CH3_S2C_BD_COUNT/span_count;
  end
   // total number of packet that user can transmit is `CH0_S2C_BD_COUNT/span_count 
   for(ii = 0; ii < tmp_var; ii= ii+1)
    begin
      if (chnl_id == 0)
      begin
        length = BUFFER_LENGTH_CH0[ii];
        buff_addr = BUFFER_ADDRESS_CH0[ii];
      end
      else if (chnl_id == 1)
      begin
        length = BUFFER_LENGTH_CH1[ii];
        buff_addr = BUFFER_ADDRESS_CH1[ii];
      end
      else if (chnl_id == 2)
      begin
        length = BUFFER_LENGTH_CH2[ii];
        buff_addr = BUFFER_ADDRESS_CH2[ii];
      end
      else
      begin
        length = BUFFER_LENGTH_CH3[ii];
        buff_addr = BUFFER_ADDRESS_CH3[ii];
      end
     count = span_count;

     while(count)
      begin
       if(count == span_count) begin
        DESC_DATA[bd_addr +4][31:30] = 2'b10; // setting sop
   //length in user control, should be done but doing it for duoble check
        DESC_DATA[bd_addr +1][19:0] = length; 
       end else if(count == 4'h1)
        DESC_DATA[bd_addr +4][31:30] = 2'b01;  // setting eop  
       else  
        DESC_DATA[bd_addr +4][31:30] = 2'b00;

       if(count == 4'h1)
        length_span = length;
       else 
        length_span = (length >> 1);  // - ((length >> 1) % 8); //dividing length
       
//       $display("[DEBUG]: Total length = %d, span length = %d\n",length,length_span);
        
       DESC_DATA[bd_addr][19:0] = length_span;
       DESC_DATA[bd_addr + 4][19:0] = length_span;
       DESC_DATA[bd_addr + 5] = buff_addr;
       buff_addr = buff_addr + length_span;
       length = length - length_span;
       count = count - 1;
       bd_addr = bd_addr + 32'h8;
       s2c_sw_desc_ch = s2c_sw_desc_ch + 32'h20;
      end  
    end
    if (chnl_id == 0)
      S2C_SW_DESC_CH0 = s2c_sw_desc_ch; 
    else if (chnl_id == 1) 
      S2C_SW_DESC_CH1 = s2c_sw_desc_ch; 
    else if (chnl_id == 2) 
      S2C_SW_DESC_CH2 = s2c_sw_desc_ch; 
    else //if (chnl_id == 3) 
      S2C_SW_DESC_CH3 = s2c_sw_desc_ch; 
  end  

 endtask //TSK_PACKET_SPANNING  

 /************************************************************
 Task : TSK_TEST_INTERRUPTS
 Description : Enables interrupts in C2S direction, Works for one channel
 *************************************************************/

 task TSK_TEST_INTERRUPTS;
 reg [31:0] bd_addr;

  begin
   inter_processed_flag = 1'b0;


   `ifdef CH0
     bd_addr = `RXDESC0_BASE>>2;
     DESC_DATA[bd_addr + 8*(`CH0_S2C_BD_COUNT - 1) + 4][24] = 1'b1;
   `endif  

   `ifdef CH1
     bd_addr = `RXDESC1_BASE>>2;
     DESC_DATA[bd_addr + 8*(`CH1_S2C_BD_COUNT - 1) + 4][24] = 1'b1;
   `endif  

   `ifdef CH2
     bd_addr = `RXDESC2_BASE>>2;
     DESC_DATA[bd_addr + 8*(`CH2_S2C_BD_COUNT - 1) + 4][24] = 1'b1;
   `endif  

   `ifdef CH3
     bd_addr = `RXDESC3_BASE>>2;
     DESC_DATA[bd_addr + 8*(`CH3_S2C_BD_COUNT - 1) + 4][24] = 1'b1;
   `endif  
  end

 endtask // TSK_TEST_INTERRUPTS

 /************************************************************
 Task : TSK_DMA_DISABLE
 Description : Disables DMA at the end when all packets in both channels are received
 *************************************************************/

 task TSK_DMA_DISABLE;
  begin
  DMA_DISABLE_FLAG = 1'b1;
  // - This test requires descriptor count in both S2C and C2S channels to
  // be equal.
  
 `ifdef CH0
  TSK_DESC_DATA(`RXDESC0_BASE, `CH0_S2C_BD_COUNT, `RXBUF0_BASE);
 `endif

 `ifdef CH1
  TSK_DESC_DATA(`RXDESC1_BASE, `CH1_S2C_BD_COUNT, `RXBUF1_BASE);
 `endif 

 `ifdef CH2
  TSK_DESC_DATA(`RXDESC2_BASE, `CH2_S2C_BD_COUNT, `RXBUF2_BASE);
 `endif 

 `ifdef CH3
  TSK_DESC_DATA(`RXDESC3_BASE, `CH3_S2C_BD_COUNT, `RXBUF3_BASE);
 `endif 
  end
 endtask // TSK_DMA_DISABLE

/************************************************************
 *  Task : TSK_PROG_REG
 *   Description : Programs registers given address offset and data 
 **************************************************************/

 task TSK_PROG_REG;
  input [31:0] data;
  input [31:0] reg_offset;
  
  reg [31:0] Adrs;
  
  begin
   Adrs = `DUT_BADDR_LOWER + reg_offset;
    //- Avoid read to save on sim time
/*
   $display("[%t] TSK_PROG_REG: Reading register @ 0x%h\n",$time,reg_offset);
   TSK_TX_MEMORY_READ_32_1DW(Adrs);
   $display("[%t] TSK_PROG_REG: Register @ 0x%h contains 0x%h\n",$time,reg_offset,P_READ_DATA);
   TSK_TX_CLK_EAT(50);
*/   
   $display("[%t] TSK_PROG_REG: Programming register @ 0x%h with 0x%h\n",$time, reg_offset, data);
   TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, Adrs, data);
   DEFAULT_TAG = DEFAULT_TAG + 1;
   TSK_TX_CLK_EAT(50);
  
  end 

 endtask  // TSK_PROG_REG

 task XGEMAC_CONFIG;
  input [31:0] inst_num;

  reg [31:0] Adrs;
  reg [31:0] data;
  reg [31:0] ReadData;  
  reg [31:0] adrs_offset;
  
  begin

    adrs_offset = `DUT_BADDR_LOWER + 16'hB000;

    if (inst_num == 1)
      adrs_offset = adrs_offset + 32'h00001000;
    else if (inst_num == 2)
      adrs_offset = adrs_offset + 32'h00002000;
    else if (inst_num == 3)
      adrs_offset = adrs_offset + 32'h00003000;

    //- Disable Flow Control 
    Adrs = adrs_offset + `XGEMAC_FC;
/*  
    TSK_TX_MEMORY_READ_32_1DW(Adrs);
    ReadData = P_READ_DATA;
    $display("Reading FC Register contains %h\n", ReadData);
    TSK_TX_CLK_EAT(50);
*/
    data = 32'd0;
    $display("Writing FC Register\n");
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, Adrs, data);
    DEFAULT_TAG = DEFAULT_TAG + 1;
    TSK_TX_CLK_EAT(50);
    
/*    
    //- Read RCW1 
    Adrs = adrs_offset + `XGEMAC_RCW1;
    TSK_TX_MEMORY_READ_32_1DW(Adrs);
    ReadData = P_READ_DATA;
    $display("Reading RCW1 returned %h\n", ReadData);
    TSK_TX_CLK_EAT(10);

    //- Read TC 
    Adrs = adrs_offset + `XGEMAC_TC;
    TSK_TX_MEMORY_READ_32_1DW(Adrs);
    ReadData = P_READ_DATA;
    $display("Reading TC returned %h\n", ReadData);
    TSK_TX_CLK_EAT(10);
*/
    //- Program the MDIO register, enable MDIO, clock divider set to 33
    
    $display("Reading MDIO...\n");
    Adrs = adrs_offset + `XGEMAC_MDIO;
    TSK_TX_MEMORY_READ_32_1DW(Adrs);
    ReadData = P_READ_DATA;

    $display("Writing MDIO...\n");
    data = {ReadData[31:7],1'b1,6'b100001};
    TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, Adrs, data);
    DEFAULT_TAG = DEFAULT_TAG + 1;
    TSK_TX_CLK_EAT(10);

  end
 endtask  //XGEMAC_CONFIG
 
/************************************************************
 *  Task : TSK_SET_PACKET_LENGTH
 *   Description : Configures VFIFO, it does following:
 **************************************************************/

 task TSK_SET_PACKET_LENGTH;
  input [31:0] chnl_no;
  reg [31:0] Adrs;
  reg [15:0] Data;
  
  begin
   $fdisplay(tx_file_ptr,"[%t] configure packet length on channel %d ",$time, chnl_no);
   Adrs = (chnl_no == 0) ? `DUT_BADDR_LOWER + `PKT_LEN0 
                            : `DUT_BADDR_LOWER + `PKT_LEN1;

   Data = (chnl_no == 0) ? `MAX_BUFFER_LENGTH_CHNL0 
                            : `MAX_BUFFER_LENGTH_CHNL1;
   
   TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, Adrs, Data);
   DEFAULT_TAG = DEFAULT_TAG + 1;
   TSK_TX_CLK_EAT(100);      
   
   $display("[%t]  Packet length register Address on channel %d = %h, programmed with length %d bytes",$time, chnl_no, Adrs, Data);
   $fdisplay(tx_file_ptr,"[%t] Packet length Address on channel %d = %h",$time, chnl_no, Adrs);
   TSK_TX_MEMORY_READ_32_1DW(Adrs);
   //$display("[%t] P_READ_DATA %h", $time, P_READ_DATA);
         
  end 
  
 endtask  // TSK_SET_PACKET_LENGTH

/************************************************************
 *  Task : TSK_CH1_LB_OR_CHEC
 *   Description : Sets loopback or independent TX 
 **************************************************************/

 task TSK_EN_LB_OR_CHEC;
  input [31:0] chnl_no;
  input [31:0] data;
  reg [31:0] Adrs;
  
  begin
   $fdisplay(tx_file_ptr,"[%t] enable loopback or packet checker on raw data path ",$time);
   Adrs = (chnl_no == 0) ? `DUT_BADDR_LOWER + `RAWDATA_ENABLE_LB_OR_CHEC0 
                            : `DUT_BADDR_LOWER + `RAWDATA_ENABLE_LB_OR_CHEC1;

   TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, Adrs, data);
   DEFAULT_TAG = DEFAULT_TAG + 1;
   TSK_TX_CLK_EAT(100);
  end 

 endtask  // TSK_CH1_LB_OR_CHEC

/************************************************************
 *  Task : TSK_CH1_GEN
 *   Description : Sets independent RX path 
 **************************************************************/

 task TSK_EN_GEN;
  input [31:0] chnl_no;
  input [31:0] data;
  reg [31:0] Adrs;
  
  begin
   $fdisplay(tx_file_ptr,"[%t] enable packet generator on raw data path ",$time);
   Adrs = (chnl_no == 0) ? `DUT_BADDR_LOWER + `RAWDATA_ENABLE_GEN0 
                            : `DUT_BADDR_LOWER + `RAWDATA_ENABLE_GEN1;
   TSK_TX_MEMORY_WRITE_1DW(DEFAULT_TAG, DEFAULT_TC, Adrs, data);
   DEFAULT_TAG = DEFAULT_TAG + 1;
   TSK_TX_CLK_EAT(100);
  
  end 
 endtask  // TSK_CH1_GEN

