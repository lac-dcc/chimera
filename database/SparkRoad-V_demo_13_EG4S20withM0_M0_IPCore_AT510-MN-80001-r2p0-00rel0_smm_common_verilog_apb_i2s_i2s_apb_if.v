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
// Abstract : I2S interface - APB interface
//-----------------------------------------------------------------------------

module i2s_apb_if (
  input    wire           PCLK,
  input    wire           PRESETn,  
  input    wire  [11:2]   PADDR,
  input    wire           PSEL,
  input    wire           PENABLE,
  input    wire           PWRITE,
  input    wire  [31:0]   PWDATA,
  output   wire  [31:0]   PRDATA,
  
  output   wire           tx_enable,
  output   wire           rx_enable,
  output   wire           fifo_reset,
  output   wire           audio_reset,
  input    wire   [2:0]   tx_fifo_space,
  input    wire           tx_fifo_empty,
  input    wire           tx_fifo_full,
  input    wire   [2:0]   rx_fifo_space,
  input    wire           rx_fifo_empty,
  input    wire           rx_fifo_full,
  input    wire           tx_underrun,
  input    wire           rx_overrun,
  output   wire           IRQOUT,
  
  output   wire   [9:0]   div_ratio, // LRCLK divide ratio
  output   wire           wr_tx_buf, // Write to TX Buffer
  output   wire           rd_rx_buf, // Read from RX Buffer
  input    wire  [31:0]   rd_buf_rdata, // Read data from RX FIFO
  
  // Integration test
  output   wire           it_itcr,
  input    wire           SDIN,
  output   wire   [3:0]   it_itop1
  );

