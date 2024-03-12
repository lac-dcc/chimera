// Switch network arbiter
// Wishbone B3 signals compliant 

`define NUM_MASTERS_4
`define NUM_SLAVES_5
`define WATCHDOG_TIMER

`ifdef NUM_MASTERS_6
 `define NUM_MASTERS 6
 `define WBM5
 `define WBM4
 `define WBM3
 `define WBM2
 `define WBM1
`else
 `ifdef NUM_MASTERS_5
  `define NUM_MASTERS 5
  `define WBM4
  `define WBM3
  `define WBM2
  `define WBM1
 `else
  `ifdef NUM_MASTERS_4
   `define NUM_MASTERS 4
   `define WBM3
   `define WBM2
   `define WBM1
  `else
   `ifdef NUM_MASTERS_3
    `define NUM_MASTERS 3
    `define WBM2
    `define WBM1
   `else
    `ifdef NUM_MASTERS_2
     `define NUM_MASTERS 2
     `define WBM1
    `else
     `define NUM_MASTERS 1
    `endif
   `endif // !`ifdef NUM_MASTERS_3
  `endif // !`ifdef NUM_MASTERS_4
 `endif // !`ifdef NUM_MASTERS_5
`endif // !`ifdef NUM_MASTERS_6


`ifdef NUM_SLAVES_8
 `define NUM_SLAVES 8
 `define WBS7
 `define WBS6
 `define WBS5
 `define WBS4
 `define WBS3
 `define WBS2
 `define WBS1
`else
 `ifdef NUM_SLAVES_7
  `define NUM_SLAVES 7
  `define WBS6
  `define WBS5
  `define WBS4
  `define WBS3
  `define WBS2
  `define WBS1
 `else
  `ifdef NUM_SLAVES_6
   `define NUM_SLAVES 6
   `define WBS5
   `define WBS4
   `define WBS3
   `define WBS2
   `define WBS1
  `else
   `ifdef NUM_SLAVES_5
    `define NUM_SLAVES 5
    `define WBS4
    `define WBS3
    `define WBS2
    `define WBS1
   `else
    `ifdef NUM_SLAVES_4
     `define NUM_SLAVES 4
     `define WBS3
     `define WBS2
     `define WBS1
    `else
     `ifdef NUM_SLAVES_3
      `define NUM_SLAVES 3
      `define WBS2
      `define WBS1
     `else
      `ifdef NUM_SLAVES_2
       `define NUM_SLAVES 2
       `define WBS1
      `else
       `define NUM_SLAVES 1
      `endif
     `endif
    `endif // !`ifdef NUM_SLAVES_4
   `endif // !`ifdef NUM_SLAVES_5
  `endif // !`ifdef NUM_SLAVES_6
 `endif // !`ifdef NUM_SLAVES_7
`endif // !`ifdef NUM_SLAVES_8



module wb_switch_b3
  (
   // Master ports
   wbm0_adr_o, wbm0_bte_o, wbm0_cti_o, wbm0_cyc_o, wbm0_dat_o, wbm0_sel_o,
   wbm0_stb_o, wbm0_we_o, wbm0_ack_i, wbm0_err_i, wbm0_rty_i, wbm0_dat_i,
`ifdef WBM1		    
   wbm1_adr_o, wbm1_bte_o, wbm1_cti_o, wbm1_cyc_o, wbm1_dat_o, wbm1_sel_o,
   wbm1_stb_o, wbm1_we_o, wbm1_ack_i, wbm1_err_i, wbm1_rty_i, wbm1_dat_i,
`endif
`ifdef WBM2		    		     
   wbm2_adr_o, wbm2_bte_o, wbm2_cti_o, wbm2_cyc_o, wbm2_dat_o, wbm2_sel_o,
   wbm2_stb_o, wbm2_we_o, wbm2_ack_i, wbm2_err_i, wbm2_rty_i, wbm2_dat_i,
`endif
`ifdef WBM3		    		     
   wbm3_adr_o, wbm3_bte_o, wbm3_cti_o, wbm3_cyc_o, wbm3_dat_o, wbm3_sel_o,
   wbm3_stb_o, wbm3_we_o, wbm3_ack_i, wbm3_err_i, wbm3_rty_i, wbm3_dat_i,
`endif
`ifdef WBM4		    		     
   wbm4_adr_o, wbm4_bte_o, wbm4_cti_o, wbm4_cyc_o, wbm4_dat_o, wbm4_sel_o,
   wbm4_stb_o, wbm4_we_o, wbm4_ack_i, wbm4_err_i, wbm4_rty_i, wbm4_dat_i,
`endif
`ifdef WBM5		    		     
   wbm5_adr_o, wbm5_bte_o, wbm5_cti_o, wbm5_cyc_o, wbm5_dat_o, wbm5_sel_o,
   wbm5_stb_o, wbm5_we_o, wbm5_ack_i, wbm5_err_i, wbm5_rty_i, wbm5_dat_i,
`endif
   
   // Slave ports
   wbs0_adr_i, wbs0_bte_i, wbs0_cti_i, wbs0_cyc_i, wbs0_dat_i, wbs0_sel_i,
   wbs0_stb_i, wbs0_we_i, wbs0_ack_o, wbs0_err_o, wbs0_rty_o, wbs0_dat_o,   
`ifdef WBS1
   wbs1_adr_i, wbs1_bte_i, wbs1_cti_i, wbs1_cyc_i, wbs1_dat_i, wbs1_sel_i,
   wbs1_stb_i, wbs1_we_i, wbs1_ack_o, wbs1_err_o, wbs1_rty_o, wbs1_dat_o,
`endif
`ifdef WBS2
   wbs2_adr_i, wbs2_bte_i, wbs2_cti_i, wbs2_cyc_i, wbs2_dat_i, wbs2_sel_i,
   wbs2_stb_i, wbs2_we_i, wbs2_ack_o, wbs2_err_o, wbs2_rty_o, wbs2_dat_o,
`endif		     
`ifdef WBS3
   wbs3_adr_i, wbs3_bte_i, wbs3_cti_i, wbs3_cyc_i, wbs3_dat_i, wbs3_sel_i,
   wbs3_stb_i, wbs3_we_i, wbs3_ack_o, wbs3_err_o, wbs3_rty_o, wbs3_dat_o,
`endif
`ifdef WBS4
   wbs4_adr_i, wbs4_bte_i, wbs4_cti_i, wbs4_cyc_i, wbs4_dat_i, wbs4_sel_i,
   wbs4_stb_i, wbs4_we_i, wbs4_ack_o, wbs4_err_o, wbs4_rty_o, wbs4_dat_o,
`endif
`ifdef WBS5
   wbs5_adr_i, wbs5_bte_i, wbs5_cti_i, wbs5_cyc_i, wbs5_dat_i, wbs5_sel_i,
   wbs5_stb_i, wbs5_we_i, wbs5_ack_o, wbs5_err_o, wbs5_rty_o, wbs5_dat_o,
`endif
`ifdef WBS6
   wbs6_adr_i, wbs6_bte_i, wbs6_cti_i, wbs6_cyc_i, wbs6_dat_i, wbs6_sel_i,
   wbs6_stb_i, wbs6_we_i, wbs6_ack_o, wbs6_err_o, wbs6_rty_o, wbs6_dat_o,
`endif
`ifdef WBS7
   wbs7_adr_i, wbs7_bte_i, wbs7_cti_i, wbs7_cyc_i, wbs7_dat_i, wbs7_sel_i,
   wbs7_stb_i, wbs7_we_i, wbs7_ack_o, wbs7_err_o, wbs7_rty_o, wbs7_dat_o,
`endif
   
   // Clocks, resets
   wb_clk, wb_rst
   );
   // Data and address width parameters
   parameter dw = 32;
   parameter aw = 32;

   input [aw-1:0] wbm0_adr_o;input [1:0] wbm0_bte_o;input [2:0]	wbm0_cti_o;input wbm0_cyc_o;input [dw-1:0] wbm0_dat_o;input [3:0] wbm0_sel_o;input wbm0_stb_o;input wbm0_we_o;output wbm0_ack_i;output wbm0_err_i;output wbm0_rty_i;output [dw-1:0] wbm0_dat_i;
`ifdef WBM1
   input [aw-1:0] wbm1_adr_o;input [1:0] wbm1_bte_o;input [2:0]	wbm1_cti_o;input wbm1_cyc_o;input [dw-1:0] wbm1_dat_o;input [3:0] wbm1_sel_o;input wbm1_stb_o;input wbm1_we_o;output wbm1_ack_i;output wbm1_err_i;output wbm1_rty_i;output [dw-1:0] wbm1_dat_i;   
`endif
`ifdef WBM2
   input [aw-1:0] wbm2_adr_o;input [1:0] wbm2_bte_o;input [2:0]	wbm2_cti_o;input wbm2_cyc_o;input [dw-1:0] wbm2_dat_o;input [3:0] wbm2_sel_o;input wbm2_stb_o;input wbm2_we_o;output wbm2_ack_i;output wbm2_err_i;output wbm2_rty_i;output [dw-1:0] wbm2_dat_i;   
`endif
`ifdef WBM3
   input [aw-1:0] wbm3_adr_o;input [1:0] wbm3_bte_o;input [2:0]	wbm3_cti_o;input wbm3_cyc_o;input [dw-1:0] wbm3_dat_o;input [3:0] wbm3_sel_o;input wbm3_stb_o;input wbm3_we_o;output wbm3_ack_i;output wbm3_err_i;output wbm3_rty_i;output [dw-1:0] wbm3_dat_i;   
`endif
`ifdef WBM4
   input [aw-1:0] wbm4_adr_o;input [1:0] wbm4_bte_o;input [2:0]	wbm4_cti_o;input wbm4_cyc_o;input [dw-1:0] wbm4_dat_o;input [3:0] wbm4_sel_o;input wbm4_stb_o;input wbm4_we_o;output wbm4_ack_i;output wbm4_err_i;output wbm4_rty_i;output [dw-1:0] wbm4_dat_i;   
`endif
`ifdef WBM5
   input [aw-1:0] wbm5_adr_o;input [1:0] wbm5_bte_o;input [2:0]	wbm5_cti_o;input wbm5_cyc_o;input [dw-1:0] wbm5_dat_o;input [3:0] wbm5_sel_o;input wbm5_stb_o;input wbm5_we_o;output wbm5_ack_i;output wbm5_err_i;output wbm5_rty_i;output [dw-1:0] wbm5_dat_i;   
`endif

   output [aw-1:0] wbs0_adr_i;output [1:0] wbs0_bte_i;output [2:0]	wbs0_cti_i;output wbs0_cyc_i;output [dw-1:0] wbs0_dat_i;output [3:0] wbs0_sel_i;output wbs0_stb_i;output wbs0_we_i;input wbs0_ack_o;input wbs0_err_o;input wbs0_rty_o;input [dw-1:0] wbs0_dat_o;

