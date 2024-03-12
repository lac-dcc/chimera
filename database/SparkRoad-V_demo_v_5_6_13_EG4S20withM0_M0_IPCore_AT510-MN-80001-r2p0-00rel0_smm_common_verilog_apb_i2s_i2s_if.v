//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//      Revision            : $Revision: 368444 $
//
//      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : I2S interface - I2S protocol I/O
//-----------------------------------------------------------------------------

module i2s_if (
  input    wire           clk,    // Audio interface master clock (e.g. 12.88MHz)
                                  // Invert of MCLK
  input    wire           rst_n,  // Audio interface reset
  output   wire           LRCK,   // Left Right Clock
  output   wire           SDOUT,  // Audio Data Out
  input    wire           SDIN,   // Audio Data In
  output   wire           AUD_nRESET, // Audio reset

  input    wire           tx_enable,
  input    wire           rx_enable,
  input    wire   [9:0]   div_ratio,
  input    wire           audio_reset,

  input    wire  [31:0]   data_in,
  input    wire           data_in_valid,
  output   wire           data_in_ack,
  
  output   wire  [31:0]   data_out,
  output   wire           data_out_valid,
  input    wire           data_out_ack,  
  
  output   wire           tx_underrun,
  output   wire           rx_overrun
  );
  
  
  // Internal wires
  reg   [9:0]  reg_lrclk_div;
  reg   [9:0]  nxt_lrclk_div;
  wire         i2s_enable;
  reg          reg_lrck;
  wire         lrclk_cntr_reload;
  reg   [2:0]  reg_state;
  reg   [2:0]  nxt_state;
  localparam  I2SFSM_IDLE= 3'b000; // Wait for i2s_enable & lrclk_cntr_reload & reg_lrck
  localparam  I2SFSM_LSTA= 3'b001; // Start cycle for Left channel
  localparam  I2SFSM_LDAT= 3'b010; // 16 cycles of data bit
  localparam  I2SFSM_LWAI= 3'b011; // Wait for lrclk_cntr_reload
  localparam  I2SFSM_RSTA= 3'b100; // Start cycle for Right channel
  localparam  I2SFSM_RDAT= 3'b101; // 16 cycles of data bit
  localparam  I2SFSM_RWAI= 3'b110; // Wait for lrclk_cntr_reload
  
  reg  [31:0]  reg_shiftdata;      // Shift register for data
  reg  [31:0]  nxt_shiftdata;      // Shift register for data
  reg   [3:0]  reg_bitcntr;        // Bit counter
  wire  [3:0]  nxt_bitcntr;        // Bit counter
  
  reg          reg_rx_data_valid;  // RX buffer status
  reg          nxt_rx_data_valid;
  
  reg          reg_aud_rst_n;
  
  // reload Left/Right clock counter when counter reach 1
  assign lrclk_cntr_reload = (reg_lrclk_div==9'b00000001);
  // Enable i2s when transfer is enabled and when disabled,
  //  and when disabled, wait until current transfer is completed
  assign i2s_enable = tx_enable | rx_enable | (reg_state!=I2SFSM_IDLE);
  
  always @(reg_lrclk_div or i2s_enable or div_ratio)
  begin
    if (i2s_enable)
      begin 
      if (reg_lrclk_div==10'b0000000001)
        nxt_lrclk_div = div_ratio; // reload
      else
        nxt_lrclk_div = reg_lrclk_div-1'b1;
      end
    else
      nxt_lrclk_div = div_ratio;
  end
      
  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_lrclk_div <= 10'b0000000001;
  else
    reg_lrclk_div <= nxt_lrclk_div;
  end
  
  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_lrck <= 1'b1;
  else if (lrclk_cntr_reload & (tx_enable|rx_enable))
    reg_lrck <= ~reg_lrck;
  end
  
  assign LRCK = reg_lrck;
  
  // I2S protocol FSM
  always @(reg_state or lrclk_cntr_reload or reg_lrck or i2s_enable or reg_bitcntr)
  begin
  case (reg_state)
    I2SFSM_IDLE: nxt_state = (i2s_enable & lrclk_cntr_reload & reg_lrck) ?
    I2SFSM_LSTA: I2SFSM_IDLE; // Wait for start of I2S frame
    I2SFSM_LSTA: nxt_state = I2SFSM_LDAT; // Padding bit cycle, move to data next
    I2SFSM_LDAT: nxt_state = // Wait for 16 bit transfer completed
       (reg_bitcntr==4'h0) ? I2SFSM_LWAI : I2SFSM_LDAT;  
    I2SFSM_LWAI: nxt_state = // Wait for starting of right channel
       (lrclk_cntr_reload) ? I2SFSM_RSTA : I2SFSM_LWAI;
    I2SFSM_RSTA: nxt_state = I2SFSM_RDAT; // Padding bit cycle, move to data next
    I2SFSM_RDAT: nxt_state = // Wait for 16 bit transfer completed
       (reg_bitcntr==4'h0) ? I2SFSM_RWAI : I2SFSM_RDAT;
    I2SFSM_RWAI: nxt_state = // Check enable status and return to IDLE if I2S disabled
          (lrclk_cntr_reload) ?
       ((i2s_enable) ? I2SFSM_LSTA : I2SFSM_IDLE): I2SFSM_RWAI; // else start Left frame again
    default: nxt_state = I2SFSM_IDLE; // Not used
  endcase
  end  

  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_state <= I2SFSM_IDLE;
  else
    reg_state <= nxt_state;
  end
  
  // Shift register
  always @(reg_state or data_in or data_in_valid or SDIN or tx_enable or reg_shiftdata)
  begin
  case (reg_state)
    I2SFSM_IDLE: nxt_shiftdata = reg_shiftdata; // No change
    I2SFSM_LSTA: nxt_shiftdata = (tx_enable) ? data_in : {32{1'b0}}; // Load new data
    I2SFSM_LDAT: nxt_shiftdata = {reg_shiftdata[30:0], SDIN}; // Shift data in 16 times
    I2SFSM_LWAI: nxt_shiftdata = reg_shiftdata; // No change
    I2SFSM_RSTA: nxt_shiftdata = reg_shiftdata; // No change
    I2SFSM_RDAT: nxt_shiftdata = {reg_shiftdata[30:0], SDIN}; // Shift data in 16 times
    I2SFSM_RWAI: nxt_shiftdata = reg_shiftdata; // No change
    default:     nxt_shiftdata = reg_shiftdata; // No change
  endcase
  end

  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_shiftdata <= {32{1'b0}};
  else
    reg_shiftdata <= nxt_shiftdata;
  end
  
  // Output bit in shift data cycles
  assign SDOUT = ((reg_state==I2SFSM_LDAT)||(reg_state==I2SFSM_RDAT)) ? 
                  reg_shiftdata[31] : 1'b0 ;
  
  // Bit counter
  assign nxt_bitcntr = // Reload at start bit and decrement during data bits
    ((reg_state==I2SFSM_LSTA)|(reg_state==I2SFSM_RSTA)) ?
       4'hF : (reg_bitcntr - 1'b1);

  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_bitcntr <= 4'h0;
  else if ((reg_state==I2SFSM_LSTA)|(reg_state==I2SFSM_RSTA)|
           (reg_state==I2SFSM_LDAT)|(reg_state==I2SFSM_RDAT))
    reg_bitcntr <= nxt_bitcntr;
  end
  
  // TX control handling
  assign data_in_ack =  data_in_valid & tx_enable & (reg_state==I2SFSM_LSTA);
  assign tx_underrun = ~data_in_valid & tx_enable & (reg_state==I2SFSM_LSTA);
  
  // RX control handling
  always @(reg_rx_data_valid or reg_state or rx_enable or data_out_ack or reg_bitcntr)
  begin
  if (reg_rx_data_valid)
    nxt_rx_data_valid = (data_out_ack|(reg_state==I2SFSM_LSTA)) ? 1'b0 : 1'b1;
  else
    nxt_rx_data_valid = rx_enable & (reg_state==I2SFSM_RDAT) & (reg_bitcntr==4'h0);
  end
  
  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_rx_data_valid <= 1'b0;
  else if (reg_rx_data_valid | (reg_state==I2SFSM_RDAT))
    reg_rx_data_valid <= nxt_rx_data_valid;
  end  
  
  assign data_out_valid = reg_rx_data_valid;
  assign data_out       = reg_shiftdata;
  assign rx_overrun     = reg_rx_data_valid & (reg_state==I2SFSM_LSTA) & ~data_out_ack;

  // Audio reset
  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_aud_rst_n <= 1'b0;
  else 
    reg_aud_rst_n <= ~audio_reset;
  end  

  assign AUD_nRESET = reg_aud_rst_n;

endmodule
  
