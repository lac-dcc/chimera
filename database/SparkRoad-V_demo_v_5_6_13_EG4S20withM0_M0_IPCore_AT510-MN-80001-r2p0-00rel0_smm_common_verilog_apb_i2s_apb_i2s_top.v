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
// Abstract : APB I2S interface - Top Level
//-----------------------------------------------------------------------------

//
// SCLK=MCLK/4=3.072MHz

// Programer's model
// Offset
// 0x000    CONTROL    Control Register
//                     [    0] TX Enable
//                     [    1] TX Interrupt Enable
//                     [    2] RX Enable
//                     [    3] RX Interrupt Enable
//                     [ 7: 4] -
//                     [10: 8] TX Buffer IRQ Water Level - Default 2
//                             (IRQ triggers when more than 2 word space available)
//                     [   11] - (Not used / reserved)
//                     [14:12] RX Buffer IRQ Water Level - Default 2
//                             (IRQ triggers when more less 2 word space available)
//                     [   15] - (Not used / reserved)
//                     [   16] FIFO reset
//                     [   17] Audio CODEC reset control  
// 0x004    STATUS     Status Register
//                     [    0] TX Buffer Alert (Depends on Water level)
//                     [    1] RX Buffer Alert (Depends on Water level)
//                     [    2] TX Buffer Empty
//                     [    3] TX Buffer Full
//                     [    4] RX Buffer Empty
//                     [    5] RX Buffer Full
// 0x008    ERROR      Error Status Register
//                     [    0] TX overrun/underrun - write 1 to clear
//                     [    1] RX overrun - write 1 to clear
// 0x00C    DIVIDE     Clock Divide ratio register
//                     [ 9: 0] LRDIV (Left/Right) Default = 0x80
//                             12.288MHz / 48KHz / 2 (L+R) = 128 
// 0x010    TXBUF      Transmit Buffer FIFO Data Register (WO)
//                     [31:16] Left  Channel
//                     [15: 0] Right Channel
// 0x014    RXBUF      Receive  Buffer FIFO Data Register (RO)
//                     [31:16] Left  Channel
//                     [15: 0] Right Channel
// 0x300    ITCR       Integration Test Control Register
// 0x304    ITIP1      Integration Test Input Register 1
//                     [0] SDIN
// 0x308    ITOP1      Integration Test Output Register 1
//                     [0] SDOUT
//                     [1] SCLK
//                     [2] LRCK
//                     [3] IRQOUT
// 0xFD0    PID4       Peripheral ID4
// 0xFD4    PID5       Peripheral ID5
// 0xFD8    PID6       Peripheral ID6
// 0xFDC    PID7       Peripheral ID7
// 0xFE0    PID0       Peripheral ID0
// 0xFE4    PID1       Peripheral ID1
// 0xFE8    PID2       Peripheral ID2
// 0xFEC    PID3       Peripheral ID3
// 0xFF0    CID0       Component  ID0
// 0xFF4    CID1       Component  ID1
// 0xFF8    CID2       Component  ID2
// 0xFFC    CID3       Component  ID3



