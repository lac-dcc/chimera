// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : power_ctrl_veneer.v
//Title       : 
//Created     : 1999
//Description : 
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
module power_ctrl_veneer (
    //------------------------------------
    // Clocks & Reset
    //------------------------------------
    pclk,
    nprst,
    //------------------------------------
    // APB programming interface
    //------------------------------------
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
    //------------------------------------
    // Scan 
    //------------------------------------
    scan_in,
    scan_en,
    scan_mode,
    scan_out,
    int_source_h,
    //------------------------------------
    // Module control outputs
    //------------------------------------
    // SMC
    rstn_non_srpg_smc,
    gate_clk_smc,
    isolate_smc,
    save_edge_smc,
    restore_edge_smc,
    pwr1_on_smc,
    pwr2_on_smc,
    // URT
    rstn_non_srpg_urt,
    gate_clk_urt,
    isolate_urt,
    save_edge_urt,
    restore_edge_urt,
    pwr1_on_urt,
    pwr2_on_urt,
    // ETH0
    rstn_non_srpg_macb0,
    gate_clk_macb0,
    isolate_macb0,
    save_edge_macb0,
    restore_edge_macb0,
    pwr1_on_macb0,
    pwr2_on_macb0,
    // ETH1
    rstn_non_srpg_macb1,
    gate_clk_macb1,
    isolate_macb1,
    save_edge_macb1,
    restore_edge_macb1,
    pwr1_on_macb1,
    pwr2_on_macb1,
    // ETH2
    rstn_non_srpg_macb2,
    gate_clk_macb2,
    isolate_macb2,
    save_edge_macb2,
    restore_edge_macb2,
    pwr1_on_macb2,
    pwr2_on_macb2,
    // ETH3
    rstn_non_srpg_macb3,
    gate_clk_macb3,
    isolate_macb3,
    save_edge_macb3,
    restore_edge_macb3,
    pwr1_on_macb3,
    pwr2_on_macb3,
    // core dvfs transitions
    core06v,
    core08v,
    core10v,
    core12v,
    pcm_macb_wakeup_int,
    isolate_mem,
    
    // transit signals
    mte_smc_start,
    mte_uart_start,
    mte_smc_uart_start,  
    mte_pm_smc_to_default_start, 
    mte_pm_uart_to_default_start,
    mte_pm_smc_uart_to_default_start
  );

//------------------------------------------------------------------------------
// I/O declaration
//------------------------------------------------------------------------------

   //------------------------------------
   // Clocks & Reset
   //------------------------------------
   input             pclk;
   input             nprst;
   //------------------------------------
   // APB programming interface;
   //------------------------------------
   input  [31:0]     paddr;
   input             psel;
   input             penable;
   input             pwrite;
   input  [31:0]     pwdata;
   output [31:0]     prdata;
    // mac
   input macb3_wakeup;
   input macb2_wakeup;
   input macb1_wakeup;
   input macb0_wakeup;
   //------------------------------------
   // Scan
   //------------------------------------
   input             scan_in;
   input             scan_en;
   input             scan_mode;
   output            scan_out;
   //------------------------------------
   // Module control outputs
   input             int_source_h;
   //------------------------------------
   // SMC
   output            rstn_non_srpg_smc;
   output            gate_clk_smc;
   output            isolate_smc;
   output            save_edge_smc;
   output            restore_edge_smc;
   output            pwr1_on_smc;
   output            pwr2_on_smc;
   // URT
   output            rstn_non_srpg_urt;
   output            gate_clk_urt;
   output            isolate_urt;
   output            save_edge_urt;
   output            restore_edge_urt;
   output            pwr1_on_urt;
   output            pwr2_on_urt;
   // ETH0
   output            rstn_non_srpg_macb0;
   output            gate_clk_macb0;
   output            isolate_macb0;
   output            save_edge_macb0;
   output            restore_edge_macb0;
   output            pwr1_on_macb0;
   output            pwr2_on_macb0;
   // ETH1
   output            rstn_non_srpg_macb1;
   output            gate_clk_macb1;
   output            isolate_macb1;
   output            save_edge_macb1;
   output            restore_edge_macb1;
   output            pwr1_on_macb1;
   output            pwr2_on_macb1;
   // ETH2
   output            rstn_non_srpg_macb2;
   output            gate_clk_macb2;
   output            isolate_macb2;
   output            save_edge_macb2;
   output            restore_edge_macb2;
   output            pwr1_on_macb2;
   output            pwr2_on_macb2;
   // ETH3
   output            rstn_non_srpg_macb3;
   output            gate_clk_macb3;
   output            isolate_macb3;
   output            save_edge_macb3;
   output            restore_edge_macb3;
   output            pwr1_on_macb3;
   output            pwr2_on_macb3;

   // dvfs
   output core06v;
   output core08v;
   output core10v;
   output core12v;
   output pcm_macb_wakeup_int ;
   output isolate_mem ;

   //transit  signals
   output mte_smc_start;
   output mte_uart_start;
   output mte_smc_uart_start;  
   output mte_pm_smc_to_default_start; 
   output mte_pm_uart_to_default_start;
   output mte_pm_smc_uart_to_default_start;



