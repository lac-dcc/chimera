`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////
//  Project     : SATA Host controller
//  Title       : Link Layer Top
//  File name   : sata_link.v
//  Version     : 0.1
//  Note        : This is top module of SATA link Layer          
//  Design ref. : SATA3 Specification
//  Dependencies   : Nil
//////////////////////////////////////////////////////////////////////////////


module sata_link #(
    parameter integer CHIPSCOPE = 0
    )
    (
    input             CLK,
    input             RESET,
    input             LINKUP,
    input             PHY_CLK,
    output reg [15:0] TX_DATA_OUT,
    output reg        TX_CHARISK_OUT,
    input      [15:0] RX_DATA_IN,
    input      [1:0]  RX_CHARISK_IN,
    input      [1:0]  ALIGN_COUNT,
    input      [31:0] TX_DATA_IN_DW,
    output     [31:0] RX_DATA_OUT_DW,
    input             PMREQ_P_T,
    input             PMREQ_S_T,
    input             PM_EN,
    input             LRESET,
    input             DATA_RDY_T,
    output            PHY_DETECT_T,
    output            ILLEGAL_STATE_T,
    input             ESCAPECF_T,
    input             FRAME_END_T,
    input             DECERR,
    output            TX_TERMN_T_O,
    input             RX_FIFO_RDY,
    output            RX_FAIL_T,
    output            CRC_ERR_T,
    output            VALID_CRC_T,
    input             FIS_ERR,
    input             GOOD_STATUS_T,
    input             UNRECGNZD_FIS_T,
    input             TX_TERMN_T_I,
    output            R_OK_T,
    output            R_ERR_T,
    output            SOF_T,
    output            EOF_T,
    output            TX_RDY_ACK_T,
    output            DATA_OUT_VLD_T,
    input             TX_RDY_T,
    output            R_OK_SENT_T,
    output            DATA_IN_RD_EN_T,
    output            X_RDY_SENT_T,
    output            DMA_TERMINATED
    );


  reg   [15:0]  RX_DATA_IN_LHW;
  reg   [31:0]  RX_DATA_IN_DW;
  wire  [31:0]  TX_DATA_OUT_DW;
  reg           RX_LHW;
  wire          TX_CHARISK_OUT_int;
  reg   [31:0]  RX_DATA_IN_DW_int;
  reg   [31:0]  TX_DATA_OUT_DW_int;
  reg           TX_CHARISK_OUT_int2;
  reg           RX_CHARISK_IN_int;
  reg           RX_CHARISK_OUT;
  reg           rx_charisk_temp;
  
  always @(posedge PHY_CLK, posedge RESET) 
  begin: rxdata_2_32bit
    if (RESET == 1 ) begin
      RX_DATA_IN_LHW    <= 16'h 957C;
      RX_DATA_IN_DW_int <= 32'h 00000000;
      RX_LHW            <= 1;
      RX_CHARISK_IN_int <= 1;
      rx_charisk_temp   <= 1;
    end
    else begin
      if (LINKUP == 1) begin
        RX_LHW <= !RX_LHW;
        if (RX_LHW == 1) begin
          RX_DATA_IN_LHW     <= RX_DATA_IN;
          RX_DATA_IN_DW_int  <= RX_DATA_IN_DW_int;
          rx_charisk_temp    <= RX_CHARISK_IN[0];
          RX_CHARISK_IN_int  <= RX_CHARISK_IN_int;
        end
        else begin
          RX_DATA_IN_DW_int  <= {RX_DATA_IN, RX_DATA_IN_LHW};
          RX_DATA_IN_LHW     <= RX_DATA_IN_LHW;
          RX_CHARISK_IN_int  <= rx_charisk_temp;
        end
      end
      else begin
        RX_DATA_IN_LHW     <= RX_DATA_IN_LHW;
        RX_DATA_IN_DW_int  <= RX_DATA_IN_DW_int;
        RX_CHARISK_IN_int  <= 0;
        rx_charisk_temp    <= 0;
      end 
    end
  end //always
  
  always @(posedge PHY_CLK, posedge RESET) 
  begin: rxdata_2_32bit_aligh_to_CLK
    if (RESET == 1 ) begin
      RX_DATA_IN_DW  <=  32'h 00000000;
      RX_CHARISK_OUT <= 0;
    end
    else begin
      if (LINKUP == 1) begin
        if (CLK == 1) begin
          RX_DATA_IN_DW  <= RX_DATA_IN_DW_int;
          RX_CHARISK_OUT <= RX_CHARISK_IN_int;
        end
        else begin
          RX_DATA_IN_DW  <= RX_DATA_IN_DW;
          RX_CHARISK_OUT <= RX_CHARISK_OUT;
        end
      end
      else begin
        RX_DATA_IN_DW  <= RX_DATA_IN_DW;
        RX_CHARISK_OUT <= 0;
      end 
    end
  end //always
  
  
  
  always @ (posedge RESET, posedge PHY_CLK)
  begin: txdata_2_16bit
    if (RESET == 1 ) begin
      TX_DATA_OUT    <= 16'h0;
      TX_CHARISK_OUT <= 0;
    end
    else begin
      case (ALIGN_COUNT)
			  2'b00 : 
				begin 
					TX_DATA_OUT    <= TX_DATA_OUT_DW_int[31:16];
					TX_CHARISK_OUT <= 0;
				end
				2'b01 : 
				begin
					TX_DATA_OUT    <= TX_DATA_OUT_DW_int[15:0];
					TX_CHARISK_OUT <= TX_CHARISK_OUT_int2;
				end
				2'b10 : 
				begin
					TX_DATA_OUT    <= TX_DATA_OUT_DW_int[31:16];
					TX_CHARISK_OUT <= 0;
				end
				2'b11 : 
				begin
					TX_DATA_OUT    <= TX_DATA_OUT_DW_int[15:0];
					TX_CHARISK_OUT <= TX_CHARISK_OUT_int2;
				end
			endcase	
    end
  end //always

  always @(posedge PHY_CLK, posedge RESET) 
  begin: txdata_aligh_to_CLK
    if (RESET == 1 ) begin
      TX_DATA_OUT_DW_int  <=  32'h 7B4A4ABC;
    end
    else begin
      if ((ALIGN_COUNT == 2'b00) || (ALIGN_COUNT == 2'b 10)) begin
        TX_DATA_OUT_DW_int  <= TX_DATA_OUT_DW;
        TX_CHARISK_OUT_int2 <= TX_CHARISK_OUT_int;
      end
      else begin
        TX_DATA_OUT_DW_int  <= TX_DATA_OUT_DW_int;
        TX_CHARISK_OUT_int2 <= TX_CHARISK_OUT_int2;
      end
    end
  end //always
  
  link_layer #(
    .CHIPSCOPE        (CHIPSCOPE)
    )
  link_layer_32bit(
    .clk              (CLK),
    .rst              (RESET),
    .data_in_p        (RX_DATA_IN_DW),
    .data_in_t        (TX_DATA_IN_DW),
    .data_out_p       (TX_DATA_OUT_DW),
    .data_out_t       (RX_DATA_OUT_DW),
    .PHYRDY           (LINKUP),
    .TX_RDY_T         (TX_RDY_T),
    .PMREQ_P_T        (PMREQ_P_T),
    .PMREQ_S_T        (PMREQ_S_T),
    .PM_EN            (PM_EN),
    .LRESET           (LRESET),
    .data_rdy_T       (DATA_RDY_T),
    .phy_detect_T     (PHY_DETECT_T),
    .illegal_state_t  (ILLEGAL_STATE_T),
    .EscapeCF_T       (ESCAPECF_T),
    .frame_end_T      (FRAME_END_T),
    .DecErr           (DECERR),
    .tx_termn_T_o     (TX_TERMN_T_O),
    .rx_FIFO_rdy      (RX_FIFO_RDY),
    .rx_fail_T        (RX_FAIL_T),
    .crc_err_T        (CRC_ERR_T),
    .valid_CRC_T      (VALID_CRC_T),
    .FIS_err          (FIS_ERR),
    .Good_status_T    (GOOD_STATUS_T),
    .Unrecgnzd_FIS_T  (UNRECGNZD_FIS_T),
    .tx_termn_T_i     (TX_TERMN_T_I),
    .R_OK_T           (R_OK_T),
    .R_ERR_T          (R_ERR_T),
    .SOF_T            (SOF_T),
    .EOF_T            (EOF_T),
    .cntrl_char       (TX_CHARISK_OUT_int),
    .RX_CHARISK_IN    (RX_CHARISK_OUT),
    .tx_rdy_ack_t     (TX_RDY_ACK_T),
    .data_out_vld_T   (DATA_OUT_VLD_T),
    .R_OK_SENT_T      (R_OK_SENT_T),
    .data_in_rd_en_t  (DATA_IN_RD_EN_T),
    .X_RDY_SENT_T     (X_RDY_SENT_T),
    .DMA_TERMINATED   (DMA_TERMINATED)
  );
  
endmodule