module apb_i2s_top (
  input    wire           MCLK,   // Audio interface master clock (e.g. 12.288MHz) - Not used
  input    wire           MRSTn,  // Audio interface reset
  output   wire           LRCK,   // Left Right Clock
  output   wire           SDOUT,  // Audio Data Out
  input    wire           SDIN,   // Audio Data In
  input    wire           SCLK,   // Audio Serial Clock
  output   wire           AUD_nRESET, // Audio codec reset
  
  input    wire           PCLK,
  input    wire           PRESETn,  
  input    wire  [11:2]   PADDR,
  input    wire           PSEL,
  input    wire           PENABLE,
  input    wire           PWRITE,
  input    wire  [31:0]   PWDATA,
  output   wire  [31:0]   PRDATA,
  
  output   wire           IRQOUT
  );

  // Internal wires
  wire           inv_sclk;           // Inverted SCLK
  wire           fifo_reset;         // FIFO reset control
  wire           audio_reset;        // Audio codec reset control
  wire           audio_reset_sclk;   // Audio codec reset control in SCLK domain
  wire           tx_enable;          // TX enable control
  wire           tx_enable_sclk;     // TX enable control
  wire           rx_enable;          // RX enable control
  wire           rx_enable_sclk;     // RX enable control
  wire     [9:0] div_ratio;          // LRCLK divide ratio
  
  wire           wr_tx_buf;          // Indicate a write to TX buffer
  wire           rd_rx_buf;          // Indicate a read to RX buffer
  wire    [31:0] rd_buf_rdata;       // Read data from RX buffer
  
  wire    [31:0] tx_s1_data_out;     // TX stage 1 - from FIFO to async TX
  wire           tx_s1_data_valid;   
  wire           tx_s1_data_ack;

  wire    [31:0] tx_s2_data_out;     // TX stage 2 - between PCLK and SCLK
  wire           tx_s2_data_valid;   // (4 stage handshaking)
  wire           tx_s2_data_ack;

  wire    [31:0] tx_s3_data_out;     // TX stage 3 - from async RX to I2S I/F
  wire           tx_s3_data_valid;
  wire           tx_s3_data_ack;

  wire           tx_fifo_full;
  wire           tx_fifo_empty;
  wire     [2:0] tx_fifo_space;

  wire    [31:0] rx_s1_data_out;     // RX stage 1 - from async RX to FIFO
  wire           rx_s1_data_valid;
  wire           rx_s1_data_ack;

  wire    [31:0] rx_s2_data_out;     // RX stage 2 - between PCLK and SCLK
  wire           rx_s2_data_valid;   // (4 stage handshaking)
  wire           rx_s2_data_ack;

  wire    [31:0] rx_s3_data_out;     // RX stage 3 - from I2S I/F to async RX
  wire           rx_s3_data_valid;
  wire           rx_s3_data_ack;

  wire           rx_fifo_full;
  wire           rx_fifo_empty;
  wire     [2:0] rx_fifo_space;
  
  wire           tx_underrun;         // TX underrun error in SCLK domain
  wire           tx_underrun_pclk;    // Synchronised to PCLK
  wire           rx_overrun;          // RX underrun error in SCLK domain
  wire           rx_overrun_pclk;     // Synchronised to PCLK

  wire           i_sdout;  // Internal SDOUT
  wire           i_lrclk;  // Internal LRCLK
  wire           i_sclk;   // Internal SCLK
  wire           i_irqout; // Interrupt output
  wire           it_itcr;  // Integration Test Control Register
  wire    [3:0]  it_itop1; // Integration Test Output Register

  assign inv_sclk = ~SCLK;
  
  // APB interface  
  i2s_apb_if u_apb_if (
    .PCLK         (PCLK),
    .PRESETn      (PRESETn),
    .PADDR        (PADDR[11:2]),
    .PSEL         (PSEL),
    .PENABLE      (PENABLE),
    .PWRITE       (PWRITE),
    .PWDATA       (PWDATA[31:0]),
    .PRDATA       (PRDATA[31:0]),

    .tx_enable    (tx_enable),
    .rx_enable    (rx_enable),
    .fifo_reset   (fifo_reset),
    .audio_reset  (audio_reset),
    .tx_fifo_space(tx_fifo_space[2:0]),
    .tx_fifo_empty(tx_fifo_empty),
    .tx_fifo_full (tx_fifo_full),
    .rx_fifo_space(rx_fifo_space[2:0]),
    .rx_fifo_empty(rx_fifo_empty),
    .rx_fifo_full (rx_fifo_full),
    .tx_underrun  (tx_underrun_pclk),
    .rx_overrun   (rx_overrun_pclk),
    .IRQOUT       (i_irqout),

    .div_ratio    (div_ratio), // LRCLK divide ratio
    .wr_tx_buf    (wr_tx_buf), // Write to TX Buffer
    .rd_rx_buf    (rd_rx_buf), // Read from RX Buffer
    .rd_buf_rdata (rd_buf_rdata[31:0]), // Read data from RX FIFO
  
    .it_itcr      (it_itcr),       // Integration test
    .SDIN         (SDIN),
    .it_itop1     (it_itop1[3:0])
    );

  //---------------------------------------------------
  // Transmit path
  //
  // TX FIFO
  i2s_fifo_4  #(
    .WIDTH(32)) u_tx_fifo
  (
    .clk              (PCLK),
    .rst_n            (PRESETn),

    .fifo_reset       (fifo_reset),
  
    .data_in          (PWDATA),
    .data_in_valid    (wr_tx_buf),
    .data_in_ack      (), // Not used - if write to FIFO when FIFO full
                          // new write data will be lost 
                          // (wr_tx_buf not asserted)
    .fifo_full        (tx_fifo_full),
    .fifo_empty       (tx_fifo_empty),
  
    .data_out         (tx_s1_data_out),
    .data_out_valid   (tx_s1_data_valid),
    .data_out_ack     (tx_s1_data_ack),
  
    .fifo_space       (tx_fifo_space)
  );

  // Asynchronouse data transfer (source clock domain)
  i2s_async_src  #(
    .WIDTH(32)) u_i2s_async_tx_src
    (
    .clk              (PCLK),
    .rst_n            (PRESETn),

    .data_in          (tx_s1_data_out),
    .data_in_valid    (tx_s1_data_valid),
    .data_in_ack      (tx_s1_data_ack),
  
    .data_out         (tx_s2_data_out),
    .data_out_valid   (tx_s2_data_valid),
    .data_out_ack     (tx_s2_data_ack)
  );

  // Asynchronouse data transfer (dest clock domain)
  i2s_async_dest  #(
    .WIDTH(32)) u_i2s_async_tx_dest
    (
    .clk              (inv_sclk),
    .rst_n            (MRSTn),

    .data_in          (tx_s2_data_out),
    .data_in_valid    (tx_s2_data_valid),
    .data_in_ack      (tx_s2_data_ack),
  
    .data_out         (tx_s3_data_out),
    .data_out_valid   (tx_s3_data_valid),
    .data_out_ack     (tx_s3_data_ack)
  );
  
  //---------------------------------------------------
  // Receive path
  //

  // Asynchronouse data transfer (source clock domain)
  i2s_async_src  #(
    .WIDTH(32)) u_i2s_async_rx_src
    (
    .clk              (inv_sclk),
    .rst_n            (MRSTn),

    .data_in          (rx_s3_data_out),
    .data_in_valid    (rx_s3_data_valid),
    .data_in_ack      (rx_s3_data_ack),
  
    .data_out         (rx_s2_data_out),
    .data_out_valid   (rx_s2_data_valid),
    .data_out_ack     (rx_s2_data_ack)
  );

  // Asynchronouse data transfer (dest clock domain)
  i2s_async_dest  #(
    .WIDTH(32)) u_i2s_async_rx_dest
    (
    .clk              (PCLK),
    .rst_n            (PRESETn),

    .data_in          (rx_s2_data_out),
    .data_in_valid    (rx_s2_data_valid),
    .data_in_ack      (rx_s2_data_ack),
  
    .data_out         (rx_s1_data_out),
    .data_out_valid   (rx_s1_data_valid),
    .data_out_ack     (rx_s1_data_ack)
  );


  // RX FIFO
  i2s_fifo_4  #(
    .WIDTH(32)) u_rx_fifo
  (
    .clk              (PCLK),
    .rst_n            (PRESETn),

    .fifo_reset       (fifo_reset),
  
    .data_in          (rx_s1_data_out),  // Data from Async Receiver
    .data_in_valid    (rx_s1_data_valid),
    .data_in_ack      (rx_s1_data_ack),
    
    .fifo_full        (rx_fifo_full),
    .fifo_empty       (rx_fifo_empty),
  
    .data_out         (rd_buf_rdata),
    .data_out_valid   (), // Not used - if read to FIFO when FIFO empty
                          // rd_rx_buf not asserted
    .data_out_ack     (rd_rx_buf),
  
    .fifo_space       (rx_fifo_space)
  );

  //---------------------------------------------------
  // I2C interface
  
  i2s_sync_cell u_sync_tx_en (
    .clk        (inv_sclk),
    .rst_n      (MRSTn),
    .din        (tx_enable),
    .dout       (tx_enable_sclk));

  i2s_sync_cell u_sync_rx_en (
    .clk        (inv_sclk),
    .rst_n      (MRSTn),
    .din        (rx_enable),
    .dout       (rx_enable_sclk));

  i2s_sync_cell u_sync_codec_rst (
    .clk        (inv_sclk),
    .rst_n      (MRSTn),
    .din        (audio_reset),
    .dout       (audio_reset_sclk));
  

  i2s_if u_i2s_if (
    .clk            (inv_sclk),
    .rst_n          (MRSTn),
    .LRCK           (i_lrclk),
    .SDOUT          (i_sdout),
    .SDIN           (SDIN),   // Audio Data In
    //.SCLK         (SCLK),   // Audio Serial Clock
    .AUD_nRESET     (AUD_nRESET),

    .audio_reset    (audio_reset_sclk),
    .tx_enable      (tx_enable_sclk),
    .rx_enable      (rx_enable_sclk),
    .div_ratio      (div_ratio),

    .data_in        (tx_s3_data_out),
    .data_in_valid  (tx_s3_data_valid),
    .data_in_ack    (tx_s3_data_ack),
  
    .data_out       (rx_s3_data_out),
    .data_out_valid (rx_s3_data_valid),
    .data_out_ack   (rx_s3_data_ack),  
  
    .tx_underrun    (tx_underrun),
    .rx_overrun     (rx_overrun)
  );
  
  i2s_pulse_sync u_i2s_tx_underrun_sync (
    .clk1       (inv_sclk),
    .rst1_n     (MRSTn),

    .clk2       (PCLK),
    .rst2_n     (PRESETn),

    .pulse_in   (tx_underrun),
    .pulse_out  (tx_underrun_pclk)
  );

  i2s_pulse_sync u_i2s_rx_overrun_sync (
    .clk1       (inv_sclk),
    .rst1_n     (MRSTn),

    .clk2       (PCLK),
    .rst2_n     (PRESETn),

    .pulse_in   (rx_overrun),
    .pulse_out  (rx_overrun_pclk)
  );
  
  //---------------------------------------------------  
  // Integration Test mux
  assign IRQOUT = (it_itcr) ? it_itop1[3] : i_irqout;
  assign LRCK   = (it_itcr) ? it_itop1[2] : i_lrclk; 
//  assign SCLK   = (it_itcr) ? it_itop1[1] : MCLK; 
  assign SDOUT  = (it_itcr) ? it_itop1[0] : i_sdout; 
  
endmodule
  
  