//##############################################################################
// if the POWER_CTRL is NOT black boxed 
//##############################################################################
`ifndef FV_KIT_BLACK_BOX_POWER_CTRL

power_ctrl i_power_ctrl(
    // -- Clocks & Reset
    	.pclk(pclk), 			//  : in  std_logic;
    	.nprst(nprst), 		//  : in  std_logic;
    // -- APB programming interface
    	.paddr(paddr), 			//  : in  std_logic_vector(31 downto 0);
    	.psel(psel), 			//  : in  std_logic;
    	.penable(penable), 		//  : in  std_logic;
    	.pwrite(pwrite), 		//  : in  std_logic;
    	.pwdata(pwdata), 		//  : in  std_logic_vector(31 downto 0);
    	.prdata(prdata), 		//  : out std_logic_vector(31 downto 0);
        .macb3_wakeup(macb3_wakeup),
        .macb2_wakeup(macb2_wakeup),
        .macb1_wakeup(macb1_wakeup),
        .macb0_wakeup(macb0_wakeup),
    // -- Module control outputs
    	.scan_in(),			//  : in  std_logic;
    	.scan_en(scan_en),             	//  : in  std_logic;
    	.scan_mode(scan_mode),          //  : in  std_logic;
    	.scan_out(),            	//  : out std_logic;
    	.int_source_h(int_source_h),    //  : out std_logic;
     	.rstn_non_srpg_smc(rstn_non_srpg_smc), 		//   : out std_logic;
    	.gate_clk_smc(gate_clk_smc), 	//  : out std_logic;
    	.isolate_smc(isolate_smc), 	//  : out std_logic;
    	.save_edge_smc(save_edge_smc), 	//  : out std_logic;
    	.restore_edge_smc(restore_edge_smc), 	//  : out std_logic;
    	.pwr1_on_smc(pwr1_on_smc), 	//  : out std_logic;
    	.pwr2_on_smc(pwr2_on_smc), 	//  : out std_logic
	.pwr1_off_smc(pwr1_off_smc), 	//  : out std_logic;
    	.pwr2_off_smc(pwr2_off_smc), 	//  : out std_logic
     	.rstn_non_srpg_urt(rstn_non_srpg_urt), 		//   : out std_logic;
    	.gate_clk_urt(gate_clk_urt), 	//  : out std_logic;
    	.isolate_urt(isolate_urt), 	//  : out std_logic;
    	.save_edge_urt(save_edge_urt), 	//  : out std_logic;
    	.restore_edge_urt(restore_edge_urt), 	//  : out std_logic;
    	.pwr1_on_urt(pwr1_on_urt), 	//  : out std_logic;
    	.pwr2_on_urt(pwr2_on_urt), 	//  : out std_logic;
    	.pwr1_off_urt(pwr1_off_urt),    //  : out std_logic;
    	.pwr2_off_urt(pwr2_off_urt),     //  : out std_logic
     	.rstn_non_srpg_macb0(rstn_non_srpg_macb0), 		//   : out std_logic;
    	.gate_clk_macb0(gate_clk_macb0), 	//  : out std_logic;
    	.isolate_macb0(isolate_macb0), 	//  : out std_logic;
    	.save_edge_macb0(save_edge_macb0), 	//  : out std_logic;
    	.restore_edge_macb0(restore_edge_macb0), 	//  : out std_logic;
    	.pwr1_on_macb0(pwr1_on_macb0), 	//  : out std_logic;
    	.pwr2_on_macb0(pwr2_on_macb0), 	//  : out std_logic;
    	.pwr1_off_macb0(pwr1_off_macb0),    //  : out std_logic;
    	.pwr2_off_macb0(pwr2_off_macb0),     //  : out std_logic
     	.rstn_non_srpg_macb1(rstn_non_srpg_macb1), 		//   : out std_logic;
    	.gate_clk_macb1(gate_clk_macb1), 	//  : out std_logic;
    	.isolate_macb1(isolate_macb1), 	//  : out std_logic;
    	.save_edge_macb1(save_edge_macb1), 	//  : out std_logic;
    	.restore_edge_macb1(restore_edge_macb1), 	//  : out std_logic;
    	.pwr1_on_macb1(pwr1_on_macb1), 	//  : out std_logic;
    	.pwr2_on_macb1(pwr2_on_macb1), 	//  : out std_logic;
    	.pwr1_off_macb1(pwr1_off_macb1),    //  : out std_logic;
    	.pwr2_off_macb1(pwr2_off_macb1),     //  : out std_logic
     	.rstn_non_srpg_macb2(rstn_non_srpg_macb2), 		//   : out std_logic;
    	.gate_clk_macb2(gate_clk_macb2), 	//  : out std_logic;
    	.isolate_macb2(isolate_macb2), 	//  : out std_logic;
    	.save_edge_macb2(save_edge_macb2), 	//  : out std_logic;
    	.restore_edge_macb2(restore_edge_macb2), 	//  : out std_logic;
    	.pwr1_on_macb2(pwr1_on_macb2), 	//  : out std_logic;
    	.pwr2_on_macb2(pwr2_on_macb2), 	//  : out std_logic;
    	.pwr1_off_macb2(pwr1_off_macb2),    //  : out std_logic;
    	.pwr2_off_macb2(pwr2_off_macb2),     //  : out std_logic
     	.rstn_non_srpg_macb3(rstn_non_srpg_macb3), 		//   : out std_logic;
    	.gate_clk_macb3(gate_clk_macb3), 	//  : out std_logic;
    	.isolate_macb3(isolate_macb3), 	//  : out std_logic;
    	.save_edge_macb3(save_edge_macb3), 	//  : out std_logic;
    	.restore_edge_macb3(restore_edge_macb3), 	//  : out std_logic;
    	.pwr1_on_macb3(pwr1_on_macb3), 	//  : out std_logic;
    	.pwr2_on_macb3(pwr2_on_macb3), 	//  : out std_logic;
    	.pwr1_off_macb3(pwr1_off_macb3),    //  : out std_logic;
    	.pwr2_off_macb3(pwr2_off_macb3),     //  : out std_logic
        .rstn_non_srpg_dma(rstn_non_srpg_dma ) ,
        .gate_clk_dma(gate_clk_dma      )      ,
        .isolate_dma(isolate_dma       )       ,
        .save_edge_dma(save_edge_dma   )   ,
        .restore_edge_dma(restore_edge_dma   )   ,
        .pwr1_on_dma(pwr1_on_dma       )       ,
        .pwr2_on_dma(pwr2_on_dma       )       ,
        .pwr1_off_dma(pwr1_off_dma      )      ,
        .pwr2_off_dma(pwr2_off_dma      )      ,
        
        .rstn_non_srpg_cpu(rstn_non_srpg_cpu ) ,
        .gate_clk_cpu(gate_clk_cpu      )      ,
        .isolate_cpu(isolate_cpu       )       ,
        .save_edge_cpu(save_edge_cpu   )   ,
        .restore_edge_cpu(restore_edge_cpu   )   ,
        .pwr1_on_cpu(pwr1_on_cpu       )       ,
        .pwr2_on_cpu(pwr2_on_cpu       )       ,
        .pwr1_off_cpu(pwr1_off_cpu      )      ,
        .pwr2_off_cpu(pwr2_off_cpu      )      ,
        
        .rstn_non_srpg_alut(rstn_non_srpg_alut ) ,
        .gate_clk_alut(gate_clk_alut      )      ,
        .isolate_alut(isolate_alut       )       ,
        .save_edge_alut(save_edge_alut   )   ,
        .restore_edge_alut(restore_edge_alut   )   ,
        .pwr1_on_alut(pwr1_on_alut       )       ,
        .pwr2_on_alut(pwr2_on_alut       )       ,
        .pwr1_off_alut(pwr1_off_alut      )      ,
        .pwr2_off_alut(pwr2_off_alut      )      ,
        
        .rstn_non_srpg_mem(rstn_non_srpg_mem ) ,
        .gate_clk_mem(gate_clk_mem      )      ,
        .isolate_mem(isolate_mem       )       ,
        .save_edge_mem(save_edge_mem   )   ,
        .restore_edge_mem(restore_edge_mem   )   ,
        .pwr1_on_mem(pwr1_on_mem       )       ,
        .pwr2_on_mem(pwr2_on_mem       )       ,
        .pwr1_off_mem(pwr1_off_mem      )      ,
        .pwr2_off_mem(pwr2_off_mem      )      ,

    	.core06v(core06v),     //  : out std_logic
    	.core08v(core08v),     //  : out std_logic
    	.core10v(core10v),     //  : out std_logic
    	.core12v(core12v),     //  : out std_logic
        .pcm_macb_wakeup_int(pcm_macb_wakeup_int),
        .mte_smc_start(mte_smc_start),
        .mte_uart_start(mte_uart_start),
        .mte_smc_uart_start(mte_smc_uart_start),  
        .mte_pm_smc_to_default_start(mte_pm_smc_to_default_start), 
        .mte_pm_uart_to_default_start(mte_pm_uart_to_default_start),
        .mte_pm_smc_uart_to_default_start(mte_pm_smc_uart_to_default_start)
);


`else 
//##############################################################################
// if the POWER_CTRL is black boxed 
//##############################################################################

   //------------------------------------
   // Clocks & Reset
   //------------------------------------
   wire              pclk;
   wire              nprst;
   //------------------------------------
   // APB programming interface;
   //------------------------------------
   wire   [31:0]     paddr;
   wire              psel;
   wire              penable;
   wire              pwrite;
   wire   [31:0]     pwdata;
   reg    [31:0]     prdata;
   //------------------------------------
   // Scan
   //------------------------------------
   wire              scan_in;
   wire              scan_en;
   wire              scan_mode;
   reg               scan_out;
   //------------------------------------
   // Module control outputs
   //------------------------------------
   // SMC;
   reg               rstn_non_srpg_smc;
   reg               gate_clk_smc;
   reg               isolate_smc;
   reg               save_edge_smc;
   reg               restore_edge_smc;
   reg               pwr1_on_smc;
   reg               pwr2_on_smc;
   wire              pwr1_off_smc;
   wire              pwr2_off_smc;

   // URT;
   reg               rstn_non_srpg_urt;
   reg               gate_clk_urt;
   reg               isolate_urt;
   reg               save_edge_urt;
   reg               restore_edge_urt;
   reg               pwr1_on_urt;
   reg               pwr2_on_urt;
   wire              pwr1_off_urt;
   wire              pwr2_off_urt;

   // ETH0
   reg               rstn_non_srpg_macb0;
   reg               gate_clk_macb0;
   reg               isolate_macb0;
   reg               save_edge_macb0;
   reg               restore_edge_macb0;
   reg               pwr1_on_macb0;
   reg               pwr2_on_macb0;
   wire              pwr1_off_macb0;
   wire              pwr2_off_macb0;
   // ETH1
   reg               rstn_non_srpg_macb1;
   reg               gate_clk_macb1;
   reg               isolate_macb1;
   reg               save_edge_macb1;
   reg               restore_edge_macb1;
   reg               pwr1_on_macb1;
   reg               pwr2_on_macb1;
   wire              pwr1_off_macb1;
   wire              pwr2_off_macb1;
   // ETH2
   reg               rstn_non_srpg_macb2;
   reg               gate_clk_macb2;
   reg               isolate_macb2;
   reg               save_edge_macb2;
   reg               restore_edge_macb2;
   reg               pwr1_on_macb2;
   reg               pwr2_on_macb2;
   wire              pwr1_off_macb2;
   wire              pwr2_off_macb2;
   // ETH3
   reg               rstn_non_srpg_macb3;
   reg               gate_clk_macb3;
   reg               isolate_macb3;
   reg               save_edge_macb3;
   reg               restore_edge_macb3;
   reg               pwr1_on_macb3;
   reg               pwr2_on_macb3;
   wire              pwr1_off_macb3;
   wire              pwr2_off_macb3;

   wire core06v;
   wire core08v;
   wire core10v;
   wire core12v;



`endif
//##############################################################################
// black boxed defines 
//##############################################################################

endmodule
