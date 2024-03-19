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

module user_registers_slave #(
    parameter         CORE_DATA_WIDTH     = 128,
    parameter         CORE_BE_WIDTH       = 16,
    parameter         CORE_REMAIN_WIDTH   = 4,
    parameter         C_S_AXI_ADDR_WIDTH  = 32,
    parameter         C_S_AXI_DATA_WIDTH  = 32,
    parameter [31:0]  C_BASE_ADDRESS      = 32'h0000_0000,
    parameter [31:0]  C_HIGH_ADDRESS      = 32'h0000_FFFF,
    parameter         C_TOTAL_NUM_CE      = 1,
    parameter         C_NUM_ADDRESS_RANGES  = 1,
    parameter         C_S_AXI_MIN_SIZE    = 32'h0000_FFFF,
    parameter         C_DPHASE_TIMEOUT    = 32,
    parameter         NUM_POWER_REG       = 13,
    parameter         C_FAMILY            = "kintex7"
  ) (
    input                               s_axi_clk,
    input                               s_axi_areset_n,
    input [C_S_AXI_ADDR_WIDTH-1:0]      s_axi_awaddr,
    input                               s_axi_awvalid,
    output                              s_axi_awready,
    input [C_S_AXI_DATA_WIDTH-1:0]      s_axi_wdata,
    input [(C_S_AXI_DATA_WIDTH/8)-1:0]  s_axi_wstrb,
    input                               s_axi_wvalid,
    output                              s_axi_wready,
    output [1:0]                        s_axi_bresp,
    output                              s_axi_bvalid,
    input                               s_axi_bready,
    input [C_S_AXI_ADDR_WIDTH-1:0]      s_axi_araddr,
    input                               s_axi_arvalid,
    output                              s_axi_arready,
    output [C_S_AXI_DATA_WIDTH-1:0]     s_axi_rdata,
    output [1:0]                        s_axi_rresp,
    output                              s_axi_rvalid,
    input                               s_axi_rready,

    input [31:0]                        tx_pcie_byte_cnt,
    input [31:0]                        rx_pcie_byte_cnt,
    input [31:0]                        tx_pcie_payload_cnt,
    input [31:0]                        rx_pcie_payload_cnt,

    input [11:0]                        init_fc_cpld,
    input [7:0]                         init_fc_cplh,
    input [11:0]                        init_fc_npd,
    input [7:0]                         init_fc_nph,
    input [11:0]                        init_fc_pd,
    input [7:0]                         init_fc_ph,

    input   [5:0]                       pl_ltssm_state,
    input   [2:0]                       pl_initial_link_width,
    input                               pl_link_upcfg_capable,
    input                               pl_link_gen2_capable,
    input                               pl_link_partner_gen2_supported,
    input   [2:0]                       cfg_pcie_link_state,
    input   [1:0]                       pl_lane_reversal_mode,
//    input                               hw_auton_width_disable,

    
    input                               pl_sel_lnk_rate,
    input   [1:0]                       pl_sel_lnk_width,

    output                              pl_directed_link_speed,
    output  [1:0]                       pl_directed_link_width,
    output  [1:0]                       pl_directed_link_change,
    output                              pl_directed_link_auton,

    output                               ch0_perf_mode_en,
    output                               ch1_perf_mode_en,

    output                              app0_en_gen,
    output                              app0_en_lpbk,
    output                              app0_en_chk,
    output [15:0]                       app0_pkt_len,
    output [31:0]                       app0_cnt_wrap,
    input                               app0_chk_status,  
    output                              app1_en_gen,
    output                              app1_en_lpbk,
    output                              app1_en_chk,
    output [15:0]                       app1_pkt_len,
    output [31:0]                       app1_cnt_wrap,
    input                               app1_chk_status,  
   
    input  [3:0]                        ddr3_fifo_empty,
    output                              axi_ic_mig_shim_rst_n,
    input                               calib_done,
    input                               xphy0_status, 
    input                               xphy1_status, 
    output                              mac0_pm_enable,
    output [47:0]                       mac0_adrs,
    input                               mac0_rx_fifo_overflow,
    output                              mac1_pm_enable,
    output [47:0]                       mac1_adrs,
    input                               mac1_rx_fifo_overflow,
        //- Power monitoring for KC705
    inout                               pmbus_clk,
    inout                               pmbus_data,
    output                              pmbus_control,
    input                               pmbus_alert,
    input                               clk50,
    output reg [11:0]                   device_temp,
 
    input                               pcie_link_up
    
  
  );

  wire                                  Bus2IP_Clk;
  wire                                  Bus2IP_Resetn;
  wire [(C_S_AXI_ADDR_WIDTH-1):0]       Bus2IP_Addr;
  wire                                  Bus2IP_RNW;
  wire [(C_S_AXI_DATA_WIDTH/8)-1:0]     Bus2IP_BE;
  wire [C_NUM_ADDRESS_RANGES-1:0]       Bus2IP_CS;
  wire [C_TOTAL_NUM_CE-1:0]             Bus2IP_RdCE;
  wire [C_TOTAL_NUM_CE-1:0]             Bus2IP_WrCE;
  wire [C_S_AXI_DATA_WIDTH-1:0]         Bus2IP_Data;
  wire [C_S_AXI_DATA_WIDTH-1:0]         IP2Bus_Data;
  wire                                  IP2Bus_WrAck;
  wire                                  IP2Bus_RdAck;
  wire                                  IP2Bus_Error;

  wire    [2:0]                         target_link_width;
  wire                                  valid_width_change_req;
  wire                                  width_change_done;
  wire                                  width_change_error;
  wire    [1:0]                         target_link_speed;
  wire                                  valid_speed_change_req;
  wire                                  speed_change_done;
  wire                                  speed_change_error;


  wire                                  count_expired;

  reg                                   ren_bram_r; 
  reg     [9:0]                         reg_map_addr_r;       
  reg     [(NUM_POWER_REG * 32) - 1 :0] power_status_reg = 'd0;
  reg     [15:0]                        timeout_count;
  reg                                   rd_en;
  reg     [9:0]                         rd_address;
  wire    [31:0]                        rd_data;
  reg                                   rst_r;
  reg                                   rst_int;
  parameter  

               ADDR_DIE_TEMP  = 10'h002,
               ADDR_52_RAIL1  = 10'h012,
               ADDR_52_RAIL2  = 10'h016,
               ADDR_52_RAIL3  = 10'h01A,
               ADDR_52_RAIL4  = 10'h01E,
               ADDR_53_RAIL1  = 10'h022,
               ADDR_53_RAIL2  = 10'h026,
               ADDR_53_RAIL3  = 10'h02A,
               ADDR_53_RAIL4  = 10'h02E,
               ADDR_54_RAIL1  = 10'h032,
               ADDR_54_RAIL2  = 10'h036,
               ADDR_54_RAIL3  = 10'h03A,
               ADDR_54_RAIL4  = 10'h03E;

  parameter 
               IDLE           = 0,
               PREP_READ      = 1, 
               READ_52_RAIL1  = 2, 
               READ_52_RAIL2  = 3, 
               READ_52_RAIL3  = 4, 
               READ_52_RAIL4  = 5, 
               READ_53_RAIL1  = 6, 
               READ_53_RAIL2  = 7, 
               READ_53_RAIL3  = 8, 
               READ_53_RAIL4  = 9,
               READ_54_RAIL1  = 10, 
               READ_54_RAIL2  = 11, 
               READ_54_RAIL3  = 12, 
               READ_54_RAIL4  = 13,
               READ_DIE_TEMP  = 14; 
 
  reg [3:0]   fsm_state = IDLE;
  
  parameter    TERMINAL_COUNT = 'h1fff;


  /*
   * Timeout counter counts 50 MHz clock cycles until a terminal count is reached
   * The counter is intended to to be used by the BRAM address assertion logic
   */
  always @(posedge clk50)
  begin
      if(rst_int)
         timeout_count <= 0;
      else if(timeout_count == TERMINAL_COUNT) 
         timeout_count <= 0;
      else
         timeout_count <= timeout_count+1;
  end

  assign  count_expired = (timeout_count==TERMINAL_COUNT)?1'b1:1'b0;

  //Synchronous reset generation circuit for the power control FSM
  always @(negedge s_axi_areset_n or posedge clk50)
  begin
    if(!s_axi_areset_n)
    begin
      rst_r <= 1'b1;
      rst_int <= 1'b1;
    end
    else
    begin
      rst_r <= 1'b0;
      rst_int <= rst_r;
    end
  end
  
  //The power control FSM reads the BRAM locations that are populated by
  //by PicoBlaze once it reads out different power rails using PMBus.
  //BRAM acts as a bridge between PicoBlaze and user logic
  //The FSM waits until a free-running counter expires and asserts read enable
  //to BRAM along with the read addresses
  always @(posedge clk50)
  begin
        if(rst_int)
        begin
            fsm_state <= IDLE;
            power_status_reg <= 'h00000000;
        end    
        else
        begin
           case(fsm_state)
             IDLE : 
              begin
                   rd_en <= 1'b0;
                   rd_address <= 'h000;   
                   power_status_reg[415:384] <= rd_data;

                   if(count_expired)
                      fsm_state <= PREP_READ;
                   else
                      fsm_state <= IDLE;
              end        
             PREP_READ:
              begin
                   rd_en <= 1'b1;
                   rd_address <= ADDR_52_RAIL1;   
                   fsm_state <= READ_52_RAIL1;
              end      
             READ_52_RAIL1:
              begin
                   rd_en <= 1'b1;
                   rd_address <= ADDR_52_RAIL2;   
                   fsm_state <= READ_52_RAIL2;
              end      
             READ_52_RAIL2:
              begin
                   rd_en <= 1'b1;
                   rd_address <= ADDR_52_RAIL3;   
                   power_status_reg[31:0] <= rd_data;
                   fsm_state <= READ_52_RAIL3;
              end      
             READ_52_RAIL3:
              begin
                   rd_en <= 1'b1;
                   rd_address <= ADDR_52_RAIL4;   
                   power_status_reg[63:32] <= rd_data;
                   fsm_state <= READ_52_RAIL4;
              end      
             READ_52_RAIL4:
              begin
                   rd_en <= 1'b1;
                   rd_address <= ADDR_53_RAIL1;   
                   power_status_reg[95:64] <= rd_data;
                   fsm_state <= READ_53_RAIL1;
              end      
             READ_53_RAIL1:
              begin
                   rd_en <= 1'b1;
                   rd_address <= ADDR_53_RAIL2;   
                   power_status_reg[127:96] <= rd_data;
                   fsm_state <= READ_53_RAIL2;
              end      
             READ_53_RAIL2:
              begin
                   rd_en <= 1'b1;
                   rd_address <= ADDR_53_RAIL3;   
                   power_status_reg[159:128] <= rd_data;
                   fsm_state <= READ_53_RAIL3;
              end      
             READ_53_RAIL3:
              begin
                   rd_en <= 1'b1;
                   rd_address <= ADDR_53_RAIL4;   
                   power_status_reg[191:160] <= rd_data;
                   fsm_state <= READ_53_RAIL4;
              end      
             READ_53_RAIL4:
              begin
                   rd_en <= 1'b1;
                   rd_address <= ADDR_54_RAIL1;   
                   power_status_reg[223:192] <= rd_data;
                   fsm_state <= READ_54_RAIL1;
              end    
             READ_54_RAIL1:
              begin
                   rd_en <= 1'b1;
                   rd_address <= ADDR_54_RAIL2;   
                   power_status_reg[255:224] <= rd_data;
                   fsm_state <= READ_54_RAIL2;
              end      
             READ_54_RAIL2:
              begin
                   rd_en <= 1'b1;
                   rd_address <= ADDR_54_RAIL3;   
                   power_status_reg[287:256] <= rd_data;
                   fsm_state <= READ_54_RAIL3;
              end      
             READ_54_RAIL3:
              begin
                   rd_en <= 1'b1;
                   rd_address <= ADDR_54_RAIL4;   
                   power_status_reg[319:288] <= rd_data;
                   fsm_state <= READ_54_RAIL4;
              end      
             READ_54_RAIL4:
              begin
                   rd_en <= 1'b1;
                   rd_address <= ADDR_DIE_TEMP;   
                   power_status_reg[351:320] <= rd_data;
                   fsm_state <= READ_DIE_TEMP;
              end  
             READ_DIE_TEMP:
              begin
                   rd_en <= 1'b0;
                   rd_address <= 'h000;   
                   power_status_reg[383:352] <= rd_data;
                   fsm_state <= IDLE;
              end    
             default:          
              begin
                   rd_en <= 1'b0;
                   rd_address <= 'h000;   
                   fsm_state <= IDLE;
              end      
          endcase
       end
  end

  //-Convert the temperature in deg celcius to 12-bit ADC code
  //Pico uses 10-bit MSB only
  always @(posedge clk50)
  begin
    device_temp[11:2]  <= power_status_reg[415:384];    
    device_temp[1:0]   <= 2'b00;
  end  


  /*
   *    Instantiation of AXI Lite IPIF Slave which converts the AXI Lite
   *    interface to IPIF
   */
    
  axi_lite_ipif #(
    .C_S_AXI_DATA_WIDTH     (C_S_AXI_DATA_WIDTH ),
    .C_S_AXI_ADDR_WIDTH     (C_S_AXI_ADDR_WIDTH ),
    .C_S_AXI_MIN_SIZE       (C_S_AXI_MIN_SIZE   ),
    .C_DPHASE_TIMEOUT       (C_DPHASE_TIMEOUT   ),
    .C_NUM_ADDRESS_RANGES   (C_NUM_ADDRESS_RANGES),
    .C_TOTAL_NUM_CE         (C_TOTAL_NUM_CE     ),
    .C_ARD_ADDR_RANGE_ARRAY ({C_BASE_ADDRESS,C_HIGH_ADDRESS}),
    .C_ARD_NUM_CE_ARRAY     ({8'd1}),
    .C_FAMILY               (C_FAMILY           )
  ) axi_lite_ipif_inst (
    .S_AXI_ACLK             (s_axi_clk          ),
    .S_AXI_ARESETN          (s_axi_areset_n     ),
    .S_AXI_AWADDR           (s_axi_awaddr       ),
    .S_AXI_AWVALID          (s_axi_awvalid      ),
    .S_AXI_AWREADY          (s_axi_awready      ),
    .S_AXI_WDATA            (s_axi_wdata        ),
    .S_AXI_WSTRB            (s_axi_wstrb        ),
    .S_AXI_WVALID           (s_axi_wvalid       ),
    .S_AXI_WREADY           (s_axi_wready       ),
    .S_AXI_BRESP            (s_axi_bresp        ),
    .S_AXI_BVALID           (s_axi_bvalid       ),
    .S_AXI_BREADY           (s_axi_bready       ),
    .S_AXI_ARADDR           (s_axi_araddr       ),
    .S_AXI_ARVALID          (s_axi_arvalid      ),
    .S_AXI_ARREADY          (s_axi_arready      ),
    .S_AXI_RDATA            (s_axi_rdata        ),
    .S_AXI_RRESP            (s_axi_rresp        ),
    .S_AXI_RVALID           (s_axi_rvalid       ),
    .S_AXI_RREADY           (s_axi_rready       ),
    .Bus2IP_Clk             (Bus2IP_Clk         ),  
    .Bus2IP_Resetn          (Bus2IP_Resetn      ),  
    .Bus2IP_Addr            (Bus2IP_Addr        ),  
    .Bus2IP_RNW             (Bus2IP_RNW         ),  
    .Bus2IP_BE              (Bus2IP_BE          ),  
    .Bus2IP_CS              (Bus2IP_CS          ),  
    .Bus2IP_RdCE            (Bus2IP_RdCE        ),  
    .Bus2IP_WrCE            (Bus2IP_WrCE        ),  
    .Bus2IP_Data            (Bus2IP_Data        ),  
    .IP2Bus_Data            (IP2Bus_Data        ),  
    .IP2Bus_WrAck           (IP2Bus_WrAck       ),  
    .IP2Bus_RdAck           (IP2Bus_RdAck       ),  
    .IP2Bus_Error           (IP2Bus_Error       )   
  );

    /*
     * Register Logic tied to the IPIC interface
     */

  registers # (
     .NUM_POWER_REG(NUM_POWER_REG)  
  ) registers_inst (
    .Bus2IP_Addr            (Bus2IP_Addr        ),
    .Bus2IP_RNW             (Bus2IP_RNW         ),
    .Bus2IP_CS              (Bus2IP_CS          ),
    .Bus2IP_Data            (Bus2IP_Data        ),
    .IP2Bus_Data            (IP2Bus_Data        ),  
    .IP2Bus_WrAck           (IP2Bus_WrAck       ),  
    .IP2Bus_RdAck           (IP2Bus_RdAck       ),  
    .IP2Bus_Error           (IP2Bus_Error       ),

    .tx_pcie_byte_cnt       (tx_pcie_byte_cnt   ),
    .rx_pcie_byte_cnt       (rx_pcie_byte_cnt   ),
    .tx_pcie_payload_cnt    (tx_pcie_payload_cnt),
    .rx_pcie_payload_cnt    (rx_pcie_payload_cnt),

    .init_fc_cpld           (init_fc_cpld       ),
    .init_fc_cplh           (init_fc_cplh       ),
    .init_fc_npd            (init_fc_npd        ),
    .init_fc_nph            (init_fc_nph        ),
    .init_fc_pd             (init_fc_pd         ),
    .init_fc_ph             (init_fc_ph         ),  

    .ch0_perf_mode_en       (ch0_perf_mode_en   ),
    .ch1_perf_mode_en       (ch1_perf_mode_en   ),

    .app0_en_lpbk           (app0_en_lpbk       ),
    .app0_en_gen            (app0_en_gen        ),
    .app0_en_chk            (app0_en_chk        ),
    .app0_pkt_size          (app0_pkt_len       ),
    .app0_cnt_wrap          (app0_cnt_wrap      ),
    .app0_chk_status        (app0_chk_status    ),
    .app1_en_lpbk           (app1_en_lpbk       ),
    .app1_en_gen            (app1_en_gen        ),
    .app1_en_chk            (app1_en_chk        ),
    .app1_pkt_size          (app1_pkt_len       ),
    .app1_cnt_wrap          (app1_cnt_wrap      ),
    .app1_chk_status        (app1_chk_status    ),
    
    .ddr3_fifo_empty        (ddr3_fifo_empty    ),
    .axi_ic_mig_shim_rst_n  (axi_ic_mig_shim_rst_n),
    .calib_done             (calib_done         ),

    .xphy0_status           (xphy0_status       ),
    .xphy1_status           (xphy1_status       ),
    .mac0_pm_enable         (mac0_pm_enable     ),
    .mac0_adrs              (mac0_adrs          ),  
    .mac0_rx_fifo_overflow  (mac0_rx_fifo_overflow),
    .mac1_pm_enable         (mac1_pm_enable     ),
    .mac1_adrs              (mac1_adrs          ),  
    .mac1_rx_fifo_overflow  (mac1_rx_fifo_overflow),

    .pcie_link_up           (pcie_link_up       ),
    .pl_sel_lnk_width       (pl_sel_lnk_width   ),
    .pl_sel_lnk_rate        (pl_sel_lnk_rate    ),
    .pl_link_upcfg_capable  (pl_link_upcfg_capable),
    .pl_link_gen2_capable   (pl_link_gen2_capable),
    .pl_link_partner_gen2_supported(pl_link_partner_gen2_supported),
    .pl_initial_link_width  (pl_initial_link_width),
    .width_change_done      (width_change_done    ),
    .width_change_error     (width_change_error   ),
    .speed_change_done      (speed_change_done    ),
    .speed_change_error     (speed_change_error   ),
    .target_link_width      (target_link_width    ),
    .valid_width_change_req (valid_width_change_req),
    .target_link_speed      (target_link_speed    ),
    .valid_speed_change_req (valid_speed_change_req),

    .power_status_reg       (power_status_reg      ),

    .Clk                    (Bus2IP_Clk         ),
    .Resetn                 (Bus2IP_Resetn      )
  );


  pcie_pl_control pcie_pl_ctrl_inst (
    .pl_ltssm_state         (pl_ltssm_state     ),
    .pl_initial_link_width  (pl_initial_link_width),
    .pl_link_upcfg_capable  (pl_link_upcfg_capable),
    .pl_link_gen2_capable   (pl_link_gen2_capable),
    .pl_link_partner_gen2_supported (pl_link_partner_gen2_supported),
    .cfg_pcie_link_state    (cfg_pcie_link_state  ),
    .pl_lane_reversal_mode  (pl_lane_reversal_mode),
//    .hw_auton_width_disable (hw_auton_width_disable),
    .target_link_width      (target_link_width[1:0]    ),
    .valid_width_change_req (valid_width_change_req),
    .width_change_done      (width_change_done    ),
    .width_change_error     (width_change_error   ),
    .target_link_speed      (target_link_speed[0]    ),
    .valid_speed_change_req (valid_speed_change_req ),
    .speed_change_done      (speed_change_done    ),
    .speed_change_error     (speed_change_error   ),
    .pl_sel_lnk_rate        (pl_sel_lnk_rate      ),
    .pl_sel_lnk_width       (pl_sel_lnk_width     ),
    .pl_directed_link_speed (pl_directed_link_speed ),
    .pl_directed_link_width (pl_directed_link_width ),
    .pl_directed_link_change(pl_directed_link_change),
    .pl_directed_link_auton (pl_directed_link_auton ),

    .user_reset             (~s_axi_areset_n),
    .user_clk               (s_axi_clk             )
  );



  kc705_power_test kc705_pvt_monitor (
    .pmbus_clk      (pmbus_clk),
    .pmbus_data     (pmbus_data),
    .pmbus_control  (pmbus_control),
    .pmbus_alert    (pmbus_alert),
    .rd_en          (rd_en),
    .rd_address     (rd_address),
    .rd_data        (rd_data),
    .cpu_rst        (~s_axi_areset_n),
    .clk50          (clk50)
    
  );



endmodule