// Internal wires
  // Control Register
  wire        wr_to_ctrl;    // Write to control register
  reg  [3:0]  reg_ctrl;      // Lowest 4 bits of control
  reg  [2:0]  reg_tx_wlevel; // TX FIFO water level
  reg  [2:0]  reg_rx_wlevel; // RX FIFO water level
  reg         reg_fifo_reset;// FIFO reset
  reg         reg_audio_reset;// Audio codec reset
  // Status Register
  reg  [5:0]  reg_status;
  // Error Status Register
  wire        wr_to_errstatus; // Write to Error status register
  reg         reg_tx_err;
  wire        nxt_tx_err;
  reg         reg_rx_err;
  wire        nxt_rx_err;
  // Divider ratio register
  wire        wr_to_div; // Write to div ratio register
  reg  [9:0]  reg_div_ratio;
  // TX & RX buffer
  wire        wr_to_tx_buffer; // Write to TX buffer
  wire        rd_fr_rx_buffer; // Read from RX buffer
  // Integration Test Registers
  wire        wr_to_itcr;
  wire        wr_to_itop1;
  reg         reg_itcr;
  reg         reg_itip1;
  reg   [3:0] reg_itop1;
  
  reg  [31:0] read_mux;   // read data mux (not registered)
  reg  [31:0] reg_rdata;  // Registered read data
  
  always @(PADDR or reg_ctrl or reg_tx_wlevel or reg_rx_wlevel
    or reg_fifo_reset or reg_audio_reset or reg_status or 
        reg_tx_err or reg_rx_err or reg_div_ratio or 
        rd_buf_rdata or reg_itcr or reg_itip1 or reg_itop1)
        begin
        case (PADDR[11:2])
         10'b0000000000: // CONTROL
           read_mux = {{14{1'b0}}, reg_audio_reset, reg_fifo_reset,
             1'b0, reg_rx_wlevel[2:0], 1'b0, reg_tx_wlevel[2:0],
             {4{1'b0}}, reg_ctrl[3:0]};
         10'b0000000001: // STATUS
           read_mux = {{26{1'b0}}, reg_status};
         10'b0000000010: // Error status
           read_mux = {{30{1'b0}}, reg_rx_err, reg_tx_err};
         10'b0000000011: // Divide ratio
           read_mux = {{22{1'b0}}, reg_div_ratio};
         10'b0000000100: // TX buffer - write only
           read_mux = {32{1'b0}};
         10'b0000000101: // RX buffer - read only
           read_mux = rd_buf_rdata[31:0];
         10'b0011000000: // ITCR
           read_mux = {{31{1'b0}}, reg_itcr};
         10'b0011000001: // ITIP1
           read_mux = {{31{1'b0}}, reg_itip1};
         10'b0011000010: // ITOP1
           read_mux = {{28{1'b0}}, reg_itop1};
         10'b1111110100: // PID4
           read_mux = {{24{1'b0}}, 8'h04};
         10'b1111110101: // PID5
           read_mux = {32{1'b0}};
         10'b1111110110: // PID6
           read_mux = {32{1'b0}};
         10'b1111110111: // PID7
           read_mux = {32{1'b0}};
         10'b1111111000: // PID0
           read_mux = {{24{1'b0}}, 8'h03};// Part number 703
         10'b1111111001: // PID1
           read_mux = {{24{1'b0}}, 8'hB7};// Part number 703
         10'b1111111010: // PID2
           read_mux = {{24{1'b0}}, 8'h0B};// Rev 0
         10'b1111111011: // PID3
           read_mux = {{24{1'b0}}, 8'h00};
         10'b1111111100: // CID0
           read_mux = {{24{1'b0}}, 8'h0D};
         10'b1111111101: // CID1
           read_mux = {{24{1'b0}}, 8'hF0}; // Component type F, PrimeCell/Peripherals
         10'b1111111110: // CID2
           read_mux = {{24{1'b0}}, 8'h05};
         10'b1111111111: // CID3
           read_mux = {{24{1'b0}}, 8'hB1};
     default:
           read_mux = {32{1'b0}};
         endcase
         end

  // Registering read data
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_rdata <= {32{1'b0}};
  else if (PSEL & ~PWRITE)
    reg_rdata <= read_mux;
  end

  assign PRDATA = (PENABLE & ~PWRITE) ? reg_rdata : {32{1'b0}};
  
  // address decoder
  wire   wr_op = PSEL & PENABLE & PWRITE;
  wire   rd_op = PSEL & PENABLE & ~PWRITE;
  assign wr_to_ctrl      = (PADDR[11:2]==10'b0000000000) & wr_op;
  assign wr_to_errstatus = (PADDR[11:2]==10'b0000000010) & wr_op;
  assign wr_to_div       = (PADDR[11:2]==10'b0000000011) & wr_op;
  assign wr_to_tx_buffer = (PADDR[11:2]==10'b0000000100) & wr_op;
  assign rd_fr_rx_buffer = (PADDR[11:2]==10'b0000000101) & rd_op;
  assign wr_to_itcr      = (PADDR[11:2]==10'b0011000000) & wr_op;
  assign wr_to_itop1     = (PADDR[11:2]==10'b0011000010) & wr_op;
  
  // Control Register
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    begin
    reg_ctrl       <= {4{1'b0}};
    reg_tx_wlevel  <= 3'b010;
    reg_rx_wlevel  <= 3'b010;
    reg_fifo_reset <= 1'b0;
    reg_audio_reset<= 1'b0;
    end
  else if (wr_to_ctrl)
    begin
    reg_ctrl       <= PWDATA[ 3: 0];
    reg_tx_wlevel  <= PWDATA[10: 8];
    reg_rx_wlevel  <= PWDATA[14:12];
    reg_fifo_reset <= PWDATA[16];
    reg_audio_reset<= PWDATA[17];
    end
  end
  // Connect to higher level  
  assign tx_enable  = reg_ctrl[0];
  assign rx_enable  = reg_ctrl[2];
  assign fifo_reset = reg_fifo_reset;
  assign audio_reset= reg_audio_reset;

  // Status register
  // [0] TX Buffer Alert (Depends on Water level)
  // [1] TX Buffer Full
  // [2] RX Buffer Alert (Depends on Water level)
  // [3] RX Buffer Empty
  //    TX alert - IRQ triggers when more than 2 word space available
  wire tx_alert = (tx_fifo_space > reg_tx_wlevel) ? 1'b1 : 1'b0;
  //    RX alert - IRQ triggers when less than 2 word space available
  wire rx_alert = (rx_fifo_space < reg_rx_wlevel) ? 1'b1 : 1'b0;
  // Registering status
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_status <= {6'b010101};
  else        
    reg_status <= {rx_fifo_full, rx_fifo_empty,  tx_fifo_full, tx_fifo_empty, rx_alert, tx_alert};
  end
  
  // Error flags
  //   TX error set if there is a TX underrun, or write to TX
  //   buffer when it is already full.
  //   Clear when write 1 to TX error flag.
  assign nxt_tx_err = tx_underrun | 
        (tx_fifo_full & wr_to_tx_buffer) |
                (reg_tx_err & ~(wr_to_errstatus & PWDATA[0]));

  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_tx_err <= 1'b0;
  else        
    reg_tx_err <= nxt_tx_err;
  end
  //   RX error set if there is a RX overrun.
  //   Clear when write 1 to RX error flag.
  assign nxt_rx_err = rx_overrun | 
                (reg_rx_err & ~(wr_to_errstatus & PWDATA[1]));

  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_rx_err <= 1'b0;
  else
    reg_rx_err <= nxt_rx_err;
  end

  // Divide ratio config register
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_div_ratio <= 10'b00_0010_0000; // 0x20
  else if (wr_to_div)
    reg_div_ratio <= PWDATA[9:0];
  end

  assign div_ratio = reg_div_ratio;

  // TX buffer - do not write more data if FIFO is full
  // If doing so trigger error status.
  assign wr_tx_buf = wr_to_tx_buffer & ~tx_fifo_full;
  
  // RX Buffer - do not read more data if FIFO is empty
  assign rd_rx_buf = rd_fr_rx_buffer & ~rx_fifo_empty;
  
  // ITCR - Integration Test Control Register
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_itcr <= 1'b0;
  else if (wr_to_itcr)
    reg_itcr <= PWDATA[0];
  end  
  
  assign it_itcr = reg_itcr;
  
  // ITIP1 - Integration Test Input Register, registering result
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_itip1 <= 1'b0;
  else if (reg_itcr)
    reg_itip1 <= SDIN;
  end    

  // ITOP1 - Integration Test Output Register, registering result
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_itop1 <= {4{1'b0}};
  else if (wr_to_itop1)
    reg_itop1 <= PWDATA[3:0];
  end      

  assign it_itop1 = reg_itop1;
  
  // Interrupt - TX alert | RX alert
  assign IRQOUT = (reg_ctrl[1] & reg_status[0]) | (reg_ctrl[3] & reg_status[1]);

endmodule
  
