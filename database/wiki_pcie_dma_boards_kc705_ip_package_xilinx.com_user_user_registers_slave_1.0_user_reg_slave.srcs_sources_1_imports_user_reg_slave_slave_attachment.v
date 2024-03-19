// ------------------------------------------------------------------------------
// (c) Copyright 2010 Xilinx, Inc. All rights reserved.
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
// ------------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Filename:        slave_attachment.v
// Version:         v1.00.a
// Description:     AXI slave attachment supporting single transfers
//-----------------------------------------------------------------------------
// Structure:   This section shows the hierarchical structure of axi_lite_ipif.
//
//              --axi_lite_ipif.v
//                    --slave_attachment.v
//                       --address_decoder.v
//                       --pselect_f.v
//                    --counter_f.v
//-----------------------------------------------------------------------------
// Author:      BSB
//
// History:
//
//  BSB      05/20/10      -- First version
// ~~~~~~
//  - Created the first version v1.00.a
// ^^^^^^
//-----------------------------------------------------------------------------
// Naming Conventions:
//      active low signals:                     "*_n"
//      clock signals:                          "clk", "clk_div#", "clk_#x"
//      reset signals:                          "rst", "rst_n"
//      generics:                               "C_*"
//      user defined types:                     "*_TYPE"
//      state machine next state:               "*_ns"
//      state machine current state:            "*_cs"
//      combinatorial signals:                  "*_cmb"
//      pipelined or register delay signals:    "*_d#"
//      counter signals:                        "*cnt*"
//      clock enable signals:                   "*_ce"
//      internal version of output port         "*_i"
//      device pins:                            "*_pin"
//      ports:                                  - Names begin with Uppercase
//      processes:                              "*_PROCESS"
//      component instantiations:               "<ENTITY_>I_<#|FUNC>
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//                     Definition of Generics
//-----------------------------------------------------------------------------
// C_NUM_ADDRESS_RANGES  -- Total Number of address ranges
// C_TOTAL_NUM_CE        -- Total number of chip enables in all the ranges
// C_IPIF_ABUS_WIDTH     -- IPIF Address bus width
// C_IPIF_DBUS_WIDTH     -- IPIF Data Bus width
// C_S_AXI_MIN_SIZE      -- Minimum address range of the IP
// C_USE_WSTRB           -- Use write strobs or not
// C_DPHASE_TIMEOUT      -- Data phase time out counter 
// C_NUM_ADDRESS_RANGES  -- Number of address ranges in C_ARD_ADDR_RANGE_ARRAY
// C_ARD_ADDR_RANGE_ARRAY-- Base /High Address Pair for each Address Range
// C_ARD_NUM_CE_ARRAY    -- Desired number of chip enables for an address range
// C_FAMILY              -- Target FPGA family
//-----------------------------------------------------------------------------
//                  Definition of Ports
//-----------------------------------------------------------------------------
// S_AXI_ACLK            -- AXI Clock
// S_AXI_ARESET          -- AXI Reset
// S_AXI_AWADDR          -- AXI Write address
// S_AXI_AWVALID         -- Write address valid
// S_AXI_AWREADY         -- Write address ready
// S_AXI_WDATA           -- Write data
// S_AXI_WSTRB           -- Write strobes
// S_AXI_WVALID          -- Write valid
// S_AXI_WREADY          -- Write ready
// S_AXI_BRESP           -- Write response
// S_AXI_BVALID          -- Write response valid
// S_AXI_BREADY          -- Response ready
// S_AXI_ARADDR          -- Read address
// S_AXI_ARVALID         -- Read address valid
// S_AXI_ARREADY         -- Read address ready
// S_AXI_RDATA           -- Read data
// S_AXI_RRESP           -- Read response
// S_AXI_RVALID          -- Read valid
// S_AXI_RREADY          -- Read ready
// Bus2IP_Clk            -- Synchronization clock provided to User IP
// Bus2IP_Reset          -- Active high reset for use by the User IP
// Bus2IP_Addr           -- Desired address of read or write operation
// Bus2IP_RNW            -- Read or write indicator for the transaction
// Bus2IP_BE             -- Byte enables for the data bus
// Bus2IP_CS             -- Chip select for the transcations
// Bus2IP_RdCE           -- Chip enables for the read
// Bus2IP_WrCE           -- Chip enables for the write
// Bus2IP_Data           -- Write data bus to the User IP
// IP2Bus_Data           -- Input Read Data bus from the User IP
// IP2Bus_WrAck          -- Active high Write Data qualifier from the IP
// IP2Bus_RdAck          -- Active high Read Data qualifier from the IP
// IP2Bus_Error          -- Error signal from the IP
//-----------------------------------------------------------------------------
module slave_attachment 
#(
parameter                                C_NUM_ADDRESS_RANGES      = 2,
parameter                                C_TOTAL_NUM_CE            = 16,
parameter [0:32*2*C_NUM_ADDRESS_RANGES-1]C_ARD_ADDR_RANGE_ARRAY  = 
                                             {2*C_NUM_ADDRESS_RANGES
                                             {32'h00000000}},
parameter [0:8*C_NUM_ADDRESS_RANGES-1]   C_ARD_NUM_CE_ARRAY  = 
                                             {C_NUM_ADDRESS_RANGES{8'd4}},
parameter        C_IPIF_ABUS_WIDTH         = 32,
parameter        C_IPIF_DBUS_WIDTH         = 32,
parameter [31:0] C_S_AXI_MIN_SIZE          = 'h000001FF,
parameter        C_USE_WSTRB               = 0,
parameter        C_DPHASE_TIMEOUT          = 16,
parameter        C_FAMILY                  = "kintex7"
)
(
input                            S_AXI_ACLK, 
input                            S_AXI_ARESETN, 
input[C_IPIF_ABUS_WIDTH-1:0]     S_AXI_AWADDR, 
input                            S_AXI_AWVALID, 
output                           S_AXI_AWREADY, 
input[C_IPIF_DBUS_WIDTH-1:0]     S_AXI_WDATA,
input[(C_IPIF_DBUS_WIDTH/8)-1:0] S_AXI_WSTRB, 
input                            S_AXI_WVALID, 
output                           S_AXI_WREADY, 
output[1:0]                      S_AXI_BRESP,
output                           S_AXI_BVALID,    
input                            S_AXI_BREADY, 
input[C_IPIF_ABUS_WIDTH - 1:0]   S_AXI_ARADDR, 
input                            S_AXI_ARVALID, 
output                           S_AXI_ARREADY,    
output[C_IPIF_DBUS_WIDTH - 1:0]  S_AXI_RDATA,   
output[1:0]                      S_AXI_RRESP, 
output                           S_AXI_RVALID,
input                            S_AXI_RREADY, 
output                           Bus2IP_Clk, 
output                           Bus2IP_Resetn,    
output[C_IPIF_ABUS_WIDTH-1:0]  Bus2IP_Addr,    
output Bus2IP_RNW,
output[((C_IPIF_DBUS_WIDTH/8) - 1):0] Bus2IP_BE,
output[(C_NUM_ADDRESS_RANGES -1):0] Bus2IP_CS,  
output[C_TOTAL_NUM_CE-1:0] Bus2IP_RdCE,   
output[C_TOTAL_NUM_CE-1:0] Bus2IP_WrCE, 
output[(C_IPIF_DBUS_WIDTH - 1):0] Bus2IP_Data,    
input [(C_IPIF_DBUS_WIDTH - 1):0] IP2Bus_Data, 
input IP2Bus_WrAck,
input IP2Bus_RdAck, 
input IP2Bus_Error 
);
//-----------------------------------------------------------------------------
// Function Declarations
//-----------------------------------------------------------------------------
//---------------------------------------------------------------------------
// Function Get_Addr_Bits
//
// This function is used to get the number of address bits required
//---------------------------------------------------------------------------
function integer Get_Addr_Bits;
input[31:0] y; 
begin : GET_NUM_DECODE_BITS
  integer i;
  for(i = 31; (y[i]) == 1'b0; i = i - 1)
  begin
     begin
        Get_Addr_Bits = i; 
     end 
  end
end
endfunction
//------------------------------------------------------------------------------
// Function clog2 - returns the integer ceiling of the base 2 logarithm of x,
//------------------------------------------------------------------------------
function integer clog2;
input [31:0] Depth;
integer i;
begin
 i = Depth;		
 for(clog2 = 0; i > 0; clog2 = clog2 + 1)
   i = i >> 1;
end
endfunction
//-----------------------------------------------------------------------------
// Constant Declarations
//-----------------------------------------------------------------------------
parameter C_INCLUDE_DPHASE_TIMER = C_DPHASE_TIMEOUT;
parameter AXI_RESP_OK  = 2'b00;
parameter AXI_RESP_SLVERR = 2'b10;
parameter C_ADDR_DECODE_BITS = Get_Addr_Bits(C_S_AXI_MIN_SIZE);
parameter ZEROS = {((C_IPIF_ABUS_WIDTH-1)-(C_ADDR_DECODE_BITS)+1){1'b0}};
parameter[2:0] IDLE = 0; 
parameter[2:0] READING = 1; 
parameter[2:0] READ_WAIT = 2; 
parameter[2:0] WRITE_WAIT = 3; 
parameter[2:0] WRITING = 4; 
parameter[2:0] B_VALID = 5; 
parameter[2:0] BRESP_WAIT = 6; 
parameter COUNTER_WIDTH = clog2(C_DPHASE_TIMEOUT);
parameter [COUNTER_WIDTH-1:0] DPTO_LD_VALUE = C_DPHASE_TIMEOUT-1;

reg      s_axi_awready_i; 
reg      s_axi_wready_i; 
reg[1:0] s_axi_bresp_i; 
reg      s_axi_bvalid_i; 
reg      s_axi_arready_i; 
reg[C_IPIF_DBUS_WIDTH - 1:0] s_axi_rdata_i; 
reg[1:0] s_axi_rresp_i; 
reg      s_axi_rvalid_i; 
reg      s_axi_awready_reg; 
reg      s_axi_wready_reg; 
reg[1:0] s_axi_bresp_reg; 
reg      s_axi_bvalid_reg; 
reg      s_axi_arready_reg; 
reg[C_IPIF_DBUS_WIDTH - 1:0] s_axi_rdata_reg; 
reg[1:0] s_axi_rresp_reg; 
reg      s_axi_rvalid_reg; 
wire[C_IPIF_ABUS_WIDTH - 1:0] ipif_addr; 
wire[C_IPIF_ABUS_WIDTH - 1:0] axi_addr; 
reg [C_IPIF_ABUS_WIDTH - 1:0] bus2ip_addr_reg; 
reg      axi_avalid; 
reg      axi_avalid_reg; 
reg[(C_IPIF_DBUS_WIDTH - 1):0] bus2ip_addr_i; 
reg      bus2ip_rnw_i; 
reg[((C_IPIF_DBUS_WIDTH / 8) - 1):0] bus2ip_be_i; 
reg      bus2ip_rnw_reg; 
reg[((C_IPIF_DBUS_WIDTH / 8) - 1):0] bus2ip_be_reg; 
wire[(C_NUM_ADDRESS_RANGES - 1):0] bus2ip_cs_i; 
wire[(C_TOTAL_NUM_CE - 1):0] bus2ip_rdce_i; 
wire[(C_TOTAL_NUM_CE - 1):0] bus2ip_wrce_i; 
wire ip2bus_wrack_i; 
wire ip2bus_rdack_i; 
wire  data_timeout_i; 
reg  data_timeout; 
reg  counter_en_i; 
reg  counter_en_reg; 
reg  cs_ce_ld_enable_i; 
reg  clear_cs_ce_i; 
reg  dp_count_load; 
reg[2:0] access_ns; 
reg[2:0] access_cs; 

assign Bus2IP_Clk = S_AXI_ACLK ;
assign Bus2IP_Resetn = S_AXI_ARESETN ;
assign Bus2IP_RNW = bus2ip_rnw_reg ;
assign Bus2IP_BE = (C_USE_WSTRB == 1) ? bus2ip_be_reg : 4'b1111;
assign Bus2IP_Data = S_AXI_WDATA ;
assign Bus2IP_Addr = bus2ip_addr_reg ;
assign Bus2IP_CS = bus2ip_cs_i ;
assign Bus2IP_RdCE = bus2ip_rdce_i ;
assign Bus2IP_WrCE = bus2ip_wrce_i ;
assign S_AXI_AWREADY = s_axi_awready_reg ;
assign S_AXI_WREADY = s_axi_wready_reg ;
assign S_AXI_BVALID = s_axi_bvalid_reg ;
assign S_AXI_BRESP = s_axi_bresp_reg ;
assign S_AXI_ARREADY = s_axi_arready_reg ;
assign S_AXI_RRESP = s_axi_rresp_reg ;
assign S_AXI_RVALID = s_axi_rvalid_reg ;
assign S_AXI_RDATA = s_axi_rdata_reg ;
assign axi_addr = (S_AXI_ARVALID == 1'b1) ? S_AXI_ARADDR : S_AXI_AWADDR;
// Mask off unused high-order address bits
assign ipif_addr = {ZEROS, axi_addr[C_ADDR_DECODE_BITS-1:0]};
//-------------------------------------------------------------------------------
//-- Address Decoder Component Instance
//--
//-- This component decodes the specified base address pairs and outputs the
//-- specified number of chip enables and the target bus size.
//-------------------------------------------------------------------------------
address_decoder 
#(
.C_NUM_ADDRESS_RANGES(C_NUM_ADDRESS_RANGES),
.C_TOTAL_NUM_CE(C_TOTAL_NUM_CE),
.C_BUS_AWIDTH(C_ADDR_DECODE_BITS),
.C_ARD_ADDR_RANGE_ARRAY (C_ARD_ADDR_RANGE_ARRAY), 
.C_ARD_NUM_CE_ARRAY(C_ARD_NUM_CE_ARRAY),
.C_FAMILY("nofamily")
)
I_DECODER
(
.Bus_clk(S_AXI_ACLK),
.Bus_rst(S_AXI_ARESETN),
.Address_In_Erly(bus2ip_addr_i[C_ADDR_DECODE_BITS-1:0]),
.Address_Valid_Erly(axi_avalid),
.Bus_RNW(bus2ip_rnw_reg), 
.Bus_RNW_Erly(bus2ip_rnw_i),
.CS_CE_ld_enable(cs_ce_ld_enable_i), 
.Clear_CS_CE_Reg(clear_cs_ce_i),
.RW_CE_ld_enable(cs_ce_ld_enable_i), 
// Decode output signals
.CS_Out(bus2ip_cs_i),
.RdCE_Out(bus2ip_rdce_i),
.WrCE_Out(bus2ip_wrce_i)
); 

//-------------------------------------------------------------------------------
//-- AXI Transaction Controller
//-------------------------------------------------------------------------------
always @(access_cs or ipif_addr or data_timeout_i or S_AXI_ARVALID or 
S_AXI_AWVALID or 
         S_AXI_WVALID or S_AXI_RREADY or S_AXI_BREADY or S_AXI_WSTRB or 
         IP2Bus_Data or 
         IP2Bus_RdAck or IP2Bus_WrAck or IP2Bus_Error or axi_avalid_reg or 
         s_axi_bvalid_reg or s_axi_bresp_reg or s_axi_rdata_reg or 
         s_axi_rresp_reg or 
         s_axi_rvalid_reg or bus2ip_addr_reg or bus2ip_rnw_reg or 
         bus2ip_be_reg or 
         counter_en_reg)
begin : Access_Control
   access_ns <= access_cs ; 
   s_axi_arready_i <= 1'b1 ; 
   s_axi_awready_i <= 1'b0 ; 
   s_axi_wready_i <= 1'b0 ; 
   s_axi_bvalid_i <= s_axi_bvalid_reg ; 
   s_axi_bresp_i <= s_axi_bresp_reg ; 
   s_axi_rdata_i <= s_axi_rdata_reg ; 
   s_axi_rresp_i <= s_axi_rresp_reg ; 
   s_axi_rvalid_i <= s_axi_rvalid_reg ; 
   bus2ip_addr_i <= bus2ip_addr_reg ; 
   bus2ip_rnw_i <= bus2ip_rnw_reg ; 
   bus2ip_be_i <= bus2ip_be_reg ; 
   cs_ce_ld_enable_i <= 1'b0 ; 
   clear_cs_ce_i <= 1'b0 ; 
   dp_count_load <= 1'b0 ; 
   axi_avalid <= axi_avalid_reg ; 
   counter_en_i <= counter_en_reg ; 
   case (access_cs)
      IDLE :
           begin
              if (S_AXI_ARVALID == 1'b1)
              begin
                 // Read precedence over write
                 s_axi_arready_i <= 1'b0 ; // 1-cycle pulse
                 axi_avalid <= 1'b1 ; // sticky
                 bus2ip_rnw_i <= 1'b1 ; 
                 bus2ip_addr_i <= ipif_addr ; 
                 bus2ip_be_i <= 4'b1111 ; 
                 cs_ce_ld_enable_i <= 1'b1 ; 
                 counter_en_i <= 1'b1 ; 
                 dp_count_load <= 1'b1 ; 
                 access_ns <= READING ; 
              end
              else if (S_AXI_AWVALID == 1'b1)
              begin
                 s_axi_arready_i <= 1'b0 ; 
                 s_axi_awready_i <= 1'b1 ; // 1-cycle pulse
                 axi_avalid <= 1'b1 ; 
                 bus2ip_rnw_i <= 1'b0 ; 
                 bus2ip_addr_i <= ipif_addr ; 
                 counter_en_i <= 1'b0 ; 
                 dp_count_load <= 1'b0 ; 
                 access_ns <= WRITE_WAIT ; 
              end
              else
              begin
                 s_axi_arready_i <= 1'b1 ; 
                 access_ns <= IDLE ; 
              end 
           end
      READING :
               begin
                  s_axi_arready_i <= 1'b0 ; 
                  axi_avalid <= 1'b0 ; 
                  if (data_timeout_i == 1'b1)
                  begin
                     s_axi_rvalid_i <= 1'b1 ; // Sticky
                     s_axi_rdata_i <= {(C_IPIF_DBUS_WIDTH){1'b0}} ; 
                     s_axi_rresp_i <= AXI_RESP_OK; 
                     clear_cs_ce_i <= 1'b1 ; 
                     counter_en_i <= 1'b0 ; 
                     access_ns <= READ_WAIT ; 
                  end
                  else if (IP2Bus_RdAck == 1'b1)
                  begin
                     s_axi_rvalid_i <= 1'b1 ; // Sticky
                     s_axi_rdata_i <= IP2Bus_Data ; 
                     if (IP2Bus_Error == 1'b1)
                     begin
                        s_axi_rresp_i <= AXI_RESP_SLVERR ; 
                     end
                     else
                     begin
                        s_axi_rresp_i <= AXI_RESP_OK ; 
                     end 
                     clear_cs_ce_i <= 1'b1 ; 
                     counter_en_i <= 1'b0 ; 
                     access_ns <= READ_WAIT ; 
                  end 
               end
      READ_WAIT :
               begin
                  // s_axi_arready_i    <= '0';       
                  counter_en_i <= 1'b0 ; 
                  axi_avalid <= 1'b0 ; 
                  if (S_AXI_RREADY == 1'b1)
                  begin
                     s_axi_rvalid_i <= 1'b0 ; 
                     s_axi_rdata_i <= {(C_IPIF_DBUS_WIDTH){1'b0}} ; 
                     s_axi_arready_i <= 1'b1 ; 
                     access_ns <= IDLE ; 
                  end 
               end
      WRITE_WAIT :
               begin
                  s_axi_arready_i <= 1'b0 ; 
                  if (S_AXI_WVALID == 1'b1)
                  begin
                     counter_en_i <= 1'b1 ; 
                     dp_count_load <= 1'b1 ; 
                     axi_avalid <= 1'b1 ; 
                     cs_ce_ld_enable_i <= 1'b1 ; 
                     bus2ip_be_i <= S_AXI_WSTRB ; 
                     access_ns <= WRITING ; 
                  end 
               end
      WRITING :
               begin
                  s_axi_arready_i <= 1'b0 ; 
                  bus2ip_be_i <= S_AXI_WSTRB ; 
                  axi_avalid <= 1'b0 ; 
                  if (data_timeout_i == 1'b1)
                  begin
                     s_axi_wready_i <= 1'b1;
                     s_axi_bresp_i <= AXI_RESP_OK ; 
                     axi_avalid <= 1'b0 ; 
                     cs_ce_ld_enable_i <= 1'b0 ; 
                     clear_cs_ce_i <= 1'b1 ; 
                     counter_en_i <= 1'b0 ; 
                     bus2ip_be_i <= S_AXI_WSTRB ; 
                     access_ns <= B_VALID ;
                  end   
                  else if (IP2Bus_WrAck == 1'b1)
                  begin
                     s_axi_wready_i <= 1'b1 ; 
                     if (IP2Bus_Error == 1'b1)
                     begin
                        s_axi_bresp_i <= AXI_RESP_SLVERR ; 
                     end
                     else
                     begin
                        s_axi_bresp_i <= AXI_RESP_OK ; 
                     end 
                     axi_avalid <= 1'b0 ; 
                     cs_ce_ld_enable_i <= 1'b0 ; 
                     clear_cs_ce_i <= 1'b1 ; 
                     counter_en_i <= 1'b0 ; 
                     bus2ip_be_i <= S_AXI_WSTRB ; 
                     access_ns <= B_VALID ; 
                  end 
               end
      B_VALID :
               begin
                  s_axi_arready_i <= 1'b0 ; 
                  s_axi_bvalid_i <= 1'b1 ; 
                  access_ns <= BRESP_WAIT ; 
               end
      BRESP_WAIT :
               begin
                  // s_axi_arready_i    <= '0';       
                  counter_en_i <= 1'b0 ; 
                  axi_avalid <= 1'b0 ; 
                  if (S_AXI_BREADY == 1'b1)
                  begin
                     s_axi_arready_i <= 1'b1 ; 
                     s_axi_bvalid_i <= 1'b0 ; 
                     access_ns <= IDLE ; 
                  end 
               end
   endcase 
end 

//-----------------------------------------------------------------------------
// AXI Transaction Controller signals registered
//-----------------------------------------------------------------------------
always @(posedge S_AXI_ACLK)
begin : Access_Control_Reg
   if (S_AXI_ARESETN == 1'b0)
   begin
      access_cs <= IDLE ; 
      s_axi_awready_reg <= 1'b0 ; 
      s_axi_wready_reg <= 1'b0 ; 
      s_axi_bvalid_reg <= 1'b0 ; 
      s_axi_bresp_reg <= 2'b00 ; 
      s_axi_arready_reg <= 1'b0 ; 
      s_axi_rdata_reg <= {(C_IPIF_DBUS_WIDTH){1'b0}} ; 
      s_axi_rresp_reg <= 2'b00 ; 
      s_axi_rvalid_reg <= 1'b0 ; 
      bus2ip_addr_reg <= {(C_IPIF_DBUS_WIDTH){1'b0}} ; 
      bus2ip_rnw_reg <= 1'b0 ; 
      axi_avalid_reg <= 1'b0 ; 
      counter_en_reg <= 1'b0 ; 
   end
   else
   begin
      access_cs <= access_ns ; 
      s_axi_awready_reg <= s_axi_awready_i ; 
      s_axi_wready_reg <= s_axi_wready_i ; 
      s_axi_bvalid_reg <= s_axi_bvalid_i ; 
      s_axi_bresp_reg <= s_axi_bresp_i ; 
      s_axi_arready_reg <= s_axi_arready_i ; 
      s_axi_rdata_reg <= s_axi_rdata_i ; 
      s_axi_rresp_reg <= s_axi_rresp_i ; 
      s_axi_rvalid_reg <= s_axi_rvalid_i ; 
      bus2ip_addr_reg <= bus2ip_addr_i ; 
      bus2ip_rnw_reg <= bus2ip_rnw_i ; 
      axi_avalid_reg <= axi_avalid ; 
      counter_en_reg <= counter_en_i ; 
   end  
end 
//-------------------------------------------------------------------------------
//-- BE will be sent to the IPIC if C_USE_WSTRB = 1.
//-------------------------------------------------------------------------------  
generate
if (C_USE_WSTRB == 1) begin : GEN_USE_WSTRB
   always @(posedge S_AXI_ACLK)
   begin
      if (S_AXI_ARESETN == 1'b0)
      begin
         bus2ip_be_reg <= 4'b1111 ; 
      end
      else
      begin
         bus2ip_be_reg <= bus2ip_be_i ; 
      end  
   end
end    
endgenerate
//-------------------------------------------------------------------------------
//-- This implements the dataphase watchdog timeout function. The counter is
//-- allowed to count down when an active IPIF operation is ongoing. A data 
//-- acknowledge from the target address space forces the counter to reload.
//------------------------------------------------------------------------------- 
generate
if (C_INCLUDE_DPHASE_TIMER != 0) begin : DATA_PHASE_WDT

assign dpto_cntr_ld_en = dp_count_load;
assign dpto_cnt_en = counter_en_i;

counter_f 
#(
.C_NUM_BITS(COUNTER_WIDTH),
.C_FAMILY("nofamily")
) 
I_DPTO_COUNTER
(
.Clk(S_AXI_ACLK),
.Rst(1'b0), 
.Load_In(DPTO_LD_VALUE),
.Count_Enable(dpto_cnt_en), 
.Count_Load(dpto_cntr_ld_en),
.Count_Down(1'b1), 
.Count_Out(), 
.Carry_Out(timeout_i)
); 
//-------------------------------------------------------------------------------
//-- Registering the counter output.
//------------------------------------------------------------------------------- 
always @(posedge S_AXI_ACLK)
begin : REG_TIMEOUT
   if (S_AXI_ARESETN == 1'b0)
   begin
      data_timeout <= 1'b0 ; 
   end
   else
   begin
      data_timeout <= timeout_i ; 
   end  
end 
end
endgenerate

assign data_timeout_i = (C_INCLUDE_DPHASE_TIMER == 0) ? 1'b0 : data_timeout ;

endmodule