`ifdef WBS1
   output [aw-1:0] wbs1_adr_i;output [1:0] wbs1_bte_i;output [2:0]	wbs1_cti_i;output wbs1_cyc_i;output [dw-1:0] wbs1_dat_i;output [3:0] wbs1_sel_i;output wbs1_stb_i;output wbs1_we_i;input wbs1_ack_o;input wbs1_err_o;input wbs1_rty_o;input [dw-1:0] wbs1_dat_o;
`endif
`ifdef WBS2
   output [aw-1:0] wbs2_adr_i;output [1:0] wbs2_bte_i;output [2:0]	wbs2_cti_i;output wbs2_cyc_i;output [dw-1:0] wbs2_dat_i;output [3:0] wbs2_sel_i;output wbs2_stb_i;output wbs2_we_i;input wbs2_ack_o;input wbs2_err_o;input wbs2_rty_o;input [dw-1:0] wbs2_dat_o;
`endif
`ifdef WBS3
   output [aw-1:0] wbs3_adr_i;output [1:0] wbs3_bte_i;output [2:0]	wbs3_cti_i;output wbs3_cyc_i;output [dw-1:0] wbs3_dat_i;output [3:0] wbs3_sel_i;output wbs3_stb_i;output wbs3_we_i;input wbs3_ack_o;input wbs3_err_o;input wbs3_rty_o;input [dw-1:0] wbs3_dat_o;
`endif
`ifdef WBS4
   output [aw-1:0] wbs4_adr_i;output [1:0] wbs4_bte_i;output [2:0]	wbs4_cti_i;output wbs4_cyc_i;output [dw-1:0] wbs4_dat_i;output [3:0] wbs4_sel_i;output wbs4_stb_i;output wbs4_we_i;input wbs4_ack_o;input wbs4_err_o;input wbs4_rty_o;input [dw-1:0] wbs4_dat_o;
`endif
`ifdef WBS5
   output [aw-1:0] wbs5_adr_i;output [1:0] wbs5_bte_i;output [2:0]	wbs5_cti_i;output wbs5_cyc_i;output [dw-1:0] wbs5_dat_i;output [3:0] wbs5_sel_i;output wbs5_stb_i;output wbs5_we_i;input wbs5_ack_o;input wbs5_err_o;input wbs5_rty_o;input [dw-1:0] wbs5_dat_o;
`endif
`ifdef WBS6
   output [aw-1:0] wbs6_adr_i;output [1:0] wbs6_bte_i;output [2:0]	wbs6_cti_i;output wbs6_cyc_i;output [dw-1:0] wbs6_dat_i;output [3:0] wbs6_sel_i;output wbs6_stb_i;output wbs6_we_i;input wbs6_ack_o;input wbs6_err_o;input wbs6_rty_o;input [dw-1:0] wbs6_dat_o;
`endif
`ifdef WBS7
   output [aw-1:0] wbs7_adr_i;output [1:0] wbs7_bte_i;output [2:0]	wbs7_cti_i;output wbs7_cyc_i;output [dw-1:0] wbs7_dat_i;output [3:0] wbs7_sel_i;output wbs7_stb_i;output wbs7_we_i;input wbs7_ack_o;input wbs7_err_o;input wbs7_rty_o;input [dw-1:0] wbs7_dat_o;
`endif

   input 	   wb_clk, wb_rst;
   
   
   // have a master select for each slave, meaning multiple slaves could be driven at a time
   wire [`NUM_MASTERS-1:0] wbs0_master_sel;
   wire 		   wbs0_master_sel_new;
`ifdef WBS1
   wire [`NUM_MASTERS-1:0] wbs1_master_sel;
   wire 		   wbs1_master_sel_new;
`endif
`ifdef WBS2
   wire [`NUM_MASTERS-1:0] wbs2_master_sel;
   wire 		   wbs2_master_sel_new;
`endif
`ifdef WBS3
   wire [`NUM_MASTERS-1:0] wbs3_master_sel;
   wire 		   wbs3_master_sel_new;   
`endif
`ifdef WBS4
   wire [`NUM_MASTERS-1:0] wbs4_master_sel;
   wire 		   wbs4_master_sel_new;   
`endif
`ifdef WBS5
   wire [`NUM_MASTERS-1:0] wbs5_master_sel;
   wire 		   wbs5_master_sel_new;   
`endif
`ifdef WBS6
   wire [`NUM_MASTERS-1:0] wbs6_master_sel;
   wire 		   wbs6_master_sel_new;   
`endif
`ifdef WBS7
   wire [`NUM_MASTERS-1:0] wbs7_master_sel;
   wire 		   wbs7_master_sel_new;   
`endif

   wire [`NUM_SLAVES-1:0]  wbm0_slave_sel;
`ifdef WBM1   
   wire [`NUM_SLAVES-1:0]  wbm1_slave_sel;
`endif
`ifdef WBM2
   wire [`NUM_SLAVES-1:0]  wbm2_slave_sel;
`endif
`ifdef WBM3   
   wire [`NUM_SLAVES-1:0]  wbm3_slave_sel;
`endif
`ifdef WBM4
   wire [`NUM_SLAVES-1:0]  wbm4_slave_sel;
`endif
`ifdef WBM5
   wire [`NUM_SLAVES-1:0]  wbm5_slave_sel;
`endif
   
   // Should probably be def-param'd outside
   parameter slave0_sel_width = -1;
   parameter slave0_sel_addr = 4'hx;
   
   parameter slave1_sel_width = -1;
   parameter slave1_sel_addr = 4'hx;

   parameter slave2_sel_width = -1;
   parameter slave2_sel_addr = 8'hxx;

   parameter slave3_sel_width = -1;
   parameter slave3_sel_addr = 8'hxx;

   parameter slave4_sel_width = -1;
   parameter slave4_sel_addr = 8'hxx;

   parameter slave5_sel_width = -1;
   parameter slave5_sel_addr = 8'hxx;
   
   parameter slave6_sel_width = -1;
   parameter slave6_sel_addr = 8'hxx;
   
   parameter slave7_sel_width = -1;
   parameter slave7_sel_addr = 8'hxx;



   ///////////////////////////////////////////////////////////////////////////
   // Slave Select logic                                                    //
   ///////////////////////////////////////////////////////////////////////////
   
   // Slave select logic, for each master   
   wb_b3_switch_slave_sel slave_sel0
     (
      // Outputs
      .wbs_master_sel			(wbs0_master_sel),
      .wbs_master_sel_new		(wbs0_master_sel_new),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
`endif
`ifdef WBM2
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
`endif
`ifdef WBM3            
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
`endif
`ifdef WBM4            
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
`endif      
`ifdef WBM5            
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
`endif      
      
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));

   defparam slave_sel0.num_masters = `NUM_MASTERS;
   defparam slave_sel0.slave_sel_bit_width = slave0_sel_width;   
   defparam slave_sel0.slave_addr = slave0_sel_addr;


`ifdef WBS1
   // Slave selec logic, for each master   
   wb_b3_switch_slave_sel slave_sel1
     (
      // Outputs
      .wbs_master_sel			(wbs1_master_sel),
      .wbs_master_sel_new		(wbs1_master_sel_new),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
`endif
`ifdef WBM2
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
`endif
`ifdef WBM3            
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
`endif
`ifdef WBM4            
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
`endif      
`ifdef WBM5            
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
`endif      
      
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));

   defparam slave_sel1.num_masters = `NUM_MASTERS;
   defparam slave_sel1.slave_sel_bit_width = slave1_sel_width;   
   defparam slave_sel1.slave_addr = slave1_sel_addr;

`endif //  `ifdef WBS1
   

`ifdef WBS2
   // Slave selec logic, for each master   
   wb_b3_switch_slave_sel slave_sel2
     (
      // Outputs
      .wbs_master_sel			(wbs2_master_sel),
      .wbs_master_sel_new		(wbs2_master_sel_new),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
`endif
`ifdef WBM2
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
`endif
`ifdef WBM3            
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
`endif
`ifdef WBM4            
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
`endif      
`ifdef WBM5            
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
`endif      
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));
   
   defparam slave_sel2.num_masters = `NUM_MASTERS;
   defparam slave_sel2.slave_sel_bit_width = slave2_sel_width;   
   defparam slave_sel2.slave_addr = slave2_sel_addr;
   
`endif //  `ifdef WBS2

`ifdef WBS3
   // Slave selec logic, for each master   
   wb_b3_switch_slave_sel slave_sel3
     (
      // Outputs
      .wbs_master_sel			(wbs3_master_sel),
      .wbs_master_sel_new		(wbs3_master_sel_new),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
`endif
`ifdef WBM2
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
`endif
`ifdef WBM3            
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
`endif
`ifdef WBM4            
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
`endif      
`ifdef WBM5            
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
`endif      
      
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));

   defparam slave_sel3.num_masters = `NUM_MASTERS;
   defparam slave_sel3.slave_sel_bit_width = slave3_sel_width;   
   defparam slave_sel3.slave_addr = slave3_sel_addr;

`endif //  `ifdef WBS3

`ifdef WBS4
   // Slave selec logic, for each master   
   wb_b3_switch_slave_sel slave_sel4
     (
      // Outputs
      .wbs_master_sel			(wbs4_master_sel),
      .wbs_master_sel_new		(wbs4_master_sel_new),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
`endif
`ifdef WBM2
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
`endif
`ifdef WBM3            
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
`endif
`ifdef WBM4            
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
`endif      
`ifdef WBM5            
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
`endif      
      
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));

   defparam slave_sel4.num_masters = `NUM_MASTERS;
   defparam slave_sel4.slave_sel_bit_width = slave4_sel_width;   
   defparam slave_sel4.slave_addr = slave4_sel_addr;

`endif //  `ifdef WBS4
`ifdef WBS5
   // Slave selec logic, for each master   
   wb_b3_switch_slave_sel slave_sel5
     (
      // Outputs
      .wbs_master_sel			(wbs5_master_sel),
      .wbs_master_sel_new		(wbs5_master_sel_new),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
`endif
`ifdef WBM2
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
`endif
`ifdef WBM3            
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
`endif
`ifdef WBM4            
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
`endif      
`ifdef WBM5            
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
`endif      
      
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));

   defparam slave_sel5.num_masters = `NUM_MASTERS;
   defparam slave_sel5.slave_sel_bit_width = slave5_sel_width;   
   defparam slave_sel5.slave_addr = slave5_sel_addr;

`endif //  `ifdef WBS5
`ifdef WBS6
   // Slave selec logic, for each master   
   wb_b3_switch_slave_sel slave_sel6
     (
      // Outputs
      .wbs_master_sel			(wbs6_master_sel),
      .wbs_master_sel_new		(wbs6_master_sel_new),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
`endif
`ifdef WBM2
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
`endif
`ifdef WBM3            
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
`endif
`ifdef WBM4            
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
`endif      
`ifdef WBM5            
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
`endif      
      
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));

   defparam slave_sel6.num_masters = `NUM_MASTERS;
   defparam slave_sel6.slave_sel_bit_width = slave6_sel_width;   
   defparam slave_sel6.slave_addr = slave6_sel_addr;

`endif //  `ifdef WBS6
`ifdef WBS7
   // Slave selec logic, for each master   
   wb_b3_switch_slave_sel slave_sel7
     (
      // Outputs
      .wbs_master_sel			(wbs7_master_sel),
      .wbs_master_sel_new		(wbs7_master_sel_new),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
`endif
`ifdef WBM2
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
`endif
`ifdef WBM3            
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
`endif
`ifdef WBM4            
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
`endif      
`ifdef WBM5            
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
`endif      
      
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));

   defparam slave_sel7.num_masters = `NUM_MASTERS;
   defparam slave_sel7.slave_sel_bit_width = slave7_sel_width;   
   defparam slave_sel7.slave_addr = slave7_sel_addr;

`endif //  `ifdef WBS7
   
   /////////////////////////////////////////////////////////////////////////////
   // Master slave detection: detect which slave has selected each master
   /////////////////////////////////////////////////////////////////////////////
   wb_b3_switch_master_detect_slave_sel master_detect_slave0
     (
      // Outputs
      .wbm_slave_sel			(wbm0_slave_sel),
      // Inputs
      .wbs0_master_sel			(wbs0_master_sel),
      .wbs0_master_sel_new		(wbs0_master_sel_new),
`ifdef WBS1      
      .wbs1_master_sel			(wbs1_master_sel),
      .wbs1_master_sel_new		(wbs1_master_sel_new),
`endif
`ifdef WBS2      
      .wbs2_master_sel			(wbs2_master_sel),
      .wbs2_master_sel_new		(wbs2_master_sel_new),
`endif
`ifdef WBS3      
      .wbs3_master_sel			(wbs3_master_sel),
      .wbs3_master_sel_new		(wbs3_master_sel_new),
`endif
`ifdef WBS4      
      .wbs4_master_sel			(wbs4_master_sel),
      .wbs4_master_sel_new		(wbs4_master_sel_new),
`endif
`ifdef WBS5      
      .wbs5_master_sel			(wbs5_master_sel),
      .wbs5_master_sel_new		(wbs5_master_sel_new),
`endif      
`ifdef WBS6      
      .wbs6_master_sel			(wbs6_master_sel),
      .wbs6_master_sel_new		(wbs6_master_sel_new),
`endif      
`ifdef WBS7      
      .wbs7_master_sel			(wbs7_master_sel),
      .wbs7_master_sel_new		(wbs7_master_sel_new),
`endif      
      .wb_clk(wb_clk),
      .wb_rst(wb_rst)
      );
   defparam master_detect_slave0.slave_bit = 0;
   
`ifdef WBM1
   wb_b3_switch_master_detect_slave_sel master_detect_slave1
     (
      // Outputs
      .wbm_slave_sel			(wbm1_slave_sel),
      // Inputs
      .wbs0_master_sel			(wbs0_master_sel),
      .wbs0_master_sel_new		(wbs0_master_sel_new),
`ifdef WBS1      
      .wbs1_master_sel			(wbs1_master_sel),
      .wbs1_master_sel_new		(wbs1_master_sel_new),
`endif
`ifdef WBS2      
      .wbs2_master_sel			(wbs2_master_sel),
      .wbs2_master_sel_new		(wbs2_master_sel_new),
`endif
`ifdef WBS3      
      .wbs3_master_sel			(wbs3_master_sel),
      .wbs3_master_sel_new		(wbs3_master_sel_new),
`endif
`ifdef WBS4      
      .wbs4_master_sel			(wbs4_master_sel),
      .wbs4_master_sel_new		(wbs4_master_sel_new),
`endif
`ifdef WBS5      
      .wbs5_master_sel			(wbs5_master_sel),
      .wbs5_master_sel_new		(wbs5_master_sel_new),
`endif      
`ifdef WBS6      
      .wbs6_master_sel			(wbs6_master_sel),
      .wbs6_master_sel_new		(wbs6_master_sel_new),
`endif      
`ifdef WBS7      
      .wbs7_master_sel			(wbs7_master_sel),
      .wbs7_master_sel_new		(wbs7_master_sel_new),
`endif      
      .wb_clk(wb_clk),
      .wb_rst(wb_rst)
      );
   defparam master_detect_slave1.slave_bit = 1;
`endif //  `ifdef WBM1

`ifdef WBM2
      wb_b3_switch_master_detect_slave_sel master_detect_slave2
     (
      // Outputs
      .wbm_slave_sel			(wbm2_slave_sel),
      // Inputs
      .wbs0_master_sel			(wbs0_master_sel),
      .wbs0_master_sel_new		(wbs0_master_sel_new),
`ifdef WBS1      
      .wbs1_master_sel			(wbs1_master_sel),
      .wbs1_master_sel_new		(wbs1_master_sel_new),
`endif
`ifdef WBS2      
      .wbs2_master_sel			(wbs2_master_sel),
      .wbs2_master_sel_new		(wbs2_master_sel_new),
`endif
`ifdef WBS3      
      .wbs3_master_sel			(wbs3_master_sel),
      .wbs3_master_sel_new		(wbs3_master_sel_new),
`endif
`ifdef WBS4      
      .wbs4_master_sel			(wbs4_master_sel),
      .wbs4_master_sel_new		(wbs4_master_sel_new),
`endif
`ifdef WBS5      
      .wbs5_master_sel			(wbs5_master_sel),
      .wbs5_master_sel_new		(wbs5_master_sel_new),
