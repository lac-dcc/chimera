// This program was cloned from: https://github.com/intel/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. All rights reserved
module hdpldadapt_rx_datapath_asn
(
	input	wire		rx_clock_asn_pma_hclk,
	input	wire		rx_clock_fifo_rd_clk,
	input	wire		rx_reset_asn_pma_hclk_rst_n,
	input	wire		rx_reset_fifo_rd_rst_n,
	input	wire [1:0]	rx_pld_rate,
	input	wire		rx_fsr_mask_tx_pll,		//pld_pmaif_mask_tx_pll
	input	wire [1:0]	rx_ssr_pcie_sw_done,		//pld_pma_pcie_sw_done
	input	wire		rx_hrdrst_asn_data_transfer_en,
	input	wire		rx_asn_phystatus,
	input	wire		nfrzdrv_in,
	input	wire		pr_channel_freeze_n,
	input	wire 		pld_fabric_rx_asn_data_transfer_en,
	input	wire		bond_rx_asn_ds_in_fifo_hold,
	//input	wire		bond_rx_asn_ds_in_fifo_srst,
	//input	wire		bond_rx_asn_ds_in_dll_lock_en,
	//input	wire		bond_rx_asn_ds_in_gen3_sel,
	input	wire		bond_rx_asn_us_in_fifo_hold,
	//input	wire		bond_rx_asn_us_in_fifo_srst,
	//input	wire		bond_rx_asn_us_in_dll_lock_en,
	//input	wire		bond_rx_asn_us_in_gen3_sel,
	input	wire		r_rx_asn_en,
	//input	wire		r_rx_asn_bypass_wait_clock_idle,
	input	wire		r_rx_asn_bypass_pma_pcie_sw_done,
	//input	wire		r_rx_asn_bypass_data_transfer_en,
	input	wire [7:0]	r_rx_asn_wait_for_fifo_flush_cnt,
	input	wire [7:0]	r_rx_asn_wait_for_dll_reset_cnt,
	input	wire [7:0]	r_rx_asn_wait_for_pma_pcie_sw_done_cnt,
	//input	wire [7:0]	r_rx_asn_wait_for_data_transfer_ready_cnt,
	//input	wire [6:0]	r_rx_asn_wait_for_fifo_ready_cnt,
	input	wire [1:0]	r_rx_master_sel,
	input	wire		r_rx_dist_master_sel,
	input	wire		r_rx_bonding_dft_in_en,
	input	wire		r_rx_bonding_dft_in_value,
	input	wire		r_rx_hrdrst_user_ctl_en,
	output	wire		pld_fabric_asn_dll_lock_en,
	output	wire		bond_rx_asn_ds_out_fifo_hold,
	//output	wire		bond_rx_asn_ds_out_fifo_srst,
	//output	wire		bond_rx_asn_ds_out_dll_lock_en,
	//output	wire		bond_rx_asn_ds_out_gen3_sel,
	output	wire		bond_rx_asn_us_out_fifo_hold,
	//output	wire		bond_rx_asn_us_out_fifo_srst,
	//output	wire		bond_rx_asn_us_out_dll_lock_en,
	//output	wire		bond_rx_asn_us_out_gen3_sel,
	output	reg		rx_asn_rate_change_in_progress,
	//output	wire [1:0]	rx_asn_rate,
	output	wire		rx_asn_fifo_hold,	// Bonded
	//output	wire		rx_asn_fifo_srst,	// Bonded
	output	reg		rx_asn_dll_lock_en,	// Bonded
	//output	wire		rx_asn_gen3_sel,	// Bonded
	output	wire [19:0]	rx_asn_testbus
);

//********************************************************************
// Define Parameters 
//********************************************************************
	localparam  WAIT_RATE_CHANGE		= 4'b0000;
	localparam  HOLD_FIFO_DATA		= 4'b0001;
	localparam  RESET_DLL			= 4'b0010;
	localparam  WAIT_DLL_RESET		= 4'b0011;
	localparam  WAIT_SWITCH_REQUEST		= 4'b0100;
	localparam  WAIT_SWITCH_DONE		= 4'b0101;
	localparam  ENABLE_DLL_LOCK		= 4'b0110;
	localparam  WAIT_DLL_LOCK_DONE		= 4'b0111;
	//localparam  DEASSERT_FIFO_RESET	= 4'b1000;
	//localparam  WAIT_FIFO_READY		= 4'b1001;
	localparam  SPEED_CHANGE_DONE		= 4'b1000;

