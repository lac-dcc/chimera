//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2013 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information of Xilinx, Inc.
// and is protected under U.S. and international copyright and other
// intellectual property laws.
//
// DISCLAIMER
//
// This disclaimer is not a license and does not grant any rights to the
// materials distributed herewith. Except as otherwise provided in a valid
// license issued to you by Xilinx, and to the maximum extent permitted by
// applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
// FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
// IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
// MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
// and (2) Xilinx shall not be liable (whether in contract or tort, including
// negligence, or under any other theory of liability) for any loss or damage
// of any kind or nature related to, arising under or in connection with these
// materials, including for any direct, or any indirect, special, incidental,
// or consequential loss or damage (including loss of data, profits, goodwill,
// or any type of loss or damage suffered as a result of any action brought by
// a third party) even if such damage or loss was reasonably foreseeable or
// Xilinx had been advised of the possibility of the same.
//
// CRITICAL APPLICATIONS
//
// Xilinx products are not designed or intended to be fail-safe, or for use in
// any application requiring fail-safe performance, such as life-support or
// safety devices or systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any other
// applications that could lead to death, personal injury, or severe property
// or environmental damage (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and liability of any use of
// Xilinx products in Critical Applications, subject only to applicable laws
// and regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
// AT ALL TIMES.

//-----------------------------------------------------------------------------
// MODULE 
//-----------------------------------------------------------------------------

module registers #(
  parameter ADDR_WIDTH  = 32,
  parameter DATA_WIDTH  = 32,
  parameter NUM_POWER_REG =13 
) (
    //-IPIC Interface

  input [ADDR_WIDTH-1:0]        Bus2IP_Addr,
  input                         Bus2IP_RNW,
  input                         Bus2IP_CS,
  input [DATA_WIDTH-1:0]        Bus2IP_Data,
  output reg [DATA_WIDTH-1:0]   IP2Bus_Data,
  output reg                    IP2Bus_WrAck,
  output reg                    IP2Bus_RdAck,
  output                        IP2Bus_Error,
    //- User registers
  input [31:0]                  tx_pcie_byte_cnt,
  input [31:0]                  rx_pcie_byte_cnt,
  input [31:0]                  tx_pcie_payload_cnt,
  input [31:0]                  rx_pcie_payload_cnt,

  input [11:0]                  init_fc_cpld,
  input [7:0]                   init_fc_cplh,
  input [11:0]                  init_fc_npd,
  input [7:0]                   init_fc_nph,
  input [11:0]                  init_fc_pd,
  input [7:0]                   init_fc_ph,
 
  output reg                    ch0_perf_mode_en,
  output reg                    ch1_perf_mode_en,
 
  output reg                    app0_en_lpbk,
  output reg                    app0_en_gen,
  output reg                    app0_en_chk,
  output reg [15:0]             app0_pkt_size,
  output reg [31:0]             app0_cnt_wrap,
  input                         app0_chk_status,
  output reg                    app1_en_lpbk,
  output reg                    app1_en_gen,
  output reg                    app1_en_chk,
  output reg [15:0]             app1_pkt_size,
  output reg [31:0]             app1_cnt_wrap,
  input                         app1_chk_status,
  
  input [3:0]                   ddr3_fifo_empty,
  output reg                    axi_ic_mig_shim_rst_n = 1'b1,
  input                         calib_done,  
  
  input                         xphy0_status, 
  input                         xphy1_status, 
  output reg                    mac0_pm_enable,
  output [47:0]                 mac0_adrs,
  input                         mac0_rx_fifo_overflow,
  input                         mac1_rx_fifo_overflow,
  output reg                    mac1_pm_enable,
  output [47:0]                 mac1_adrs,
    //- PCIe link related
  input                         pcie_link_up,
  input                         pl_sel_lnk_rate,
  input [1:0]                   pl_sel_lnk_width,
  input                         pl_link_upcfg_capable,
  input                         pl_link_gen2_capable,
  input                         pl_link_partner_gen2_supported,
  input [2:0]                   pl_initial_link_width,

  output reg [2:0]              target_link_width,
  output reg [1:0]              target_link_speed,
  output                        valid_width_change_req,
  output                        valid_speed_change_req,

  input                         width_change_done,
  input                         width_change_error,
  input                         speed_change_done,
  input                         speed_change_error,      
`ifdef KC705_PVTMON
  input [(NUM_POWER_REG * 32) -1 :0]  power_status_reg,
`endif
    //- System signals
  input                         Clk,
  input                         Resetn
);

  //- Address offset definitions
  localparam [15:0] 
        //- Design Info registers
      DESIGN_VERSION      = 16'h9000,
      DESIGN_MODE         = 16'h9004,
      DESIGN_STATUS       = 16'h9008,
        //- PCIe Performance Monitor
      TX_PCIE_BYTE_CNT    = 16'h900C,
      RX_PCIE_BYTE_CNT    = 16'h9010,
      TX_PCIE_PAYLOAD_CNT = 16'h9014,
      RX_PCIE_PAYLOAD_CNT = 16'h9018,
      INIT_FC_CPLD        = 16'h901C,
      INIT_FC_CPLH        = 16'h9020,
      INIT_FC_NPD         = 16'h9024,
      INIT_FC_NPH         = 16'h9028,
      INIT_FC_PD          = 16'h902C,
      INIT_FC_PH          = 16'h9030,
      
      PCIE_CAP_REG        = 16'h9034,
      PCIE_CTRL_REG       = 16'h9038,
      PCIE_STS_REG        = 16'h903C, 
        //- Power monitor registers
      PWR_VCCINT_REG      = 16'h9040,      
      PWR_VCCAUX_REG      = 16'h9044,      
      PWR_VCC3_3_REG      = 16'h9048,      
      PWR_VADJ            = 16'h904C,      
      PWR_VCC2_5_REG      = 16'h9050,      
      PWR_VCC1_5_REG      = 16'h9054,      
      PWR_MGT_AVCC_REG    = 16'h9058,      
      PWR_MGT_AVTT_REG    = 16'h905C,      
      PWR_VCCAUX_IO_REG   = 16'h9060,      
      PWR_VCCBRAM_REG     = 16'h9064,      
      PWR_MGT_VCCAUX_REG  = 16'h9068,      
      PWR_RSVD_REG        = 16'h906C,      
      DIE_TEMP_REG        = 16'h9070,      
        //- PCIe-DMA Performance GEN/CHK - 0
      APP0_ENABLE_GEN     = 16'h9100,
      APP0_PKT_LEN        = 16'h9104,
      APP0_ENABLE_LB_CHK  = 16'h9108,
      APP0_CHK_STATUS     = 16'h910C,
      APP0_CNT_WRAP       = 16'h9110,
        //- PCIe-DMA Performance GEN/CHK - 1
      APP1_ENABLE_GEN     = 16'h9200,
      APP1_PKT_LEN        = 16'h9204,
      APP1_ENABLE_LB_CHK  = 16'h9208,
      APP1_CHK_STATUS     = 16'h920C,
      APP1_CNT_WRAP       = 16'h9210,
