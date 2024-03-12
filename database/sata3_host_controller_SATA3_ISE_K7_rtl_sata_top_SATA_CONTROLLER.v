`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////
//  Project     : SATA Host controller
//  Title       : SATA Host Controller TOP Module
//  File name   : SATA_TOP.v
//  Note        : This is the top module of SATA2 Host Controller              
//  Design ref. : SATA3 Specification
//  Test/Verification Environment
//  Dependencies   : Nil
//////////////////////////////////////////////////////////////////////////////

module SATA_CONTROLLER#(
    parameter integer CHIPSCOPE = 0
    )
    (
    input           TILE0_REFCLK_PAD_P_IN,       // Input differential clock pin P 150MHZ 
    input           TILE0_REFCLK_PAD_N_IN,       // Input differential clock pin N 150MHZ
    input           GTPRESET_IN,                 // Reset input for GTP initialization
    output          TILE0_PLLLKDET_OUT,          // GTP PLL Lock detected output

    output          TXP0_OUT,                    // SATA Connector TX P pin
    output          TXN0_OUT,                    // SATA Connector TX N pin
    input           RXP0_IN,                     // SATA Connector RX P pin
    input           RXN0_IN,                     // SATA Connector RX N pin
      
    output          DCMLOCKED_OUT,               // PHY Layer DCM locked
    output          LINKUP,                      // SATA PHY initialisation completed LINK UP
    output [1:0]    GEN,                         // 2 when a SATA3, 1 when a SATA2 device detected, 0 when SATA1 device detected
  //output          PHY_CLK_OUT,                 // PHY layer clock out
    output          CLK_OUT,                     // LINK and Transport Layer clock out CLK_OUT = PHY_CLK_OUT / 2
    input           HOST_READ_EN,                // Read enable from host / user logic for Shadow register and PIO data
    input           HOST_WRITE_EN,               // Write enable from host / user logic for Shadow register and PIO data
    input  [4:0]    HOST_ADDR_REG,               // Address bus for Shadow register
    input  [31:0]   HOST_DATA_IN,                // Data in bus for Shadow register and PIO data
    output [31:0]   HOST_DATA_OUT,               // Data out bus for Shadow register and PIO data
    output          RESET_OUT,                   // Reset out for User logic this is from GTP reset out
    output          WRITE_HOLD_U,                // Write HOLD signal for PIO and DMA write
    output          READ_HOLD_U,                 // Read HOLD signal for PIO and DMA read
    input           PIO_CLK_IN,                  // Clock in for PIO read / write
    input           DMA_CLK_IN,                  // Clock in for DMA read / write
    input           DMA_RQST,                    // DMA request. This should be 1 for DMA operation and 0 for PIO operation
    output   [31:0] DMA_RX_DATA_OUT,             // DMA read data out bus
    input           DMA_RX_REN,                  // DMA read enable
    input    [31:0] DMA_TX_DATA_IN,              // DMA write data in bus
    input           DMA_TX_WEN,                  // DMA write enable
    input           CE,                          // Chip enable
    output          IPF,                         // Interrupt pending flag
    output          DMA_TERMINATED,              // This signal becomes 1 when a DMA terminate primitive get from Device (SSD)
    output          R_ERR,                       // set 1 when R_ERR Primitive received from disk 
    output          ILLEGAL_STATE,               // set 1 when illegal_state transition detected
    input           RX_FIFO_RESET,               // reset signal for Receive data fifo
    input           TX_FIFO_RESET,               // reset signal for Transmit data fifo
    output          DMA_DATA_RCV_ERROR,           // indicates error during DMA data receive operation
    input           OOB_reset_IN,
    input           RX_FSM_reset_IN,
    input           TX_FSM_reset_IN    
    
    );

 
  wire  [31:0]  phy_rx_data_out;
  wire  [3:0]   phy_rx_charisk_out;
  wire  [31:0]  link_tx_data_out;
  wire          link_tx_charisk_out;
  wire          linkup_int;
  wire          logic_reset;
  wire  [1:0]   align_count;
  wire          clk;
  
  //wire  for link layer
  wire  [31:0]  trnsp_tx_data_out;
  wire  [31:0]  link_rx_data_out;
  wire          pmreq_p_t;
  wire          pmreq_s_t;
  wire          pm_en;
  wire          lreset;
  wire          data_rdy_t;
  wire          phy_detect_t;
  wire          illegal_state_t;
  wire          escapecf_t;
  wire          frame_end_t;
  wire          decerr;
  wire          tx_termn_t_o;
  wire          rx_fifo_rdy;
  wire          rx_fail_t;
  wire          crc_err_t;
  wire          valid_crc_t;
  wire          fis_err;
  wire          good_status_t;
  wire          unrecgnzd_fis_t;
  //wire          tx_termn_t_i;
  wire          r_ok_t;
  wire          r_err_t;
  wire          sof_t;
  wire          eof_t;
  wire          tx_rdy_ack_t;
  wire          data_out_vld_t;
  wire          r_ok_sent_t;
  
  //for transport layer
  wire          dma_init;
  wire          dma_end;
  wire          stop_dma;
  wire          rx_fifo_empty;
  wire          hold_L;
  wire          cmd_done;
  wire          dma_tx_fifo_full;
  wire          dma_rx_fifo_empty;
  
  
  wire          data_in_rd_en_t;
  wire          x_rdy_sent_t;
  wire          tx_rdy_t;
 


  
  assign CLK_OUT       = clk;
  assign RESET_OUT     = logic_reset;
  assign R_ERR         = r_err_t;
  assign ILLEGAL_STATE = illegal_state_t;
  
  sata_phy PHY 
  (
    .TILE0_REFCLK_PAD_P_IN  (TILE0_REFCLK_PAD_P_IN),
    .TILE0_REFCLK_PAD_N_IN  (TILE0_REFCLK_PAD_N_IN),
    .GTXRESET_IN            (GTPRESET_IN),
    .TILE0_PLLLKDET_OUT     (TILE0_PLLLKDET_OUT),
    .TXP0_OUT               (TXP0_OUT),
    .TXN0_OUT               (TXN0_OUT),
    .RXP0_IN                (RXP0_IN),
    .RXN0_IN                (RXN0_IN),
    .DCMLOCKED_OUT          (DCMLOCKED_OUT),
    .LINKUP                 (linkup_int),
    .logic_clk              (clk),
    .GEN                    (GEN),
    .tx_data_in             (link_tx_data_out),
    .tx_charisk_in          (link_tx_charisk_out),
    .rx_data_out            (phy_rx_data_out),
    .rx_charisk_out         (phy_rx_charisk_out),
    .logic_reset            (logic_reset),
    .OOB_reset_IN           (OOB_reset_IN),
    .RX_FSM_reset_IN        (RX_FSM_reset_IN),
		.TX_FSM_reset_IN        (TX_FSM_reset_IN)    
    
	);
  
  assign LINKUP = linkup_int; 
  
  link_layer #(
    .CHIPSCOPE        (CHIPSCOPE)
    )
  link_layer_32bit(
    .clk              (clk),
    .rst              (logic_reset),
    .data_in_p        (phy_rx_data_out),
    .data_in_t        (trnsp_tx_data_out),
    .data_out_p       (link_tx_data_out),
    .data_out_t       (link_rx_data_out),
    .PHYRDY           (linkup_int),
    .TX_RDY_T         (tx_rdy_t),
    .PMREQ_P_T        (1'b0),
    .PMREQ_S_T        (1'b0),
    .PM_EN            (1'b0),
    .LRESET           (1'b0),
    .data_rdy_T       (data_rdy_t),
    .phy_detect_T     (phy_detect_t),
    .illegal_state_t  (illegal_state_t),
    .EscapeCF_T       (escapecf_t),
    .frame_end_T      (frame_end_t),
    .DecErr           (1'b0),
    .tx_termn_T_o     (tx_termn_t_o),
    .rx_FIFO_rdy      (rx_fifo_rdy),
    .rx_fail_T        (rx_fail_t),
    .crc_err_T        (crc_err_t),
    .valid_CRC_T      (valid_crc_t),
    .FIS_err          (fis_err),
    .Good_status_T    (good_status_t),
    .Unrecgnzd_FIS_T  (unrecgnzd_fis_t),
    .tx_termn_T_i     (1'b0),
    .R_OK_T           (r_ok_t),
    .R_ERR_T          (r_err_t),
    .SOF_T            (sof_t),
    .EOF_T            (eof_t),
    .cntrl_char       (link_tx_charisk_out),
    .RX_CHARISK_IN    (phy_rx_charisk_out[1:0]),
    .tx_rdy_ack_t     (tx_rdy_ack_t),
    .data_out_vld_T   (data_out_vld_t),
    .R_OK_SENT_T      (r_ok_sent_t),
    .data_in_rd_en_t  (data_in_rd_en_t),
    .X_RDY_SENT_T     (x_rdy_sent_t),
    .DMA_TERMINATED   ()
  );
  
  assign DMA_TERMINATED = tx_termn_t_o;  

  sata_transport TRANSPORT (
    .clk                      (clk), 
    .reset                    (logic_reset), 
    .DMA_RQST                 (DMA_RQST), 
    .data_in                  (HOST_DATA_IN),           //output interface 
    .addr_reg                 (HOST_ADDR_REG),          //output interface
    .data_link_in             (link_rx_data_out),  
    .LINK_DMA_ABORT           (tx_termn_t_o), 
    .link_fis_recved_frm_dev  (sof_t), 
    .phy_detect               (phy_detect_t), 
    .H_write                  (HOST_WRITE_EN),           //output interface 
    .H_read                   (HOST_READ_EN),            //output interface 
    .link_txr_rdy             (tx_rdy_ack_t),      
    .r_ok                     (r_ok_t), 
    .r_error                  (r_err_t), 
    .illegal_state            (illegal_state_t), 
    .end_status               (eof_t), 
    .data_link_out            (trnsp_tx_data_out), 
    .FRAME_END_T              (frame_end_t), 
    .hold_L                   (hold_L),            
    .WRITE_HOLD_U             (WRITE_HOLD_U),            
    .READ_HOLD_U              (READ_HOLD_U),
    .txr_rdy                  (tx_rdy_t), 
    .data_out                 (HOST_DATA_OUT),           
    .EscapeCF_T               (escapecf_t), 
    .UNRECGNZD_FIS_T          (unrecgnzd_fis_t), 
    .IPF                      (IPF),  
    .FIS_ERR                  (fis_err), 
    .Good_status_T            (good_status_t), 
    .RX_FIFO_RDY              (rx_fifo_rdy), 
    .cmd_done                 (cmd_done),          
    .DMA_TX_DATA_IN           (DMA_TX_DATA_IN),         
    .DMA_TX_WEN               (DMA_TX_WEN),           
    .DMA_RX_DATA_OUT          (DMA_RX_DATA_OUT),       
    .DMA_RX_REN               (DMA_RX_REN),           
    .VALID_CRC_T              (valid_crc_t), 
    .data_out_vld_T           (data_out_vld_t), 
    .CRC_ERR_T                (crc_err_t), 
    .DMA_INIT                 (1'b 0),                 
    .DMA_END                  (dma_end),           
    .DATA_RDY_T               (data_rdy_t),
    .data_link_rd_en_t        (data_in_rd_en_t),
    .PIO_CLK_IN               (PIO_CLK_IN),
    .DMA_CLK_IN               (DMA_CLK_IN),
    .CE                       (CE),
    .RX_FIFO_RESET            (RX_FIFO_RESET),
    .TX_FIFO_RESET            (TX_FIFO_RESET),
    .DMA_data_rcv_error       (DMA_DATA_RCV_ERROR)
    );

endmodule