//********************************************************************
// Define variables 
//********************************************************************

	wire		frz_2one_by_nfrzdrv_or_pr_channel_freeze_n;

	reg  [3:0]   	asn_sm_cs;
	reg  [3:0]   	asn_sm_ns;

	wire [1:0]	rx_pld_rate_sync;
	reg [1:0]	rx_pld_rate_sync_reg1;
	reg [1:0]	rx_pld_rate_sync_reg2;
	wire		rx_asn_allow_rate_update;
	reg [1:0]	rx_asn_rate_update;
	wire		rx_asn_rate_change_pulse;
	/*
	//reg		rx_asn_rate_change_g1_g2;
	//reg		rx_asn_rate_change_g2_g1;
	reg		rx_asn_rate_change_g1_g3;
	reg		rx_asn_rate_change_g3_g1;
	reg		rx_asn_rate_change_g2_g3;
	reg		rx_asn_rate_change_g3_g2;
	wire		rx_asn_from_to_g3;
	*/

	/*
	wire [1:0]	rx_asn_rate_int_sync;
	reg [1:0]	rx_asn_rate_int_sync_reg1;
	reg [1:0]	rx_asn_rate_int_sync_reg2;
	*/

	wire [1:0]	rx_ssr_pcie_sw_done_sync;
	reg [1:0]	rx_ssr_pcie_sw_done_sync_reg;
	reg		rx_asn_pma_pcie_sw_done_change_mem;

	wire		rx_fsr_mask_tx_pll_sync;
	wire		rx_hrdrst_asn_data_transfer_en_int;
	wire		rx_hrdrst_asn_data_transfer_en_sync;

	reg		rx_asn_phystatus_reg;
	reg		rx_asn_phystatus_rise_mem;
	wire		rx_asn_phystatus_rise_mem_sync;

	reg [7:0]  	rx_asn_counter;
	reg		rx_asn_counter_done;

	reg		rx_asn_fifo_hold_comb;
	reg		rx_asn_fifo_hold_reg;
	//reg		rx_asn_fifo_srst_comb;
	//reg		rx_asn_fifo_srst_reg;
	reg		rx_asn_dll_lock_en_comb;
	//reg		rx_asn_dll_lock_en_reg;
	reg		rx_asn_wait_pma_pcie_sw_done_comb;
	reg		rx_asn_wait_pma_pcie_sw_done;
	reg		rx_asn_wait_phystatus_comb;
	reg		rx_asn_wait_phystatus;
	wire		rx_asn_wait_phystatus_sync;
	//reg		rx_asn_send_rate_change;
	//reg		rx_asn_switch_mux;
	//reg		rx_asn_gen3_sel_reg;

	reg		rx_asn_reset_count;
	reg		rx_asn_count_wait_for_fifo_flush;
	reg		rx_asn_count_wait_for_dll_reset;
	reg		rx_asn_count_wait_for_pma_pcie_sw_done;
	//reg		rx_asn_count_wait_for_data_transfer_ready;
	//reg		rx_asn_count_wait_for_fifo_ready;

	wire		bond_rx_asn_ds_in_fifo_hold_int;
	//wire		bond_rx_asn_ds_in_fifo_srst_int;
	//wire		bond_rx_asn_ds_in_dll_lock_en_int;
	//wire		bond_rx_asn_ds_in_gen3_sel_int;
	wire		bond_rx_asn_us_in_fifo_hold_int;
	//wire		bond_rx_asn_us_in_fifo_srst_int;
	//wire		bond_rx_asn_us_in_dll_lock_en_int;
	//wire		bond_rx_asn_us_in_gen3_sel_int;

	wire		rx_asn_fifo_hold_chnl_down;		
	wire		rx_asn_fifo_hold_chnl_up;		
	//wire		rx_asn_fifo_srst_chnl_down;		
	//wire		rx_asn_fifo_srst_chnl_up;		
	//wire		rx_asn_dll_lock_en_chnl_down;		
	//wire		rx_asn_dll_lock_en_chnl_up;		
	//wire		rx_asn_gen3_sel_chnl_down;		
	//wire		rx_asn_gen3_sel_chnl_up;		

//********************************************************************
// Test bus
//********************************************************************
assign rx_asn_testbus[19:0] = {2'b00,rx_hrdrst_asn_data_transfer_en, rx_asn_phystatus_rise_mem_sync,rx_hrdrst_asn_data_transfer_en_sync,rx_asn_pma_pcie_sw_done_change_mem,rx_ssr_pcie_sw_done_sync[1:0],rx_fsr_mask_tx_pll_sync,rx_asn_dll_lock_en,rx_asn_fifo_hold,rx_asn_fifo_hold_reg,rx_asn_rate_update[1:0],rx_pld_rate[1:0],asn_sm_cs[3:0]};

//********************************************************************
// PLD
//********************************************************************
assign frz_2one_by_nfrzdrv_or_pr_channel_freeze_n = ~(nfrzdrv_in & pr_channel_freeze_n);
assign pld_fabric_asn_dll_lock_en = frz_2one_by_nfrzdrv_or_pr_channel_freeze_n | rx_asn_dll_lock_en;

//********************************************************************
//********************************************************************
//assign rx_asn_rate_change_in_progress = (asn_sm_cs[3:0] != WAIT_RATE_CHANGE);

always @(negedge rx_reset_asn_pma_hclk_rst_n or posedge rx_clock_asn_pma_hclk)
begin
	if (~rx_reset_asn_pma_hclk_rst_n) 
	begin
		rx_asn_rate_change_in_progress <= 1'b0;
	end
	else 
	begin
          	rx_asn_rate_change_in_progress <= (asn_sm_cs[3:0] != WAIT_RATE_CHANGE);
        end
end        

// Rate change detection in hclk domain
cdclib_bitsync2
    #(
   	.DWIDTH      (2),       // Sync Data input
   	.RESET_VAL   (0),	// Reset value
	.CLK_FREQ_MHZ(250),
        .TOGGLE_TYPE (2),
        .VID         (1)
    ) cdclib_bitsync2_pld_rate
    (
      .clk      (rx_clock_asn_pma_hclk),
      .rst_n    (rx_reset_asn_pma_hclk_rst_n),
      .data_in  (rx_pld_rate[1:0]),
      .data_out (rx_pld_rate_sync[1:0])
    );