/*
        //- DDR3 Related Registers for 4-port memory controller
      MC0_START_ADRS        = 16'h9300,
      MC0_END_ADRS          = 16'h9304,
      MC0_WR_BURST          = 16'h9308,
      MC0_RD_BURST          = 16'h930C,
      MC1_START_ADRS        = 16'h9310,
      MC1_END_ADRS          = 16'h9314,
      MC1_WR_BURST          = 16'h9318,
      MC1_RD_BURST          = 16'h931C,
      MC2_START_ADRS        = 16'h9320,
      MC2_END_ADRS          = 16'h9324,
      MC2_WR_BURST          = 16'h9328,
      MC2_RD_BURST          = 16'h932C,
      MC3_START_ADRS        = 16'h9330,
      MC3_END_ADRS          = 16'h9334,
      MC3_WR_BURST          = 16'h9338,
      MC3_RD_BURST          = 16'h933C,
*/      
        //-XGEMAC Related registers
      MAC0_ADRS_FILTER    = 16'h9400,
      MAC0_ADRS_LOW       = 16'h9404,
      MAC0_ADRS_HIGH      = 16'h9408,
      MAC1_ADRS_FILTER    = 16'h940C,
      MAC1_ADRS_LOW       = 16'h9410,
      MAC1_ADRS_HIGH      = 16'h9414;


  wire [31:0]  pcie_cap_reg;
  wire [31:0]  pcie_sts_reg;
  reg          init_speed_change_req = 1'b0;
  reg          init_width_change_req = 1'b0; 
  reg [1:0]    wr_pcie_ctrl_reg = 2'b00;

  reg [47:0]  mac0_id = 'd0;
  reg [47:0]  mac1_id = 'd0;

  assign IP2Bus_Error = 1'b0;
  assign mac0_adrs  = mac0_id;
  assign mac1_adrs  = mac1_id;

  always @(posedge Clk)
    if (Bus2IP_CS & ~Bus2IP_RNW & (Bus2IP_Addr[15:0] == PCIE_CTRL_REG))
      wr_pcie_ctrl_reg  <= 2'b10;
    else  
      wr_pcie_ctrl_reg  <= wr_pcie_ctrl_reg >> 1;

  assign valid_width_change_req = (|wr_pcie_ctrl_reg) & init_width_change_req;

  assign valid_speed_change_req = (|wr_pcie_ctrl_reg) & init_speed_change_req;

  assign pcie_cap_reg = {
                          22'd0,
                          pl_initial_link_width,            //9:7
                          pl_link_partner_gen2_supported,   //-6
                          pl_link_gen2_capable,             //-5
                          pl_link_upcfg_capable,            //-4
                          pl_sel_lnk_width,                 //-3:2
                          pl_sel_lnk_rate,                  //-1
                          pcie_link_up                      //-0
                        };

  assign pcie_sts_reg = {
                          22'd0,
                          pl_sel_lnk_rate,        
                          speed_change_error,
                          speed_change_done,
                          3'd0,
                          pl_sel_lnk_width,  
                          width_change_error,
                          width_change_done
                        };


 /*
  * On the assertion of CS, RNW port is checked for read or a write
  * transaction. 
  * In case of a write transaction, the relevant register is written to and
  * WrAck generated.
  * In case of reads, the read data along with RdAck is generated.
  */
 
  always @(posedge Clk)
    if (Resetn == 1'b0)
    begin
      IP2Bus_Data   <= 32'd0;
      IP2Bus_WrAck  <= 1'b0;
      IP2Bus_RdAck  <= 1'b0;

      ch0_perf_mode_en  <= 1'b1;
      ch1_perf_mode_en  <= 1'b1;

      app0_en_gen   <= 1'b0;
      app0_en_chk   <= 1'b0;
      app0_en_lpbk  <= 1'b1;
      app0_pkt_size <= 16'd4096;
      app0_cnt_wrap <= 32'd511;
      app1_en_gen   <= 1'b0;
      app1_en_chk   <= 1'b0;
      app1_en_lpbk  <= 1'b1;
      app1_pkt_size <= 16'd4096;
      app1_cnt_wrap <= 32'd511;
      axi_ic_mig_shim_rst_n <= 1'b1;
      mac0_pm_enable  <= 1'b0;
      mac0_id         <= 48'hFFEEDDCCBBAA;
      mac1_pm_enable  <= 1'b0;
      mac1_id         <= 48'hFFEEDDCC00AA;

      target_link_speed <= 2'b00;
      target_link_width <= 3'b00;
      init_speed_change_req <= 1'b0;
      init_width_change_req <= 1'b0;
    end
    else
    begin
        //- Write transaction
      if (Bus2IP_CS & ~Bus2IP_RNW)
      begin
       if(Bus2IP_Addr[15:8]=='h90)
        case (Bus2IP_Addr[7:0])
          DESIGN_MODE[7:0]  : begin
                                ch0_perf_mode_en  <= Bus2IP_Data[0];
                                ch1_perf_mode_en  <= Bus2IP_Data[1];
                              end
          DESIGN_STATUS[7:0]: axi_ic_mig_shim_rst_n <= Bus2IP_Data[1];                    
          PCIE_CTRL_REG[7:0]: begin
                                target_link_speed <= Bus2IP_Data[1:0];
                                target_link_width <= Bus2IP_Data[4:2];
                                init_speed_change_req  <= Bus2IP_Data[30];
                                init_width_change_req  <= Bus2IP_Data[31];
                              end
        endcase
       else if(Bus2IP_Addr[15:8]=='h91)
        case (Bus2IP_Addr[7:0])
          APP0_ENABLE_GEN[7:0]: app0_en_gen  <= Bus2IP_Data[0];
          APP0_PKT_LEN[7:0]   : app0_pkt_size  <= Bus2IP_Data[15:0];
          APP0_CNT_WRAP[7:0]  : app0_cnt_wrap  <= Bus2IP_Data[31:0];
          APP0_ENABLE_LB_CHK[7:0]:begin
                                   app0_en_chk <= Bus2IP_Data[0];
                                   app0_en_lpbk<= Bus2IP_Data[1];
                                  end
        endcase
       else if(Bus2IP_Addr[15:8]=='h92)
        case (Bus2IP_Addr[7:0])
          APP1_ENABLE_GEN[7:0] : app1_en_gen  <= Bus2IP_Data[0];
          APP1_PKT_LEN[7:0]    : app1_pkt_size  <= Bus2IP_Data[15:0];
          APP1_CNT_WRAP[7:0]   : app1_cnt_wrap  <= Bus2IP_Data[31:0];
          APP1_ENABLE_LB_CHK[7:0]: begin
                                    app1_en_chk <= Bus2IP_Data[0];
                                    app1_en_lpbk<= Bus2IP_Data[1];
                                   end
        endcase
       else if(Bus2IP_Addr[15:8]=='h94)
        case (Bus2IP_Addr[7:0])

          MAC0_ADRS_FILTER[7:0]: mac0_pm_enable  <= Bus2IP_Data[0];
          MAC0_ADRS_LOW[7:0]   : mac0_id[31:0]   <= Bus2IP_Data;
          MAC0_ADRS_HIGH[7:0]  : mac0_id[47:32]  <= Bus2IP_Data[15:0];
          MAC1_ADRS_FILTER[7:0]: mac1_pm_enable  <= Bus2IP_Data[0];
          MAC1_ADRS_LOW[7:0]   : mac1_id[31:0]   <= Bus2IP_Data;
          MAC1_ADRS_HIGH[7:0]  : mac1_id[47:32]  <= Bus2IP_Data[15:0];
        endcase
        IP2Bus_WrAck  <= 1'b1;
        IP2Bus_Data   <= 32'd0;
        IP2Bus_RdAck  <= 1'b0;  
      end
        //- Read transaction
      else if (Bus2IP_CS & Bus2IP_RNW)
      begin
       if(Bus2IP_Addr[15:8]=='h90) 
        case (Bus2IP_Addr[7:0])
            /* [31:20] : Rsvd
             * [19:16] : Device, 0 -> A7, 1 -> K7, 2 -> V7, 
             * [15:8]  : DMA version (major, minor)
             * [7:0]   : Design version (major, minor)
             */
          DESIGN_VERSION[7:0]  : IP2Bus_Data <= {12'd0,4'h1,8'h10,8'h14};
          DESIGN_MODE[7:0]     : IP2Bus_Data <= {30'd0,ch1_perf_mode_en,
                                            ch0_perf_mode_en};
          DESIGN_STATUS[7:0]   : IP2Bus_Data <= {xphy1_status, xphy0_status,
               24'd0, ddr3_fifo_empty,axi_ic_mig_shim_rst_n, calib_done}; 
          TX_PCIE_BYTE_CNT[7:0] : IP2Bus_Data <= tx_pcie_byte_cnt;
          RX_PCIE_BYTE_CNT[7:0] : IP2Bus_Data <= rx_pcie_byte_cnt;
          TX_PCIE_PAYLOAD_CNT[7:0]: IP2Bus_Data <= tx_pcie_payload_cnt;
          RX_PCIE_PAYLOAD_CNT[7:0]: IP2Bus_Data <= rx_pcie_payload_cnt;
          INIT_FC_CPLD[7:0]  : IP2Bus_Data <= {20'd0,init_fc_cpld};
          INIT_FC_CPLH[7:0]  : IP2Bus_Data <= {24'd0,init_fc_cplh};
          INIT_FC_NPD[7:0]  : IP2Bus_Data <= {20'd0,init_fc_npd};
          INIT_FC_NPH[7:0]  : IP2Bus_Data <= {24'd0,init_fc_nph};
          INIT_FC_PD[7:0]  : IP2Bus_Data <= {20'd0,init_fc_pd};
          INIT_FC_PH[7:0]  : IP2Bus_Data <= {24'd0,init_fc_ph};
          
          PCIE_CAP_REG[7:0]    : IP2Bus_Data <= pcie_cap_reg;
          PCIE_STS_REG[7:0]    : IP2Bus_Data  <= pcie_sts_reg;

`ifdef KC705_PVTMON
          PWR_VCCINT_REG[7:0]    : IP2Bus_Data <= power_status_reg[31:0];
          PWR_VCCAUX_REG[7:0]    : IP2Bus_Data <= power_status_reg[63:32];
          PWR_VCC3_3_REG[7:0]    : IP2Bus_Data <= power_status_reg[95:64];
          PWR_VADJ[7:0]          : IP2Bus_Data <= power_status_reg[127:96];
          PWR_VCC2_5_REG[7:0]    : IP2Bus_Data <= power_status_reg[159:128];
          PWR_VCC1_5_REG[7:0]    : IP2Bus_Data <= power_status_reg[191:160];
          PWR_MGT_AVCC_REG[7:0]  : IP2Bus_Data <= power_status_reg[223:192];
          PWR_MGT_AVTT_REG[7:0]  : IP2Bus_Data <= power_status_reg[255:224];
          PWR_VCCAUX_IO_REG[7:0] : IP2Bus_Data <= power_status_reg[287:256];
          PWR_VCCBRAM_REG[7:0]   : IP2Bus_Data <= power_status_reg[319:288];
          PWR_MGT_VCCAUX_REG[7:0]: IP2Bus_Data <= power_status_reg[351:320];
          PWR_RSVD_REG[7:0]      : IP2Bus_Data <= power_status_reg[383:352];
          DIE_TEMP_REG[7:0]      : IP2Bus_Data <= power_status_reg[415:384];
`endif          
          
        endcase
       else if(Bus2IP_Addr[15:8]=='h91)
        case (Bus2IP_Addr[7:0])
          APP0_ENABLE_GEN[7:0]     : IP2Bus_Data <= {31'd0,app0_en_gen};
          APP0_PKT_LEN[7:0]        : IP2Bus_Data <= {16'd0,app0_pkt_size};
          APP0_ENABLE_LB_CHK[7:0]  : IP2Bus_Data <= {30'd0,app0_en_lpbk,app0_en_chk};
          APP0_CHK_STATUS[7:0]     : IP2Bus_Data <= {31'd0,app0_chk_status}; 
          APP0_CNT_WRAP[7:0]       : IP2Bus_Data <= app0_cnt_wrap; 
        endcase
       else if(Bus2IP_Addr[15:8]=='h92)
        case (Bus2IP_Addr[7:0])
          APP1_ENABLE_GEN[7:0]     : IP2Bus_Data <= {31'd0,app1_en_gen};
          APP1_PKT_LEN[7:0]        : IP2Bus_Data <= {16'd0,app1_pkt_size};
          APP1_ENABLE_LB_CHK[7:0]  : IP2Bus_Data <= {30'd0,app1_en_lpbk,app1_en_chk};
          APP1_CHK_STATUS[7:0]     : IP2Bus_Data <= {31'd0,app1_chk_status}; 
          APP1_CNT_WRAP[7:0]       : IP2Bus_Data <= app1_cnt_wrap; 
        endcase
       else if(Bus2IP_Addr[15:8]=='h94)
        case (Bus2IP_Addr[7:0])

          MAC0_ADRS_FILTER[7:0]  : IP2Bus_Data <= {mac0_rx_fifo_overflow, 30'd0,mac0_pm_enable};
          MAC0_ADRS_LOW[7:0]     : IP2Bus_Data <= mac0_adrs[31:0];
          MAC0_ADRS_HIGH[7:0]    : IP2Bus_Data <= {16'd0,mac0_adrs[47:32]};
          MAC1_ADRS_FILTER[7:0]  : IP2Bus_Data <= {mac1_rx_fifo_overflow, 30'd0,mac1_pm_enable};
          MAC1_ADRS_LOW[7:0]     : IP2Bus_Data <= mac1_adrs[31:0];
          MAC1_ADRS_HIGH[7:0]    : IP2Bus_Data <= {16'd0,mac1_adrs[47:32]};
        endcase
        IP2Bus_RdAck  <= 1'b1;
        IP2Bus_WrAck  <= 1'b0;
      end
      else
      begin
        IP2Bus_Data   <= 32'd0;
        IP2Bus_WrAck  <= 1'b0;
        IP2Bus_RdAck  <= 1'b0;
      end
    end
  
endmodule