`endif      
`ifdef WBS6      
      .wbs6_master_sel			(wbs6_master_sel),
      .wbs6_master_sel_new		(wbs6_master_sel_new),
`endif      
`ifdef WBS7      
      .wbs7_master_sel			(wbs7_master_sel),
      .wbs7_master_sel_new		(wbs7_master_sel_new),
`endif      
      .wb_clk(wb_clk),
      .wb_rst(wb_rst)
      );
   defparam master_detect_slave2.slave_bit = 2;
`endif //  `ifdef WBM2
   
`ifdef WBM3
      wb_b3_switch_master_detect_slave_sel master_detect_slave3
     (
      // Outputs
      .wbm_slave_sel			(wbm3_slave_sel),
      // Inputs
      .wbs0_master_sel			(wbs0_master_sel),
      .wbs0_master_sel_new		(wbs0_master_sel_new),
`ifdef WBS1      
      .wbs1_master_sel			(wbs1_master_sel),
      .wbs1_master_sel_new		(wbs1_master_sel_new),
`endif
`ifdef WBS2      
      .wbs2_master_sel			(wbs2_master_sel),
      .wbs2_master_sel_new		(wbs2_master_sel_new),
`endif
`ifdef WBS3      
      .wbs3_master_sel			(wbs3_master_sel),
      .wbs3_master_sel_new		(wbs3_master_sel_new),
`endif
`ifdef WBS4      
      .wbs4_master_sel			(wbs4_master_sel),
      .wbs4_master_sel_new		(wbs4_master_sel_new),
`endif
`ifdef WBS5      
      .wbs5_master_sel			(wbs5_master_sel),
      .wbs5_master_sel_new		(wbs5_master_sel_new),
`endif      
`ifdef WBS6      
      .wbs6_master_sel			(wbs6_master_sel),
      .wbs6_master_sel_new		(wbs6_master_sel_new),
`endif      
`ifdef WBS7      
      .wbs7_master_sel			(wbs7_master_sel),
      .wbs7_master_sel_new		(wbs7_master_sel_new),
`endif      
      .wb_clk(wb_clk),
      .wb_rst(wb_rst)
      );
   defparam master_detect_slave3.slave_bit = 3;
`endif //  `ifdef WBM3

`ifdef WBM4
      wb_b3_switch_master_detect_slave_sel master_detect_slave4
     (
      // Outputs
      .wbm_slave_sel			(wbm4_slave_sel),
      // Inputs
      .wbs0_master_sel			(wbs0_master_sel),
      .wbs0_master_sel_new		(wbs0_master_sel_new),
`ifdef WBS1      
      .wbs1_master_sel			(wbs1_master_sel),
      .wbs1_master_sel_new		(wbs1_master_sel_new),
`endif
`ifdef WBS2      
      .wbs2_master_sel			(wbs2_master_sel),
      .wbs2_master_sel_new		(wbs2_master_sel_new),
`endif
`ifdef WBS3      
      .wbs3_master_sel			(wbs3_master_sel),
      .wbs3_master_sel_new		(wbs3_master_sel_new),
`endif
`ifdef WBS4      
      .wbs4_master_sel			(wbs4_master_sel),
      .wbs4_master_sel_new		(wbs4_master_sel_new),
`endif
`ifdef WBS5      
      .wbs5_master_sel			(wbs5_master_sel),
      .wbs5_master_sel_new		(wbs5_master_sel_new),
`endif      
`ifdef WBS6      
      .wbs6_master_sel			(wbs6_master_sel),
      .wbs6_master_sel_new		(wbs6_master_sel_new),
`endif      
`ifdef WBS7      
      .wbs7_master_sel			(wbs7_master_sel),
      .wbs7_master_sel_new		(wbs7_master_sel_new),
`endif      
      .wb_clk(wb_clk),
      .wb_rst(wb_rst)
      );
   defparam master_detect_slave4.slave_bit = 4;
`endif //  `ifdef WBM4

`ifdef WBM5
      wb_b3_switch_master_detect_slave_sel master_detect_slave5
     (
      // Outputs
      .wbm_slave_sel			(wbm5_slave_sel),
      // Inputs
      .wbs0_master_sel			(wbs0_master_sel),
      .wbs0_master_sel_new		(wbs0_master_sel_new),
`ifdef WBS1      
      .wbs1_master_sel			(wbs1_master_sel),
      .wbs1_master_sel_new		(wbs1_master_sel_new),
`endif
`ifdef WBS2      
      .wbs2_master_sel			(wbs2_master_sel),
      .wbs2_master_sel_new		(wbs2_master_sel_new),
`endif
`ifdef WBS3      
      .wbs3_master_sel			(wbs3_master_sel),
      .wbs3_master_sel_new		(wbs3_master_sel_new),
`endif
`ifdef WBS4      
      .wbs4_master_sel			(wbs4_master_sel),
      .wbs4_master_sel_new		(wbs4_master_sel_new),
`endif
`ifdef WBS5      
      .wbs5_master_sel			(wbs5_master_sel),
      .wbs5_master_sel_new		(wbs5_master_sel_new),
`endif      
`ifdef WBS6      
      .wbs6_master_sel			(wbs6_master_sel),
      .wbs6_master_sel_new		(wbs6_master_sel_new),
`endif      
`ifdef WBS7      
      .wbs7_master_sel			(wbs7_master_sel),
      .wbs7_master_sel_new		(wbs7_master_sel_new),