always @(negedge rx_reset_asn_pma_hclk_rst_n or posedge rx_clock_asn_pma_hclk)
begin
	if (~rx_reset_asn_pma_hclk_rst_n) 
	begin
		rx_pld_rate_sync_reg1[1:0] <= {2{1'b0}};
		rx_pld_rate_sync_reg2[1:0] <= {2{1'b0}};
	end
	else 
	begin
          	rx_pld_rate_sync_reg1[1:0] <= rx_pld_rate_sync[1:0];
          	rx_pld_rate_sync_reg2[1:0] <= rx_pld_rate_sync_reg1[1:0];
        end
end        

assign rx_asn_allow_rate_update = (asn_sm_cs[3:0] == WAIT_RATE_CHANGE) && 
				  (rx_pld_rate_sync[1:0] == rx_pld_rate_sync_reg1[1:0]) && 
				  (rx_pld_rate_sync_reg1[1:0] == rx_pld_rate_sync_reg2[1:0]);

always @(negedge rx_reset_asn_pma_hclk_rst_n or posedge rx_clock_asn_pma_hclk)
begin
	if (~rx_reset_asn_pma_hclk_rst_n) 
	begin
		rx_asn_rate_update[1:0] <= {2{1'b0}};
	end
	else 
	begin
		if (rx_asn_allow_rate_update)
		begin
          		rx_asn_rate_update[1:0] <= rx_pld_rate_sync_reg2[1:0];
		end
        end
end        

assign rx_asn_rate_change_pulse = rx_asn_allow_rate_update && (rx_asn_rate_update[1:0] != rx_pld_rate_sync_reg2[1:0]);

/*
always @(negedge rx_reset_asn_pma_hclk_rst_n or posedge rx_clock_asn_pma_hclk)
begin
	if (~rx_reset_asn_pma_hclk_rst_n) 
	begin
		//rx_asn_rate_change_g1_g2  <= 1'b0;
      		//rx_asn_rate_change_g2_g1  <= 1'b0;
      		rx_asn_rate_change_g1_g3  <= 1'b0;
      		rx_asn_rate_change_g3_g1  <= 1'b0;
      		rx_asn_rate_change_g2_g3  <= 1'b0;
      		rx_asn_rate_change_g3_g2  <= 1'b0;
	end
	else 
	begin
		if (rx_asn_rate_change_pulse)
		begin
			//rx_asn_rate_change_g1_g2  <= ((rx_asn_rate_update == 2'b00) && (rx_pld_rate_sync_reg2 == 2'b01));
			//rx_asn_rate_change_g2_g1  <= ((rx_asn_rate_update == 2'b01) && (rx_pld_rate_sync_reg2 == 2'b00));
			rx_asn_rate_change_g1_g3  <= ((rx_asn_rate_update == 2'b00) && (rx_pld_rate_sync_reg2 == 2'b10));
			rx_asn_rate_change_g3_g1  <= ((rx_asn_rate_update == 2'b10) && (rx_pld_rate_sync_reg2 == 2'b00));
			rx_asn_rate_change_g2_g3  <= ((rx_asn_rate_update == 2'b01) && (rx_pld_rate_sync_reg2 == 2'b10));
			rx_asn_rate_change_g3_g2  <= ((rx_asn_rate_update == 2'b10) && (rx_pld_rate_sync_reg2 == 2'b01));
		end
	end
end

// Rate change from/to GEN3
assign rx_asn_from_to_g3 = rx_asn_rate_change_g1_g3 | rx_asn_rate_change_g3_g1 | rx_asn_rate_change_g2_g3 | rx_asn_rate_change_g3_g2;
*/

//assign rx_asn_rate[1:0] = rx_asn_rate_update[1:0]; 

/*
// Rate change generation in PIPE clock domain
cdclib_bitsync2
    #(
   	.DWIDTH      (2),       // Sync Data input
   	.RESET_VAL   (0)	// Reset value
    ) cdclib_bitsync2_rx_asn_rate_int_sync
    (
      .clk      (tx_clock_fifo_wr_clk),
      .rst_n    (tx_reset_fifo_wr_rst_n),
      .data_in  (rx_asn_rate_int[1:0]),
      .data_out (rx_asn_rate_int_sync[1:0])
    );

always @(negedge tx_reset_fifo_wr_rst_n or posedge tx_clock_fifo_wr_clk)
begin
	if (~tx_reset_fifo_wr_rst_n) 
	begin
		rx_asn_rate_int_sync_reg1[1:0] <= {2{1'b0}};
		rx_asn_rate_int_sync_reg2[1:0] <= {2{1'b0}};
	end
	else 
	begin
          	rx_asn_rate_int_sync_reg1[1:0] <= rx_asn_rate_int_sync[1:0];
          	rx_asn_rate_int_sync_reg2[1:0] <= rx_asn_rate_int_sync_reg1[1:0];
        end
end        

always @(negedge tx_reset_fifo_wr_rst_n or posedge tx_clock_fifo_wr_clk)
begin
	if (~tx_reset_fifo_wr_rst_n) 
	begin
		rx_asn_rate[1:0] <= {2{1'b0}};
	end
	else 
	begin
		if ((rx_asn_rate_int_sync[1:0] == rx_asn_rate_int_sync_reg1[1:0]) && (rx_asn_rate_int_sync_reg1[1:0] == rx_asn_rate_int_sync_reg2[1:0]))
		begin
          		rx_asn_rate[1:0] <= rx_asn_rate_int_sync_reg2[1:0];
		end
        end
end        
*/

// PMA pcie_sw_done change detection
cdclib_bitsync2
    #(
   	.DWIDTH      (2),       // Sync Data input
   	.RESET_VAL   (0),	// Reset value
	.CLK_FREQ_MHZ(250),
        .TOGGLE_TYPE (2),
        .VID         (1)
    ) cdclib_bitsync2_pma_pcie_sw_done
    (
      .clk      (rx_clock_asn_pma_hclk),
      .rst_n    (rx_reset_asn_pma_hclk_rst_n),
      .data_in  (rx_ssr_pcie_sw_done[1:0]),
      .data_out (rx_ssr_pcie_sw_done_sync[1:0])
    );


always @(negedge rx_reset_asn_pma_hclk_rst_n or posedge rx_clock_asn_pma_hclk)
begin
	if (~rx_reset_asn_pma_hclk_rst_n)
    	begin
      		rx_ssr_pcie_sw_done_sync_reg[1:0] <= 2'b00;
    	end	
  	else
    	begin
      		rx_ssr_pcie_sw_done_sync_reg[1:0] <= rx_ssr_pcie_sw_done_sync[1:0];
    	end
end

// Store the change of PMA pcie_sw_done at any time after RESET_DLL state. 
always @(negedge rx_reset_asn_pma_hclk_rst_n or posedge rx_clock_asn_pma_hclk)
begin
	if (~rx_reset_asn_pma_hclk_rst_n)
    	begin
		rx_asn_pma_pcie_sw_done_change_mem <= 1'b0;
    	end
  	else if (rx_asn_wait_pma_pcie_sw_done == 1'b1)
    	begin
      		rx_asn_pma_pcie_sw_done_change_mem <= (rx_ssr_pcie_sw_done_sync_reg[1:0] != rx_ssr_pcie_sw_done_sync[1:0]) || rx_asn_pma_pcie_sw_done_change_mem;
    	end
  	else
    	begin
      		rx_asn_pma_pcie_sw_done_change_mem   <= 1'b0;
    	end
end

// PMA IF mask_tx_pll
cdclib_bitsync2
    #(
   	.DWIDTH      (1),       // Sync Data input
   	.RESET_VAL   (0),	// Reset value
	.CLK_FREQ_MHZ(250),
        .TOGGLE_TYPE (2),
        .VID         (1)
    ) cdclib_bitsync2_rx_fsr_mask_tx_pll
    (
      .clk      (rx_clock_asn_pma_hclk),
      .rst_n    (rx_reset_asn_pma_hclk_rst_n),
      .data_in  (rx_fsr_mask_tx_pll),
      .data_out (rx_fsr_mask_tx_pll_sync)
    );

assign rx_hrdrst_asn_data_transfer_en_int = r_rx_hrdrst_user_ctl_en ? pld_fabric_rx_asn_data_transfer_en : rx_hrdrst_asn_data_transfer_en;

cdclib_bitsync2
    #(
   	.DWIDTH      (1),       // Sync Data input
   	.RESET_VAL   (0),	// Reset value
	.CLK_FREQ_MHZ(250),
        .TOGGLE_TYPE (2),
        .VID         (1)
    ) cdclib_bitsync2_rx_hrdrst_asn_data_transfer_en
    (
      .clk      (rx_clock_asn_pma_hclk),
      .rst_n    (rx_reset_asn_pma_hclk_rst_n),
      .data_in  (rx_hrdrst_asn_data_transfer_en_int),
      .data_out (rx_hrdrst_asn_data_transfer_en_sync)
    );

// PCS phystatus rising edge detection
cdclib_bitsync4
    #(
   	.DWIDTH      (1),       // Sync Data input
   	.RESET_VAL   (0),	// Reset value
	.CLK_FREQ_MHZ(1000),
        .TOGGLE_TYPE (2),
        .VID         (1)
    ) cdclib_bitsync4_rx_asn_wait_phystatus
    (
      .clk      (rx_clock_fifo_rd_clk),
      .rst_n    (rx_reset_fifo_rd_rst_n),
      .data_in  (rx_asn_wait_phystatus),
      .data_out (rx_asn_wait_phystatus_sync)
    );

always @(negedge rx_reset_fifo_rd_rst_n or posedge rx_clock_fifo_rd_clk)
begin
	if (~rx_reset_fifo_rd_rst_n)
    	begin
      		rx_asn_phystatus_reg <= 1'b1;
    	end	
  	else
    	begin
      		rx_asn_phystatus_reg <= rx_asn_phystatus;
    	end
end

// Store the rising edge of PCS phystatus at any time after RESET_DLL state. 
always @(negedge rx_reset_fifo_rd_rst_n or posedge rx_clock_fifo_rd_clk)
begin
	if (~rx_reset_fifo_rd_rst_n)
    	begin
		rx_asn_phystatus_rise_mem <= 1'b0;
    	end
  	else if (rx_asn_wait_phystatus_sync)
    	begin
      		rx_asn_phystatus_rise_mem <= (rx_asn_phystatus && ~rx_asn_phystatus_reg) || rx_asn_phystatus_rise_mem;
    	end
  	else
    	begin
      		rx_asn_phystatus_rise_mem <= 1'b0;
    	end
end

cdclib_bitsync2
    #(
   	.DWIDTH      (1),       // Sync Data input
   	.RESET_VAL   (0),	// Reset value
	.CLK_FREQ_MHZ(250),
        .TOGGLE_TYPE (2),
        .VID         (1)
    ) cdclib_bitsync2_rx_asn_phystatus_rise_mem
    (
      .clk      (rx_clock_asn_pma_hclk),
      .rst_n    (rx_reset_asn_pma_hclk_rst_n),
      .data_in  (rx_asn_phystatus_rise_mem),
      .data_out (rx_asn_phystatus_rise_mem_sync)
    );

//********************************************************************
//  Multiple counters for ASN SM
//********************************************************************
always @ (negedge rx_reset_asn_pma_hclk_rst_n or posedge rx_clock_asn_pma_hclk)
begin
	if (~rx_reset_asn_pma_hclk_rst_n)
	begin
		rx_asn_counter[7:0] <=  8'h00;
        	rx_asn_counter_done <=  1'b0;
      	end
    	else if (rx_asn_reset_count)
      	begin
        	rx_asn_counter[7:0] <=  8'h00;
        	rx_asn_counter_done <=  1'b0;
      	end
	else 
      	begin
        	rx_asn_counter <=  rx_asn_counter + 8'h01;
        	if (~rx_asn_counter_done)
          	begin
            		if(rx_asn_count_wait_for_fifo_flush)
              		begin
                		rx_asn_counter_done <=  (rx_asn_counter[7:0] == r_rx_asn_wait_for_fifo_flush_cnt[7:0]) ? 1'b1 : 1'b0;
              		end
            		else if (rx_asn_count_wait_for_dll_reset)
              		begin
                		rx_asn_counter_done <=  (rx_asn_counter[7:0] == r_rx_asn_wait_for_dll_reset_cnt[7:0]) ? 1'b1 : 1'b0;
              		end
            		else if (rx_asn_count_wait_for_pma_pcie_sw_done)
              		begin
                		rx_asn_counter_done <=  (rx_asn_counter[7:0] == r_rx_asn_wait_for_pma_pcie_sw_done_cnt[7:0]) ? 1'b1 : 1'b0;
              		end
            		//else if (rx_asn_count_wait_for_data_transfer_ready)
              		//begin
                	//	rx_asn_counter_done <=  (rx_asn_counter[7:0] == r_rx_asn_wait_for_data_transfer_ready_cnt[7:0]) ? 1'b1 : 1'b0;
              		//end
            		//else if (rx_asn_count_wait_for_fifo_ready)
              		//begin
                	//	rx_asn_counter_done <=  (rx_asn_counter[6:0] == r_rx_asn_wait_for_fifo_ready_cnt[6:0]) ? 1'b1 : 1'b0;
              		//end
         	end 
      	end
end

//********************************************************************
//  Output generation
//********************************************************************

/*
// rate output
always @(negedge rx_reset_asn_pma_hclk_rst_n or posedge rx_clock_asn_pma_hclk)
begin
	if (~rx_reset_asn_pma_hclk_rst_n) 
	begin
		rx_asn_rate[1:0] <= {2{1'b0}};
	end
	else if (rx_asn_send_rate_change)
	begin
        	rx_asn_rate[1:0] <= rx_asn_rate_update[1:0];
        end
end        
*/

/*
// gen3_sel output
always @ (negedge rx_reset_asn_pma_hclk_rst_n or posedge rx_clock_asn_pma_hclk)
begin
	if (~rx_reset_asn_pma_hclk_rst_n)
	begin
        	rx_asn_gen3_sel_reg <= 1'b0;
      	end
    	else if (rx_asn_switch_mux)
      	begin
        	rx_asn_gen3_sel_reg <= (rx_asn_rate_update == 2'b10) ? 1'b1: 1'b0;
	end
end
*/

// Other outputs
always @ (negedge rx_reset_asn_pma_hclk_rst_n or posedge rx_clock_asn_pma_hclk)
begin
	if (~rx_reset_asn_pma_hclk_rst_n)
	begin
		rx_asn_fifo_hold_reg <= 1'b0;
		//rx_asn_fifo_srst_reg <= 1'b0;
		rx_asn_dll_lock_en <= 1'b1;
		rx_asn_wait_pma_pcie_sw_done <= 1'b0;
		rx_asn_wait_phystatus <= 1'b0;
	end
	else
	begin
		rx_asn_fifo_hold_reg <= rx_asn_fifo_hold_comb;
		//rx_asn_fifo_srst_reg <= rx_asn_fifo_srst_comb;
		rx_asn_dll_lock_en <= rx_asn_dll_lock_en_comb; 
		rx_asn_wait_pma_pcie_sw_done <= rx_asn_wait_pma_pcie_sw_done_comb;
		rx_asn_wait_phystatus <= rx_asn_wait_phystatus_comb;
      end
  end

//********************************************************************
// ASN State Machine 
//********************************************************************
always @(negedge rx_reset_asn_pma_hclk_rst_n or posedge rx_clock_asn_pma_hclk) 
begin
	if (~rx_reset_asn_pma_hclk_rst_n) 
	begin
		asn_sm_cs <= WAIT_RATE_CHANGE;
	end
	else if (r_rx_asn_en == 1'b0)
	begin
		asn_sm_cs    <= WAIT_RATE_CHANGE;
	end      
	else 
	begin
		asn_sm_cs    <= asn_sm_ns;
	end
end


always @ (*)
begin
	asn_sm_ns = asn_sm_cs;
	rx_asn_fifo_hold_comb = 1'b0;
	//rx_asn_fifo_srst_comb = 1'b0;
	rx_asn_dll_lock_en_comb = 1'b1;
	rx_asn_wait_pma_pcie_sw_done_comb = 1'b0;
	rx_asn_wait_phystatus_comb = 1'b0;
	//rx_asn_send_rate_change = 1'b0;
	//rx_asn_switch_mux = 1'b0;
	rx_asn_reset_count = 1'b1;
	rx_asn_count_wait_for_fifo_flush = 1'b0;
	rx_asn_count_wait_for_dll_reset = 1'b0;
	rx_asn_count_wait_for_pma_pcie_sw_done = 1'b0;
	//rx_asn_count_wait_for_data_transfer_ready = 1'b0;
	//rx_asn_count_wait_for_fifo_ready = 1'b0;
    
	case(asn_sm_cs)
	WAIT_RATE_CHANGE: 
	begin
		if (rx_asn_rate_change_pulse) 
        	begin
        		asn_sm_ns  = HOLD_FIFO_DATA;
		end
	end

	HOLD_FIFO_DATA:
	begin
		rx_asn_fifo_hold_comb = 1'b1;
		rx_asn_reset_count = 1'b0;
		rx_asn_count_wait_for_fifo_flush = 1'b1;
            	if(rx_asn_counter_done)
              	begin
                	asn_sm_ns  = RESET_DLL;
              	end
        end
        
	RESET_DLL:
        begin
		rx_asn_fifo_hold_comb = 1'b1;
		//rx_asn_fifo_srst_comb = 1'b1;
		rx_asn_dll_lock_en_comb = 1'b0;
		rx_asn_wait_pma_pcie_sw_done_comb = 1'b1;
		rx_asn_wait_phystatus_comb = 1'b1;
		//rx_asn_send_rate_change = 1'b1;
		asn_sm_ns = WAIT_DLL_RESET;
        end
      
	WAIT_DLL_RESET:
        begin
		rx_asn_fifo_hold_comb = 1'b1;
		//rx_asn_fifo_srst_comb = 1'b1;
		rx_asn_dll_lock_en_comb = 1'b0;
		rx_asn_wait_pma_pcie_sw_done_comb = 1'b1;
		rx_asn_wait_phystatus_comb = 1'b1;
		rx_asn_reset_count = 1'b0;
		rx_asn_count_wait_for_dll_reset = 1'b1;
              	if (rx_asn_counter_done)
                begin
                	asn_sm_ns = WAIT_SWITCH_REQUEST;
            	end
        end

	WAIT_SWITCH_REQUEST:
        begin
		rx_asn_fifo_hold_comb = 1'b1;
		//rx_asn_fifo_srst_comb = 1'b1;
		rx_asn_dll_lock_en_comb = 1'b0;
		rx_asn_wait_pma_pcie_sw_done_comb = 1'b1;
		rx_asn_wait_phystatus_comb = 1'b1;
		//rx_asn_switch_mux = 1'b1;
		if (rx_fsr_mask_tx_pll_sync)
		begin
          		asn_sm_ns = WAIT_SWITCH_DONE;
		end
        end
     
      	WAIT_SWITCH_DONE:
        begin
		rx_asn_fifo_hold_comb = 1'b1;
		//rx_asn_fifo_srst_comb = 1'b1;
		rx_asn_dll_lock_en_comb = 1'b0;
		rx_asn_wait_pma_pcie_sw_done_comb = 1'b1;
		rx_asn_wait_phystatus_comb = 1'b1;
		rx_asn_reset_count = 1'b0;
		rx_asn_count_wait_for_pma_pcie_sw_done = 1'b1;
              	if (rx_asn_counter_done)
          	begin
			if (rx_asn_pma_pcie_sw_done_change_mem || r_rx_asn_bypass_pma_pcie_sw_done)
            		begin
              			asn_sm_ns = ENABLE_DLL_LOCK;
            		end
		end
        end
      
	ENABLE_DLL_LOCK:
        begin
		rx_asn_fifo_hold_comb = 1'b1;
		//rx_asn_fifo_srst_comb = 1'b1;
		rx_asn_wait_phystatus_comb = 1'b1;
          	asn_sm_ns = WAIT_DLL_LOCK_DONE;
        end

	WAIT_DLL_LOCK_DONE:
        begin
		rx_asn_fifo_hold_comb = 1'b1;
		//rx_asn_fifo_srst_comb = 1'b1;
		rx_asn_wait_phystatus_comb = 1'b1;
		//rx_asn_reset_count = 1'b0;
		//rx_asn_count_wait_for_data_transfer_ready = 1'b1;
              	//if (rx_asn_counter_done && rx_hrdrst_asn_data_transfer_en_sync && ~rx_fsr_mask_tx_pll_sync)
              	if (rx_hrdrst_asn_data_transfer_en_sync && ~rx_fsr_mask_tx_pll_sync) 
                begin
                	asn_sm_ns = SPEED_CHANGE_DONE;
		end
        end
      
      	SPEED_CHANGE_DONE:
      	begin
		rx_asn_wait_phystatus_comb = 1'b1;
		if (rx_asn_phystatus_rise_mem_sync)
		begin
          		asn_sm_ns  =  WAIT_RATE_CHANGE;
		end
        end
           
	default: 
        begin
		asn_sm_ns = WAIT_RATE_CHANGE;
		rx_asn_fifo_hold_comb = 1'b0;
		//rx_asn_fifo_srst_comb = 1'b0;
		rx_asn_dll_lock_en_comb = 1'b1;
		rx_asn_wait_pma_pcie_sw_done_comb = 1'b0;
		rx_asn_wait_phystatus_comb = 1'b0;
		//rx_asn_send_rate_change = 1'b0;
		//rx_asn_switch_mux = 1'b0;
		rx_asn_reset_count = 1'b1;
		rx_asn_count_wait_for_fifo_flush = 1'b0;
		rx_asn_count_wait_for_dll_reset = 1'b0;
		rx_asn_count_wait_for_pma_pcie_sw_done = 1'b0;
		//rx_asn_count_wait_for_data_transfer_ready = 1'b0;
		//rx_asn_count_wait_for_fifo_ready = 1'b0;
        end
      endcase
  end


// ASN Output with Bonding
	assign bond_rx_asn_ds_in_fifo_hold_int = r_rx_bonding_dft_in_en ? r_rx_bonding_dft_in_value : bond_rx_asn_ds_in_fifo_hold; 
	assign bond_rx_asn_us_in_fifo_hold_int = r_rx_bonding_dft_in_en ? r_rx_bonding_dft_in_value : bond_rx_asn_us_in_fifo_hold; 

	//assign bond_rx_asn_ds_in_fifo_srst_int = r_rx_bonding_dft_in_en ? r_rx_bonding_dft_in_value : bond_rx_asn_ds_in_fifo_srst; 
	//assign bond_rx_asn_us_in_fifo_srst_int = r_rx_bonding_dft_in_en ? r_rx_bonding_dft_in_value : bond_rx_asn_us_in_fifo_srst; 

	//assign bond_rx_asn_ds_in_dll_lock_en_int = r_rx_bonding_dft_in_en ? r_rx_bonding_dft_in_value : bond_rx_asn_ds_in_dll_lock_en; 
	//assign bond_rx_asn_us_in_dll_lock_en_int = r_rx_bonding_dft_in_en ? r_rx_bonding_dft_in_value : bond_rx_asn_us_in_dll_lock_en; 

	//assign bond_rx_asn_ds_in_gen3_sel_int = r_rx_bonding_dft_in_en ? r_rx_bonding_dft_in_value : bond_rx_asn_ds_in_gen3_sel; 
	//assign bond_rx_asn_us_in_gen3_sel_int = r_rx_bonding_dft_in_en ? r_rx_bonding_dft_in_value : bond_rx_asn_us_in_gen3_sel; 

hdpldadapt_cmn_cp_dist_pair
    #(
        .ASYNC_RESET_VAL(0),
        .WIDTH(1)               // Control width
    ) hdpldadapt_cmn_cp_dist_pair_fifo_hold
    (
	.clk(1'b0),                                   		// clock
        .rst_n(1'b1),						// async reset
        .srst_n(1'b1),                                          // sync reset
        .data_enable(1'b1),                                     // data enable / data valid
        .master_in(rx_asn_fifo_hold_reg),			// master control signal
        .us_in(bond_rx_asn_us_in_fifo_hold_int),		// CP distributed signal in up
        .ds_in(bond_rx_asn_ds_in_fifo_hold_int),		// CP distributed signal in dwn
        .r_us_master(r_rx_dist_master_sel),			// CRAM to control master or distributed up
        .r_ds_master(r_rx_dist_master_sel),			// CRAM to control master or distributed dwn
        .r_us_bypass_pipeln(1'b1),				// CRAM combo or registered up
        .r_ds_bypass_pipeln(1'b1),				// CRAM combo or registered dwn
        .us_out(bond_rx_asn_us_out_fifo_hold),			// CP distributed signal out up
        .ds_out(bond_rx_asn_ds_out_fifo_hold),			// CP distributed signal out dwn
        .ds_tap(rx_asn_fifo_hold_chnl_down),    // CP output for this channel dwn
        .us_tap(rx_asn_fifo_hold_chnl_up)       // CP output for this channel up
    );

/*
hdpldadapt_cmn_cp_dist_pair
    #(
        .ASYNC_RESET_VAL(0),
        .WIDTH(1)               // Control width
    ) hdpldadapt_cmn_cp_dist_pair_fifo_srst
    (
	.clk(1'b0),                                   		// clock
        .rst_n(1'b1),						// async reset
        .srst_n(1'b1),                                          // sync reset
        .data_enable(1'b1),                                     // data enable / data valid
        .master_in(rx_asn_fifo_srst_reg),			// master control signal
        .us_in(bond_rx_asn_us_in_fifo_srst_int),		// CP distributed signal in up
        .ds_in(bond_rx_asn_ds_in_fifo_srst_int),		// CP distributed signal in dwn
        .r_us_master(r_rx_dist_master_sel),			// CRAM to control master or distributed up
        .r_ds_master(r_rx_dist_master_sel),			// CRAM to control master or distributed dwn
        .r_us_bypass_pipeln(1'b1),				// CRAM combo or registered up
        .r_ds_bypass_pipeln(1'b1),				// CRAM combo or registered dwn
        .us_out(bond_rx_asn_us_out_fifo_srst),			// CP distributed signal out up
        .ds_out(bond_rx_asn_ds_out_fifo_srst),			// CP distributed signal out dwn
        .ds_tap(rx_asn_fifo_srst_chnl_down),    // CP output for this channel dwn
        .us_tap(rx_asn_fifo_srst_chnl_up)       // CP output for this channel up
    );
*/

/*
hdpldadapt_cmn_cp_dist_pair
    #(
        .ASYNC_RESET_VAL(0),
        .WIDTH(1)               // Control width
    ) hdpldadapt_cmn_cp_dist_pair_dll_lock_en
    (
	.clk(1'b0),                                   		// clock
        .rst_n(1'b1),						// async reset
        .srst_n(1'b1),                                          // sync reset
        .data_enable(1'b1),                                     // data enable / data valid
        .master_in(rx_asn_dll_lock_en_reg),			// master control signal
        .us_in(bond_rx_asn_us_in_dll_lock_en_int),		// CP distributed signal in up
        .ds_in(bond_rx_asn_ds_in_dll_lock_en_int),		// CP distributed signal in dwn
        .r_us_master(r_rx_dist_master_sel),			// CRAM to control master or distributed up
        .r_ds_master(r_rx_dist_master_sel),			// CRAM to control master or distributed dwn
        .r_us_bypass_pipeln(1'b1),				// CRAM combo or registered up
        .r_ds_bypass_pipeln(1'b1),				// CRAM combo or registered dwn
        .us_out(bond_rx_asn_us_out_dll_lock_en),			// CP distributed signal out up
        .ds_out(bond_rx_asn_ds_out_dll_lock_en),			// CP distributed signal out dwn
        .ds_tap(rx_asn_dll_lock_en_chnl_down),    // CP output for this channel dwn
        .us_tap(rx_asn_dll_lock_en_chnl_up)       // CP output for this channel up
    );
*/

/*
hdpldadapt_cmn_cp_dist_pair
    #(
        .ASYNC_RESET_VAL(0),
        .WIDTH(1)               // Control width
    ) hdpldadapt_cmn_cp_dist_pair_gen3_sel
    (
	.clk(1'b0),                                   		// clock
        .rst_n(1'b1),						// async reset
        .srst_n(1'b1),                                          // sync reset
        .data_enable(1'b1),                                     // data enable / data valid
        .master_in(rx_asn_gen3_sel_reg),			// master control signal
        .us_in(bond_rx_asn_us_in_gen3_sel_int),		// CP distributed signal in up
        .ds_in(bond_rx_asn_ds_in_gen3_sel_int),		// CP distributed signal in dwn
        .r_us_master(r_rx_dist_master_sel),			// CRAM to control master or distributed up
        .r_ds_master(r_rx_dist_master_sel),			// CRAM to control master or distributed dwn
        .r_us_bypass_pipeln(1'b1),				// CRAM combo or registered up
        .r_ds_bypass_pipeln(1'b1),				// CRAM combo or registered dwn
        .us_out(bond_rx_asn_us_out_gen3_sel),			// CP distributed signal out up
        .ds_out(bond_rx_asn_ds_out_gen3_sel),			// CP distributed signal out dwn
        .ds_tap(rx_asn_gen3_sel_chnl_down),    // CP output for this channel dwn
        .us_tap(rx_asn_gen3_sel_chnl_up)       // CP output for this channel up
    );
*/
	//assign rx_asn_fifo_hold = (~r_rx_master_sel[1]) ? (rx_asn_fifo_hold_reg) : (r_rx_master_sel[0] ? rx_asn_fifo_hold_chnl_up : rx_asn_fifo_hold_chnl_down);
	//assign rx_asn_fifo_hold = (~r_rx_master_sel[1]) ? (rx_asn_fifo_hold_reg) : (r_rx_master_sel[0] ? rx_asn_fifo_hold_chnl_down : rx_asn_fifo_hold_chnl_up);
	assign rx_asn_fifo_hold = (r_rx_master_sel == 2'b00) ? rx_asn_fifo_hold_reg		:
				  (r_rx_master_sel == 2'b01) ? rx_asn_fifo_hold_chnl_up		:
				  (r_rx_master_sel == 2'b10) ? rx_asn_fifo_hold_chnl_down	:
							       rx_asn_fifo_hold_reg		;

	//assign rx_asn_fifo_srst = (~r_rx_master_sel[1]) ? (rx_asn_fifo_srst_reg) : (r_rx_master_sel[0] ? rx_asn_fifo_srst_chnl_up : rx_asn_fifo_srst_chnl_down);
	//assign rx_asn_dll_lock_en = (~r_rx_master_sel[1]) ? (rx_asn_dll_lock_en_reg) : (r_rx_master_sel[0] ? rx_asn_dll_lock_en_chnl_up : rx_asn_dll_lock_en_chnl_down);
	//assign rx_asn_gen3_sel = (~r_rx_master_sel[1]) ? (rx_asn_gen3_sel_reg) : (r_rx_master_sel[0] ? rx_asn_gen3_sel_chnl_up : rx_asn_gen3_sel_chnl_down);

endmodule // hdpldadapt_rx_datapath_asn
