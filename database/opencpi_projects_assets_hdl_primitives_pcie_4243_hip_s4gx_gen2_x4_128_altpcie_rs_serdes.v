//Copyright (C) 1991-2010 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions
//and other software and tools, and its AMPP partner logic
//functions, and any output files from any of the foregoing
//(including device programming or simulation files), and any
//associated documentation or information are expressly subject
//to the terms and conditions of the Altera Program License
//Subscription Agreement, Altera MegaCore Function License
//Agreement, or other applicable license agreement, including,
//without limitation, that your use is for the sole purpose of
//programming logic devices manufactured by Altera and sold by
//Altera or its authorized distributors.  Please refer to the
//applicable agreement for further details.
//
//
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on

module altpcie_rs_serdes (
   input pld_clk,
   input [39:0]   test_in,
   input [4:0]    ltssm,
   input npor,
   input pll_locked,
   input busy_altgxb_reconfig,
   input [7:0] rx_pll_locked,
   input [7:0] rx_freqlocked,
   input [7:0] rx_signaldetect,
   input use_c4gx_serdes,
   input fifo_err,
   input rc_inclk_eq_125mhz,
   input detect_mask_rxdrst,

   output txdigitalreset,
   output rxanalogreset,
   output rxdigitalreset
);

   localparam [19:0] WS_SIM = 20'h00020;
   localparam [19:0] WS_1MS_10000 = 20'h186a0;
   localparam [19:0] WS_1MS_12500 = 20'h1e848;
   localparam [19:0] WS_1MS_15625 = 20'h2625a;
   localparam [19:0] WS_1MS_25000 = 20'h3d090;

   localparam [1:0] STROBE_TXPLL_LOCKED_SD_CNT = 2'b00;
   localparam [1:0] IDLE_ST_CNT                = 2'b01;
   localparam [1:0] STABLE_TX_PLL_ST_CNT       = 2'b10;
   localparam [1:0] WAIT_STATE_ST_CNT          = 2'b11;

   localparam [1:0] IDLE_ST_SD = 2'b00;
   localparam [1:0] RSET_ST_SD = 2'b01;
   localparam [1:0] DONE_ST_SD = 2'b10;
   localparam [1:0] DFLT_ST_SD = 2'b11;

   localparam [4:0] LTSSM_POL = 5'b00010;
   localparam [4:0] LTSSM_DET = 5'b00000;

   genvar i;

   // Reset
   wire arst;
   reg [2:0] arst_r;

   // Test
   wire test_sim;             // When 1 simulation mode
   wire test_cbb_compliance;  // When 1 DUT is under PCIe Compliance board test mode

   (* syn_encoding = "user" *) reg  [1:0] serdes_rst_state;
   reg [19:0] waitstate_timer;

   reg txdigitalreset_r;
   reg rxanalogreset_r;
   reg rxdigitalreset_r;
   reg ws_tmr_eq_0;
   reg ld_ws_tmr;
   reg ld_ws_tmr_short;
   wire rx_pll_freq_locked;
   reg [7:0] rx_pll_locked_sync_r;
   reg [2:0] rx_pll_freq_locked_cnt  ;
   reg       rx_pll_freq_locked_sync_r  ;
   reg [1:0] busy_altgxb_reconfig_r;
   wire pll_locked_sync;
   reg [2:0] pll_locked_r;
   reg [6:0] pll_locked_cnt;
   reg       pll_locked_stable;
   reg  [4:0]    ltssm_r;

   wire rx_pll_freq_locked_sync;
   reg [2:0] rx_pll_freq_locked_r;

   wire [7:0] rx_pll_locked_sync;
   reg  [7:0] rx_pll_locked_r;
   reg  [7:0] rx_pll_locked_rr;
   reg  [7:0] rx_pll_locked_rrr;

   wire [7:0] rx_signaldetect_sync;
   reg  [7:0] rx_signaldetect_r;
   reg  [7:0] rx_signaldetect_rr;
   reg  [7:0] rx_signaldetect_rrr;

   reg ltssm_detect; // when 1 , the LTSSM is in detect state

   reg [7:0] rx_sd_strb0;
   reg [7:0] rx_sd_strb1;
   wire stable_sd;
   wire rst_rxpcs_sd;
   (* syn_encoding = "user" *) reg [1:0]    sd_state; //State machine for rx_signaldetect strobing;
   reg [ 19: 0] rx_sd_idl_cnt;

   assign test_sim            =test_in[0];
   assign test_cbb_compliance =test_in[32];

   // SERDES reset outputs
   assign txdigitalreset = txdigitalreset_r ;
   assign rxanalogreset  = (use_c4gx_serdes==1'b1)?arst:rxanalogreset_r  ;
   assign rxdigitalreset = (detect_mask_rxdrst==1'b0)?rxdigitalreset_r|rst_rxpcs_sd:(ltssm_detect==1'b1)?1'b0:rxdigitalreset_r | rst_rxpcs_sd;

   //npor Reset Synchronizer on pld_clk
   always @(posedge pld_clk or negedge npor) begin
      if (npor == 1'b0) begin
         arst_r[2:0] <= 3'b111;
      end
      else begin
         arst_r[2:0] <= {arst_r[1],arst_r[0],1'b0};
      end
   end
   assign arst = arst_r[2];

   // Synchronize pll_lock,rx_pll_freq_locked to pld_clk
   // using 3 level sync circuit
   assign rx_pll_freq_locked = &(rx_pll_locked_sync_r[7:0] | rx_freqlocked[7:0] );
   always @(posedge pld_clk or posedge arst) begin
      if (arst == 1'b1) begin
         pll_locked_r[2:0]          <= 3'b000;
         rx_pll_freq_locked_r[2:0]  <= 3'b000;
         ltssm_r                    <= 5'h0;
      end
      else begin
         pll_locked_r[2:0]          <= {pll_locked_r[1],pll_locked_r[0],pll_locked};
         rx_pll_freq_locked_r[2:0]  <= {rx_pll_freq_locked_r[1],rx_pll_freq_locked_r[0],rx_pll_freq_locked};
         ltssm_r                    <= ltssm;
      end
   end
   assign pll_locked_sync           = pll_locked_r[2];
   assign rx_pll_freq_locked_sync   = rx_pll_freq_locked_r[2];

   // Synchronize rx_pll_locked[7:0],rx_signaldetect[7:0] to pld_clk
   // using 3 level sync circuit
   generate
      for (i=0;i<8;i=i+1) begin : g_rx_pll_locked_sync
         always @(posedge pld_clk or posedge arst) begin
            if (arst == 1'b1) begin
               rx_pll_locked_r[i]      <= 1'b0;
               rx_pll_locked_rr[i]     <= 1'b0;
               rx_pll_locked_rrr[i]    <= 1'b0;

               rx_signaldetect_r[i]    <= 1'b0;
               rx_signaldetect_rr[i]   <= 1'b0;
               rx_signaldetect_rrr[i]  <= 1'b0;
            end
            else begin
               rx_pll_locked_r[i]      <= rx_pll_locked[i];
               rx_pll_locked_rr[i]     <= rx_pll_locked_r[i];
               rx_pll_locked_rrr[i]    <= rx_pll_locked_rr[i];

               rx_signaldetect_r[i]    <= rx_signaldetect[i];
               rx_signaldetect_rr[i]   <= rx_signaldetect_r[i];
               rx_signaldetect_rrr[i]  <= rx_signaldetect_rr[i];
            end
         end
         assign rx_pll_locked_sync[i]   = rx_pll_locked_rrr[i];
         assign rx_signaldetect_sync[i] = rx_signaldetect_rrr[i];
      end
   endgenerate

   always @(posedge pld_clk or posedge arst)
   begin
      if (arst == 1'b1) begin
         txdigitalreset_r              <= 1'b1 ;
         rxanalogreset_r               <= 1'b1 ;
         rxdigitalreset_r              <= 1'b1 ;
         waitstate_timer               <= 20'hFFFFF ;
         serdes_rst_state              <= STROBE_TXPLL_LOCKED_SD_CNT ;
         ws_tmr_eq_0                   <= 1'b0 ;
         ld_ws_tmr                     <= 1'b1 ;
         ld_ws_tmr_short               <= 1'b0 ;
         rx_pll_freq_locked_cnt        <= 3'h0;
         rx_pll_freq_locked_sync_r     <= 1'b0;
         rx_pll_locked_sync_r          <= 8'h00;
         busy_altgxb_reconfig_r[1:0]   <= 2'b11;
         pll_locked_cnt                <= 7'h0;
         pll_locked_stable             <= 1'b0;
         ltssm_detect                  <= 1'b1;
      end
      else begin
         if ((ltssm_r==5'h0)||(ltssm_r==5'h1)) begin
            ltssm_detect    <= 1'b1;
         end
         else begin
            ltssm_detect    <= 1'b0;
         end
         if ( rx_pll_locked_sync[7:0]==8'hFF ) begin
            rx_pll_locked_sync_r   <= 8'hFF;
         end
         // add hysteresis for losing lock
         if (rx_pll_freq_locked_sync == 1'b1) begin
           rx_pll_freq_locked_cnt <= 3'h7;
         end
         else if (rx_pll_freq_locked_cnt == 3'h0) begin
           rx_pll_freq_locked_cnt <= 3'h0;
         end
         else if (rx_pll_freq_locked_sync == 1'b0) begin
           rx_pll_freq_locked_cnt <= rx_pll_freq_locked_cnt - 3'h1;
         end
         rx_pll_freq_locked_sync_r <= (rx_pll_freq_locked_cnt != 3'h0);
         busy_altgxb_reconfig_r[1] <= busy_altgxb_reconfig_r[0];
         busy_altgxb_reconfig_r[0] <= busy_altgxb_reconfig;

         if (pll_locked_sync==1'b0) begin
            pll_locked_cnt <= 7'h0;
         end
         else if (pll_locked_cnt < 7'h7F) begin
            pll_locked_cnt <= pll_locked_cnt+7'h1;
         end
         pll_locked_stable <= (pll_locked_cnt==7'h7F)?1'b1:1'b0;

         if (ld_ws_tmr == 1'b1) begin
            if (test_sim == 1'b1) begin
               waitstate_timer <= WS_SIM ;
            end
            else if (rc_inclk_eq_125mhz == 1'b1) begin
              waitstate_timer <= WS_1MS_12500 ;
            end
            else begin
              waitstate_timer <= WS_1MS_25000 ;
            end
         end
         else if (ld_ws_tmr_short == 1'b1) begin
            waitstate_timer <= WS_SIM ;
         end
         else if (waitstate_timer != 20'h00000) begin
            waitstate_timer <= waitstate_timer - 20'h1 ;
         end

         if (ld_ws_tmr == 1'b1 | ld_ws_tmr_short) begin
            ws_tmr_eq_0 <= 1'b0 ;
         end
         else if (waitstate_timer == 20'h00000) begin
            ws_tmr_eq_0 <= 1'b1 ;
         end
         else begin
            ws_tmr_eq_0 <= 1'b0 ;
         end

         case (serdes_rst_state)
            STROBE_TXPLL_LOCKED_SD_CNT : begin
               ld_ws_tmr <= 1'b0 ;
               if ((pll_locked_sync == 1'b1) && (ws_tmr_eq_0 == 1'b1) && (pll_locked_stable==1'b1)) begin
                  serdes_rst_state      <= (busy_altgxb_reconfig_r[1]==1'b1)?STROBE_TXPLL_LOCKED_SD_CNT:STABLE_TX_PLL_ST_CNT ;
                  txdigitalreset_r <= 1'b0 ;
                  rxanalogreset_r  <= (busy_altgxb_reconfig_r[1]==1'b1)?1'b1:1'b0;
                  rxdigitalreset_r <= 1'b1 ;
               end
               else begin
                  serdes_rst_state      <= STROBE_TXPLL_LOCKED_SD_CNT ;
                  txdigitalreset_r <= 1'b1 ;
                  rxanalogreset_r  <= 1'b1 ;
                  rxdigitalreset_r <= 1'b1 ;
               end
            end
            IDLE_ST_CNT : begin
               if (rx_pll_freq_locked_sync_r == 1'b1) begin
                  if (fifo_err == 1'b1) begin
                     serdes_rst_state <= STABLE_TX_PLL_ST_CNT ;
                  end
                  else begin
                     serdes_rst_state <= IDLE_ST_CNT ;
                  end
               end
               else begin
                  serdes_rst_state <= STROBE_TXPLL_LOCKED_SD_CNT ;
                  ld_ws_tmr   <= 1'b1 ;
               end
            end
            STABLE_TX_PLL_ST_CNT : begin
               if (rx_pll_freq_locked_sync_r == 1'b1) begin
                  serdes_rst_state      <= WAIT_STATE_ST_CNT ;
                  txdigitalreset_r <= 1'b0 ;
                  rxanalogreset_r  <= 1'b0 ;
                  rxdigitalreset_r <= 1'b1 ;
                  ld_ws_tmr_short  <= 1'b1 ;
               end
               else begin
                  serdes_rst_state <= STABLE_TX_PLL_ST_CNT ;
                  txdigitalreset_r <= 1'b0 ;
                  rxanalogreset_r  <= 1'b0 ;
                  rxdigitalreset_r <= 1'b1 ;
               end
            end
            WAIT_STATE_ST_CNT : begin
               if (rx_pll_freq_locked_sync_r == 1'b1) begin
                  ld_ws_tmr_short <= 1'b0 ;
                  if (ld_ws_tmr_short == 1'b0 & ws_tmr_eq_0 == 1'b1) begin
                     serdes_rst_state <= IDLE_ST_CNT ;
                     txdigitalreset_r <= 1'b0 ;
                     rxanalogreset_r  <= 1'b0 ;
                     rxdigitalreset_r <= 1'b0 ;
                  end
                  else begin
                     serdes_rst_state <= WAIT_STATE_ST_CNT ;
                     txdigitalreset_r <= 1'b0 ;
                     rxanalogreset_r  <= 1'b0 ;
                     rxdigitalreset_r <= 1'b1 ;
                  end
               end
               else begin
                  serdes_rst_state <= STABLE_TX_PLL_ST_CNT ;
                  txdigitalreset_r <= 1'b0 ;
                  rxanalogreset_r  <= 1'b0 ;
                  rxdigitalreset_r <= 1'b1 ;
               end
            end
            default : begin
               serdes_rst_state  <= STROBE_TXPLL_LOCKED_SD_CNT ;
               waitstate_timer   <= 20'hFFFFF ;
            end
         endcase
      end
   end

////////////////////////////////////////////////////////////////
//
// Signal detect logic use suffix/prefix _sd
//

// rx_signaldetect strobing (stable_sd)
   assign rst_rxpcs_sd = ((test_cbb_compliance==1'b1)||(use_c4gx_serdes==1'b1))?1'b0:sd_state[0];
   always @(posedge pld_clk or posedge arst) begin
      if (arst == 1'b1) begin
         rx_sd_strb0[7:0] <= 8'h00;
         rx_sd_strb1[7:0] <= 8'h00;
      end
      else begin
         rx_sd_strb0[7:0] <= rx_signaldetect_sync[7:0];
         rx_sd_strb1[7:0] <= rx_sd_strb0[7:0];
      end
   end
   assign stable_sd = (rx_sd_strb1[7:0] == rx_sd_strb0[7:0]) & (rx_sd_strb1[7:0] != 8'h00);

   //signal detect based reset logic
   always @(posedge pld_clk or posedge arst) begin
      if (arst == 1'b1) begin
         rx_sd_idl_cnt  <= 20'h0;
         sd_state    <= IDLE_ST_SD;
      end
      else begin
         case (sd_state)

            IDLE_ST_SD: begin
               //reset RXPCS on polling.active
               if (ltssm_r == LTSSM_POL) begin
                   rx_sd_idl_cnt <= (rx_sd_idl_cnt > 20'd10) ? rx_sd_idl_cnt - 20'd10 : 20'h0;
                   sd_state   <= RSET_ST_SD;
               end
               else begin //Incoming signal unstable, clear counter
                  if (stable_sd == 1'b0) begin
                     rx_sd_idl_cnt <= 20'h0;
                  end
                  else if ((stable_sd == 1'b1) & (rx_sd_idl_cnt < 20'd750000)) begin
                     rx_sd_idl_cnt <= rx_sd_idl_cnt + 20'h1;
                  end
               end
            end

            RSET_ST_SD: begin
               //Incoming data unstable, back to IDLE_ST_SD iff in detect
               if (stable_sd == 1'b0) begin
                   rx_sd_idl_cnt <= 20'h0;
                   sd_state   <= (ltssm_r == LTSSM_DET) ? IDLE_ST_SD : RSET_ST_SD;
               end
               else begin
                  if ((test_sim == 1'b1) & (rx_sd_idl_cnt >= 20'd32)) begin
                      rx_sd_idl_cnt <= 20'd32;
                      sd_state   <= DONE_ST_SD;
                  end
                  else begin
                     if (rx_sd_idl_cnt == 20'd750000) begin
                        rx_sd_idl_cnt  <= 20'd750000;
                        sd_state    <= DONE_ST_SD;
                     end
                     else if (stable_sd == 1'b1) begin
                        rx_sd_idl_cnt <= rx_sd_idl_cnt + 20'h1;
                     end
                  end
               end
            end

            DONE_ST_SD: begin
               //Incoming data unstable, back to IDLE_ST_SD iff in detect
               if (stable_sd == 1'b0) begin
                   rx_sd_idl_cnt <= 20'h0;
                   sd_state   <= (ltssm_r == LTSSM_DET) ? IDLE_ST_SD : DONE_ST_SD;
               end
            end

            default: begin
               rx_sd_idl_cnt  <= 20'h0;
               sd_state    <= IDLE_ST_SD;
            end

         endcase
      end
   end

endmodule