`endif      
      .wb_clk(wb_clk),
      .wb_rst(wb_rst)
      );
   defparam master_detect_slave5.slave_bit = 5;
`endif //  `ifdef WBM5
   
   /////////////////////////////////////////////////////////////////////////////
   // Slave Output MUXes
   /////////////////////////////////////////////////////////////////////////////
   
   wb_b3_switch_slave_out_mux slave_out_mux0
     (
      // Outputs
      .wbs_adr_i			(wbs0_adr_i[aw-1:0]),
      .wbs_bte_i			(wbs0_bte_i[1:0]),
      .wbs_cti_i			(wbs0_cti_i[2:0]),
      .wbs_cyc_i			(wbs0_cyc_i),
      .wbs_dat_i			(wbs0_dat_i[dw-1:0]),
      .wbs_sel_i			(wbs0_sel_i[3:0]),
      .wbs_stb_i			(wbs0_stb_i),
      .wbs_we_i				(wbs0_we_i),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_bte_o			(wbm0_bte_o[1:0]),
      .wbm0_cti_o			(wbm0_cti_o[2:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
      .wbm0_dat_o			(wbm0_dat_o[dw-1:0]),
      .wbm0_sel_o			(wbm0_sel_o[3:0]),
      .wbm0_stb_o			(wbm0_stb_o),
      .wbm0_we_o			(wbm0_we_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_bte_o			(wbm1_bte_o[1:0]),
      .wbm1_cti_o			(wbm1_cti_o[2:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
      .wbm1_dat_o			(wbm1_dat_o[dw-1:0]),
      .wbm1_sel_o			(wbm1_sel_o[3:0]),
      .wbm1_stb_o			(wbm1_stb_o),
      .wbm1_we_o			(wbm1_we_o),
`endif
`ifdef WBM2      
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_bte_o			(wbm2_bte_o[1:0]),
      .wbm2_cti_o			(wbm2_cti_o[2:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
      .wbm2_dat_o			(wbm2_dat_o[dw-1:0]),
      .wbm2_sel_o			(wbm2_sel_o[3:0]),
      .wbm2_stb_o			(wbm2_stb_o),
      .wbm2_we_o			(wbm2_we_o),
`endif
`ifdef WBM3      
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_bte_o			(wbm3_bte_o[1:0]),
      .wbm3_cti_o			(wbm3_cti_o[2:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
      .wbm3_dat_o			(wbm3_dat_o[dw-1:0]),
      .wbm3_sel_o			(wbm3_sel_o[3:0]),
      .wbm3_stb_o			(wbm3_stb_o),
      .wbm3_we_o			(wbm3_we_o),
`endif
`ifdef WBM4      
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_bte_o			(wbm4_bte_o[1:0]),
      .wbm4_cti_o			(wbm4_cti_o[2:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
      .wbm4_dat_o			(wbm4_dat_o[dw-1:0]),
      .wbm4_sel_o			(wbm4_sel_o[3:0]),
      .wbm4_stb_o			(wbm4_stb_o),
      .wbm4_we_o			(wbm4_we_o),
`endif      
`ifdef WBM5      
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_bte_o			(wbm5_bte_o[1:0]),
      .wbm5_cti_o			(wbm5_cti_o[2:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
      .wbm5_dat_o			(wbm5_dat_o[dw-1:0]),
      .wbm5_sel_o			(wbm5_sel_o[3:0]),
      .wbm5_stb_o			(wbm5_stb_o),
      .wbm5_we_o			(wbm5_we_o),
`endif      
      .wbs_master_sel			(wbs0_master_sel),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));

`ifdef WBS1
   wb_b3_switch_slave_out_mux slave_out_mux1
     (
      // Outputs
      .wbs_adr_i			(wbs1_adr_i[aw-1:0]),
      .wbs_bte_i			(wbs1_bte_i[1:0]),
      .wbs_cti_i			(wbs1_cti_i[2:0]),
      .wbs_cyc_i			(wbs1_cyc_i),
      .wbs_dat_i			(wbs1_dat_i[dw-1:0]),
      .wbs_sel_i			(wbs1_sel_i[3:0]),
      .wbs_stb_i			(wbs1_stb_i),
      .wbs_we_i				(wbs1_we_i),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_bte_o			(wbm0_bte_o[1:0]),
      .wbm0_cti_o			(wbm0_cti_o[2:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
      .wbm0_dat_o			(wbm0_dat_o[dw-1:0]),
      .wbm0_sel_o			(wbm0_sel_o[3:0]),
      .wbm0_stb_o			(wbm0_stb_o),
      .wbm0_we_o			(wbm0_we_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_bte_o			(wbm1_bte_o[1:0]),
      .wbm1_cti_o			(wbm1_cti_o[2:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
      .wbm1_dat_o			(wbm1_dat_o[dw-1:0]),
      .wbm1_sel_o			(wbm1_sel_o[3:0]),
      .wbm1_stb_o			(wbm1_stb_o),
      .wbm1_we_o			(wbm1_we_o),
`endif
`ifdef WBM2      
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_bte_o			(wbm2_bte_o[1:0]),
      .wbm2_cti_o			(wbm2_cti_o[2:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
      .wbm2_dat_o			(wbm2_dat_o[dw-1:0]),
      .wbm2_sel_o			(wbm2_sel_o[3:0]),
      .wbm2_stb_o			(wbm2_stb_o),
      .wbm2_we_o			(wbm2_we_o),
`endif
`ifdef WBM3      
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_bte_o			(wbm3_bte_o[1:0]),
      .wbm3_cti_o			(wbm3_cti_o[2:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
      .wbm3_dat_o			(wbm3_dat_o[dw-1:0]),
      .wbm3_sel_o			(wbm3_sel_o[3:0]),
      .wbm3_stb_o			(wbm3_stb_o),
      .wbm3_we_o			(wbm3_we_o),
`endif
`ifdef WBM4      
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_bte_o			(wbm4_bte_o[1:0]),
      .wbm4_cti_o			(wbm4_cti_o[2:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
      .wbm4_dat_o			(wbm4_dat_o[dw-1:0]),
      .wbm4_sel_o			(wbm4_sel_o[3:0]),
      .wbm4_stb_o			(wbm4_stb_o),
      .wbm4_we_o			(wbm4_we_o),
`endif      
`ifdef WBM5      
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_bte_o			(wbm5_bte_o[1:0]),
      .wbm5_cti_o			(wbm5_cti_o[2:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
      .wbm5_dat_o			(wbm5_dat_o[dw-1:0]),
      .wbm5_sel_o			(wbm5_sel_o[3:0]),
      .wbm5_stb_o			(wbm5_stb_o),
      .wbm5_we_o			(wbm5_we_o),
`endif      
      .wbs_master_sel			(wbs1_master_sel),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));
`endif //  `ifdef WBS1

`ifdef WBS2
   wb_b3_switch_slave_out_mux slave_out_mux2
     (
      // Outputs
      .wbs_adr_i			(wbs2_adr_i[aw-1:0]),
      .wbs_bte_i			(wbs2_bte_i[1:0]),
      .wbs_cti_i			(wbs2_cti_i[2:0]),
      .wbs_cyc_i			(wbs2_cyc_i),
      .wbs_dat_i			(wbs2_dat_i[dw-1:0]),
      .wbs_sel_i			(wbs2_sel_i[3:0]),
      .wbs_stb_i			(wbs2_stb_i),
      .wbs_we_i				(wbs2_we_i),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_bte_o			(wbm0_bte_o[1:0]),
      .wbm0_cti_o			(wbm0_cti_o[2:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
      .wbm0_dat_o			(wbm0_dat_o[dw-1:0]),
      .wbm0_sel_o			(wbm0_sel_o[3:0]),
      .wbm0_stb_o			(wbm0_stb_o),
      .wbm0_we_o			(wbm0_we_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_bte_o			(wbm1_bte_o[1:0]),
      .wbm1_cti_o			(wbm1_cti_o[2:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
      .wbm1_dat_o			(wbm1_dat_o[dw-1:0]),
      .wbm1_sel_o			(wbm1_sel_o[3:0]),
      .wbm1_stb_o			(wbm1_stb_o),
      .wbm1_we_o			(wbm1_we_o),
`endif
`ifdef WBM2      
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_bte_o			(wbm2_bte_o[1:0]),
      .wbm2_cti_o			(wbm2_cti_o[2:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
      .wbm2_dat_o			(wbm2_dat_o[dw-1:0]),
      .wbm2_sel_o			(wbm2_sel_o[3:0]),
      .wbm2_stb_o			(wbm2_stb_o),
      .wbm2_we_o			(wbm2_we_o),
`endif
`ifdef WBM3      
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_bte_o			(wbm3_bte_o[1:0]),
      .wbm3_cti_o			(wbm3_cti_o[2:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
      .wbm3_dat_o			(wbm3_dat_o[dw-1:0]),
      .wbm3_sel_o			(wbm3_sel_o[3:0]),
      .wbm3_stb_o			(wbm3_stb_o),
      .wbm3_we_o			(wbm3_we_o),
`endif
`ifdef WBM4      
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_bte_o			(wbm4_bte_o[1:0]),
      .wbm4_cti_o			(wbm4_cti_o[2:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
      .wbm4_dat_o			(wbm4_dat_o[dw-1:0]),
      .wbm4_sel_o			(wbm4_sel_o[3:0]),
      .wbm4_stb_o			(wbm4_stb_o),
      .wbm4_we_o			(wbm4_we_o),
`endif      
`ifdef WBM5      
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_bte_o			(wbm5_bte_o[1:0]),
      .wbm5_cti_o			(wbm5_cti_o[2:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
      .wbm5_dat_o			(wbm5_dat_o[dw-1:0]),
      .wbm5_sel_o			(wbm5_sel_o[3:0]),
      .wbm5_stb_o			(wbm5_stb_o),
      .wbm5_we_o			(wbm5_we_o),
`endif      
      
      .wbs_master_sel			(wbs2_master_sel),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));
`endif //  `ifdef WBS2

`ifdef WBS3
   wb_b3_switch_slave_out_mux slave_out_mux3
     (
      // Outputs
      .wbs_adr_i			(wbs3_adr_i[aw-1:0]),
      .wbs_bte_i			(wbs3_bte_i[1:0]),
      .wbs_cti_i			(wbs3_cti_i[2:0]),
      .wbs_cyc_i			(wbs3_cyc_i),
      .wbs_dat_i			(wbs3_dat_i[dw-1:0]),
      .wbs_sel_i			(wbs3_sel_i[3:0]),
      .wbs_stb_i			(wbs3_stb_i),
      .wbs_we_i				(wbs3_we_i),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_bte_o			(wbm0_bte_o[1:0]),
      .wbm0_cti_o			(wbm0_cti_o[2:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
      .wbm0_dat_o			(wbm0_dat_o[dw-1:0]),
      .wbm0_sel_o			(wbm0_sel_o[3:0]),
      .wbm0_stb_o			(wbm0_stb_o),
      .wbm0_we_o			(wbm0_we_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_bte_o			(wbm1_bte_o[1:0]),
      .wbm1_cti_o			(wbm1_cti_o[2:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
      .wbm1_dat_o			(wbm1_dat_o[dw-1:0]),
      .wbm1_sel_o			(wbm1_sel_o[3:0]),
      .wbm1_stb_o			(wbm1_stb_o),
      .wbm1_we_o			(wbm1_we_o),
`endif
`ifdef WBM2      
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_bte_o			(wbm2_bte_o[1:0]),
      .wbm2_cti_o			(wbm2_cti_o[2:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
      .wbm2_dat_o			(wbm2_dat_o[dw-1:0]),
      .wbm2_sel_o			(wbm2_sel_o[3:0]),
      .wbm2_stb_o			(wbm2_stb_o),
      .wbm2_we_o			(wbm2_we_o),
`endif
`ifdef WBM3      
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_bte_o			(wbm3_bte_o[1:0]),
      .wbm3_cti_o			(wbm3_cti_o[2:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
      .wbm3_dat_o			(wbm3_dat_o[dw-1:0]),
      .wbm3_sel_o			(wbm3_sel_o[3:0]),
      .wbm3_stb_o			(wbm3_stb_o),
      .wbm3_we_o			(wbm3_we_o),
`endif
`ifdef WBM4      
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_bte_o			(wbm4_bte_o[1:0]),
      .wbm4_cti_o			(wbm4_cti_o[2:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
      .wbm4_dat_o			(wbm4_dat_o[dw-1:0]),
      .wbm4_sel_o			(wbm4_sel_o[3:0]),
      .wbm4_stb_o			(wbm4_stb_o),
      .wbm4_we_o			(wbm4_we_o),
`endif      
`ifdef WBM5      
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_bte_o			(wbm5_bte_o[1:0]),
      .wbm5_cti_o			(wbm5_cti_o[2:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
      .wbm5_dat_o			(wbm5_dat_o[dw-1:0]),
      .wbm5_sel_o			(wbm5_sel_o[3:0]),
      .wbm5_stb_o			(wbm5_stb_o),
      .wbm5_we_o			(wbm5_we_o),
`endif      
      .wbs_master_sel			(wbs3_master_sel),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));
`endif //  `ifdef WBS3
`ifdef WBS4
   wb_b3_switch_slave_out_mux slave_out_mux4
     (
      // Outputs
      .wbs_adr_i			(wbs4_adr_i[aw-1:0]),
      .wbs_bte_i			(wbs4_bte_i[1:0]),
      .wbs_cti_i			(wbs4_cti_i[2:0]),
      .wbs_cyc_i			(wbs4_cyc_i),
      .wbs_dat_i			(wbs4_dat_i[dw-1:0]),
      .wbs_sel_i			(wbs4_sel_i[3:0]),
      .wbs_stb_i			(wbs4_stb_i),
      .wbs_we_i				(wbs4_we_i),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_bte_o			(wbm0_bte_o[1:0]),
      .wbm0_cti_o			(wbm0_cti_o[2:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
      .wbm0_dat_o			(wbm0_dat_o[dw-1:0]),
      .wbm0_sel_o			(wbm0_sel_o[3:0]),
      .wbm0_stb_o			(wbm0_stb_o),
      .wbm0_we_o			(wbm0_we_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_bte_o			(wbm1_bte_o[1:0]),
      .wbm1_cti_o			(wbm1_cti_o[2:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
      .wbm1_dat_o			(wbm1_dat_o[dw-1:0]),
      .wbm1_sel_o			(wbm1_sel_o[3:0]),
      .wbm1_stb_o			(wbm1_stb_o),
      .wbm1_we_o			(wbm1_we_o),
`endif
`ifdef WBM2      
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_bte_o			(wbm2_bte_o[1:0]),
      .wbm2_cti_o			(wbm2_cti_o[2:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
      .wbm2_dat_o			(wbm2_dat_o[dw-1:0]),
      .wbm2_sel_o			(wbm2_sel_o[3:0]),
      .wbm2_stb_o			(wbm2_stb_o),
      .wbm2_we_o			(wbm2_we_o),
`endif
`ifdef WBM3      
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_bte_o			(wbm3_bte_o[1:0]),
      .wbm3_cti_o			(wbm3_cti_o[2:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
      .wbm3_dat_o			(wbm3_dat_o[dw-1:0]),
      .wbm3_sel_o			(wbm3_sel_o[3:0]),
      .wbm3_stb_o			(wbm3_stb_o),
      .wbm3_we_o			(wbm3_we_o),
`endif
`ifdef WBM4      
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_bte_o			(wbm4_bte_o[1:0]),
      .wbm4_cti_o			(wbm4_cti_o[2:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
      .wbm4_dat_o			(wbm4_dat_o[dw-1:0]),
      .wbm4_sel_o			(wbm4_sel_o[3:0]),
      .wbm4_stb_o			(wbm4_stb_o),
      .wbm4_we_o			(wbm4_we_o),
`endif      
`ifdef WBM5      
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_bte_o			(wbm5_bte_o[1:0]),
      .wbm5_cti_o			(wbm5_cti_o[2:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
      .wbm5_dat_o			(wbm5_dat_o[dw-1:0]),
      .wbm5_sel_o			(wbm5_sel_o[3:0]),
      .wbm5_stb_o			(wbm5_stb_o),
      .wbm5_we_o			(wbm5_we_o),
`endif      
      .wbs_master_sel			(wbs4_master_sel),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));
`endif //  `ifdef WBS4
`ifdef WBS5
   wb_b3_switch_slave_out_mux slave_out_mux5
     (
      // Outputs
      .wbs_adr_i			(wbs5_adr_i[aw-1:0]),
      .wbs_bte_i			(wbs5_bte_i[1:0]),
      .wbs_cti_i			(wbs5_cti_i[2:0]),
      .wbs_cyc_i			(wbs5_cyc_i),
      .wbs_dat_i			(wbs5_dat_i[dw-1:0]),
      .wbs_sel_i			(wbs5_sel_i[3:0]),
      .wbs_stb_i			(wbs5_stb_i),
      .wbs_we_i				(wbs5_we_i),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_bte_o			(wbm0_bte_o[1:0]),
      .wbm0_cti_o			(wbm0_cti_o[2:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
      .wbm0_dat_o			(wbm0_dat_o[dw-1:0]),
      .wbm0_sel_o			(wbm0_sel_o[3:0]),
      .wbm0_stb_o			(wbm0_stb_o),
      .wbm0_we_o			(wbm0_we_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_bte_o			(wbm1_bte_o[1:0]),
      .wbm1_cti_o			(wbm1_cti_o[2:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
      .wbm1_dat_o			(wbm1_dat_o[dw-1:0]),
      .wbm1_sel_o			(wbm1_sel_o[3:0]),
      .wbm1_stb_o			(wbm1_stb_o),
      .wbm1_we_o			(wbm1_we_o),
`endif
`ifdef WBM2      
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_bte_o			(wbm2_bte_o[1:0]),
      .wbm2_cti_o			(wbm2_cti_o[2:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
      .wbm2_dat_o			(wbm2_dat_o[dw-1:0]),
      .wbm2_sel_o			(wbm2_sel_o[3:0]),
      .wbm2_stb_o			(wbm2_stb_o),
      .wbm2_we_o			(wbm2_we_o),
`endif
`ifdef WBM3      
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_bte_o			(wbm3_bte_o[1:0]),
      .wbm3_cti_o			(wbm3_cti_o[2:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
      .wbm3_dat_o			(wbm3_dat_o[dw-1:0]),
      .wbm3_sel_o			(wbm3_sel_o[3:0]),
      .wbm3_stb_o			(wbm3_stb_o),
      .wbm3_we_o			(wbm3_we_o),
`endif
`ifdef WBM4      
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_bte_o			(wbm4_bte_o[1:0]),
      .wbm4_cti_o			(wbm4_cti_o[2:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
      .wbm4_dat_o			(wbm4_dat_o[dw-1:0]),
      .wbm4_sel_o			(wbm4_sel_o[3:0]),
      .wbm4_stb_o			(wbm4_stb_o),
      .wbm4_we_o			(wbm4_we_o),
`endif      
`ifdef WBM5      
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_bte_o			(wbm5_bte_o[1:0]),
      .wbm5_cti_o			(wbm5_cti_o[2:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
      .wbm5_dat_o			(wbm5_dat_o[dw-1:0]),
      .wbm5_sel_o			(wbm5_sel_o[3:0]),
      .wbm5_stb_o			(wbm5_stb_o),
      .wbm5_we_o			(wbm5_we_o),
`endif      
      .wbs_master_sel			(wbs5_master_sel),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));
`endif //  `ifdef WBS5
`ifdef WBS6
   wb_b3_switch_slave_out_mux slave_out_mux6
     (
      // Outputs
      .wbs_adr_i			(wbs6_adr_i[aw-1:0]),
      .wbs_bte_i			(wbs6_bte_i[1:0]),
      .wbs_cti_i			(wbs6_cti_i[2:0]),
      .wbs_cyc_i			(wbs6_cyc_i),
      .wbs_dat_i			(wbs6_dat_i[dw-1:0]),
      .wbs_sel_i			(wbs6_sel_i[3:0]),
      .wbs_stb_i			(wbs6_stb_i),
      .wbs_we_i				(wbs6_we_i),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_bte_o			(wbm0_bte_o[1:0]),
      .wbm0_cti_o			(wbm0_cti_o[2:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
      .wbm0_dat_o			(wbm0_dat_o[dw-1:0]),
      .wbm0_sel_o			(wbm0_sel_o[3:0]),
      .wbm0_stb_o			(wbm0_stb_o),
      .wbm0_we_o			(wbm0_we_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_bte_o			(wbm1_bte_o[1:0]),
      .wbm1_cti_o			(wbm1_cti_o[2:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
      .wbm1_dat_o			(wbm1_dat_o[dw-1:0]),
      .wbm1_sel_o			(wbm1_sel_o[3:0]),
      .wbm1_stb_o			(wbm1_stb_o),
      .wbm1_we_o			(wbm1_we_o),
`endif
`ifdef WBM2      
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_bte_o			(wbm2_bte_o[1:0]),
      .wbm2_cti_o			(wbm2_cti_o[2:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
      .wbm2_dat_o			(wbm2_dat_o[dw-1:0]),
      .wbm2_sel_o			(wbm2_sel_o[3:0]),
      .wbm2_stb_o			(wbm2_stb_o),
      .wbm2_we_o			(wbm2_we_o),
`endif
`ifdef WBM3      
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_bte_o			(wbm3_bte_o[1:0]),
      .wbm3_cti_o			(wbm3_cti_o[2:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
      .wbm3_dat_o			(wbm3_dat_o[dw-1:0]),
      .wbm3_sel_o			(wbm3_sel_o[3:0]),
      .wbm3_stb_o			(wbm3_stb_o),
      .wbm3_we_o			(wbm3_we_o),
`endif
`ifdef WBM4      
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_bte_o			(wbm4_bte_o[1:0]),
      .wbm4_cti_o			(wbm4_cti_o[2:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
      .wbm4_dat_o			(wbm4_dat_o[dw-1:0]),
      .wbm4_sel_o			(wbm4_sel_o[3:0]),
      .wbm4_stb_o			(wbm4_stb_o),
      .wbm4_we_o			(wbm4_we_o),
`endif      
`ifdef WBM5      
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_bte_o			(wbm5_bte_o[1:0]),
      .wbm5_cti_o			(wbm5_cti_o[2:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
      .wbm5_dat_o			(wbm5_dat_o[dw-1:0]),
      .wbm5_sel_o			(wbm5_sel_o[3:0]),
      .wbm5_stb_o			(wbm5_stb_o),
      .wbm5_we_o			(wbm5_we_o),
`endif      
      .wbs_master_sel			(wbs6_master_sel),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));
`endif //  `ifdef WBS6
`ifdef WBS7
   wb_b3_switch_slave_out_mux slave_out_mux7
     (
      // Outputs
      .wbs_adr_i			(wbs7_adr_i[aw-1:0]),
      .wbs_bte_i			(wbs7_bte_i[1:0]),
      .wbs_cti_i			(wbs7_cti_i[2:0]),
      .wbs_cyc_i			(wbs7_cyc_i),
      .wbs_dat_i			(wbs7_dat_i[dw-1:0]),
      .wbs_sel_i			(wbs7_sel_i[3:0]),
      .wbs_stb_i			(wbs7_stb_i),
      .wbs_we_i				(wbs7_we_i),
      // Inputs
      .wbm0_adr_o			(wbm0_adr_o[aw-1:0]),
      .wbm0_bte_o			(wbm0_bte_o[1:0]),
      .wbm0_cti_o			(wbm0_cti_o[2:0]),
      .wbm0_cyc_o			(wbm0_cyc_o),
      .wbm0_dat_o			(wbm0_dat_o[dw-1:0]),
      .wbm0_sel_o			(wbm0_sel_o[3:0]),
      .wbm0_stb_o			(wbm0_stb_o),
      .wbm0_we_o			(wbm0_we_o),
`ifdef WBM1      
      .wbm1_adr_o			(wbm1_adr_o[aw-1:0]),
      .wbm1_bte_o			(wbm1_bte_o[1:0]),
      .wbm1_cti_o			(wbm1_cti_o[2:0]),
      .wbm1_cyc_o			(wbm1_cyc_o),
      .wbm1_dat_o			(wbm1_dat_o[dw-1:0]),
      .wbm1_sel_o			(wbm1_sel_o[3:0]),
      .wbm1_stb_o			(wbm1_stb_o),
      .wbm1_we_o			(wbm1_we_o),
`endif
`ifdef WBM2      
      .wbm2_adr_o			(wbm2_adr_o[aw-1:0]),
      .wbm2_bte_o			(wbm2_bte_o[1:0]),
      .wbm2_cti_o			(wbm2_cti_o[2:0]),
      .wbm2_cyc_o			(wbm2_cyc_o),
      .wbm2_dat_o			(wbm2_dat_o[dw-1:0]),
      .wbm2_sel_o			(wbm2_sel_o[3:0]),
      .wbm2_stb_o			(wbm2_stb_o),
      .wbm2_we_o			(wbm2_we_o),
`endif
`ifdef WBM3      
      .wbm3_adr_o			(wbm3_adr_o[aw-1:0]),
      .wbm3_bte_o			(wbm3_bte_o[1:0]),
      .wbm3_cti_o			(wbm3_cti_o[2:0]),
      .wbm3_cyc_o			(wbm3_cyc_o),
      .wbm3_dat_o			(wbm3_dat_o[dw-1:0]),
      .wbm3_sel_o			(wbm3_sel_o[3:0]),
      .wbm3_stb_o			(wbm3_stb_o),
      .wbm3_we_o			(wbm3_we_o),
`endif
`ifdef WBM4      
      .wbm4_adr_o			(wbm4_adr_o[aw-1:0]),
      .wbm4_bte_o			(wbm4_bte_o[1:0]),
      .wbm4_cti_o			(wbm4_cti_o[2:0]),
      .wbm4_cyc_o			(wbm4_cyc_o),
      .wbm4_dat_o			(wbm4_dat_o[dw-1:0]),
      .wbm4_sel_o			(wbm4_sel_o[3:0]),
      .wbm4_stb_o			(wbm4_stb_o),
      .wbm4_we_o			(wbm4_we_o),
`endif      
`ifdef WBM5      
      .wbm5_adr_o			(wbm5_adr_o[aw-1:0]),
      .wbm5_bte_o			(wbm5_bte_o[1:0]),
      .wbm5_cti_o			(wbm5_cti_o[2:0]),
      .wbm5_cyc_o			(wbm5_cyc_o),
      .wbm5_dat_o			(wbm5_dat_o[dw-1:0]),
      .wbm5_sel_o			(wbm5_sel_o[3:0]),
      .wbm5_stb_o			(wbm5_stb_o),
      .wbm5_we_o			(wbm5_we_o),
`endif      
      .wbs_master_sel			(wbs7_master_sel),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));
`endif //  `ifdef WBS7

   /////////////////////////////////////////////////////////////////////////////
   // Master output MUXes
   /////////////////////////////////////////////////////////////////////////////
   
   wb_b3_switch_master_out_mux master_out_mux0
     (
      .wbm_stb_o                        (wbm0_stb_o),
      // Outputs
      .wbm_ack_i			(wbm0_ack_i),
      .wbm_err_i			(wbm0_err_i),
      .wbm_rty_i			(wbm0_rty_i),
      .wbm_dat_i			(wbm0_dat_i[dw-1:0]),
      // Inputs
      .wbs0_ack_o			(wbs0_ack_o),
      .wbs0_err_o			(wbs0_err_o),
      .wbs0_rty_o			(wbs0_rty_o),
      .wbs0_dat_o			(wbs0_dat_o[dw-1:0]),
`ifdef WBS1      
      .wbs1_ack_o			(wbs1_ack_o),
      .wbs1_err_o			(wbs1_err_o),
      .wbs1_rty_o			(wbs1_rty_o),
      .wbs1_dat_o			(wbs1_dat_o[dw-1:0]),
`endif
`ifdef WBS2      
      .wbs2_ack_o			(wbs2_ack_o),
      .wbs2_err_o			(wbs2_err_o),
      .wbs2_rty_o			(wbs2_rty_o),
      .wbs2_dat_o			(wbs2_dat_o[dw-1:0]),
`endif
`ifdef WBS3      
      .wbs3_ack_o			(wbs3_ack_o),
      .wbs3_err_o			(wbs3_err_o),
      .wbs3_rty_o			(wbs3_rty_o),
      .wbs3_dat_o			(wbs3_dat_o[dw-1:0]),
`endif
`ifdef WBS4
      .wbs4_ack_o			(wbs4_ack_o),
      .wbs4_err_o			(wbs4_err_o),
      .wbs4_rty_o			(wbs4_rty_o),
      .wbs4_dat_o			(wbs4_dat_o[dw-1:0]),
`endif      
`ifdef WBS5
      .wbs5_ack_o			(wbs5_ack_o),
      .wbs5_err_o			(wbs5_err_o),
      .wbs5_rty_o			(wbs5_rty_o),
      .wbs5_dat_o			(wbs5_dat_o[dw-1:0]),
`endif      
`ifdef WBS6
      .wbs6_ack_o			(wbs6_ack_o),
      .wbs6_err_o			(wbs6_err_o),
      .wbs6_rty_o			(wbs6_rty_o),
      .wbs6_dat_o			(wbs6_dat_o[dw-1:0]),
`endif      
`ifdef WBS7
      .wbs7_ack_o			(wbs7_ack_o),
      .wbs7_err_o			(wbs7_err_o),
      .wbs7_rty_o			(wbs7_rty_o),
      .wbs7_dat_o			(wbs7_dat_o[dw-1:0]),
`endif      
      .wbm_slave_sel			(wbm0_slave_sel),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));
   
`ifdef WBM1
   wb_b3_switch_master_out_mux master_out_mux1
     (
      .wbm_stb_o                        (wbm1_stb_o),
      // Outputs
      .wbm_ack_i			(wbm1_ack_i),
      .wbm_err_i			(wbm1_err_i),
      .wbm_rty_i			(wbm1_rty_i),
      .wbm_dat_i			(wbm1_dat_i[dw-1:0]),
      // Inputs
      .wbs0_ack_o			(wbs0_ack_o),
      .wbs0_err_o			(wbs0_err_o),
      .wbs0_rty_o			(wbs0_rty_o),
      .wbs0_dat_o			(wbs0_dat_o[dw-1:0]),
`ifdef WBS1      
      .wbs1_ack_o			(wbs1_ack_o),
      .wbs1_err_o			(wbs1_err_o),
      .wbs1_rty_o			(wbs1_rty_o),
      .wbs1_dat_o			(wbs1_dat_o[dw-1:0]),
`endif
`ifdef WBS2      
      .wbs2_ack_o			(wbs2_ack_o),
      .wbs2_err_o			(wbs2_err_o),
      .wbs2_rty_o			(wbs2_rty_o),
      .wbs2_dat_o			(wbs2_dat_o[dw-1:0]),
`endif
`ifdef WBS3      
      .wbs3_ack_o			(wbs3_ack_o),
      .wbs3_err_o			(wbs3_err_o),
      .wbs3_rty_o			(wbs3_rty_o),
      .wbs3_dat_o			(wbs3_dat_o[dw-1:0]),
`endif      
`ifdef WBS4
      .wbs4_ack_o			(wbs4_ack_o),
      .wbs4_err_o			(wbs4_err_o),
      .wbs4_rty_o			(wbs4_rty_o),
      .wbs4_dat_o			(wbs4_dat_o[dw-1:0]),
`endif      
`ifdef WBS5
      .wbs5_ack_o			(wbs5_ack_o),
      .wbs5_err_o			(wbs5_err_o),
      .wbs5_rty_o			(wbs5_rty_o),
      .wbs5_dat_o			(wbs5_dat_o[dw-1:0]),
`endif      
`ifdef WBS6
      .wbs6_ack_o			(wbs6_ack_o),
      .wbs6_err_o			(wbs6_err_o),
      .wbs6_rty_o			(wbs6_rty_o),
      .wbs6_dat_o			(wbs6_dat_o[dw-1:0]),
`endif      
`ifdef WBS7
      .wbs7_ack_o			(wbs7_ack_o),
      .wbs7_err_o			(wbs7_err_o),
      .wbs7_rty_o			(wbs7_rty_o),
      .wbs7_dat_o			(wbs7_dat_o[dw-1:0]),
`endif      
      .wbm_slave_sel			(wbm1_slave_sel),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));
`endif //  `ifdef WBM1
   
`ifdef WBM2
   wb_b3_switch_master_out_mux master_out_mux2
     (
      .wbm_stb_o                        (wbm2_stb_o),
      // Outputs
      .wbm_ack_i			(wbm2_ack_i),
      .wbm_err_i			(wbm2_err_i),
      .wbm_rty_i			(wbm2_rty_i),
      .wbm_dat_i			(wbm2_dat_i[dw-1:0]),
      // Inputs
      .wbs0_ack_o			(wbs0_ack_o),
      .wbs0_err_o			(wbs0_err_o),
      .wbs0_rty_o			(wbs0_rty_o),
      .wbs0_dat_o			(wbs0_dat_o[dw-1:0]),
`ifdef WBS1      
      .wbs1_ack_o			(wbs1_ack_o),
      .wbs1_err_o			(wbs1_err_o),
      .wbs1_rty_o			(wbs1_rty_o),
      .wbs1_dat_o			(wbs1_dat_o[dw-1:0]),
`endif
`ifdef WBS2      
      .wbs2_ack_o			(wbs2_ack_o),
      .wbs2_err_o			(wbs2_err_o),
      .wbs2_rty_o			(wbs2_rty_o),
      .wbs2_dat_o			(wbs2_dat_o[dw-1:0]),
`endif
`ifdef WBS3      
      .wbs3_ack_o			(wbs3_ack_o),
      .wbs3_err_o			(wbs3_err_o),
      .wbs3_rty_o			(wbs3_rty_o),
      .wbs3_dat_o			(wbs3_dat_o[dw-1:0]),
`endif      
`ifdef WBS4
      .wbs4_ack_o			(wbs4_ack_o),
      .wbs4_err_o			(wbs4_err_o),
      .wbs4_rty_o			(wbs4_rty_o),
      .wbs4_dat_o			(wbs4_dat_o[dw-1:0]),
`endif      
`ifdef WBS5
      .wbs5_ack_o			(wbs5_ack_o),
      .wbs5_err_o			(wbs5_err_o),
      .wbs5_rty_o			(wbs5_rty_o),
      .wbs5_dat_o			(wbs5_dat_o[dw-1:0]),
`endif      
`ifdef WBS6
      .wbs6_ack_o			(wbs6_ack_o),
      .wbs6_err_o			(wbs6_err_o),
      .wbs6_rty_o			(wbs6_rty_o),
      .wbs6_dat_o			(wbs6_dat_o[dw-1:0]),
`endif      
`ifdef WBS7
      .wbs7_ack_o			(wbs7_ack_o),
      .wbs7_err_o			(wbs7_err_o),
      .wbs7_rty_o			(wbs7_rty_o),
      .wbs7_dat_o			(wbs7_dat_o[dw-1:0]),
`endif      
      .wbm_slave_sel			(wbm2_slave_sel),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));
`endif
   
`ifdef WBM3
   wb_b3_switch_master_out_mux master_out_mux3
     (
      .wbm_stb_o                        (wbm3_stb_o),
      // Outputs
      .wbm_ack_i			(wbm3_ack_i),
      .wbm_err_i			(wbm3_err_i),
      .wbm_rty_i			(wbm3_rty_i),
      .wbm_dat_i			(wbm3_dat_i[dw-1:0]),
      // Inputs
      .wbs0_ack_o			(wbs0_ack_o),
      .wbs0_err_o			(wbs0_err_o),
      .wbs0_rty_o			(wbs0_rty_o),
      .wbs0_dat_o			(wbs0_dat_o[dw-1:0]),
`ifdef WBS1      
      .wbs1_ack_o			(wbs1_ack_o),
      .wbs1_err_o			(wbs1_err_o),
      .wbs1_rty_o			(wbs1_rty_o),
      .wbs1_dat_o			(wbs1_dat_o[dw-1:0]),
`endif
`ifdef WBS2      
      .wbs2_ack_o			(wbs2_ack_o),
      .wbs2_err_o			(wbs2_err_o),
      .wbs2_rty_o			(wbs2_rty_o),
      .wbs2_dat_o			(wbs2_dat_o[dw-1:0]),
`endif
`ifdef WBS3      
      .wbs3_ack_o			(wbs3_ack_o),
      .wbs3_err_o			(wbs3_err_o),
      .wbs3_rty_o			(wbs3_rty_o),
      .wbs3_dat_o			(wbs3_dat_o[dw-1:0]),
`endif      
`ifdef WBS4
      .wbs4_ack_o			(wbs4_ack_o),
      .wbs4_err_o			(wbs4_err_o),
      .wbs4_rty_o			(wbs4_rty_o),
      .wbs4_dat_o			(wbs4_dat_o[dw-1:0]),
`endif      
`ifdef WBS5
      .wbs5_ack_o			(wbs5_ack_o),
      .wbs5_err_o			(wbs5_err_o),
      .wbs5_rty_o			(wbs5_rty_o),
      .wbs5_dat_o			(wbs5_dat_o[dw-1:0]),
`endif      
`ifdef WBS6
      .wbs6_ack_o			(wbs6_ack_o),
      .wbs6_err_o			(wbs6_err_o),
      .wbs6_rty_o			(wbs6_rty_o),
      .wbs6_dat_o			(wbs6_dat_o[dw-1:0]),
`endif      
`ifdef WBS7
      .wbs7_ack_o			(wbs7_ack_o),
      .wbs7_err_o			(wbs7_err_o),
      .wbs7_rty_o			(wbs7_rty_o),
      .wbs7_dat_o			(wbs7_dat_o[dw-1:0]),
`endif      
      .wbm_slave_sel			(wbm3_slave_sel),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));
`endif
`ifdef WBM4
   wb_b3_switch_master_out_mux master_out_mux4
     (
      .wbm_stb_o                        (wbm4_stb_o),
      // Outputs
      .wbm_ack_i			(wbm4_ack_i),
      .wbm_err_i			(wbm4_err_i),
      .wbm_rty_i			(wbm4_rty_i),
      .wbm_dat_i			(wbm4_dat_i[dw-1:0]),
      // Inputs
      .wbs0_ack_o			(wbs0_ack_o),
      .wbs0_err_o			(wbs0_err_o),
      .wbs0_rty_o			(wbs0_rty_o),
      .wbs0_dat_o			(wbs0_dat_o[dw-1:0]),
`ifdef WBS1      
      .wbs1_ack_o			(wbs1_ack_o),
      .wbs1_err_o			(wbs1_err_o),
      .wbs1_rty_o			(wbs1_rty_o),
      .wbs1_dat_o			(wbs1_dat_o[dw-1:0]),
`endif
`ifdef WBS2      
      .wbs2_ack_o			(wbs2_ack_o),
      .wbs2_err_o			(wbs2_err_o),
      .wbs2_rty_o			(wbs2_rty_o),
      .wbs2_dat_o			(wbs2_dat_o[dw-1:0]),
`endif
`ifdef WBS3      
      .wbs3_ack_o			(wbs3_ack_o),
      .wbs3_err_o			(wbs3_err_o),
      .wbs3_rty_o			(wbs3_rty_o),
      .wbs3_dat_o			(wbs3_dat_o[dw-1:0]),
`endif      
`ifdef WBS4
      .wbs4_ack_o			(wbs4_ack_o),
      .wbs4_err_o			(wbs4_err_o),
      .wbs4_rty_o			(wbs4_rty_o),
      .wbs4_dat_o			(wbs4_dat_o[dw-1:0]),
`endif      
`ifdef WBS5
      .wbs5_ack_o			(wbs5_ack_o),
      .wbs5_err_o			(wbs5_err_o),
      .wbs5_rty_o			(wbs5_rty_o),
      .wbs5_dat_o			(wbs5_dat_o[dw-1:0]),
`endif      
`ifdef WBS6
      .wbs6_ack_o			(wbs6_ack_o),
      .wbs6_err_o			(wbs6_err_o),
      .wbs6_rty_o			(wbs6_rty_o),
      .wbs6_dat_o			(wbs6_dat_o[dw-1:0]),
`endif      
`ifdef WBS7
      .wbs7_ack_o			(wbs7_ack_o),
      .wbs7_err_o			(wbs7_err_o),
      .wbs7_rty_o			(wbs7_rty_o),
      .wbs7_dat_o			(wbs7_dat_o[dw-1:0]),
`endif      
      .wbm_slave_sel			(wbm4_slave_sel),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));
`endif
`ifdef WBM5
   wb_b3_switch_master_out_mux master_out_mux5
     (
      .wbm_stb_o                        (wbm5_stb_o),
      // Outputs
      .wbm_ack_i			(wbm5_ack_i),
      .wbm_err_i			(wbm5_err_i),
      .wbm_rty_i			(wbm5_rty_i),
      .wbm_dat_i			(wbm5_dat_i[dw-1:0]),
      // Inputs
      .wbs0_ack_o			(wbs0_ack_o),
      .wbs0_err_o			(wbs0_err_o),
      .wbs0_rty_o			(wbs0_rty_o),
      .wbs0_dat_o			(wbs0_dat_o[dw-1:0]),
`ifdef WBS1      
      .wbs1_ack_o			(wbs1_ack_o),
      .wbs1_err_o			(wbs1_err_o),
      .wbs1_rty_o			(wbs1_rty_o),
      .wbs1_dat_o			(wbs1_dat_o[dw-1:0]),
`endif
`ifdef WBS2      
      .wbs2_ack_o			(wbs2_ack_o),
      .wbs2_err_o			(wbs2_err_o),
      .wbs2_rty_o			(wbs2_rty_o),
      .wbs2_dat_o			(wbs2_dat_o[dw-1:0]),
`endif
`ifdef WBS3      
      .wbs3_ack_o			(wbs3_ack_o),
      .wbs3_err_o			(wbs3_err_o),
      .wbs3_rty_o			(wbs3_rty_o),
      .wbs3_dat_o			(wbs3_dat_o[dw-1:0]),
`endif      
`ifdef WBS4
      .wbs4_ack_o			(wbs4_ack_o),
      .wbs4_err_o			(wbs4_err_o),
      .wbs4_rty_o			(wbs4_rty_o),
      .wbs4_dat_o			(wbs4_dat_o[dw-1:0]),
`endif      
`ifdef WBS5
      .wbs5_ack_o			(wbs5_ack_o),
      .wbs5_err_o			(wbs5_err_o),
      .wbs5_rty_o			(wbs5_rty_o),
      .wbs5_dat_o			(wbs5_dat_o[dw-1:0]),
`endif      
`ifdef WBS6
      .wbs6_ack_o			(wbs6_ack_o),
      .wbs6_err_o			(wbs6_err_o),
      .wbs6_rty_o			(wbs6_rty_o),
      .wbs6_dat_o			(wbs6_dat_o[dw-1:0]),
`endif      
`ifdef WBS7
      .wbs7_ack_o			(wbs7_ack_o),
      .wbs7_err_o			(wbs7_err_o),
      .wbs7_rty_o			(wbs7_rty_o),
      .wbs7_dat_o			(wbs7_dat_o[dw-1:0]),
`endif      
      .wbm_slave_sel			(wbm5_slave_sel),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));
`endif
   
endmodule // wb_b3_switch

// Master selection logic
module wb_b3_switch_slave_sel
  (
   wbm0_adr_o, wbm0_cyc_o,
`ifdef WBM1		    
   wbm1_adr_o, wbm1_cyc_o,
`endif
`ifdef WBM2		    		     
   wbm2_adr_o, wbm2_cyc_o,
`endif
`ifdef WBM3		    		     
   wbm3_adr_o, wbm3_cyc_o,
`endif
`ifdef WBM4		    		     
   wbm4_adr_o, wbm4_cyc_o,
`endif
`ifdef WBM5		    		     
   wbm5_adr_o, wbm5_cyc_o,
`endif
   
   wbs_master_sel, wbs_master_sel_new,   
   
   wb_clk, wb_rst);
   
   parameter dw = 32;
   parameter aw = 32;

   parameter num_masters = 4;
   parameter slave_sel_bit_width = 4;   
   parameter slave_addr = 4'hf;

   
   input [aw-1:0] wbm0_adr_o;input wbm0_cyc_o;
`ifdef WBM1
   input [aw-1:0] wbm1_adr_o;input wbm1_cyc_o;   
`endif
`ifdef WBM2
   input [aw-1:0] wbm2_adr_o;input wbm2_cyc_o;   
`endif
`ifdef WBM3
   input [aw-1:0] wbm3_adr_o;input wbm3_cyc_o;   
`endif
`ifdef WBM4
   input [aw-1:0] wbm4_adr_o;input wbm4_cyc_o;   
`endif
`ifdef WBM5
   input [aw-1:0] wbm5_adr_o;input wbm5_cyc_o;   
`endif
   
   input 	  wb_clk, wb_rst;
   
   output reg [num_masters - 1:0] wbs_master_sel;
   output 			  wbs_master_sel_new;

   reg [num_masters - 1:0] 	  wbs_master_sel_r;

   reg [num_masters - 1:0] 	  last_master;

   wire 			  wbm0_req;
   assign wbm0_req = (wbm0_adr_o[aw-1:(aw-(slave_sel_bit_width))] ==  slave_addr) &
		     wbm0_cyc_o;
`ifdef WBM1
   wire 			  wbm1_req;
   assign wbm1_req = (wbm1_adr_o[aw-1:(aw-(slave_sel_bit_width))] ==  slave_addr) &
		     wbm1_cyc_o;
`endif
   
`ifdef WBM2
   wire 			  wbm2_req;
   assign wbm2_req = (wbm2_adr_o[aw-1:(aw-(slave_sel_bit_width))] ==  slave_addr) &
		     wbm2_cyc_o;
`endif

`ifdef WBM3
   wire 			  wbm3_req;
   assign wbm3_req = (wbm3_adr_o[aw-1:(aw-(slave_sel_bit_width))] ==  slave_addr) &
		     wbm3_cyc_o;
`endif
`ifdef WBM4
   wire 			  wbm4_req;
   assign wbm4_req = (wbm4_adr_o[aw-1:(aw-(slave_sel_bit_width))] ==  slave_addr) &
		     wbm4_cyc_o;
`endif
`ifdef WBM5
   wire 			  wbm5_req;
   assign wbm5_req = (wbm5_adr_o[aw-1:(aw-(slave_sel_bit_width))] ==  slave_addr) &
		     wbm5_cyc_o;
`endif
   
   // Generate wires to check if there's other requests than our own, to enable us to stop
   // any particular master hogging the bus
`ifdef WBM5
   wire 			  wbm0_other_reqs;
   assign wbm0_other_reqs = (wbm1_req | wbm2_req | wbm3_req | wbm4_req | wbm5_req);
   wire 			  wbm1_other_reqs;
   assign wbm1_other_reqs = (wbm0_req | wbm2_req | wbm3_req | wbm4_req | wbm5_req);
   wire 			  wbm2_other_reqs;
   assign wbm2_other_reqs = (wbm1_req | wbm0_req | wbm3_req | wbm4_req | wbm5_req);
   wire 			  wbm3_other_reqs;
   assign wbm3_other_reqs = (wbm1_req | wbm2_req | wbm0_req | wbm4_req | wbm5_req);
   wire 			  wbm4_other_reqs;
   assign wbm4_other_reqs = (wbm1_req | wbm2_req | wbm0_req | wbm3_req | wbm5_req);
   wire 			  wbm5_other_reqs;
   assign wbm5_other_reqs = (wbm1_req | wbm2_req | wbm0_req | wbm3_req | wbm4_req);
`else   
`ifdef WBM4
   wire 			  wbm0_other_reqs;
   assign wbm0_other_reqs = (wbm1_req | wbm2_req | wbm3_req | wbm4_req);
   wire 			  wbm1_other_reqs;
   assign wbm1_other_reqs = (wbm0_req | wbm2_req | wbm3_req | wbm4_req);
   wire 			  wbm2_other_reqs;
   assign wbm2_other_reqs = (wbm1_req | wbm0_req | wbm3_req | wbm4_req);
   wire 			  wbm3_other_reqs;
   assign wbm3_other_reqs = (wbm1_req | wbm2_req | wbm0_req | wbm4_req);
   wire 			  wbm4_other_reqs;
   assign wbm4_other_reqs = (wbm1_req | wbm2_req | wbm0_req | wbm3_req);
`else   
`ifdef WBM3
   wire 			  wbm0_other_reqs;
   assign wbm0_other_reqs = (wbm1_req | wbm2_req | wbm3_req);
   wire 			  wbm1_other_reqs;
   assign wbm1_other_reqs = (wbm0_req | wbm2_req | wbm3_req);
   wire 			  wbm2_other_reqs;
   assign wbm2_other_reqs = (wbm1_req | wbm0_req | wbm3_req);
   wire 			  wbm3_other_reqs;
   assign wbm3_other_reqs = (wbm1_req | wbm2_req | wbm0_req);
`else
 `ifdef WBM2
   wire 			  wbm0_other_reqs;
   assign wbm0_other_reqs = (wbm1_req | wbm2_req);
   wire 			  wbm1_other_reqs;
   assign wbm1_other_reqs = (wbm0_req | wbm2_req);
   wire 			  wbm2_other_reqs;
   assign wbm2_other_reqs = (wbm1_req | wbm0_req);
 `else
  `ifdef WBM1
   wire 			  wbm0_other_reqs;
   assign wbm0_other_reqs = (wbm1_req);
   wire 			  wbm1_other_reqs;
   assign wbm1_other_reqs = (wbm0_req);
  `else
   wire 			  wbm0_other_reqs;
   assign wbm0_other_reqs = 0;
  `endif
 `endif // !`ifdef WBM2
`endif // !`ifdef WBM3
`endif // !`ifdef WBM4
`endif // !`ifdef WBM5

   // Address match logic - number of bits from the MSbit we used for address 
   // selection. Typically just the top nibble
   always @(posedge wb_clk)
     if (wb_rst)
       begin
	  wbs_master_sel <= 0;
	  last_master <= 0;	  
       end // if (wb_rst)
     else
       begin
	  if ((!(|wbs_master_sel)) & (!(|wbs_master_sel_r))) 
	    // Make sure it's cleared for a couple cycles
	    begin
	       // check for a new master request
	       if (wbm0_req & ((!last_master[0]) | (last_master[0] & !wbm0_other_reqs)))
		 begin
		    wbs_master_sel[0] <= 1;
		    last_master <= 1;		    
		 end
`ifdef WBM1	       
	       else if (wbm1_req & ((!last_master[1]) | (last_master[1] & !wbm1_other_reqs)))
		 begin
		    wbs_master_sel[1] <= 1;
		    last_master <= 2;		    
		 end
`endif
`ifdef WBM2
	       else if (wbm2_req & ((!last_master[2]) | (last_master[2] & !wbm2_other_reqs)))
		 begin
		    wbs_master_sel[2] <= 1;
		    last_master <= 4;		    
		 end
`endif
`ifdef WBM3
	       else if (wbm3_req & ((!last_master[3]) | (last_master[3] & !wbm3_other_reqs)))
		 begin
		    wbs_master_sel[3] <= 1;
		    last_master <= 8;		    
		 end
`endif
`ifdef WBM4
	       else if (wbm4_req & ((!last_master[4]) | (last_master[4] & !wbm4_other_reqs)))
		 begin
		    wbs_master_sel[4] <= 1;
		    last_master <= 16;		    
		 end
`endif
`ifdef WBM5
	       else if (wbm5_req & ((!last_master[5]) | (last_master[5] & !wbm5_other_reqs)))
		 begin
		    wbs_master_sel[5] <= 1;
		    last_master <= 32;		    
		 end
`endif
	    end // if (!(|wbs_master_sel))
	  else
	    begin
	       // Poll the cycle of the selected master until it goes low, 
	       // at which point we select another master
	       if (wbs_master_sel[0] & !wbm0_cyc_o)
		 wbs_master_sel[0] <= 0;
`ifdef WBM1
	       if (wbs_master_sel[1] & !wbm1_cyc_o)
		 wbs_master_sel[1] <= 0;
`endif
`ifdef WBM2
	       if (wbs_master_sel[2] & !wbm2_cyc_o)
		 wbs_master_sel[2] <= 0;
`endif	       
`ifdef WBM3
	       if (wbs_master_sel[3] & !wbm3_cyc_o)
		 wbs_master_sel[3] <= 0;
`endif
`ifdef WBM4
	       if (wbs_master_sel[4] & !wbm4_cyc_o)
		 wbs_master_sel[4] <= 0;
`endif	       
`ifdef WBM5
	       if (wbs_master_sel[5] & !wbm5_cyc_o)
		 wbs_master_sel[5] <= 0;
`endif	       
	    end // else: !if(!(|wbs_master_sel))
       end // else: !if(wb_rst)
   
   always @(posedge wb_clk)
     wbs_master_sel_r <= wbs_master_sel;

`define  WBS_MASTER_DESELECT_ALSO   
`ifdef WBS_MASTER_DESELECT_ALSO
   // Also pulse for deselection of master
   assign wbs_master_sel_new = ((|wbs_master_sel) & !(|wbs_master_sel_r)) |
			       (!(|wbs_master_sel)) & (|wbs_master_sel_r);   
`else
   // Pulse for just new select of master by slave
   assign wbs_master_sel_new = (|wbs_master_sel) & !(|wbs_master_sel_r);
`endif   

endmodule // wb_b3_switch_slave_sel


// Detect which slave has selected this master to control its bus
// Need this to determine which slave's output to mux onto which master's inputs
module wb_b3_switch_master_detect_slave_sel
  (   
    output reg [`NUM_SLAVES-1:0] wbm_slave_sel,
      
    input [`NUM_MASTERS-1:0] wbs0_master_sel,
    input 		     wbs0_master_sel_new,
`ifdef WBS1
    input [`NUM_MASTERS-1:0] wbs1_master_sel,
    input 		     wbs1_master_sel_new,
`endif
`ifdef WBS2
    input [`NUM_MASTERS-1:0] wbs2_master_sel,
    input 		     wbs2_master_sel_new,
`endif
`ifdef WBS3
    input [`NUM_MASTERS-1:0] wbs3_master_sel,
    input 		     wbs3_master_sel_new,
`endif
`ifdef WBS4
    input [`NUM_MASTERS-1:0] wbs4_master_sel,
    input 		     wbs4_master_sel_new,
`endif
`ifdef WBS5
    input [`NUM_MASTERS-1:0] wbs5_master_sel,
    input 		     wbs5_master_sel_new,
`endif
`ifdef WBS6
    input [`NUM_MASTERS-1:0] wbs6_master_sel,
    input 		     wbs6_master_sel_new,
`endif
`ifdef WBS7
    input [`NUM_MASTERS-1:0] wbs7_master_sel,
    input 		     wbs7_master_sel_new,
`endif
    input 		     wb_clk, wb_rst
      );

   parameter slave_bit = 0;
   
   // Master's slave select detection logic (depends on which slave has 
   // selected it)
   always @(posedge wb_clk)
     if (wb_rst)
       wbm_slave_sel <= 0;
     else
       if (wbs0_master_sel_new
`ifdef WBS1
	   | wbs1_master_sel_new
`endif	   
`ifdef WBS2
	   | wbs2_master_sel_new
`endif	   
`ifdef WBS3
	   | wbs3_master_sel_new
`endif
`ifdef WBS4
	   | wbs4_master_sel_new
`endif
`ifdef WBS5
	   | wbs5_master_sel_new
`endif
`ifdef WBS6
	   | wbs6_master_sel_new
`endif
`ifdef WBS7
	   | wbs7_master_sel_new
`endif
	   )
	 // Figure out which slave is tied to master0
	 wbm_slave_sel <=
`ifdef WBS7
	   {wbs7_master_sel[slave_bit], wbs6_master_sel[slave_bit], 
	    wbs5_master_sel[slave_bit], wbs4_master_sel[slave_bit], 
	    wbs3_master_sel[slave_bit], wbs2_master_sel[slave_bit], 
	    wbs1_master_sel[slave_bit], wbs0_master_sel[slave_bit]};   
`else
 `ifdef WBS6
	   {wbs6_master_sel[slave_bit], wbs5_master_sel[slave_bit],
	    wbs4_master_sel[slave_bit], wbs3_master_sel[slave_bit], 
	    wbs2_master_sel[slave_bit], wbs1_master_sel[slave_bit], 
	    wbs0_master_sel[slave_bit]};   
 `else
  `ifdef WBS5
	   {wbs5_master_sel[slave_bit], wbs4_master_sel[slave_bit], 
	    wbs3_master_sel[slave_bit], wbs2_master_sel[slave_bit], 
	    wbs1_master_sel[slave_bit], wbs0_master_sel[slave_bit]};   
  `else
   `ifdef WBS4
	   {wbs4_master_sel[slave_bit], wbs3_master_sel[slave_bit], 
	    wbs2_master_sel[slave_bit], wbs1_master_sel[slave_bit], 
	    wbs0_master_sel[slave_bit]};   
   `else
    `ifdef WBS3
	   {wbs3_master_sel[slave_bit], wbs2_master_sel[slave_bit], 
	    wbs1_master_sel[slave_bit], wbs0_master_sel[slave_bit]};   
    `else
     `ifdef WBS2
           {wbs2_master_sel[slave_bit], wbs1_master_sel[slave_bit], 
	    wbs0_master_sel[slave_bit]};
     `else
      `ifdef WBS1
           {wbs1_master_sel[slave_bit], wbs0_master_sel[slave_bit]};
      `else
           wbs0_master_sel[slave_bit];
      `endif
     `endif
    `endif // !`ifdef WBS3
   `endif // !`ifdef WBS4
  `endif // !`ifdef WBS5
 `endif // !`ifdef WBS6
`endif // !`ifdef WBS7

endmodule // wb_b3_switch_master_detect_slave_sel

// All signals FROM master coming in, Muxing them to the signals TO the slave
module wb_b3_switch_slave_out_mux
  (
   // Master ports
   wbm0_adr_o, wbm0_bte_o, wbm0_cti_o, wbm0_cyc_o, wbm0_dat_o, wbm0_sel_o,
   wbm0_stb_o, wbm0_we_o,
`ifdef WBM1		    
   wbm1_adr_o, wbm1_bte_o, wbm1_cti_o, wbm1_cyc_o, wbm1_dat_o, wbm1_sel_o,
   wbm1_stb_o, wbm1_we_o,
`endif
`ifdef WBM2		    		     
   wbm2_adr_o, wbm2_bte_o, wbm2_cti_o, wbm2_cyc_o, wbm2_dat_o, wbm2_sel_o,
   wbm2_stb_o, wbm2_we_o,
`endif
`ifdef WBM3		    		     
   wbm3_adr_o, wbm3_bte_o, wbm3_cti_o, wbm3_cyc_o, wbm3_dat_o, wbm3_sel_o,
   wbm3_stb_o, wbm3_we_o,
`endif
`ifdef WBM4		    		     
   wbm4_adr_o, wbm4_bte_o, wbm4_cti_o, wbm4_cyc_o, wbm4_dat_o, wbm4_sel_o,
   wbm4_stb_o, wbm4_we_o,
`endif
`ifdef WBM5		    		    
   wbm5_adr_o, wbm5_bte_o, wbm5_cti_o, wbm5_cyc_o, wbm5_dat_o, wbm5_sel_o,
   wbm5_stb_o, wbm5_we_o,
`endif
   
   // Slave ports
   wbs_adr_i, wbs_bte_i, wbs_cti_i, wbs_cyc_i, wbs_dat_i, wbs_sel_i,
   wbs_stb_i, wbs_we_i,

   wbs_master_sel,
   
   wb_clk, wb_rst
   );

   
   parameter dw = 32;
   parameter aw = 32;
   parameter num_masters = `NUM_MASTERS;   
   
   input [aw-1:0] wbm0_adr_o;input [1:0] wbm0_bte_o;input [2:0]	wbm0_cti_o;input wbm0_cyc_o;input [dw-1:0] wbm0_dat_o;input [3:0] wbm0_sel_o;input wbm0_stb_o;input wbm0_we_o;
`ifdef WBM1
   input [aw-1:0] wbm1_adr_o;input [1:0] wbm1_bte_o;input [2:0]	wbm1_cti_o;input wbm1_cyc_o;input [dw-1:0] wbm1_dat_o;input [3:0] wbm1_sel_o;input wbm1_stb_o;input wbm1_we_o;
`endif
`ifdef WBM2
   input [aw-1:0] wbm2_adr_o;input [1:0] wbm2_bte_o;input [2:0]	wbm2_cti_o;input wbm2_cyc_o;input [dw-1:0] wbm2_dat_o;input [3:0] wbm2_sel_o;input wbm2_stb_o;input wbm2_we_o;
`endif
`ifdef WBM3
   input [aw-1:0] wbm3_adr_o;input [1:0] wbm3_bte_o;input [2:0]	wbm3_cti_o;input wbm3_cyc_o;input [dw-1:0] wbm3_dat_o;input [3:0] wbm3_sel_o;input wbm3_stb_o;input wbm3_we_o;
`endif
`ifdef WBM4
   input [aw-1:0] wbm4_adr_o;input [1:0] wbm4_bte_o;input [2:0]	wbm4_cti_o;input wbm4_cyc_o;input [dw-1:0] wbm4_dat_o;input [3:0] wbm4_sel_o;input wbm4_stb_o;input wbm4_we_o;
`endif
`ifdef WBM5
   input [aw-1:0] wbm5_adr_o;input [1:0] wbm5_bte_o;input [2:0]	wbm5_cti_o;input wbm5_cyc_o;input [dw-1:0] wbm5_dat_o;input [3:0] wbm5_sel_o;input wbm5_stb_o;input wbm5_we_o;
`endif
   
   output [aw-1:0] wbs_adr_i;output [1:0] wbs_bte_i;output [2:0] wbs_cti_i;output wbs_cyc_i;output [dw-1:0] wbs_dat_i;output [3:0] wbs_sel_i;output wbs_stb_i;output wbs_we_i;

   input [num_masters-1:0] wbs_master_sel;

   input 		   wb_clk, wb_rst;

   assign wbs_adr_i = (wbs_master_sel[0]) ? wbm0_adr_o :
`ifdef WBM1
                      (wbs_master_sel[1]) ? wbm1_adr_o :
`endif
`ifdef WBM2
	              (wbs_master_sel[2]) ? wbm2_adr_o :
`endif
`ifdef WBM3
		      (wbs_master_sel[3]) ? wbm3_adr_o :
`endif
`ifdef WBM4
		      (wbs_master_sel[4]) ? wbm4_adr_o :
`endif
`ifdef WBM5
		      (wbs_master_sel[5]) ? wbm5_adr_o :
`endif
		       0;
   assign wbs_bte_i = (wbs_master_sel[0]) ? wbm0_bte_o :
`ifdef WBM1
                      (wbs_master_sel[1]) ? wbm1_bte_o :
`endif
`ifdef WBM2
	              (wbs_master_sel[2]) ? wbm2_bte_o :
`endif
`ifdef WBM3
		      (wbs_master_sel[3]) ? wbm3_bte_o :
`endif
`ifdef WBM4
		      (wbs_master_sel[4]) ? wbm4_bte_o :
`endif
`ifdef WBM5
		      (wbs_master_sel[5]) ? wbm5_bte_o :
`endif
		       0;
   assign wbs_cti_i = (wbs_master_sel[0]) ? wbm0_cti_o :
`ifdef WBM1
                      (wbs_master_sel[1]) ? wbm1_cti_o :
`endif
`ifdef WBM2
	              (wbs_master_sel[2]) ? wbm2_cti_o :
`endif
`ifdef WBM3
		      (wbs_master_sel[3]) ? wbm3_cti_o :
`endif
`ifdef WBM4
		      (wbs_master_sel[4]) ? wbm4_cti_o :
`endif
`ifdef WBM5
		      (wbs_master_sel[5]) ? wbm5_cti_o :
`endif
		       0;

   assign wbs_cyc_i = (wbs_master_sel[0]) ? wbm0_cyc_o :
`ifdef WBM1
                      (wbs_master_sel[1]) ? wbm1_cyc_o :
`endif
`ifdef WBM2
	              (wbs_master_sel[2]) ? wbm2_cyc_o :
`endif
`ifdef WBM3
		      (wbs_master_sel[3]) ? wbm3_cyc_o :
`endif
`ifdef WBM4
		      (wbs_master_sel[4]) ? wbm4_cyc_o :
`endif
`ifdef WBM5
		      (wbs_master_sel[5]) ? wbm5_cyc_o :
`endif
		       0;

   assign wbs_dat_i = (wbs_master_sel[0]) ? wbm0_dat_o :
`ifdef WBM1
                      (wbs_master_sel[1]) ? wbm1_dat_o :
`endif
`ifdef WBM2
	              (wbs_master_sel[2]) ? wbm2_dat_o :
`endif
`ifdef WBM3
		      (wbs_master_sel[3]) ? wbm3_dat_o :
`endif
`ifdef WBM4
		      (wbs_master_sel[4]) ? wbm4_dat_o :
`endif
`ifdef WBM5
		      (wbs_master_sel[5]) ? wbm5_dat_o :
`endif
		       0;

   assign wbs_sel_i = (wbs_master_sel[0]) ? wbm0_sel_o :
`ifdef WBM1
                      (wbs_master_sel[1]) ? wbm1_sel_o :
`endif
`ifdef WBM2
	              (wbs_master_sel[2]) ? wbm2_sel_o :
`endif
`ifdef WBM3
		      (wbs_master_sel[3]) ? wbm3_sel_o :
`endif
`ifdef WBM4
		      (wbs_master_sel[4]) ? wbm4_sel_o :
`endif
`ifdef WBM5
		      (wbs_master_sel[5]) ? wbm5_sel_o :
`endif
		       0;

      assign wbs_stb_i = (wbs_master_sel[0]) ? wbm0_stb_o :
`ifdef WBM1
                      (wbs_master_sel[1]) ? wbm1_stb_o :
`endif
`ifdef WBM2
	              (wbs_master_sel[2]) ? wbm2_stb_o :
`endif
`ifdef WBM3
		      (wbs_master_sel[3]) ? wbm3_stb_o :
`endif
`ifdef WBM4
		      (wbs_master_sel[4]) ? wbm4_stb_o :
`endif
`ifdef WBM5
		      (wbs_master_sel[5]) ? wbm5_stb_o :
`endif
		       0;

   assign wbs_we_i = (wbs_master_sel[0]) ? wbm0_we_o :
`ifdef WBM1
                      (wbs_master_sel[1]) ? wbm1_we_o :
`endif
`ifdef WBM2
	              (wbs_master_sel[2]) ? wbm2_we_o :
`endif
`ifdef WBM3
		      (wbs_master_sel[3]) ? wbm3_we_o :
`endif
`ifdef WBM4
		      (wbs_master_sel[4]) ? wbm4_we_o :
`endif
`ifdef WBM5
		      (wbs_master_sel[5]) ? wbm5_we_o :
`endif
		       0;
endmodule // wb_b3_switch_slave_out_mux

   
module wb_b3_switch_master_out_mux
  (
   // Master in, for watchdog
   wbm_stb_o,
   // Master outs
   wbm_ack_i, wbm_err_i, wbm_rty_i, wbm_dat_i,
   // Slave ports
   wbs0_ack_o, wbs0_err_o, wbs0_rty_o, wbs0_dat_o,   
`ifdef WBS1
   wbs1_ack_o, wbs1_err_o, wbs1_rty_o, wbs1_dat_o,
`endif
`ifdef WBS2
   wbs2_ack_o, wbs2_err_o, wbs2_rty_o, wbs2_dat_o,
`endif		     
`ifdef WBS3
   wbs3_ack_o, wbs3_err_o, wbs3_rty_o, wbs3_dat_o,
`endif
`ifdef WBS4
   wbs4_ack_o, wbs4_err_o, wbs4_rty_o, wbs4_dat_o,
`endif
`ifdef WBS5
   wbs5_ack_o, wbs5_err_o, wbs5_rty_o, wbs5_dat_o,
`endif
`ifdef WBS6
   wbs6_ack_o, wbs6_err_o, wbs6_rty_o, wbs6_dat_o,
`endif
`ifdef WBS7
   wbs7_ack_o, wbs7_err_o, wbs7_rty_o, wbs7_dat_o,
`endif

   wbm_slave_sel,

   wb_clk, wb_rst);

   // Data and address width parameters
   parameter dw = 32;
   parameter aw = 32;
   input  wbm_stb_o;
   
   output wbm_ack_i;output wbm_err_i;output wbm_rty_i;output [dw-1:0] wbm_dat_i;
   
   input   wbs0_ack_o;input wbs0_err_o;input wbs0_rty_o;input [dw-1:0] wbs0_dat_o;
   
`ifdef WBS1
    input  wbs1_ack_o;input wbs1_err_o;input wbs1_rty_o;input [dw-1:0] wbs1_dat_o;
`endif
`ifdef WBS2
   input   wbs2_ack_o;input wbs2_err_o;input wbs2_rty_o;input [dw-1:0] wbs2_dat_o;
`endif
`ifdef WBS3
   input   wbs3_ack_o;input wbs3_err_o;input wbs3_rty_o;input [dw-1:0] wbs3_dat_o;
`endif
`ifdef WBS4
   input   wbs4_ack_o;input wbs4_err_o;input wbs4_rty_o;input [dw-1:0] wbs4_dat_o;
`endif
`ifdef WBS5
   input   wbs5_ack_o;input wbs5_err_o;input wbs5_rty_o;input [dw-1:0] wbs5_dat_o;
`endif
`ifdef WBS6
   input   wbs6_ack_o;input wbs6_err_o;input wbs6_rty_o;input [dw-1:0] wbs6_dat_o;
`endif
`ifdef WBS7
   input   wbs7_ack_o;input wbs7_err_o;input wbs7_rty_o;input [dw-1:0] wbs7_dat_o;
`endif
   
   input [`NUM_SLAVES-1:0] wbm_slave_sel;
   
   input 		   wb_clk, wb_rst;

`ifdef WATCHDOG_TIMER   
   parameter watchdog_timer_width = 8;
   reg [watchdog_timer_width-1:0] watchdog_timer;
   reg 			   watchdog_err;
   reg 			   wbm_stb_r, wbm_stb_r2; // Register strobe
   wire 		   wbm_stb_edge; // Detect its edge
   reg 			   wbm_stb_edge_r;
   reg 			   wbm_ack_i_r;
   
			   
   always @(posedge wb_clk)
     wbm_stb_r <= wbm_stb_o;
   
   always @(posedge wb_clk)
     wbm_stb_r2 <= wbm_stb_r;
   
   always @(posedge wb_clk)
     wbm_stb_edge_r <= wbm_stb_edge;

   always @(posedge wb_clk)
     wbm_ack_i_r <= wbm_ack_i;
   
   
   assign wbm_stb_edge = (wbm_stb_r & !wbm_stb_r2);
   
   // Counter logic
   always @(posedge wb_clk)
     if (wb_rst) watchdog_timer <= 0;
     else if (wbm_ack_i_r) // When we see an ack, turn off timer
       watchdog_timer <= 0;
     else if (wbm_stb_edge_r) // New access means start timer again
       watchdog_timer <= 1;
     else if (|watchdog_timer) // Continue counting if counter > 0
       watchdog_timer <= watchdog_timer + 1;

   always @(posedge wb_clk) 
     watchdog_err <= (&watchdog_timer);

   always @(posedge watchdog_err)
     begin
	$display("%t: %m - Watchdog counter error",$time);
	if (|wbm_slave_sel)
	  $display("%t: %m - slave %d selected - it didn't respond in time", 
		   $time, wbm_slave_sel);
	else
	  $display("%t: %m - NO slave was selected by switch - either bad address or arbiter hadn't granted a access to a locked slave", $time);
     end
   
`else
   wire 		   watchdog_err;
   assign watchdog_err = 0;
`endif
   
   

   assign wbm_ack_i = (wbm_slave_sel[0]) ? wbs0_ack_o :
`ifdef WBS1
                      (wbm_slave_sel[1]) ? wbs1_ack_o :		      
`endif
`ifdef WBS2
                      (wbm_slave_sel[2]) ? wbs2_ack_o :		      
`endif
`ifdef WBS3
                      (wbm_slave_sel[3]) ? wbs3_ack_o :		      
`endif
`ifdef WBS4
                      (wbm_slave_sel[4]) ? wbs4_ack_o :		      
`endif
`ifdef WBS5
                      (wbm_slave_sel[5]) ? wbs5_ack_o :		      
`endif
`ifdef WBS6
                      (wbm_slave_sel[6]) ? wbs6_ack_o :		      
`endif
`ifdef WBS7
                      (wbm_slave_sel[7]) ? wbs7_ack_o :		      
`endif
		       watchdog_err;
   
   assign wbm_err_i = (wbm_slave_sel[0]) ? wbs0_err_o :
`ifdef WBS1
                      (wbm_slave_sel[1]) ? wbs1_err_o :		      
`endif
`ifdef WBS2
                      (wbm_slave_sel[2]) ? wbs2_err_o :		      
`endif
`ifdef WBS3
                      (wbm_slave_sel[3]) ? wbs3_err_o :		      
`endif
`ifdef WBS4
                      (wbm_slave_sel[4]) ? wbs4_err_o :		      
`endif
`ifdef WBS5
                      (wbm_slave_sel[5]) ? wbs5_err_o :		      
`endif
`ifdef WBS6
                      (wbm_slave_sel[6]) ? wbs6_err_o :		      
`endif
`ifdef WBS7
                      (wbm_slave_sel[7]) ? wbs7_err_o :		      
`endif
		       watchdog_err;
   
   assign wbm_rty_i = (wbm_slave_sel[0]) ? wbs0_rty_o :
`ifdef WBS1
                      (wbm_slave_sel[1]) ? wbs1_rty_o :		      
`endif
`ifdef WBS2
                      (wbm_slave_sel[2]) ? wbs2_rty_o :		      
`endif
`ifdef WBS3
                      (wbm_slave_sel[3]) ? wbs3_rty_o :		      
`endif
`ifdef WBS4
                      (wbm_slave_sel[4]) ? wbs4_rty_o :		      
`endif
`ifdef WBS5
                      (wbm_slave_sel[5]) ? wbs5_rty_o :		      
`endif
`ifdef WBS6
                      (wbm_slave_sel[6]) ? wbs6_rty_o :		      
`endif
`ifdef WBS7
                      (wbm_slave_sel[7]) ? wbs7_rty_o :		      
`endif
		       0;
   
   assign wbm_dat_i = (wbm_slave_sel[0]) ? wbs0_dat_o :
`ifdef WBS1
                      (wbm_slave_sel[1]) ? wbs1_dat_o :		      
`endif
`ifdef WBS2
                      (wbm_slave_sel[2]) ? wbs2_dat_o :		      
`endif
`ifdef WBS3
                      (wbm_slave_sel[3]) ? wbs3_dat_o :		      
`endif		       		
`ifdef WBS4
                      (wbm_slave_sel[4]) ? wbs4_dat_o :		      
`endif		       		
`ifdef WBS5
                      (wbm_slave_sel[5]) ? wbs5_dat_o :		      
`endif		       		
`ifdef WBS6
                      (wbm_slave_sel[6]) ? wbs6_dat_o :		      
`endif		       		
`ifdef WBS7
                      (wbm_slave_sel[7]) ? wbs7_dat_o :		      
`endif		       		
		       0;
   
endmodule // wb_b3_switch_master_out_mux

       
