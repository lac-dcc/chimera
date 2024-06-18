// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : power_ctrl.v
//Title       : Power Control Module
//Created     : 1999
//Description : Top level of power controller
//Notes       : 
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

module power_ctrl (


    // Clocks & Reset
    pclk,
    nprst,
    // APB programming interface
    paddr,
    psel,
    penable,
    pwrite,
    pwdata,
    prdata,
    // mac i/f,
    macb3_wakeup,
    macb2_wakeup,
    macb1_wakeup,
    macb0_wakeup,
    // Scan 
    scan_in,
    scan_en,
    scan_mode,
    scan_out,
    // Module control outputs
    int_source_h,
    // SMC
    rstn_non_srpg_smc,
    gate_clk_smc,
    isolate_smc,
    save_edge_smc,
    restore_edge_smc,
    pwr1_on_smc,
    pwr2_on_smc,
    pwr1_off_smc,
    pwr2_off_smc,
    // URT
    rstn_non_srpg_urt,
    gate_clk_urt,
    isolate_urt,
    save_edge_urt,
    restore_edge_urt,
    pwr1_on_urt,
    pwr2_on_urt,
    pwr1_off_urt,      
    pwr2_off_urt,
    // ETH0
    rstn_non_srpg_macb0,
    gate_clk_macb0,
    isolate_macb0,
    save_edge_macb0,
    restore_edge_macb0,
    pwr1_on_macb0,
    pwr2_on_macb0,
    pwr1_off_macb0,      
    pwr2_off_macb0,
    // ETH1
    rstn_non_srpg_macb1,
    gate_clk_macb1,
    isolate_macb1,
    save_edge_macb1,
    restore_edge_macb1,
    pwr1_on_macb1,
    pwr2_on_macb1,
    pwr1_off_macb1,      
    pwr2_off_macb1,
    // ETH2
    rstn_non_srpg_macb2,
    gate_clk_macb2,
    isolate_macb2,
    save_edge_macb2,
    restore_edge_macb2,
    pwr1_on_macb2,
    pwr2_on_macb2,
    pwr1_off_macb2,      
    pwr2_off_macb2,
    // ETH3
    rstn_non_srpg_macb3,
    gate_clk_macb3,
    isolate_macb3,
    save_edge_macb3,
    restore_edge_macb3,
    pwr1_on_macb3,
    pwr2_on_macb3,
    pwr1_off_macb3,      
    pwr2_off_macb3,
    // DMA
    rstn_non_srpg_dma,
    gate_clk_dma,
    isolate_dma,
    save_edge_dma,
    restore_edge_dma,
    pwr1_on_dma,
    pwr2_on_dma,
    pwr1_off_dma,      
    pwr2_off_dma,
    // CPU
    rstn_non_srpg_cpu,
    gate_clk_cpu,
    isolate_cpu,
    save_edge_cpu,
    restore_edge_cpu,
    pwr1_on_cpu,
    pwr2_on_cpu,
    pwr1_off_cpu,      
    pwr2_off_cpu,
    // ALUT
    rstn_non_srpg_alut,
    gate_clk_alut,
    isolate_alut,
    save_edge_alut,
    restore_edge_alut,
    pwr1_on_alut,
    pwr2_on_alut,
    pwr1_off_alut,      
    pwr2_off_alut,
    // MEM
    rstn_non_srpg_mem,
    gate_clk_mem,
    isolate_mem,
    save_edge_mem,
    restore_edge_mem,
    pwr1_on_mem,
    pwr2_on_mem,
    pwr1_off_mem,      
    pwr2_off_mem,
    // core dvfs transitions
    core06v,
    core08v,
    core10v,
    core12v,
    pcm_macb_wakeup_int,
    // mte signals
    mte_smc_start,
    mte_uart_start,
    mte_smc_uart_start,  
    mte_pm_smc_to_default_start, 
    mte_pm_uart_to_default_start,
    mte_pm_smc_uart_to_default_start

  );

  parameter STATE_IDLE_12V = 4'b0001;
  parameter STATE_06V = 4'b0010;
  parameter STATE_08V = 4'b0100;
  parameter STATE_10V = 4'b1000;

    // Clocks & Reset
    input pclk;
    input nprst;
    // APB programming interface
    input [31:0] paddr;
    input psel  ;
    input penable;
    input pwrite ;
    input [31:0] pwdata;
    output [31:0] prdata;
    // mac
    input macb3_wakeup;
    input macb2_wakeup;
    input macb1_wakeup;
    input macb0_wakeup;
    // Scan 
    input scan_in;
    input scan_en;
    input scan_mode;
    output scan_out;
    // Module control outputs
    input int_source_h;
    // SMC
    output rstn_non_srpg_smc ;
    output gate_clk_smc   ;
    output isolate_smc   ;
    output save_edge_smc   ;
    output restore_edge_smc   ;
    output pwr1_on_smc   ;
    output pwr2_on_smc   ;
    output pwr1_off_smc  ;
    output pwr2_off_smc  ;
    // URT
    output rstn_non_srpg_urt ;
    output gate_clk_urt      ;
    output isolate_urt       ;
    output save_edge_urt   ;
    output restore_edge_urt   ;
    output pwr1_on_urt       ;
    output pwr2_on_urt       ;
    output pwr1_off_urt      ;
    output pwr2_off_urt      ;
    // ETH0
    output rstn_non_srpg_macb0 ;
    output gate_clk_macb0      ;
    output isolate_macb0       ;
    output save_edge_macb0   ;
    output restore_edge_macb0   ;
    output pwr1_on_macb0       ;
    output pwr2_on_macb0       ;
    output pwr1_off_macb0      ;
    output pwr2_off_macb0      ;
    // ETH1
    output rstn_non_srpg_macb1 ;
    output gate_clk_macb1      ;
    output isolate_macb1       ;
    output save_edge_macb1   ;
    output restore_edge_macb1   ;
    output pwr1_on_macb1       ;
    output pwr2_on_macb1       ;
    output pwr1_off_macb1      ;
    output pwr2_off_macb1      ;
    // ETH2
    output rstn_non_srpg_macb2 ;
    output gate_clk_macb2      ;
    output isolate_macb2       ;
    output save_edge_macb2   ;
    output restore_edge_macb2   ;
    output pwr1_on_macb2       ;
    output pwr2_on_macb2       ;
    output pwr1_off_macb2      ;
    output pwr2_off_macb2      ;
    // ETH3
    output rstn_non_srpg_macb3 ;
    output gate_clk_macb3      ;
    output isolate_macb3       ;
    output save_edge_macb3   ;
    output restore_edge_macb3   ;
    output pwr1_on_macb3       ;
    output pwr2_on_macb3       ;
    output pwr1_off_macb3      ;
    output pwr2_off_macb3      ;
    // DMA
    output rstn_non_srpg_dma ;
    output gate_clk_dma      ;
    output isolate_dma       ;
    output save_edge_dma   ;
    output restore_edge_dma   ;
    output pwr1_on_dma       ;
    output pwr2_on_dma       ;
    output pwr1_off_dma      ;
    output pwr2_off_dma      ;
    // CPU
    output rstn_non_srpg_cpu ;
    output gate_clk_cpu      ;
    output isolate_cpu       ;
    output save_edge_cpu   ;
    output restore_edge_cpu   ;
    output pwr1_on_cpu       ;
    output pwr2_on_cpu       ;
    output pwr1_off_cpu      ;
    output pwr2_off_cpu      ;
    // ALUT
    output rstn_non_srpg_alut ;
    output gate_clk_alut      ;
    output isolate_alut       ;
    output save_edge_alut   ;
    output restore_edge_alut   ;
    output pwr1_on_alut       ;
    output pwr2_on_alut       ;
    output pwr1_off_alut      ;
    output pwr2_off_alut      ;
    // MEM
    output rstn_non_srpg_mem ;
    output gate_clk_mem      ;
    output isolate_mem       ;
    output save_edge_mem   ;
    output restore_edge_mem   ;
    output pwr1_on_mem       ;
    output pwr2_on_mem       ;
    output pwr1_off_mem      ;
    output pwr2_off_mem      ;


   // core transitions o/p
    output core06v;
    output core08v;
    output core10v;
    output core12v;
    output pcm_macb_wakeup_int ;
    //mode mte  signals
    output mte_smc_start;
    output mte_uart_start;
    output mte_smc_uart_start;  
    output mte_pm_smc_to_default_start; 
    output mte_pm_uart_to_default_start;
    output mte_pm_smc_uart_to_default_start;

    reg mte_smc_start;
    reg mte_uart_start;
    reg mte_smc_uart_start;  
    reg mte_pm_smc_to_default_start; 
    reg mte_pm_uart_to_default_start;
    reg mte_pm_smc_uart_to_default_start;

    reg [31:0] prdata;

  wire valid_reg_write  ;
  wire valid_reg_read   ;
  wire L1_ctrl_access   ;
  wire L1_status_access ;
  wire pcm_int_mask_access;
  wire pcm_int_status_access;
  wire standby_mem0      ;
  wire standby_mem1      ;
  wire standby_mem2      ;
  wire standby_mem3      ;
  wire pwr1_off_mem0;
  wire pwr1_off_mem1;
  wire pwr1_off_mem2;
  wire pwr1_off_mem3;
  
  // Control signals
  wire set_status_smc   ;
  wire clr_status_smc   ;
  wire set_status_urt   ;
  wire clr_status_urt   ;
  wire set_status_macb0   ;
  wire clr_status_macb0   ;
  wire set_status_macb1   ;
  wire clr_status_macb1   ;
  wire set_status_macb2   ;
  wire clr_status_macb2   ;
  wire set_status_macb3   ;
  wire clr_status_macb3   ;
  wire set_status_dma   ;
  wire clr_status_dma   ;
  wire set_status_cpu   ;
  wire clr_status_cpu   ;
  wire set_status_alut   ;
  wire clr_status_alut   ;
  wire set_status_mem   ;
  wire clr_status_mem   ;


  // Status and Control registers
  reg [31:0]  L1_status_reg;
  reg  [31:0] L1_ctrl_reg  ;
  reg  [31:0] L1_ctrl_domain  ;
  reg L1_ctrl_cpu_off_reg;
  reg [31:0]  pcm_mask_reg;
  reg [31:0]  pcm_status_reg;

  // Signals gated in scan_mode
  //SMC
  wire  rstn_non_srpg_smc_int;
  wire  gate_clk_smc_int    ;     
  wire  isolate_smc_int    ;       
  wire save_edge_smc_int;
  wire restore_edge_smc_int;
  wire  pwr1_on_smc_int    ;      
  wire  pwr2_on_smc_int    ;      


  //URT
  wire   rstn_non_srpg_urt_int;
  wire   gate_clk_urt_int     ;     
  wire   isolate_urt_int      ;       
  wire save_edge_urt_int;
  wire restore_edge_urt_int;
  wire   pwr1_on_urt_int      ;      
  wire   pwr2_on_urt_int      ;      

  // ETH0
  wire   rstn_non_srpg_macb0_int;
  wire   gate_clk_macb0_int     ;     
  wire   isolate_macb0_int      ;       
  wire save_edge_macb0_int;
  wire restore_edge_macb0_int;
  wire   pwr1_on_macb0_int      ;      
  wire   pwr2_on_macb0_int      ;      
  // ETH1
  wire   rstn_non_srpg_macb1_int;
  wire   gate_clk_macb1_int     ;     
  wire   isolate_macb1_int      ;       
  wire save_edge_macb1_int;
  wire restore_edge_macb1_int;
  wire   pwr1_on_macb1_int      ;      
  wire   pwr2_on_macb1_int      ;      
  // ETH2
  wire   rstn_non_srpg_macb2_int;
  wire   gate_clk_macb2_int     ;     
  wire   isolate_macb2_int      ;       
  wire save_edge_macb2_int;
  wire restore_edge_macb2_int;
  wire   pwr1_on_macb2_int      ;      
  wire   pwr2_on_macb2_int      ;      
  // ETH3
  wire   rstn_non_srpg_macb3_int;
  wire   gate_clk_macb3_int     ;     
  wire   isolate_macb3_int      ;       
  wire save_edge_macb3_int;
  wire restore_edge_macb3_int;
  wire   pwr1_on_macb3_int      ;      
  wire   pwr2_on_macb3_int      ;      

  // DMA
  wire   rstn_non_srpg_dma_int;
  wire   gate_clk_dma_int     ;     
  wire   isolate_dma_int      ;       
  wire save_edge_dma_int;
  wire restore_edge_dma_int;
  wire   pwr1_on_dma_int      ;      
  wire   pwr2_on_dma_int      ;      

  // CPU
  wire   rstn_non_srpg_cpu_int;
  wire   gate_clk_cpu_int     ;     
  wire   isolate_cpu_int      ;       
  wire save_edge_cpu_int;
  wire restore_edge_cpu_int;
  wire   pwr1_on_cpu_int      ;      
  wire   pwr2_on_cpu_int      ;  
  wire L1_ctrl_cpu_off_p;    

  reg save_alut_tmp;
  // DFS sm

  reg cpu_shutoff_ctrl;

  reg mte_mac_off_start, mte_mac012_start, mte_mac013_start, mte_mac023_start, mte_mac123_start;
  reg mte_mac01_start, mte_mac02_start, mte_mac03_start, mte_mac12_start, mte_mac13_start, mte_mac23_start;
  reg mte_mac0_start, mte_mac1_start, mte_mac2_start, mte_mac3_start;
  reg mte_sys_hibernate ;
  reg mte_dma_start ;
  reg mte_cpu_start ;
  reg mte_mac_off_sleep_start, mte_mac012_sleep_start, mte_mac013_sleep_start, mte_mac023_sleep_start, mte_mac123_sleep_start;
  reg mte_mac01_sleep_start, mte_mac02_sleep_start, mte_mac03_sleep_start, mte_mac12_sleep_start, mte_mac13_sleep_start, mte_mac23_sleep_start;
  reg mte_mac0_sleep_start, mte_mac1_sleep_start, mte_mac2_sleep_start, mte_mac3_sleep_start;
  reg mte_dma_sleep_start;
  reg mte_mac_off_to_default, mte_mac012_to_default, mte_mac013_to_default, mte_mac023_to_default, mte_mac123_to_default;
  reg mte_mac01_to_default, mte_mac02_to_default, mte_mac03_to_default, mte_mac12_to_default, mte_mac13_to_default, mte_mac23_to_default;
  reg mte_mac0_to_default, mte_mac1_to_default, mte_mac2_to_default, mte_mac3_to_default;
  reg mte_dma_isolate_dis;
  reg mte_cpu_isolate_dis;
  reg mte_sys_hibernate_to_default;


  // Latch the CPU SLEEP invocation
  always @( posedge pclk or negedge nprst) 
  begin
    if(!nprst)
      L1_ctrl_cpu_off_reg <= 1'b0;
    else 
      L1_ctrl_cpu_off_reg <= L1_ctrl_domain[8];
  end

  // Create a pulse for sleep detection 
  assign L1_ctrl_cpu_off_p =  L1_ctrl_domain[8] && !L1_ctrl_cpu_off_reg;
  
  // CPU sleep contol logic 
  // Shut off CPU when L1_ctrl_cpu_off_p is set
  // wake cpu when any interrupt is seen  
  always @( posedge pclk or negedge nprst) 
  begin
    if(!nprst)
     cpu_shutoff_ctrl <= 1'b0;
    else if(cpu_shutoff_ctrl && int_source_h)
     cpu_shutoff_ctrl <= 1'b0;
    else if (L1_ctrl_cpu_off_p)
     cpu_shutoff_ctrl <= 1'b1;
  end
 
  // instantiate power contol  block for uart
  power_ctrl_sm i_urt_power_ctrl_sm(
    .pclk(pclk),
    .nprst(nprst),
    .L1_module_req(L1_ctrl_domain[1]),
    .set_status_module(set_status_urt),
    .clr_status_module(clr_status_urt),
    .rstn_non_srpg_module(rstn_non_srpg_urt_int),
    .gate_clk_module(gate_clk_urt_int),
    .isolate_module(isolate_urt_int),
    .save_edge(save_edge_urt_int),
    .restore_edge(restore_edge_urt_int),
    .pwr1_on(pwr1_on_urt_int),
    .pwr2_on(pwr2_on_urt_int)
    );
  

  // instantiate power contol  block for smc
  power_ctrl_sm i_smc_power_ctrl_sm(
    .pclk(pclk),
    .nprst(nprst),
    .L1_module_req(L1_ctrl_domain[2]),
    .set_status_module(set_status_smc),
    .clr_status_module(clr_status_smc),
    .rstn_non_srpg_module(rstn_non_srpg_smc_int),
    .gate_clk_module(gate_clk_smc_int),
    .isolate_module(isolate_smc_int),
    .save_edge(save_edge_smc_int),
    .restore_edge(restore_edge_smc_int),
    .pwr1_on(pwr1_on_smc_int),
    .pwr2_on(pwr2_on_smc_int)
    );

  // power control for macb0
  power_ctrl_sm i_macb0_power_ctrl_sm(
    .pclk(pclk),
    .nprst(nprst),
    .L1_module_req(L1_ctrl_domain[3]),
    .set_status_module(set_status_macb0),
    .clr_status_module(clr_status_macb0),
    .rstn_non_srpg_module(rstn_non_srpg_macb0_int),
    .gate_clk_module(gate_clk_macb0_int),
    .isolate_module(isolate_macb0_int),
    .save_edge(save_edge_macb0_int),
    .restore_edge(restore_edge_macb0_int),
    .pwr1_on(pwr1_on_macb0_int),
    .pwr2_on(pwr2_on_macb0_int)
    );
  // power control for macb1
  power_ctrl_sm i_macb1_power_ctrl_sm(
    .pclk(pclk),
    .nprst(nprst),
    .L1_module_req(L1_ctrl_domain[4]),
    .set_status_module(set_status_macb1),
    .clr_status_module(clr_status_macb1),
    .rstn_non_srpg_module(rstn_non_srpg_macb1_int),
    .gate_clk_module(gate_clk_macb1_int),
    .isolate_module(isolate_macb1_int),
    .save_edge(save_edge_macb1_int),
    .restore_edge(restore_edge_macb1_int),
    .pwr1_on(pwr1_on_macb1_int),
    .pwr2_on(pwr2_on_macb1_int)
    );
  // power control for macb2
  power_ctrl_sm i_macb2_power_ctrl_sm(
    .pclk(pclk),
    .nprst(nprst),
    .L1_module_req(L1_ctrl_domain[5]),
    .set_status_module(set_status_macb2),
    .clr_status_module(clr_status_macb2),
    .rstn_non_srpg_module(rstn_non_srpg_macb2_int),
    .gate_clk_module(gate_clk_macb2_int),
    .isolate_module(isolate_macb2_int),
    .save_edge(save_edge_macb2_int),
    .restore_edge(restore_edge_macb2_int),
    .pwr1_on(pwr1_on_macb2_int),
    .pwr2_on(pwr2_on_macb2_int)
    );
  // power control for macb3
  power_ctrl_sm i_macb3_power_ctrl_sm(
    .pclk(pclk),
    .nprst(nprst),
    .L1_module_req(L1_ctrl_domain[6]),
    .set_status_module(set_status_macb3),
    .clr_status_module(clr_status_macb3),
    .rstn_non_srpg_module(rstn_non_srpg_macb3_int),
    .gate_clk_module(gate_clk_macb3_int),
    .isolate_module(isolate_macb3_int),
    .save_edge(save_edge_macb3_int),
    .restore_edge(restore_edge_macb3_int),
    .pwr1_on(pwr1_on_macb3_int),
    .pwr2_on(pwr2_on_macb3_int)
    );
  // power control for dma
  power_ctrl_sm i_dma_power_ctrl_sm(
    .pclk(pclk),
    .nprst(nprst),
    .L1_module_req(L1_ctrl_domain[7]),
    .set_status_module(set_status_dma),
    .clr_status_module(clr_status_dma),
    .rstn_non_srpg_module(rstn_non_srpg_dma_int),
    .gate_clk_module(gate_clk_dma_int),
    .isolate_module(isolate_dma_int),
    .save_edge(save_edge_dma_int),
    .restore_edge(restore_edge_dma_int),
    .pwr1_on(pwr1_on_dma_int),
    .pwr2_on(pwr2_on_dma_int)
    );
  // power control for CPU
  power_ctrl_sm i_cpu_power_ctrl_sm(
    .pclk(pclk),
    .nprst(nprst),
    .L1_module_req(cpu_shutoff_ctrl),
    .set_status_module(set_status_cpu),
    .clr_status_module(clr_status_cpu),
    .rstn_non_srpg_module(rstn_non_srpg_cpu_int),
    .gate_clk_module(gate_clk_cpu_int),
    .isolate_module(isolate_cpu_int),
    .save_edge(save_edge_cpu_int),
    .restore_edge(restore_edge_cpu_int),
    .pwr1_on(pwr1_on_cpu_int),
    .pwr2_on(pwr2_on_cpu_int)
    );

  assign valid_reg_write =  (psel && pwrite && penable);
  assign valid_reg_read  =  (psel && (!pwrite) && penable);

  assign L1_ctrl_access  =  (paddr[15:0] == 16'b0000000000000100); 
  assign L1_status_access = (paddr[15:0] == 16'b0000000000001000);

  assign pcm_int_mask_access =   (paddr[15:0] == 16'b0000000000001100); // mask at 0xC
  assign pcm_int_status_access = (paddr[15:0] == 16'b0000000000100000); // status at 0x20

  
  // Read accesses to the control and status register
  always @(*)
  begin  
    if(valid_reg_read && L1_ctrl_access) 
      prdata = L1_ctrl_reg;
    else if (valid_reg_read && L1_status_access)
      prdata = L1_status_reg;
    else if (valid_reg_read && pcm_int_mask_access)
      prdata = pcm_mask_reg;
    else if (valid_reg_read && pcm_int_status_access)
      prdata = pcm_status_reg;
    else 
      prdata = 0;
  end

  assign set_status_mem =  (set_status_macb0 && set_status_macb1 && set_status_macb2 &&
                            set_status_macb3 && set_status_dma && set_status_cpu);

  assign clr_status_mem =  (clr_status_macb0 && clr_status_macb1 && clr_status_macb2 &&
                            clr_status_macb3 && clr_status_dma && clr_status_cpu);

  assign set_status_alut = (set_status_macb0 && set_status_macb1 && set_status_macb2 && set_status_macb3);

  assign clr_status_alut = (clr_status_macb0 || clr_status_macb1 || clr_status_macb2  || clr_status_macb3);

  // Write accesses to the control and status register
 
  always @(posedge pclk or negedge nprst)
  begin
    if (!nprst) begin
      L1_ctrl_reg   <= 0;
      L1_status_reg <= 0;
      pcm_mask_reg <= 0;
    end else begin
      // CTRL reg updates
      if (valid_reg_write && L1_ctrl_access) 
        L1_ctrl_reg <= pwdata; // Writes to the ctrl reg
      if (valid_reg_write && pcm_int_mask_access) 
        pcm_mask_reg <= pwdata; // Writes to the ctrl reg

      if (set_status_urt == 1'b1)  
        L1_status_reg[1] <= 1'b1; // Set the status bit 
      else if (clr_status_urt == 1'b1) 
        L1_status_reg[1] <= 1'b0;  // Clear the status bit

      if (set_status_smc == 1'b1) 
        L1_status_reg[2] <= 1'b1; // Set the status bit 
      else if (clr_status_smc == 1'b1) 
        L1_status_reg[2] <= 1'b0; // Clear the status bit

      if (set_status_macb0 == 1'b1)  
        L1_status_reg[3] <= 1'b1; // Set the status bit 
      else if (clr_status_macb0 == 1'b1) 
        L1_status_reg[3] <= 1'b0;  // Clear the status bit

      if (set_status_macb1 == 1'b1)  
        L1_status_reg[4] <= 1'b1; // Set the status bit 
      else if (clr_status_macb1 == 1'b1) 
        L1_status_reg[4] <= 1'b0;  // Clear the status bit

      if (set_status_macb2 == 1'b1)  
        L1_status_reg[5] <= 1'b1; // Set the status bit 
      else if (clr_status_macb2 == 1'b1) 
        L1_status_reg[5] <= 1'b0;  // Clear the status bit

      if (set_status_macb3 == 1'b1)  
        L1_status_reg[6] <= 1'b1; // Set the status bit 
      else if (clr_status_macb3 == 1'b1) 
        L1_status_reg[6] <= 1'b0;  // Clear the status bit

      if (set_status_dma == 1'b1)  
        L1_status_reg[7] <= 1'b1; // Set the status bit 
      else if (clr_status_dma == 1'b1) 
        L1_status_reg[7] <= 1'b0;  // Clear the status bit

      if (set_status_cpu == 1'b1)  
        L1_status_reg[8] <= 1'b1; // Set the status bit 
      else if (clr_status_cpu == 1'b1) 
        L1_status_reg[8] <= 1'b0;  // Clear the status bit

      if (set_status_alut == 1'b1)  
        L1_status_reg[9] <= 1'b1; // Set the status bit 
      else if (clr_status_alut == 1'b1) 
        L1_status_reg[9] <= 1'b0;  // Clear the status bit

      if (set_status_mem == 1'b1)  
        L1_status_reg[10] <= 1'b1; // Set the status bit 
      else if (clr_status_mem == 1'b1) 
        L1_status_reg[10] <= 1'b0;  // Clear the status bit

    end
  end

  // Unused bits of pcm_status_reg are tied to 0
  always @(posedge pclk or negedge nprst)
  begin
    if (!nprst)
      pcm_status_reg[31:4] <= 'b0;
    else  
      pcm_status_reg[31:4] <= pcm_status_reg[31:4];
  end
  
  // interrupt only of h/w assisted wakeup
  // MAC 3
  always @(posedge pclk or negedge nprst)
  begin
    if(!nprst)
      pcm_status_reg[3] <= 1'b0;
    else if (valid_reg_write && pcm_int_status_access) 
      pcm_status_reg[3] <= pwdata[3];
    else if (macb3_wakeup & ~pcm_mask_reg[3])
      pcm_status_reg[3] <= 1'b1;
    else if (valid_reg_read && pcm_int_status_access) 
      pcm_status_reg[3] <= 1'b0;
    else
      pcm_status_reg[3] <= pcm_status_reg[3];
  end  
   
  // MAC 2
  always @(posedge pclk or negedge nprst)
  begin
    if(!nprst)
      pcm_status_reg[2] <= 1'b0;
    else if (valid_reg_write && pcm_int_status_access) 
      pcm_status_reg[2] <= pwdata[2];
    else if (macb2_wakeup & ~pcm_mask_reg[2])
      pcm_status_reg[2] <= 1'b1;
    else if (valid_reg_read && pcm_int_status_access) 
      pcm_status_reg[2] <= 1'b0;
    else
      pcm_status_reg[2] <= pcm_status_reg[2];
  end  

  // MAC 1
  always @(posedge pclk or negedge nprst)
  begin
    if(!nprst)
      pcm_status_reg[1] <= 1'b0;
    else if (valid_reg_write && pcm_int_status_access) 
      pcm_status_reg[1] <= pwdata[1];
    else if (macb1_wakeup & ~pcm_mask_reg[1])
      pcm_status_reg[1] <= 1'b1;
    else if (valid_reg_read && pcm_int_status_access) 
      pcm_status_reg[1] <= 1'b0;
    else
      pcm_status_reg[1] <= pcm_status_reg[1];
  end  
   
  // MAC 0
  always @(posedge pclk or negedge nprst)
  begin
    if(!nprst)
      pcm_status_reg[0] <= 1'b0;
    else if (valid_reg_write && pcm_int_status_access) 
      pcm_status_reg[0] <= pwdata[0];
    else if (macb0_wakeup & ~pcm_mask_reg[0])
      pcm_status_reg[0] <= 1'b1;
    else if (valid_reg_read && pcm_int_status_access) 
      pcm_status_reg[0] <= 1'b0;
    else
      pcm_status_reg[0] <= pcm_status_reg[0];
  end  

  assign pcm_macb_wakeup_int = |pcm_status_reg;

  reg [31:0] L1_ctrl_reg1;
  always @(posedge pclk or negedge nprst)
  begin
    if(!nprst)
      L1_ctrl_reg1 <= 0;
    else
      L1_ctrl_reg1 <= L1_ctrl_reg;
  end

  // Program mode decode
  always @(L1_ctrl_reg or L1_ctrl_reg1 or int_source_h or cpu_shutoff_ctrl) begin
    mte_smc_start = 0;
    mte_uart_start = 0;
    mte_smc_uart_start  = 0;
    mte_mac_off_start  = 0;
    mte_mac012_start = 0;
    mte_mac013_start = 0;
    mte_mac023_start = 0;
    mte_mac123_start = 0;
    mte_mac01_start = 0;
    mte_mac02_start = 0;
    mte_mac03_start = 0;
    mte_mac12_start = 0;
    mte_mac13_start = 0;
    mte_mac23_start = 0;
    mte_mac0_start = 0;
    mte_mac1_start = 0;
    mte_mac2_start = 0;
    mte_mac3_start = 0;
    mte_sys_hibernate = 0 ;
    mte_dma_start = 0 ;
    mte_cpu_start = 0 ;

    mte_mac0_sleep_start = (L1_ctrl_reg ==  'h14) && (L1_ctrl_reg1 == 'h4 );
    mte_mac1_sleep_start = (L1_ctrl_reg ==  'h14) && (L1_ctrl_reg1 == 'h5 ); 
    mte_mac2_sleep_start = (L1_ctrl_reg ==  'h14) && (L1_ctrl_reg1 == 'h6 ); 
    mte_mac3_sleep_start = (L1_ctrl_reg ==  'h14) && (L1_ctrl_reg1 == 'h7 ); 
    mte_mac01_sleep_start = (L1_ctrl_reg ==  'h14) && (L1_ctrl_reg1 == 'h8 ); 
    mte_mac02_sleep_start = (L1_ctrl_reg ==  'h14) && (L1_ctrl_reg1 == 'h9 ); 
    mte_mac03_sleep_start = (L1_ctrl_reg ==  'h14) && (L1_ctrl_reg1 == 'hA ); 
    mte_mac12_sleep_start = (L1_ctrl_reg ==  'h14) && (L1_ctrl_reg1 == 'hB ); 
    mte_mac13_sleep_start = (L1_ctrl_reg ==  'h14) && (L1_ctrl_reg1 == 'hC ); 
    mte_mac23_sleep_start = (L1_ctrl_reg ==  'h14) && (L1_ctrl_reg1 == 'hD ); 
    mte_mac012_sleep_start = (L1_ctrl_reg ==  'h14) && (L1_ctrl_reg1 == 'hE ); 
    mte_mac013_sleep_start = (L1_ctrl_reg ==  'h14) && (L1_ctrl_reg1 == 'hF ); 
    mte_mac023_sleep_start = (L1_ctrl_reg ==  'h14) && (L1_ctrl_reg1 == 'h10 ); 
    mte_mac123_sleep_start = (L1_ctrl_reg ==  'h14) && (L1_ctrl_reg1 == 'h11 ); 
    mte_mac_off_sleep_start =  (L1_ctrl_reg == 'h14) && (L1_ctrl_reg1 == 'h12 );
    mte_dma_sleep_start =  (L1_ctrl_reg == 'h14) && (L1_ctrl_reg1 == 'h13 );

    mte_pm_uart_to_default_start = (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'h1);
    mte_pm_smc_to_default_start = (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'h2);
    mte_pm_smc_uart_to_default_start = (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'h3); 
    mte_mac0_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'h4); 
    mte_mac1_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'h5); 
    mte_mac2_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'h6); 
    mte_mac3_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'h7); 
    mte_mac01_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'h8); 
    mte_mac02_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'h9); 
    mte_mac03_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'hA); 
    mte_mac12_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'hB); 
    mte_mac13_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'hC); 
    mte_mac23_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'hD); 
    mte_mac012_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'hE); 
    mte_mac013_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'hF); 
    mte_mac023_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'h10); 
    mte_mac123_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'h11); 
    mte_mac_off_to_default =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'h12); 
    mte_dma_isolate_dis =  (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'h13); 
    mte_cpu_isolate_dis =  (int_source_h) && (cpu_shutoff_ctrl) && (L1_ctrl_reg != 'h15);
    mte_sys_hibernate_to_default = (L1_ctrl_reg == 32'h0) && (L1_ctrl_reg1 == 'h15); 

   
    if (L1_ctrl_reg1 == 'h0) begin // This check is to make mte_cpu_start
                                   // is set only when you from default state 
      case (L1_ctrl_reg)
        'h0 : L1_ctrl_domain = 32'h0; // default
        'h1 : begin
                L1_ctrl_domain = 32'h2; // PM_uart
                mte_uart_start = 1'b1;
              end
        'h2 : begin
                L1_ctrl_domain = 32'h4; // PM_smc
                mte_smc_start = 1'b1;
              end
        'h3 : begin
                L1_ctrl_domain = 32'h6; // PM_smc_uart
                mte_smc_uart_start = 1'b1;
              end
        'h4 : begin
                L1_ctrl_domain = 32'h8; //  PM_macb0
                mte_mac0_start = 1;
              end
        'h5 : begin  
                L1_ctrl_domain = 32'h10; //  PM_macb1
                mte_mac1_start = 1;
              end
        'h6 : begin  
                L1_ctrl_domain = 32'h20; //  PM_macb2
                mte_mac2_start = 1;
              end
        'h7 : begin  
                L1_ctrl_domain = 32'h40; //  PM_macb3
                mte_mac3_start = 1;
              end
        'h8 : begin  
                L1_ctrl_domain = 32'h18; //  PM_macb01
                mte_mac01_start = 1;
              end
        'h9 : begin  
                L1_ctrl_domain = 32'h28; //  PM_macb02
                mte_mac02_start = 1;
              end
        'hA : begin  
                L1_ctrl_domain = 32'h48; //  PM_macb03
                mte_mac03_start = 1;
              end
        'hB : begin  
                L1_ctrl_domain = 32'h30; //  PM_macb12
                mte_mac12_start = 1;
              end
        'hC : begin  
                L1_ctrl_domain = 32'h50; //  PM_macb13
                mte_mac13_start = 1;
              end
        'hD : begin  
                L1_ctrl_domain = 32'h60; //  PM_macb23
                mte_mac23_start = 1;
              end
        'hE : begin  
                L1_ctrl_domain = 32'h38; //  PM_macb012
                mte_mac012_start = 1;
              end
        'hF : begin  
                L1_ctrl_domain = 32'h58; //  PM_macb013
                mte_mac013_start = 1;
              end
        'h10 :begin  
                L1_ctrl_domain = 32'h68; //  PM_macb023
                mte_mac023_start = 1;
              end
        'h11 :begin  
                L1_ctrl_domain = 32'h70; //  PM_macb123
                mte_mac123_start = 1;
              end
        'h12 : begin  
                L1_ctrl_domain = 32'h78; //  PM_macb_off
                mte_mac_off_start = 1;
              end
        'h13 : begin  
                L1_ctrl_domain = 32'h80; //  PM_dma
                mte_dma_start = 1;
              end
        'h14 : begin  
                L1_ctrl_domain = 32'h100; //  PM_cpu_sleep
                mte_cpu_start = 1;
              end
        'h15 : begin  
                L1_ctrl_domain = 32'h1FE; //  PM_hibernate
                mte_sys_hibernate = 1;
              end
         default: L1_ctrl_domain = 32'h0;
      endcase
    end
  end


  wire to_default = (L1_ctrl_reg == 0);

  // Scan mode gating of power and isolation control signals
  //SMC
  assign rstn_non_srpg_smc  = (scan_mode == 1'b0) ? rstn_non_srpg_smc_int : 1'b1;  
  assign gate_clk_smc       = (scan_mode == 1'b0) ? gate_clk_smc_int : 1'b0;     
  assign isolate_smc        = (scan_mode == 1'b0) ? isolate_smc_int : 1'b0;      
  assign pwr1_on_smc        = (scan_mode == 1'b0) ? pwr1_on_smc_int : 1'b1;       
  assign pwr2_on_smc        = (scan_mode == 1'b0) ? pwr2_on_smc_int : 1'b1;       
  assign pwr1_off_smc       = (scan_mode == 1'b0) ? (!pwr1_on_smc_int) : 1'b0;       
  assign pwr2_off_smc       = (scan_mode == 1'b0) ? (!pwr2_on_smc_int) : 1'b0;       
  assign save_edge_smc       = (scan_mode == 1'b0) ? (save_edge_smc_int) : 1'b0;       
  assign restore_edge_smc       = (scan_mode == 1'b0) ? (restore_edge_smc_int) : 1'b0;       

  //URT
  assign rstn_non_srpg_urt  = (scan_mode == 1'b0) ?  rstn_non_srpg_urt_int : 1'b1;  
  assign gate_clk_urt       = (scan_mode == 1'b0) ?  gate_clk_urt_int      : 1'b0;     
  assign isolate_urt        = (scan_mode == 1'b0) ?  isolate_urt_int       : 1'b0;      
  assign pwr1_on_urt        = (scan_mode == 1'b0) ?  pwr1_on_urt_int       : 1'b1;       
  assign pwr2_on_urt        = (scan_mode == 1'b0) ?  pwr2_on_urt_int       : 1'b1;       
  assign pwr1_off_urt       = (scan_mode == 1'b0) ?  (!pwr1_on_urt_int)  : 1'b0;       
  assign pwr2_off_urt       = (scan_mode == 1'b0) ?  (!pwr2_on_urt_int)  : 1'b0;       
  assign save_edge_urt       = (scan_mode == 1'b0) ? (save_edge_urt_int) : 1'b0;       
  assign restore_edge_urt       = (scan_mode == 1'b0) ? (restore_edge_urt_int) : 1'b0;       

  //ETH0
  assign rstn_non_srpg_macb0 = (scan_mode == 1'b0) ?  rstn_non_srpg_macb0_int : 1'b1;  
  assign gate_clk_macb0       = (scan_mode == 1'b0) ?  gate_clk_macb0_int      : 1'b0;     
  assign isolate_macb0        = (scan_mode == 1'b0) ?  isolate_macb0_int       : 1'b0;      
  assign pwr1_on_macb0        = (scan_mode == 1'b0) ?  pwr1_on_macb0_int       : 1'b1;       
  assign pwr2_on_macb0        = (scan_mode == 1'b0) ?  pwr2_on_macb0_int       : 1'b1;       
  assign pwr1_off_macb0       = (scan_mode == 1'b0) ?  (!pwr1_on_macb0_int)  : 1'b0;       
  assign pwr2_off_macb0       = (scan_mode == 1'b0) ?  (!pwr2_on_macb0_int)  : 1'b0;       
  assign save_edge_macb0       = (scan_mode == 1'b0) ? (save_edge_macb0_int) : 1'b0;       
  assign restore_edge_macb0       = (scan_mode == 1'b0) ? (restore_edge_macb0_int) : 1'b0;       

  //ETH1
  assign rstn_non_srpg_macb1 = (scan_mode == 1'b0) ?  rstn_non_srpg_macb1_int : 1'b1;  
  assign gate_clk_macb1       = (scan_mode == 1'b0) ?  gate_clk_macb1_int      : 1'b0;     
  assign isolate_macb1        = (scan_mode == 1'b0) ?  isolate_macb1_int       : 1'b0;      
  assign pwr1_on_macb1        = (scan_mode == 1'b0) ?  pwr1_on_macb1_int       : 1'b1;       
  assign pwr2_on_macb1        = (scan_mode == 1'b0) ?  pwr2_on_macb1_int       : 1'b1;       
  assign pwr1_off_macb1       = (scan_mode == 1'b0) ?  (!pwr1_on_macb1_int)  : 1'b0;       
  assign pwr2_off_macb1       = (scan_mode == 1'b0) ?  (!pwr2_on_macb1_int)  : 1'b0;       
  assign save_edge_macb1       = (scan_mode == 1'b0) ? (save_edge_macb1_int) : 1'b0;       
  assign restore_edge_macb1       = (scan_mode == 1'b0) ? (restore_edge_macb1_int) : 1'b0;       

  //ETH2
  assign rstn_non_srpg_macb2 = (scan_mode == 1'b0) ?  rstn_non_srpg_macb2_int : 1'b1;  
  assign gate_clk_macb2       = (scan_mode == 1'b0) ?  gate_clk_macb2_int      : 1'b0;     
  assign isolate_macb2        = (scan_mode == 1'b0) ?  isolate_macb2_int       : 1'b0;      
  assign pwr1_on_macb2        = (scan_mode == 1'b0) ?  pwr1_on_macb2_int       : 1'b1;       
  assign pwr2_on_macb2        = (scan_mode == 1'b0) ?  pwr2_on_macb2_int       : 1'b1;       
  assign pwr1_off_macb2       = (scan_mode == 1'b0) ?  (!pwr1_on_macb2_int)  : 1'b0;       
  assign pwr2_off_macb2       = (scan_mode == 1'b0) ?  (!pwr2_on_macb2_int)  : 1'b0;       
  assign save_edge_macb2       = (scan_mode == 1'b0) ? (save_edge_macb2_int) : 1'b0;       
  assign restore_edge_macb2       = (scan_mode == 1'b0) ? (restore_edge_macb2_int) : 1'b0;       

  //ETH3
  assign rstn_non_srpg_macb3 = (scan_mode == 1'b0) ?  rstn_non_srpg_macb3_int : 1'b1;  
  assign gate_clk_macb3       = (scan_mode == 1'b0) ?  gate_clk_macb3_int      : 1'b0;     
  assign isolate_macb3        = (scan_mode == 1'b0) ?  isolate_macb3_int       : 1'b0;      
  assign pwr1_on_macb3        = (scan_mode == 1'b0) ?  pwr1_on_macb3_int       : 1'b1;       
  assign pwr2_on_macb3        = (scan_mode == 1'b0) ?  pwr2_on_macb3_int       : 1'b1;       
  assign pwr1_off_macb3       = (scan_mode == 1'b0) ?  (!pwr1_on_macb3_int)  : 1'b0;       
  assign pwr2_off_macb3       = (scan_mode == 1'b0) ?  (!pwr2_on_macb3_int)  : 1'b0;       
  assign save_edge_macb3       = (scan_mode == 1'b0) ? (save_edge_macb3_int) : 1'b0;       
  assign restore_edge_macb3       = (scan_mode == 1'b0) ? (restore_edge_macb3_int) : 1'b0;       

  // MEM
  assign rstn_non_srpg_mem =   (rstn_non_srpg_macb0 && rstn_non_srpg_macb1 && rstn_non_srpg_macb2 &&
                                rstn_non_srpg_macb3 && rstn_non_srpg_dma && rstn_non_srpg_cpu && rstn_non_srpg_urt &&
                                rstn_non_srpg_smc);

  assign gate_clk_mem =  (gate_clk_macb0 && gate_clk_macb1 && gate_clk_macb2 &&
                            gate_clk_macb3 && gate_clk_dma && gate_clk_cpu && gate_clk_urt && gate_clk_smc);

  assign isolate_mem  = (isolate_macb0 && isolate_macb1 && isolate_macb2 &&
                         isolate_macb3 && isolate_dma && isolate_cpu && isolate_urt && isolate_smc);


  assign pwr1_on_mem        =   ~pwr1_off_mem;

  assign pwr2_on_mem        =   ~pwr2_off_mem;

  assign pwr1_off_mem       =  (pwr1_off_macb0 && pwr1_off_macb1 && pwr1_off_macb2 &&
                                 pwr1_off_macb3 && pwr1_off_dma && pwr1_off_cpu && pwr1_off_urt && pwr1_off_smc);


  assign pwr2_off_mem       =  (pwr2_off_macb0 && pwr2_off_macb1 && pwr2_off_macb2 &&
                                pwr2_off_macb3 && pwr2_off_dma && pwr2_off_cpu && pwr2_off_urt && pwr2_off_smc);

  assign save_edge_mem      =  (save_edge_macb0 && save_edge_macb1 && save_edge_macb2 &&
                                save_edge_macb3 && save_edge_dma && save_edge_cpu && save_edge_smc && save_edge_urt);

  assign restore_edge_mem   =  (restore_edge_macb0 && restore_edge_macb1 && restore_edge_macb2  &&
                                restore_edge_macb3 && restore_edge_dma && restore_edge_cpu && restore_edge_urt &&
                                restore_edge_smc);

  assign standby_mem0 = pwr1_off_macb0 && (~ (pwr1_off_macb0 && pwr1_off_macb1 && pwr1_off_macb2 && pwr1_off_macb3 && pwr1_off_urt && pwr1_off_smc && pwr1_off_dma && pwr1_off_cpu));
  assign standby_mem1 = pwr1_off_macb1 && (~ (pwr1_off_macb0 && pwr1_off_macb1 && pwr1_off_macb2 && pwr1_off_macb3 && pwr1_off_urt && pwr1_off_smc && pwr1_off_dma && pwr1_off_cpu));
  assign standby_mem2 = pwr1_off_macb2 && (~ (pwr1_off_macb0 && pwr1_off_macb1 && pwr1_off_macb2 && pwr1_off_macb3 && pwr1_off_urt && pwr1_off_smc && pwr1_off_dma && pwr1_off_cpu));
  assign standby_mem3 = pwr1_off_macb3 && (~ (pwr1_off_macb0 && pwr1_off_macb1 && pwr1_off_macb2 && pwr1_off_macb3 && pwr1_off_urt && pwr1_off_smc && pwr1_off_dma && pwr1_off_cpu));

  assign pwr1_off_mem0 = pwr1_off_mem;
  assign pwr1_off_mem1 = pwr1_off_mem;
  assign pwr1_off_mem2 = pwr1_off_mem;
  assign pwr1_off_mem3 = pwr1_off_mem;

  assign rstn_non_srpg_alut  =  (rstn_non_srpg_macb0 && rstn_non_srpg_macb1 && rstn_non_srpg_macb2 && rstn_non_srpg_macb3);


   assign gate_clk_alut       =  (gate_clk_macb0 && gate_clk_macb1 && gate_clk_macb2 && gate_clk_macb3);


    assign isolate_alut        =  (isolate_macb0 && isolate_macb1 && isolate_macb2 && isolate_macb3);


    assign pwr1_on_alut        =  (pwr1_on_macb0 || pwr1_on_macb1 || pwr1_on_macb2 || pwr1_on_macb3);


    assign pwr2_on_alut        =  (pwr2_on_macb0 || pwr2_on_macb1 || pwr2_on_macb2 || pwr2_on_macb3);


    assign pwr1_off_alut       =  (pwr1_off_macb0 && pwr1_off_macb1 && pwr1_off_macb2 && pwr1_off_macb3);


    assign pwr2_off_alut       =  (pwr2_off_macb0 && pwr2_off_macb1 && pwr2_off_macb2 && pwr2_off_macb3);


    assign save_edge_alut      =  (save_edge_macb0 && save_edge_macb1 && save_edge_macb2 && save_edge_macb3);


    assign restore_edge_alut   =  (restore_edge_macb0 || restore_edge_macb1 || restore_edge_macb2 ||
                                   restore_edge_macb3) && save_alut_tmp;

     // alut power off detection
  always @(posedge pclk or negedge nprst) begin
    if (!nprst) 
       save_alut_tmp <= 0;
    else if (restore_edge_alut)
       save_alut_tmp <= 0;
    else if (save_edge_alut)
       save_alut_tmp <= 1;
  end

  //DMA
  assign rstn_non_srpg_dma = (scan_mode == 1'b0) ?  rstn_non_srpg_dma_int : 1'b1;  
  assign gate_clk_dma       = (scan_mode == 1'b0) ?  gate_clk_dma_int      : 1'b0;     
  assign isolate_dma        = (scan_mode == 1'b0) ?  isolate_dma_int       : 1'b0;      
  assign pwr1_on_dma        = (scan_mode == 1'b0) ?  pwr1_on_dma_int       : 1'b1;       
  assign pwr2_on_dma        = (scan_mode == 1'b0) ?  pwr2_on_dma_int       : 1'b1;       
  assign pwr1_off_dma       = (scan_mode == 1'b0) ?  (!pwr1_on_dma_int)  : 1'b0;       
  assign pwr2_off_dma       = (scan_mode == 1'b0) ?  (!pwr2_on_dma_int)  : 1'b0;       
  assign save_edge_dma       = (scan_mode == 1'b0) ? (save_edge_dma_int) : 1'b0;       
  assign restore_edge_dma       = (scan_mode == 1'b0) ? (restore_edge_dma_int) : 1'b0;       

  //CPU
  assign rstn_non_srpg_cpu = (scan_mode == 1'b0) ?  rstn_non_srpg_cpu_int : 1'b1;  
  assign gate_clk_cpu       = (scan_mode == 1'b0) ?  gate_clk_cpu_int      : 1'b0;     
  assign isolate_cpu        = (scan_mode == 1'b0) ?  isolate_cpu_int       : 1'b0;      
  assign pwr1_on_cpu        = (scan_mode == 1'b0) ?  pwr1_on_cpu_int       : 1'b1;       
  assign pwr2_on_cpu        = (scan_mode == 1'b0) ?  pwr2_on_cpu_int       : 1'b1;       
  assign pwr1_off_cpu       = (scan_mode == 1'b0) ?  (!pwr1_on_cpu_int)  : 1'b0;       
  assign pwr2_off_cpu       = (scan_mode == 1'b0) ?  (!pwr2_on_cpu_int)  : 1'b0;       
  assign save_edge_cpu       = (scan_mode == 1'b0) ? (save_edge_cpu_int) : 1'b0;       
  assign restore_edge_cpu       = (scan_mode == 1'b0) ? (restore_edge_cpu_int) : 1'b0;       



  // ASE

   reg ase_core_12v, ase_core_10v, ase_core_08v, ase_core_06v;
   reg ase_macb0_12v,ase_macb1_12v,ase_macb2_12v,ase_macb3_12v;

    // core ase

    // core at 1.0 v if (smc off, urt off, macb0 off, macb1 off, macb2 off, macb3 off
   // core at 0.8v if (mac01off, macb02off, macb03off, macb12off, mac13off, mac23off,
   // core at 0.6v if (mac012off, mac013off, mac023off, mac123off, mac0123off
    // else core at 1.2v
                 
   always @(*) begin
     if( (pwr1_off_macb0 && pwr1_off_macb1 && pwr1_off_macb2 && pwr1_off_macb3) || // all mac off
       (pwr1_off_macb3 && pwr1_off_macb2 && pwr1_off_macb1) || // mac123off 
       (pwr1_off_macb3 && pwr1_off_macb2 && pwr1_off_macb0) || // mac023off 
       (pwr1_off_macb3 && pwr1_off_macb1 && pwr1_off_macb0) || // mac013off 
       (pwr1_off_macb2 && pwr1_off_macb1 && pwr1_off_macb0) )  // mac012off 
       begin
         ase_core_12v = 0;
         ase_core_10v = 0;
         ase_core_08v = 0;
         ase_core_06v = 1;
       end
     else if( (pwr1_off_macb2 && pwr1_off_macb3) || // mac23 off
         (pwr1_off_macb3 && pwr1_off_macb1) || // mac13off 
         (pwr1_off_macb1 && pwr1_off_macb2) || // mac12off 
         (pwr1_off_macb3 && pwr1_off_macb0) || // mac03off 
         (pwr1_off_macb2 && pwr1_off_macb0) || // mac02off 
         (pwr1_off_macb1 && pwr1_off_macb0))  // mac01off 
       begin
         ase_core_12v = 0;
         ase_core_10v = 0;
         ase_core_08v = 1;
         ase_core_06v = 0;
       end
     else if( (pwr1_off_smc) || // smc off
         (pwr1_off_macb0 ) || // mac0off 
         (pwr1_off_macb1 ) || // mac1off 
         (pwr1_off_macb2 ) || // mac2off 
         (pwr1_off_macb3 ))  // mac3off 
       begin
         ase_core_12v = 0;
         ase_core_10v = 1;
         ase_core_08v = 0;
         ase_core_06v = 0;
       end
     else if (pwr1_off_urt)
       begin
         ase_core_12v = 1;
         ase_core_10v = 0;
         ase_core_08v = 0;
         ase_core_06v = 0;
       end
     else
       begin
         ase_core_12v = 1;
         ase_core_10v = 0;
         ase_core_08v = 0;
         ase_core_06v = 0;
       end
   end


   // cpu
   // cpu @ 1.0v when macoff, 
   // 
   reg ase_cpu_10v, ase_cpu_12v;
   always @(*) begin
    if(pwr1_off_cpu) begin
     ase_cpu_12v = 1'b0;
     ase_cpu_10v = 1'b0;
    end
    else if(pwr1_off_macb0 || pwr1_off_macb1 || pwr1_off_macb2 || pwr1_off_macb3)
    begin
     ase_cpu_12v = 1'b0;
     ase_cpu_10v = 1'b1;
    end
    else
    begin
     ase_cpu_12v = 1'b1;
     ase_cpu_10v = 1'b0;
    end
   end

   // dma
   // dma @v1.0 for macoff, 

   reg ase_dma_10v, ase_dma_12v;
   always @(*) begin
    if(pwr1_off_dma) begin
     ase_dma_12v = 1'b0;
     ase_dma_10v = 1'b0;
    end
    else if(pwr1_off_macb0 || pwr1_off_macb1 || pwr1_off_macb2 || pwr1_off_macb3)
    begin
     ase_dma_12v = 1'b0;
     ase_dma_10v = 1'b1;
    end
    else
    begin
     ase_dma_12v = 1'b1;
     ase_dma_10v = 1'b0;
    end
   end

   // alut
   // @ v1.0 for macoff

   reg ase_alut_10v, ase_alut_12v;
   always @(*) begin
    if(pwr1_off_alut) begin
     ase_alut_12v = 1'b0;
     ase_alut_10v = 1'b0;
    end
    else if(pwr1_off_macb0 || pwr1_off_macb1 || pwr1_off_macb2 || pwr1_off_macb3)
    begin
     ase_alut_12v = 1'b0;
     ase_alut_10v = 1'b1;
    end
    else
    begin
     ase_alut_12v = 1'b1;
     ase_alut_10v = 1'b0;
    end
   end




   reg ase_uart_12v;
   reg ase_uart_10v;
   reg ase_uart_08v;
   reg ase_uart_06v;

   reg ase_smc_12v;


   always @(*) begin
     if(pwr1_off_urt) begin // uart off
       ase_uart_08v = 1'b0;
       ase_uart_06v = 1'b0;
       ase_uart_10v = 1'b0;
       ase_uart_12v = 1'b0;
     end 
     else if( (pwr1_off_macb0 && pwr1_off_macb1 && pwr1_off_macb2 && pwr1_off_macb3) || // all mac off
       (pwr1_off_macb3 && pwr1_off_macb2 && pwr1_off_macb1) || // mac123off 
       (pwr1_off_macb3 && pwr1_off_macb2 && pwr1_off_macb0) || // mac023off 
       (pwr1_off_macb3 && pwr1_off_macb1 && pwr1_off_macb0) || // mac013off 
       (pwr1_off_macb2 && pwr1_off_macb1 && pwr1_off_macb0) )  // mac012off 
     begin
       ase_uart_06v = 1'b1;
       ase_uart_08v = 1'b0;
       ase_uart_10v = 1'b0;
       ase_uart_12v = 1'b0;
     end
     else if( (pwr1_off_macb2 && pwr1_off_macb3) || // mac23 off
         (pwr1_off_macb3 && pwr1_off_macb1) || // mac13off 
         (pwr1_off_macb1 && pwr1_off_macb2) || // mac12off 
         (pwr1_off_macb3 && pwr1_off_macb0) || // mac03off 
         (pwr1_off_macb1 && pwr1_off_macb0))  // mac01off  
     begin
       ase_uart_06v = 1'b0;
       ase_uart_08v = 1'b1;
       ase_uart_10v = 1'b0;
       ase_uart_12v = 1'b0;
     end
     else if (pwr1_off_smc || pwr1_off_macb0 || pwr1_off_macb1 || pwr1_off_macb2 || pwr1_off_macb3) begin // smc off
       ase_uart_08v = 1'b0;
       ase_uart_06v = 1'b0;
       ase_uart_10v = 1'b1;
       ase_uart_12v = 1'b0;
     end 
     else begin
       ase_uart_08v = 1'b0;
       ase_uart_06v = 1'b0;
       ase_uart_10v = 1'b0;
       ase_uart_12v = 1'b1;
     end
   end
 


   always @(pwr1_off_smc) begin
     if (pwr1_off_smc)  // smc off
       ase_smc_12v = 1'b0;
    else
       ase_smc_12v = 1'b1;
   end

   
   always @(pwr1_off_macb0) begin
     if (pwr1_off_macb0) // macb0 off
       ase_macb0_12v = 1'b0;
     else
       ase_macb0_12v = 1'b1;
   end

   always @(pwr1_off_macb1) begin
     if (pwr1_off_macb1) // macb1 off
       ase_macb1_12v = 1'b0;
     else
       ase_macb1_12v = 1'b1;
   end

   always @(pwr1_off_macb2) begin // macb2 off
     if (pwr1_off_macb2) // macb2 off
       ase_macb2_12v = 1'b0;
     else
       ase_macb2_12v = 1'b1;
   end

   always @(pwr1_off_macb3) begin // macb3 off
     if (pwr1_off_macb3) // macb3 off
       ase_macb3_12v = 1'b0;
     else
       ase_macb3_12v = 1'b1;
   end


   // core voltage for vco
  assign core12v = ase_macb0_12v & ase_macb1_12v & ase_macb2_12v & ase_macb3_12v;

  assign core10v =  (ase_macb0_12v & ase_macb1_12v & ase_macb2_12v & (!ase_macb3_12v)) ||
                    (ase_macb0_12v & ase_macb1_12v & (!ase_macb2_12v) & ase_macb3_12v) ||
                    (ase_macb0_12v & (!ase_macb1_12v) & ase_macb2_12v & ase_macb3_12v) ||
                    ((!ase_macb0_12v) & ase_macb1_12v & ase_macb2_12v & ase_macb3_12v);

  assign core08v =  ((!ase_macb0_12v) & (!ase_macb1_12v) & (ase_macb2_12v) & (ase_macb3_12v)) ||
                    ((!ase_macb0_12v) & (ase_macb1_12v) & (!ase_macb2_12v) & (ase_macb3_12v)) ||
                    ((!ase_macb0_12v) & (ase_macb1_12v) & (ase_macb2_12v) & (!ase_macb3_12v)) ||
                    ((ase_macb0_12v) & (!ase_macb1_12v) & (!ase_macb2_12v) & (ase_macb3_12v)) ||
                    ((ase_macb0_12v) & (!ase_macb1_12v) & (ase_macb2_12v) & (!ase_macb3_12v)) ||
                    ((ase_macb0_12v) & (ase_macb1_12v) & (!ase_macb2_12v) & (!ase_macb3_12v));

  assign core06v =  ((!ase_macb0_12v) & (!ase_macb1_12v) & (!ase_macb2_12v) & (ase_macb3_12v)) ||
                    ((!ase_macb0_12v) & (!ase_macb1_12v) & (ase_macb2_12v) & (!ase_macb3_12v)) ||
                    ((!ase_macb0_12v) & (ase_macb1_12v) & (!ase_macb2_12v) & (!ase_macb3_12v)) ||
                    ((ase_macb0_12v) & (!ase_macb1_12v) & (!ase_macb2_12v) & (!ase_macb3_12v)) ||
                    ((!ase_macb0_12v) & (!ase_macb1_12v) & (!ase_macb2_12v) & (!ase_macb3_12v)) ;



`ifdef LP_ABV_ON
// psl default clock = (posedge pclk);

// Cover a condition in which SMC is powered down
// and again powered up while UART is going into POWER down
// state or UART is already in POWER DOWN state
// psl cover_overlapping_smc_urt_1:
//    cover{fell(pwr1_on_urt);[*];fell(pwr1_on_smc);[*];
//    rose(pwr1_on_smc);[*];rose(pwr1_on_urt)};
//
// Cover a condition in which UART is powered down
// and again powered up while SMC is going into POWER down
// state or SMC is already in POWER DOWN state
// psl cover_overlapping_smc_urt_2:
//    cover{fell(pwr1_on_smc);[*];fell(pwr1_on_urt);[*];
//    rose(pwr1_on_urt);[*];rose(pwr1_on_smc)};
//


// Power Down UART
// This gets triggered on rising edge of Gate signal for
// UART (gate_clk_urt). In a next cycle after gate_clk_urt,
// Isolate UART(isolate_urt) signal become HIGH (active).
// In 2nd cycle after gate_clk_urt becomes HIGH, RESET for NON
// SRPG FFs(rstn_non_srpg_urt) and POWER1 for UART(pwr1_on_urt) should 
// go LOW. 
// This completes a POWER DOWN. 

sequence s_power_down_urt;
      (gate_clk_urt & !isolate_urt & rstn_non_srpg_urt & pwr1_on_urt) 
  ##1 (gate_clk_urt & isolate_urt & rstn_non_srpg_urt & pwr1_on_urt) 
  ##3 (gate_clk_urt & isolate_urt & !rstn_non_srpg_urt & !pwr1_on_urt);
endsequence


property p_power_down_urt;
   @(posedge pclk)
    $rose(gate_clk_urt) |=> s_power_down_urt;
endproperty

output_power_down_urt:
  assert property (p_power_down_urt);


// Power UP UART
// Sequence starts with , Rising edge of pwr1_on_urt.
// Two clock cycle after this, isolate_urt should become LOW 
// On the following clk gate_clk_urt should go low.
// 5 cycles after  Rising edge of pwr1_on_urt, rstn_non_srpg_urt
// should become HIGH
sequence s_power_up_urt;
##30 (pwr1_on_urt & !isolate_urt & gate_clk_urt & !rstn_non_srpg_urt) 
##1 (pwr1_on_urt & !isolate_urt & !gate_clk_urt & !rstn_non_srpg_urt) 
##2 (pwr1_on_urt & !isolate_urt & !gate_clk_urt & rstn_non_srpg_urt);
endsequence

property p_power_up_urt;
   @(posedge pclk)
  disable iff(!nprst)
    (!pwr1_on_urt ##1 pwr1_on_urt) |=> s_power_up_urt;
endproperty

output_power_up_urt:
  assert property (p_power_up_urt);


// Power Down SMC
// This gets triggered on rising edge of Gate signal for
// SMC (gate_clk_smc). In a next cycle after gate_clk_smc,
// Isolate SMC(isolate_smc) signal become HIGH (active).
// In 2nd cycle after gate_clk_smc becomes HIGH, RESET for NON
// SRPG FFs(rstn_non_srpg_smc) and POWER1 for SMC(pwr1_on_smc) should 
// go LOW. 
// This completes a POWER DOWN. 

sequence s_power_down_smc;
      (gate_clk_smc & !isolate_smc & rstn_non_srpg_smc & pwr1_on_smc) 
  ##1 (gate_clk_smc & isolate_smc & rstn_non_srpg_smc & pwr1_on_smc) 
  ##3 (gate_clk_smc & isolate_smc & !rstn_non_srpg_smc & !pwr1_on_smc);
endsequence


property p_power_down_smc;
   @(posedge pclk)
    $rose(gate_clk_smc) |=> s_power_down_smc;
endproperty

output_power_down_smc:
  assert property (p_power_down_smc);


// Power UP SMC
// Sequence starts with , Rising edge of pwr1_on_smc.
// Two clock cycle after this, isolate_smc should become LOW 
// On the following clk gate_clk_smc should go low.
// 5 cycles after  Rising edge of pwr1_on_smc, rstn_non_srpg_smc
// should become HIGH
sequence s_power_up_smc;
##30 (pwr1_on_smc & !isolate_smc & gate_clk_smc & !rstn_non_srpg_smc) 
##1 (pwr1_on_smc & !isolate_smc & !gate_clk_smc & !rstn_non_srpg_smc) 
##2 (pwr1_on_smc & !isolate_smc & !gate_clk_smc & rstn_non_srpg_smc);
endsequence

property p_power_up_smc;
   @(posedge pclk)
  disable iff(!nprst)
    (!pwr1_on_smc ##1 pwr1_on_smc) |=> s_power_up_smc;
endproperty

output_power_up_smc:
  assert property (p_power_up_smc);


// COVER SMC POWER DOWN AND UP
cover_power_down_up_smc: cover property (@(posedge pclk)
(s_power_down_smc ##[5:180] s_power_up_smc));



// COVER UART POWER DOWN AND UP
cover_power_down_up_urt: cover property (@(posedge pclk)
(s_power_down_urt ##[5:180] s_power_up_urt));

cover_power_down_urt: cover property (@(posedge pclk)
(s_power_down_urt));

cover_power_up_urt: cover property (@(posedge pclk)
(s_power_up_urt));




`ifdef PCM_ABV_ON
//------------------------------------------------------------------------------
// Power Controller Formal Verification component.  Each power domain has a 
// separate instantiation
//------------------------------------------------------------------------------

// need to assume that CPU will leave a minimum time between powering down and 
// back up.  In this example, 10clks has been selected.
// psl config_min_uart_pd_time : assume always {rose(L1_ctrl_domain[1])} |-> { L1_ctrl_domain[1][*10] } abort(~nprst);
// psl config_min_uart_pu_time : assume always {fell(L1_ctrl_domain[1])} |-> { !L1_ctrl_domain[1][*10] } abort(~nprst);
// psl config_min_smc_pd_time : assume always {rose(L1_ctrl_domain[2])} |-> { L1_ctrl_domain[2][*10] } abort(~nprst);
// psl config_min_smc_pu_time : assume always {fell(L1_ctrl_domain[2])} |-> { !L1_ctrl_domain[2][*10] } abort(~nprst);

// UART VCOMP parameters
   defparam i_uart_vcomp_domain.ENABLE_SAVE_RESTORE_EDGE   = 1;
   defparam i_uart_vcomp_domain.ENABLE_EXT_PWR_CNTRL       = 1;
   defparam i_uart_vcomp_domain.REF_CLK_DEFINED            = 0;
   defparam i_uart_vcomp_domain.MIN_SHUTOFF_CYCLES         = 4;
   defparam i_uart_vcomp_domain.MIN_RESTORE_TO_ISO_CYCLES  = 0;
   defparam i_uart_vcomp_domain.MIN_SAVE_TO_SHUTOFF_CYCLES = 1;


   vcomp_domain i_uart_vcomp_domain
   ( .ref_clk(pclk),
     .start_lps(L1_ctrl_domain[1] || !rstn_non_srpg_urt),
     .rst_n(nprst),
     .ext_power_down(L1_ctrl_domain[1]),
     .iso_en(isolate_urt),
     .save_edge(save_edge_urt),
     .restore_edge(restore_edge_urt),
     .domain_shut_off(pwr1_off_urt),
     .domain_clk(!gate_clk_urt && pclk)
   );


// SMC VCOMP parameters
   defparam i_smc_vcomp_domain.ENABLE_SAVE_RESTORE_EDGE   = 1;
   defparam i_smc_vcomp_domain.ENABLE_EXT_PWR_CNTRL       = 1;
   defparam i_smc_vcomp_domain.REF_CLK_DEFINED            = 0;
   defparam i_smc_vcomp_domain.MIN_SHUTOFF_CYCLES         = 4;
   defparam i_smc_vcomp_domain.MIN_RESTORE_TO_ISO_CYCLES  = 0;
   defparam i_smc_vcomp_domain.MIN_SAVE_TO_SHUTOFF_CYCLES = 1;


   vcomp_domain i_smc_vcomp_domain
   ( .ref_clk(pclk),
     .start_lps(L1_ctrl_domain[2] || !rstn_non_srpg_smc),
     .rst_n(nprst),
     .ext_power_down(L1_ctrl_domain[2]),
     .iso_en(isolate_smc),
     .save_edge(save_edge_smc),
     .restore_edge(restore_edge_smc),
     .domain_shut_off(pwr1_off_smc),
     .domain_clk(!gate_clk_smc && pclk)
   );

`endif

`endif



endmodule
