//  Project     : SATA Host controller
//  Title       : Link Layer
//  File name   : link_layer_host.v
//  Note        : This module is handling dtalayer operations of the SATA 
//                protocol small block decription given below
//                
//  Design ref. : SATA3 Specification
//  Dependencies   : defines.h
///////////////////////////////////////////////////////////////////////////////

/******************************************************************************
                   LINK LAYER

            _______                          
  data_in_t|       |data_crc_out_tx 
  -------->|  crc  |--->|\  data_scrmb_in     data_scrmb_out 
     |     |_______|  1 | \         ___________       ____________ 
     |                  |  |       |           |     |            | data_out_p_int
     |                  |  |------>| scrambler |---->| EncoderFSM |------------>
     |                0 |  |       |___________|     |____________|
     |----------------->| /                                
      data_in_t         |/|                                  
                          |                                                       
             tx_crc_en--->|   
   
   ___________      _____________      _______      __________        
  |           |    |             |    |       |    |          |       
  |decoderFSM |--->| unscrambler |--->|  crc  |--->|data_out_t|       
  |___________|    |_____________|    |_______|    |__________|       
           
data_in_p(data_in_p_int)    data_out_t_int  data_crc_out_rx
******************************************************************************/


`include "defines.h"
   
module link_layer#(
    parameter integer CHIPSCOPE = 0
    )
    (
    input              clk,
    input              rst,
    input      [31:0]  data_in_p,       // Data from Phy layer
    input      [31:0]  data_in_t,       // Data from Transpor layer
    output reg [31:0]  data_out_p,      // data to phy
    output reg [31:0]  data_out_t,      // data to T-layer
    input              PHYRDY,          // LINKUP
    input              TX_RDY_T,         // T-layer requests frame transmission
    input              PMREQ_P_T,       // T-layer requests transition to Partial
    input              PMREQ_S_T,       // T-layer requests transition to Slumber
    input              PM_EN,           // Link Layer is enabled to perform PM modes & in a state to accept pwr mode req.
    input              LRESET,          // Link Layer RESET
    input              data_rdy_T,      // T-layer indicates the availability of next Dword 
    output reg         phy_detect_T,    // Inform T-layer that Phy rdy
    output reg         illegal_state_t, // notify the T-layer of the illegal transition error condition
    input              EscapeCF_T,      // Notification from the T-layer to escape from current frame transfer
    input              frame_end_T,     // T-layer indicates all data for the frame has been transferred
    input              DecErr,          // Decoding error
    output reg         tx_termn_T_o,    // Notify the T-layer to terminate the transmission in progress,
    input              rx_FIFO_rdy,     // FIFO space availability
    output reg         rx_fail_T,       // Notify the T-layer that reception was aborted
    output reg         crc_err_T,       // Notify the T-layer about CRC error
    output reg         valid_CRC_T,     // CRC is valid for the frame
    input              FIS_err,         // T or L-layer indicated error detected during reception of recognized FIS.
    input              Good_status_T,   // Transport layer indicates a good result
    input              Unrecgnzd_FIS_T, // Transport layer indicates an unrecognized FIS
    input              tx_termn_T_i,    // Req from T-layer to terminate the transmission
    output reg         R_OK_T,          // R_OK received from phy
    output reg         R_ERR_T,         // R_ERR received from phy
    output reg         SOF_T,           // Notifying T-layer that SOF is recieved from phy
    output reg         EOF_T,           // Notifying T-layer that EOF is recieved from phy
    output reg         cntrl_char,      // '1' for control character & '0' for data character
    input              RX_CHARISK_IN,   // '1' for control character & '0' for data character
    output reg         tx_rdy_ack_t,    // indicates link is rdy to T-layer
    output reg         data_out_vld_T,  // data to tasport layer is valid,
    output reg         R_OK_SENT_T,     // R_OK sent to PHY
    output reg         data_in_rd_en_t, // read enable to transport layer                   
    output reg         X_RDY_SENT_T,    // activate after sending X_RDY primitive.
    output reg         DMA_TERMINATED   // DMA Terminated
    );



  // crc, scrambler, unscrambler outputs

  wire  [31:0]  data_crc_out_tx  ;      // data input to Link from crc generator
  wire  [31:0]  data_crc_out_rx  ;      // data input to Link from crc checker
  wire  [31:0]  data_scrmb_out     ;      // data input to Link from scrambler  

  // crc, scrambler, unscrambler inputs
  reg [31:0]  data_unscr_in ;            // data from T-layer scrambler

  reg [ 5:0]  state         ;
  reg crc_en_tx             ;                  
  reg crc_en_rx             ;
  reg scrmb_en              ;
  reg scrmb_rst             ;
  reg unscrmb_en_fsm            ;
  reg unscrmb_rst           ;
  reg hold_arrived;
  
  wire CRC_cal_ip_tx        ;                  // CRC calculation is in progress during txn...


  wire rx_charisk_out       ;
  wire rxelecidle_out       ;                                                            
  wire sata_user_clk        ; 
  //wire tx_charisk_out     ;                                                            
                                                                                         
  //added by Shameer  
  wire [31:0] data_in_p_int; //for CONT primitive handling
  reg         cont_flag;
  reg         crc_rx_rst;
  reg         data_out_vld_t_int;
  reg  [31:0] data_out_p_int;
  reg   [7:0] count_for_align;
  reg   [3:0] align_inserted_cnt;
  reg  [32:0] data_out_p_pipe1;
  reg  [32:0] data_out_p_pipe2;
  reg  [32:0] data_out_p_pipe3;
  reg         cntrl_char_int;
  reg         data_in_rd_last_word;
  reg         minimum_send_two_sync;
  reg   [1:0] r_rdy_wait_count;
  
    
  wire [31:0] data_scrmb_in;
  reg         tx_crc_en;
  reg         current_data_rdy_T;
  reg         crc_tx_rst;
  wire        unscrmb_en;
  wire        align_detected;
  wire        hold_detected;
  wire        crc_mask_for_data_out_vld_t;
  wire        rx_charisk_in_int;
  wire [31:0] data_out_t_int;
  reg         eof_t_int;
  reg  [31:0] data_out_t_int1;
  wire        data_vld_temp;
  reg         data_out_vld_t_int_d1;
  reg [1:0]   data_valid_state;
  
  localparam   FIRST_STATE  = 2'b00;
  localparam   SECOND_STATE = 2'b01;
  localparam   THIRD_STATE  = 2'b10;
                                                                                      
  //tintu : for making PHY detect                                                        
  always @(posedge clk, posedge rst)                                                      
  begin                                                                                   
    if (rst)                                                                            
      phy_detect_T <= 1'b0;                                                                 
    else if(PHYRDY)                                                                      
      phy_detect_T <= 1'b1;                                                                
    else                                                                                
      phy_detect_T <= 1'b0;
  end
  
  //Shameer : count for sending ALIGN after every 256 non ALIGN DWORDS
  always @(posedge clk, posedge rst)                                                      
  begin                                                                                   
    if (rst) begin
      count_for_align <= 8'h0;
    end      
    else begin
      count_for_align <= count_for_align + 1;
    end    
  end
  
  //data piping for ALIGN primitive after every 256 non ALING DWords
  always @(posedge clk, posedge rst)                                                      
  begin                                                                                   
    if (rst) begin
      data_out_p_pipe1 <= 33'h0;
      data_out_p_pipe2 <= 33'h0;
      data_out_p_pipe3 <= 33'h0;
    end      
    else begin
      data_out_p_pipe1 <= {cntrl_char_int, data_out_p_int[31:0]};
      data_out_p_pipe2 <= data_out_p_pipe1;
      data_out_p_pipe3 <= data_out_p_pipe2;
    end    
  end
  
  
  //Shameer: Inseritng ALIGN primitive after every 256 non ALIGN DWords
  always @(posedge clk, posedge rst)
  begin                                                                                   
    if (rst) begin
      data_out_p         <= 32'h0;
      cntrl_char         <= 0;
      align_inserted_cnt <= 4'h 0;
    end      
    else begin
      if (count_for_align == 8'h FE) begin
        data_out_p         <= `ALIGN;
        cntrl_char         <= 1;
        align_inserted_cnt <= align_inserted_cnt + 1;
      end
      else if (count_for_align == 8'h FF) begin
        data_out_p         <= `ALIGN;
        cntrl_char         <= 1;
        align_inserted_cnt <= align_inserted_cnt + 1;
      end
      else begin
        case (align_inserted_cnt)
          8'h00: begin
            data_out_p <= data_out_p_int;
            cntrl_char <= cntrl_char_int;
          end
          8'h01: begin
            if (data_out_p_pipe2 == data_out_p_pipe1) begin
              data_out_p         <= data_out_p_int;
              cntrl_char         <= cntrl_char_int;
              align_inserted_cnt <= align_inserted_cnt - 1;
            end
            else begin
              data_out_p         <= data_out_p_pipe1[31:0];
              cntrl_char         <= data_out_p_pipe1[32];
              align_inserted_cnt <= align_inserted_cnt;
            end
          end
          8'h02: begin
            if ((data_out_p_pipe3 == data_out_p_pipe2) && (data_out_p_pipe2 == data_out_p_pipe1)) begin
              data_out_p         <= data_out_p_int;
              cntrl_char         <= cntrl_char_int;
              align_inserted_cnt <= align_inserted_cnt - 2;
            end
            else if (data_out_p_pipe3 == data_out_p_pipe2 && data_out_p_pipe2[32] == 1) begin
              data_out_p         <= data_out_p_pipe2[31:0];
              cntrl_char         <= data_out_p_pipe2[32];
              align_inserted_cnt <= align_inserted_cnt;
            end
            else if (data_out_p_pipe3 == data_out_p_pipe2 && data_out_p_pipe2[32] == 0) begin
              data_out_p         <= data_out_p_pipe1[31:0];
              cntrl_char         <= data_out_p_pipe1[32];
              align_inserted_cnt <= align_inserted_cnt - 1;
            end
            else begin
              data_out_p         <= data_out_p_pipe2[31:0];
              cntrl_char         <= data_out_p_pipe2[32];
              align_inserted_cnt <= align_inserted_cnt;
            end
          end
        default: begin
          align_inserted_cnt <= 4'h2;
          data_out_p         <= data_out_p_pipe3[31:0];
          cntrl_char         <= data_out_p_pipe3[32];
        end  
        endcase
      end
    end    
  end
  

  //Shameer: to handle CONTp Primitive 
//  always @(posedge clk, posedge rst)                                                      
//  begin                                                                                   
//    if (rst) begin       
//      data_in_p_int     <= 32'b0;
//      cont_flag         <= 1'b0; 
//      rx_charisk_in_int <= 0;      
//    end
//    else begin 
//      //if(PHYRDY) begin
//        if ((data_in_p == `CONT) && RX_CHARISK_IN) begin
//          data_in_p_int     <= data_in_p_int;
//          cont_flag         <= 1'b1;
//          rx_charisk_in_int <= rx_charisk_in_int;
//        end
//        else begin
//          if (cont_flag == 1'b1) begin
//            if (RX_CHARISK_IN && (
//                 (data_in_p == `HOLD)    || (data_in_p == `HOLDA) || (data_in_p == `PMREQ_P) ||
//                 (data_in_p == `PMREQ_S) || (data_in_p == `R_ERR) || (data_in_p == `R_IP)    ||
//                 (data_in_p == `R_OK)    || (data_in_p == `R_RDY) || (data_in_p == `SYNC)    ||
//                 (data_in_p == `WTRM)    || (data_in_p == `X_RDY) || (data_in_p == `SOF))      ) begin
//              data_in_p_int     <= data_in_p;
//              cont_flag         <= 1'b0;
//              rx_charisk_in_int <= RX_CHARISK_IN;
//            end
//            else begin              
//              data_in_p_int     <= data_in_p_int;
//              cont_flag         <= 1'b1;
//              rx_charisk_in_int <= rx_charisk_in_int;
//            end  
//          end
//          else begin
//            data_in_p_int     <= data_in_p;
//            cont_flag         <= 1'b0;
//            rx_charisk_in_int <= RX_CHARISK_IN;
//          end
//        end
////      end
////      else begin
////        data_in_p_int     <= data_in_p;
////        cont_flag         <= 1'b0;
////        rx_charisk_in_int <= RX_CHARISK_IN;
////      end
//    end
//  end
  
  assign data_in_p_int     = data_in_p;
  assign rx_charisk_in_int = RX_CHARISK_IN;
  
  always @(posedge clk, posedge rst)
  begin 
    if (rst) begin
      current_data_rdy_T <= 0;
    end
    else begin
      current_data_rdy_T <= data_rdy_T || data_in_rd_last_word; //data_in_rd_last_word connected to GND
    end
  end //always
      
    
  //main state machine
  always @(posedge clk, posedge rst)
  begin 
    if (rst) begin
      state           <= `L_IDLE ;
      scrmb_en        <= 1'b 0 ;
      scrmb_rst       <= 1'b 1 ;
      unscrmb_en_fsm      <= 1'b 0 ;
      unscrmb_rst     <= 1'b 1 ;
      crc_en_tx       <= 1'b 0 ;
      data_out_p_int      <= 32'h 00000000 ;
      data_unscr_in   <= 32'h 00000000 ;
      cntrl_char_int      <= 1'b 0 ;
      crc_rx_rst      <= 1'b 0;
      illegal_state_t <= 1'b 0;
      tx_termn_T_o    <= 1'b 0;
      R_OK_T          <= 1'b 0;
      R_ERR_T         <= 1'b 0;
      rx_fail_T       <= 1'b 0;
      crc_err_T       <= 1'b 0;
      valid_CRC_T     <= 1'b 0 ;
      SOF_T           <= 1'b 0;
      eof_t_int           <= 1'b 0;
      //cntrl_char_int      <= 1'b 0;
      tx_rdy_ack_t    <= 1'b 0;
      data_out_vld_t_int  <= 1'b 0;
      data_in_rd_en_t <= 1'b 0;
      tx_crc_en       <= 0;
      crc_tx_rst      <= 0;
      X_RDY_SENT_T    <= 0;
      R_OK_SENT_T     <= 0;
      data_in_rd_last_word  <= 0;
      minimum_send_two_sync <= 0;
      r_rdy_wait_count      <= 2'h0;
      DMA_TERMINATED        <= 0;
      hold_arrived          <= 0;
  
    end   
    else begin
     
      /***************************************************************************/
      /******************************* BEGIN IDLE ********************************/
      /***************************************************************************/
           
      /****************************** Start L_IDLE *******************************/
      case (state)
      `L_IDLE:
      begin
        data_out_p_int      <= `SYNC ;
        cntrl_char_int      <= 1'b 1 ;  
        tx_termn_T_o    <= 0;
       
        illegal_state_t <= 0;
        R_OK_SENT_T     <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        rx_fail_T       <= 0;
        
        data_in_rd_en_t <= 0;
        tx_crc_en       <= 0;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        r_rdy_wait_count <= 2'h0;
        
        
        if (PHYRDY)
        begin
        
          if (minimum_send_two_sync == 0) begin
            state                 <= `L_IDLE;
            minimum_send_two_sync <= 1;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `X_RDY)) begin
            state <= `L_RcvWaitFifo;
            minimum_send_two_sync <= 0;
          end 
          else if(TX_RDY_T) begin
            state <= `HL_SendChkRdy ;    //for Host 
            // state <= `DL_SendChkRdy ;   //for Device
            tx_rdy_ack_t <= 1'b 1 ;
            minimum_send_two_sync <= 0;
            r_rdy_wait_count <= 2'h0;
          end
          else if (PMREQ_P_T) begin
            state <= `L_TPMPartial ;
            minimum_send_two_sync <= 0;
          end
          else if (PMREQ_S_T) begin
            state <= `L_TPMSlumber ;
            minimum_send_two_sync <= 0;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `PMREQ_S || data_in_p_int == `PMREQ_P)) begin
            if(PM_EN) begin
              state <= `L_PMOff ;
            end
            else begin
              state <= `L_PMDeny ;
            end
            minimum_send_two_sync <= 0;
          end
          else begin
            state <= `L_IDLE ;
          end       
        end          
        else begin// if (!PHYRDY)
          state <= `L_NoCommErr ;
          minimum_send_two_sync <= 0;
        end          
      end             // state : L_IDLE

      /*************************** end L_IDLE ***************************/

      /*********************** start L_SyncEscape ***********************/  

      `L_SyncEscape:
      begin
        data_out_p_int      <= `SYNC;
        cntrl_char_int      <= 1'b 1;
        tx_termn_T_o    <= 0; 
        
        illegal_state_t <= 0;
        R_OK_SENT_T     <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        rx_fail_T       <= 0;
        
        data_in_rd_en_t <= 0;
        tx_crc_en       <= 0;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (PHYRDY) begin
          if (rx_charisk_in_int && (data_in_p_int == `X_RDY || data_in_p_int == `SYNC)) begin
            state <= `L_IDLE ;
          end
          else begin   //(data_in_p_int != `X_RDY && data_in_p_int != `SYNC)
            state <= `L_SyncEscape ;
          end
        end  
        else begin
           illegal_state_t <= 1 ;
           state           <= `L_NoCommErr ;
        end
      end          // state : L_SyncEscape

      /************************ end L_SyncEscape *************************/

      /************************ start L_NoCommErr ************************/

      `L_NoCommErr:
      begin
        state           <= `L_NoComm; 
        illegal_state_t <= 0;
        R_OK_SENT_T     <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        rx_fail_T       <= 0;
        
        data_in_rd_en_t <= 0;
        tx_crc_en       <= 0;
        crc_tx_rst      <= 0;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        
      end          // state : L_NoCommErr

      /************************ end L_NoCommErr ***************************/

      /************************** start L_NoComm **************************/

      `L_NoComm:
      begin
        data_out_p_int      <= `ALIGN ;
        cntrl_char_int      <= 1'b 1 ;

        illegal_state_t <= 0;
        R_OK_SENT_T     <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        rx_fail_T       <= 0;
        
        data_in_rd_en_t <= 0;

        tx_crc_en       <= 0;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (PHYRDY) begin
          state     <= `L_SendAlign;
        end 
        else begin
          state     <= `L_NoComm;
        end
      end           // state : L_NoComm

      /************************* end L_NoComm ******************************/  

      /*********************** start L_SendAlign ***************************/ 

      `L_SendAlign:
      begin
        data_out_p_int      <= `ALIGN;
        cntrl_char_int      <= 1'b 1;  
        
        illegal_state_t <= 0;
        R_OK_SENT_T     <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        rx_fail_T       <= 0;
        
        data_in_rd_en_t <= 0;
        tx_crc_en       <= 0;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (PHYRDY) begin
           state <= `L_IDLE ;
        end
        else begin
           state <= `L_NoCommErr ;
        end
      end           // state : L_SendAlign

      /************************* end L_SendAlign ***************************/  

      /*************************** start L_RESET ***************************/

      `L_RESET:
      begin
        data_in_rd_en_t <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        illegal_state_t <= 0;
        rx_fail_T       <= 0;
        tx_crc_en       <= 0;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (LRESET) begin
          state <= `L_RESET ;
        end
        else begin
          state <= `L_NoComm ;
        end
      end               // state : L_RESET

      /***************************** end L_RESET ***************************/

      /*********************************************************************/
      /****************************** END IDLE *****************************/
      /*************************** BEGIN TRANSMIT **************************/
      /*********************************************************************/

      /************************* start HL_SendChkRdy ***********************/ 

      `HL_SendChkRdy:
      begin
        data_out_p_int      <= `X_RDY;
        cntrl_char_int      <= 1;
        tx_rdy_ack_t    <= 0;
        valid_CRC_T     <= 0;
        crc_err_T       <= 0;
        R_OK_SENT_T     <= 0;
        X_RDY_SENT_T    <= 1;
        rx_fail_T       <= 0;
        
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        tx_crc_en       <= 0;
        illegal_state_t <= 0;        

        if(PHYRDY)// edited by tintu : checking PHYRDY from device
        begin
          if (rx_charisk_in_int && (data_in_p_int == `X_RDY)) begin
            state           <= `L_RcvWaitFifo;
            data_in_rd_en_t <= 0;
            crc_tx_rst      <= 0;
            r_rdy_wait_count <= 2'h0;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `SYNC) && (r_rdy_wait_count != 2'h0) )begin
            state           <= `L_IDLE;
            data_in_rd_en_t <= 0;
            crc_tx_rst      <= 0;
            r_rdy_wait_count <= 2'h0;
            illegal_state_t <= 1;
          end
          else if ((rx_charisk_in_int && (data_in_p_int == `R_RDY)) && count_for_align != 8'hFD && count_for_align != 8'hFE && count_for_align != 8'hFF) begin
            r_rdy_wait_count <= r_rdy_wait_count + 1;
            if (r_rdy_wait_count == 2'h3) begin
            
              state           <= `L_SendSOF;
              data_in_rd_en_t <= 1;
              crc_tx_rst      <= 1;
            end
            else begin
              state           <= `HL_SendChkRdy;
              data_in_rd_en_t <= 0;
              crc_tx_rst      <= 0;
            end           
          end
          else begin // data_in_p_int : !X_RDY & !R_RDY
            state           <= `HL_SendChkRdy;
            data_in_rd_en_t <= 0;
            crc_tx_rst      <= 0;
            r_rdy_wait_count <= 2'h0;
          end
        end    
        else begin //!PHYRDY
          illegal_state_t <= 1;
          state           <= `L_NoCommErr;
          data_in_rd_en_t <= 0;
          crc_tx_rst      <= 0;
          r_rdy_wait_count <= 2'h0;
        end
      end             // state : HL_SendChkRdy
      

      /*************************** end HL_SendChkRdy ***********************/

      /************************* start DL_SendChkRdy ***********************/

      `DL_SendChkRdy:
      begin
        data_out_p_int      <= `X_RDY ;
        cntrl_char_int      <= 1; 
        valid_CRC_T     <= 0;
        crc_err_T       <= 0;
        R_OK_SENT_T     <= 0;
        rx_fail_T       <= 0;
        
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        illegal_state_t <= 0;
        tx_crc_en       <= 0;
        X_RDY_SENT_T    <= 1;
        
        if(PHYRDY)// edited by tintu : checking PHYRDY from device
        begin
          if ((rx_charisk_in_int && (data_in_p_int == `R_RDY)) && count_for_align != 8'hFD && count_for_align != 8'hFE && count_for_align != 8'hFF) begin
            state           <= `L_SendSOF ;
            data_in_rd_en_t <= 1;
            crc_tx_rst      <= 1;
            scrmb_rst       <= 1;
          end
          else begin
            state           <= `DL_SendChkRdy ;
            data_in_rd_en_t <= 0;
            crc_tx_rst      <= 0;
          end
        end
        else begin//!PHYRDY
          state           <= `L_NoCommErr ;
          data_in_rd_en_t <= 0;
          crc_tx_rst      <= 0;
        end
      end             // state : DL_SendChkRdy

      /*************************** end DL_SendChkRdy ************************/

      /**************************** start L_SendSOF *************************/

      `L_SendSOF:
      begin
        data_out_p_int      <= `SOF;
        cntrl_char_int      <= 1'b 1;
        rx_fail_T       <= 0;
        
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        tx_crc_en       <= 0;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;

        
        if (PHYRDY) begin
          if (rx_charisk_in_int && (data_in_p_int == `SYNC)) begin
            state           <= `L_IDLE;
            data_in_rd_en_t <= 0;
            illegal_state_t <= 1;
          end
          else begin
            state        <= `L_SendData;
            crc_en_tx    <= 1'b 1;
            scrmb_en     <= 1'b 1;
            scrmb_rst    <= 1'b 0;
            data_in_rd_en_t <= 1;
            illegal_state_t <= 0;
            DMA_TERMINATED  <= 0;
          end
        end
        else begin
          state           <= `L_NoCommErr;      
          data_in_rd_en_t <= 0;
          illegal_state_t <= 1;
        end
      end                 // state : L_SendSOF

      /******************************* end L_SendSOF ************************/ 

      /*************************** start L_SendData *************************/

      `L_SendData:
      begin
      
        if (count_for_align == 8'h00 || count_for_align == 8'h01) begin
          data_out_p_int <= data_out_p_int;
          cntrl_char_int <= cntrl_char_int;
        end
        else begin
          if (scrmb_en) begin
            data_out_p_int   <= data_scrmb_out;
            cntrl_char_int   <= 1'b0;
          end else begin
            data_out_p_int   <= data_out_p_int;
            cntrl_char_int   <= cntrl_char_int;
          end
        end
        
        R_OK_T       <= 0;
        R_ERR_T      <= 0;
        crc_tx_rst   <= 0;
        X_RDY_SENT_T <= 0;
        rx_fail_T    <= 0;

        if(PHYRDY) begin// edited by tintu : checking PHYRDY from device
          if (EscapeCF_T) begin
            illegal_state_t <= 0;
            state           <= `L_SyncEscape ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 1'b 0;
            scrmb_en        <= 1'b 0;
            scrmb_rst       <= 1'b 1;
            tx_crc_en       <= 0;
            hold_arrived    <= 0;
          end else if(hold_arrived) begin // tintu : data transfer not complete :!frame_end_T
            illegal_state_t <= 0;
            hold_arrived    <= 0;
            state           <= `L_RcvrHold;
            crc_en_tx       <= 0;
            scrmb_en        <= 0;
            data_in_rd_en_t <= 0;
            scrmb_rst       <= 0;
            tx_crc_en       <= 0;
            data_in_rd_last_word <= 0;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `SYNC)) begin
            illegal_state_t <= 1;    // notify T-layer of the illegal transition error condition
            state           <= `L_IDLE ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 1'b 0;
            scrmb_en        <= 1'b 0;
            scrmb_rst       <= 1'b 1;
            tx_crc_en       <= 0;
            hold_arrived    <= 0;
          end
          else if (count_for_align == 8'hFE ) begin
            illegal_state_t <= 0;
            state           <= `L_SendData ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= data_in_rd_en_t;
            scrmb_en        <= data_in_rd_en_t;
            scrmb_rst       <= 0;
            tx_crc_en       <= 0;
            data_in_rd_last_word <= data_rdy_T;
            hold_arrived    <= 0;
          end
          else if (count_for_align == 8'hFF) begin
            illegal_state_t <= 0;
            state           <= `L_SendData ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 0;
            scrmb_en        <= 0;
            scrmb_rst       <= 0;
            tx_crc_en       <= 0;
            hold_arrived    <= 0;
          end
          else if (!(rx_charisk_in_int && (data_in_p_int == `HOLD)) && !(rx_charisk_in_int && (data_in_p_int ==  `DMAT)) &&
                    !(rx_charisk_in_int && (data_in_p_int == `SYNC)) && (current_data_rdy_T) && !frame_end_T &&
                     (count_for_align != 8'hFE) && (count_for_align != 8'hFF)) begin
//            state           <= `L_SendData ;
//            data_in_rd_en_t <= data_rdy_T;
//            crc_en_tx       <= data_in_rd_en_t;
//            scrmb_en        <= data_in_rd_en_t;
//            scrmb_rst       <= 0;            
//            tx_crc_en       <= 0;
//            hold_arrived    <= 0; 
            if(data_in_rd_last_word) begin
              state                 <= `L_SendData ;
              data_in_rd_en_t       <= 1;
              crc_en_tx             <= data_in_rd_en_t;
              scrmb_en              <= data_in_rd_en_t;
              scrmb_rst             <= 0;            
              tx_crc_en             <= 0;
              hold_arrived          <= 0; 
              data_in_rd_last_word  <= 0;              
            end else begin
              state                 <= `L_SendData ;
              data_in_rd_en_t       <= data_rdy_T;
              crc_en_tx             <= data_in_rd_en_t;
              scrmb_en              <= data_in_rd_en_t;
              scrmb_rst             <= 0;            
              tx_crc_en             <= 0;
              hold_arrived          <= 0; 
              data_in_rd_last_word  <= 0;              
            end
            
          end else if (rx_charisk_in_int && (data_in_p_int == `DMAT)) begin
            tx_termn_T_o    <= 1;
            illegal_state_t <= 0;
            state           <= `L_SendCRC;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 1;
            scrmb_en        <= 1;
            scrmb_rst       <= 0;
            tx_crc_en       <= 1;
            DMA_TERMINATED  <= 1;
            hold_arrived    <= 0;
          end else if (frame_end_T && !(rx_charisk_in_int && (data_in_p_int == `SYNC)) &&  !(rx_charisk_in_int && (data_in_p_int == `DMAT))) begin
            illegal_state_t <= 0;
            state           <= `L_SendCRC; 
            data_in_rd_en_t <= 0;
            crc_en_tx       <= data_in_rd_en_t;
            scrmb_en        <= 1;
            tx_crc_en       <= 1;
            scrmb_rst       <= 0;
            hold_arrived    <= 0;
          end else if((rx_charisk_in_int && (data_in_p_int == `HOLD)) && !frame_end_T) begin // tintu : data transfer not complete :!frame_end_T
            illegal_state_t <= 0;
            hold_arrived    <= 1;
            if (!hold_arrived) begin
              state           <= `L_SendData;
              crc_en_tx       <= data_in_rd_en_t;
              scrmb_en        <= data_in_rd_en_t;
            end else begin
              state           <= `L_RcvrHold;
              crc_en_tx       <= 0;
              scrmb_en        <= 0;
            end
            data_in_rd_en_t <= 0;
            scrmb_rst       <= 0;
            tx_crc_en       <= 0;
          end
          else if (!current_data_rdy_T && !(rx_charisk_in_int && (data_in_p_int == `SYNC)) && !frame_end_T) begin // tintu : data transfer not complete :!frame_end_T
            illegal_state_t <= 0;
            state           <= `L_SendHold ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 1;
            scrmb_en        <= 1;
            scrmb_rst       <= 0;
            tx_crc_en       <= 0;
            hold_arrived    <= 0;
          end
          
        end
        else // !PHYRDY
        begin
          illegal_state_t <= 1;
          state           <= `L_NoCommErr ;
          data_in_rd_en_t <= 0;
          crc_en_tx       <= 0;
          scrmb_en        <= 0;
          scrmb_rst       <= 1;
          tx_crc_en       <= 0;
          hold_arrived    <= 0;
        end
      end               // state : L_SendData

      /***************************** end L_SendData *************************/ 

      /*************************** start L_RcvrHold *************************/

      `L_RcvrHold:
      begin
        if (count_for_align == 8'h00 || count_for_align == 8'h01) begin
          data_out_p_int <= data_out_p_int;
          cntrl_char_int <= cntrl_char_int;
        end else begin
          data_out_p_int   <= `HOLDA;
          cntrl_char_int   <= 1'b 1;
        end
          
        R_OK_T       <= 0;
        R_ERR_T      <= 0;
        crc_tx_rst   <= 0;
        X_RDY_SENT_T <= 0;
        rx_fail_T    <= 0;

        if(PHYRDY)// edited by tintu : checking PHYRDY from device
        begin
          if (EscapeCF_T) begin //tintu : High priority
            illegal_state_t <= 0;
            state           <= `L_SyncEscape ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 0;
            scrmb_en        <= 0;
            scrmb_rst       <= 1;
            tx_crc_en       <= 0;
          end else if ((rx_charisk_in_int && (data_in_p_int == `SYNC)) && data_rdy_T ) begin //tintu : more data to transmit
            illegal_state_t <= 1;
            state           <= `L_IDLE ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 0;
            scrmb_en        <= 0;
            scrmb_rst       <= 1;
            tx_crc_en       <= 0;
          end else if ((rx_charisk_in_int && (data_in_p_int == `DMAT)) && data_rdy_T ) begin //tintu : more data to transmit
            illegal_state_t <= 0;
            state           <= `L_SendCRC;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 0;
            scrmb_en        <= 1;
            scrmb_rst       <= 0;
            tx_crc_en       <= 1;
          end else if (((rx_charisk_in_int && (data_in_p_int == `HOLD)) && data_rdy_T) || DecErr) begin //tintu : more data to transmit
            illegal_state_t <= 0;
            state           <= `L_RcvrHold ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 0;
            scrmb_en        <= 0;
            scrmb_rst       <= 0;
            tx_crc_en       <= 0;
          end else if (rx_charisk_in_int && (data_in_p_int == `ALIGN)) begin //Shameer : Align Received 
            illegal_state_t <= 0;
            state           <= `L_RcvrHold ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 0;
            scrmb_en        <= 0;
            scrmb_rst       <= 0;
            tx_crc_en       <= 0;
          end else if (!(rx_charisk_in_int && (data_in_p_int == `HOLD)) && !(rx_charisk_in_int && (data_in_p_int == `SYNC)) &&    // tintu : no HOLD SYNC DMAT
                   !(rx_charisk_in_int && (data_in_p_int == `DMAT)) && data_rdy_T && !DecErr) begin         
            illegal_state_t <= 0;
            if ((count_for_align == 8'hFD) ||
                (count_for_align == 8'hFE) || 
                (count_for_align == 8'hFF) || 
                (count_for_align == 8'h00)) begin
              state           <= `L_RcvrHold;
              data_in_rd_en_t <= 0;
              crc_en_tx       <= 0;
              scrmb_en        <= 0;
            end else begin
              state           <= `L_SendData ;
              data_in_rd_en_t <= data_rdy_T;
              crc_en_tx       <= data_in_rd_en_t;
              scrmb_en        <= data_in_rd_en_t;
            end
            scrmb_rst       <= 0;
            tx_crc_en       <= 0;
          end
        end else begin //!PHYRDY
          illegal_state_t <= 1;
          state           <= `L_NoCommErr ;
          data_in_rd_en_t <= 0;
          crc_en_tx       <= 0;
          scrmb_en        <= 0;
          scrmb_rst       <= 1;
          tx_crc_en       <= 0;
        end
      end               // state : L_RcvrHold

      /***************************** end L_RcvrHold *************************/

      /*************************** start L_SendHold *************************/

      `L_SendHold:
      begin
        if (count_for_align == 8'h00 || count_for_align == 8'h01) begin
          data_out_p_int <= data_out_p_int;
          cntrl_char_int <= cntrl_char_int;
        end else begin
          data_out_p_int <= `HOLD;
          cntrl_char_int <= 1'b 1;
        end
        
        R_OK_T       <= 0;
        R_ERR_T      <= 0;
        crc_tx_rst   <= 0;
        X_RDY_SENT_T <= 0;
        rx_fail_T    <= 0;
        
        
        if(PHYRDY)// edited by tintu : checking PHYRDY from device
        begin
          if ((rx_charisk_in_int && (data_in_p_int == `HOLD)) && data_rdy_T) begin
            illegal_state_t <= 0;
            state           <= `L_RcvrHold ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 0;
            scrmb_en        <= 0;
            scrmb_rst       <= 0;
            tx_crc_en       <= 0;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `SYNC)) begin
            illegal_state_t <= 1;
            state           <= `L_IDLE ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 0;
            scrmb_en        <= 0;
            scrmb_rst       <= 1;
            tx_crc_en       <= 0;
          end else if ((count_for_align == 8'hFE) || (count_for_align == 8'hFF) || (count_for_align == 8'h00)) begin
            illegal_state_t <= 0;
            state           <= `L_SendHold;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 0;
            scrmb_en        <= 0;
            scrmb_rst       <= 0;
            tx_crc_en       <= 0;
          end else if (!data_rdy_T && !(rx_charisk_in_int && (data_in_p_int == `SYNC)) && !(rx_charisk_in_int && (data_in_p_int == `DMAT))) begin // tintu &&
            illegal_state_t <= 0;
            state           <= `L_SendHold ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 0;
            scrmb_en        <= 0;
            scrmb_rst       <= 0;
            tx_crc_en       <= 0;
          end else if (frame_end_T && !(rx_charisk_in_int && (data_in_p_int == `SYNC))) begin
            illegal_state_t <= 0;
            state           <= `L_SendCRC ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 0;
            scrmb_en        <= 1;
            scrmb_rst       <= 0;
            tx_crc_en       <= 1;
          end else if (rx_charisk_in_int && (data_in_p_int == `DMAT)) begin
            illegal_state_t <= 0;
            tx_termn_T_o    <= 1 ;
            state           <= `L_SendCRC ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 0;
            scrmb_en        <= 1;
            scrmb_rst       <= 0;
            tx_crc_en       <= 1;
          end else if (EscapeCF_T) begin
            illegal_state_t <= 0;
            state           <= `L_SyncEscape ;
            data_in_rd_en_t <= 0;
            crc_en_tx       <= 0;
            scrmb_en        <= 0;
            scrmb_rst       <= 1;
            tx_crc_en       <= 0;
          end
          else if (!(rx_charisk_in_int && (data_in_p_int == `HOLD)) && !(rx_charisk_in_int && (data_in_p_int == `SYNC)) && data_rdy_T) begin //tintu : &&
            illegal_state_t <= 0;
            state           <= `L_SendData ;
            data_in_rd_en_t <= 1;
            crc_en_tx       <= data_in_rd_en_t;
            scrmb_en        <= data_in_rd_en_t;
            scrmb_rst       <= 0;
            tx_crc_en       <= 0;
          end
        end
        else begin
          illegal_state_t <= 1;
          state           <= `L_NoCommErr ;
          data_in_rd_en_t <= 0;
          crc_en_tx       <= 0;
          scrmb_en        <= 0;
          scrmb_rst       <= 1;
        end
      end               // state : L_SendHold


      /***************************** end L_SendHold *************************/

      /*************************** start L_SendCRC **************************/

      `L_SendCRC:
      begin
        crc_en_tx       <= 0;
        scrmb_en        <= 0;
        scrmb_rst       <= 1;
        data_out_p_int      <= data_scrmb_out;
        cntrl_char_int      <= 0;  
        rx_fail_T       <= 0;
        
        data_in_rd_en_t <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        tx_crc_en       <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (PHYRDY) begin
          if (rx_charisk_in_int && (data_in_p_int == `SYNC)) begin
            illegal_state_t <= 1 ;
            state           <= `L_IDLE ;
          end
          else begin
            illegal_state_t <= 0; 
            state           <= `L_SendEOF ;
          end
        end
        else begin
          illegal_state_t <= 1;
          state           <= `L_NoCommErr ;
        end
      end                //state : L_SendCRC

      /***************************** end L_SendCRC **************************/

      /*************************** start L_SendEOF **************************/

      `L_SendEOF:
      begin
        data_out_p_int      <= `EOF ;
        cntrl_char_int      <= 1'b 1 ;
        
        crc_en_tx       <= 0;
        scrmb_en        <= 0;
        scrmb_rst       <= 1;
        rx_fail_T       <= 0;
        
        data_in_rd_en_t <= 0; 
        R_OK_T          <= 0;	
        R_ERR_T         <= 0;
        tx_crc_en       <= 0;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (PHYRDY) begin
          if (rx_charisk_in_int && (data_in_p_int == `SYNC)) begin
            illegal_state_t <= 1;  
            state           <= `L_IDLE;
          end
          else begin
            illegal_state_t <= 0;
            state           <= `L_Wait;
          end
        end
        else begin
          illegal_state_t  <= 1;
          state     <= `L_NoCommErr;
        end
      end               // state : L_SendEOF

      /***************************** end L_SendEOF **************************/ 

      /***************************** start L_Wait ***************************/

      `L_Wait:
      begin
        data_out_p_int      <= `WTRM;
        cntrl_char_int      <= 1'b 1;
        
        data_in_rd_en_t <= 0; 
        tx_crc_en       <= 0;
        rx_fail_T       <= 0;
        
        crc_en_tx       <= 0;
        scrmb_en        <= 0;
        scrmb_rst       <= 1;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (PHYRDY)
        begin
          if (rx_charisk_in_int && (data_in_p_int == `R_OK))
          begin
            R_OK_T          <= 1;
            illegal_state_t <= 0;
            R_ERR_T         <= 0;
            state           <= `L_IDLE;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `R_ERR)) 
          begin
            R_OK_T          <= 0;
            illegal_state_t <= 0;
            R_ERR_T         <= 1;
            state           <= `L_IDLE ;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `SYNC))
          begin
            R_OK_T          <= 0;
            illegal_state_t <= 1;
            R_ERR_T         <= 0;
            state           <= `L_IDLE ;
          end
          else
          begin
            illegal_state_t <= 0;
            R_OK_T          <= 0;
            R_ERR_T         <= 0;
            state           <= `L_Wait ;
          end
        end
        else
        begin
          illegal_state_t <= 1;
          R_OK_T          <= 0;
          R_ERR_T         <= 0;
          state           <= `L_NoCommErr ;
        end
      end                 // state : L_Wait

      /******************************* end L_Wait ***************************/

      /**********************************************************************/
      /****************************** END TRANSMIT **************************/
      /***************************** BEGIN RECIEVE **************************/
      /**********************************************************************/

      /**************************** start L_RcvChkRdy ***********************/

      `L_RcvChkRdy:
      begin
        data_out_p_int      <= `R_RDY;
        cntrl_char_int      <= 1'b 1;
        valid_CRC_T     <= 1'b 0;
        crc_err_T       <= 1'b 0;
        R_OK_SENT_T     <= 1'b 0;
        
        data_in_rd_en_t <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        tx_crc_en       <= 0;
        crc_en_tx       <= 0;
        scrmb_en        <= 0;
        scrmb_rst       <= 1;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (PHYRDY) begin
          if (rx_charisk_in_int && (data_in_p_int == `X_RDY)) begin
            state          <= `L_RcvChkRdy ;
            SOF_T          <= 0;
            crc_rx_rst     <= 0;
            unscrmb_en_fsm <= 0;
            unscrmb_rst    <= 1;
            rx_fail_T      <= 0;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `ALIGN)) begin
            state          <= `L_RcvChkRdy ;
            SOF_T          <= 0;
            crc_rx_rst     <= 0;
            unscrmb_en_fsm <= 0;
            unscrmb_rst    <= 1;
            rx_fail_T      <= 0;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `SOF)) begin
            state          <= `L_RcvData ;
            SOF_T          <= 1;
            crc_rx_rst     <= 1;
            unscrmb_en_fsm <= 1;
            unscrmb_rst    <= 0;
            rx_fail_T      <= 0;
          end
          else begin               //notification to the T-layer is required
            state          <= `L_IDLE ;
            SOF_T          <= 0;
            crc_rx_rst     <= 0;
            unscrmb_en_fsm <= 0;
            unscrmb_rst    <= 1;
            rx_fail_T      <= 0;
          end
        end
        else
        begin
          rx_fail_T      <= 1;
          state          <= `L_NoCommErr ;
          SOF_T          <= 0;
          crc_rx_rst     <= 0;
          unscrmb_en_fsm <= 0;
          unscrmb_rst    <= 1;
          illegal_state_t <= 1;

        end
      end                // state : L_RcvChkRdy

      /****************************** end L_RcvChkRdy ***********************/

      /************************** start L_ RcvWaitFifo **********************/

      `L_RcvWaitFifo:
      begin
        data_out_p_int <= `SYNC ;
        cntrl_char_int <= 1'b 1 ;

        data_in_rd_en_t <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        tx_crc_en       <= 0;
        crc_en_tx       <= 0;
        scrmb_en        <= 0;
        scrmb_rst       <= 1;
        illegal_state_t <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (PHYRDY) begin
          if (rx_charisk_in_int && (data_in_p_int == `X_RDY)) begin
            if (rx_FIFO_rdy) begin
              state <= `L_RcvChkRdy ;
            end
            else begin
              state <= `L_RcvWaitFifo ;
            end
            rx_fail_T <= 0;
          end
          else begin // notification to the T-layer is required
            state     <= `L_IDLE ;
            rx_fail_T <= 0;
          end
        end
        else begin
          state     <= `L_NoCommErr ;
          rx_fail_T <= 1;
        end
      end              // state : L_RcvWaitFifo

      /**************************** end L_RcvWaitFifo **********************/

      /***************************** start L_RcvData ************************/

      `L_RcvData:
      begin
        SOF_T           <= 1'b 0;
        crc_rx_rst      <= 1'b 0;
        
        data_in_rd_en_t <= 0;	
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        tx_crc_en       <= 0;
        crc_en_tx       <= 0;
        scrmb_en        <= 0;
        scrmb_rst       <= 1;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (tx_termn_T_i) begin
          data_out_p_int <= `DMAT ;
        end
        else begin
          data_out_p_int <= `R_IP ;
        end
        cntrl_char_int <= 1'b 1 ;
        
        
        if (PHYRDY) begin
          if (EscapeCF_T) begin
            state           <= `L_SyncEscape ;
            eof_t_int           <= 0;
            unscrmb_en_fsm  <= 0;
            unscrmb_rst     <= 1;
            data_out_vld_t_int  <= 1;
            rx_fail_T       <= 1;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `EOF)) begin
            state           <= `L_RcvEOF ;
            eof_t_int           <= 1;
            unscrmb_en_fsm  <= 0;
            unscrmb_rst     <= 1;
            data_out_vld_t_int  <= 0;
            rx_fail_T       <= 0;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `ALIGN)) begin
            state           <= `L_RcvData ;
            eof_t_int           <= 0;
            unscrmb_en_fsm  <= unscrmb_en_fsm;
            unscrmb_rst     <= 0;
            data_out_vld_t_int  <= 0;
            rx_fail_T       <= 0;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `HOLDA)) begin     // if there is data from phy rx_FIFO_rdy  
            state           <= `L_RcvData ;
            eof_t_int           <= 0;
            unscrmb_en_fsm  <= 0;
            unscrmb_rst     <= 0;
            data_out_vld_t_int  <= 0;
            rx_fail_T       <= 0;
          end
          else if (!rx_FIFO_rdy) begin         // if there is data from phy
            state           <= `L_Hold;
            eof_t_int           <= 0;
            unscrmb_en_fsm  <= 1;
            unscrmb_rst     <= 0;
            data_out_vld_t_int  <= 1;
            rx_fail_T       <= 0;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `HOLD)) begin
            state           <= `L_RcvHold;
            eof_t_int           <= 0;
            unscrmb_en_fsm  <= 0;
            unscrmb_rst     <= 0;
            data_out_vld_t_int  <= 0;
            rx_fail_T       <= 0;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `WTRM)) begin
            state           <= `L_BadEnd ;
            eof_t_int           <= 0;
            unscrmb_en_fsm  <= 0;
            unscrmb_rst     <= 1;
            data_out_vld_t_int  <= 0;
            rx_fail_T       <= 1;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `SYNC)) begin
            //rx_fail_T <= 1'b 1 ;
            state           <= `L_IDLE ;
            eof_t_int           <= 0;
            unscrmb_en_fsm  <= 0;
            unscrmb_rst     <= 1;
            data_out_vld_t_int  <= 0;
            rx_fail_T       <= 1;
            illegal_state_t <= 1;
          end 
          else begin
            state           <= `L_RcvData ;
            eof_t_int           <= 0;
            unscrmb_en_fsm  <= 1;
            unscrmb_rst     <= 0;
            data_out_vld_t_int  <= 1;
            rx_fail_T       <= 0;
          end
        end
        else begin
          state           <= `L_NoCommErr ;
          unscrmb_en_fsm  <= 0;
          unscrmb_rst     <= 1;
          data_out_vld_t_int  <= 0;
          rx_fail_T       <= 1;
        end
      end                 // state : L_RcvData

      /******************************* end L_RcvData ************************/

      /******************************* start L_Hold *************************/
      // receive encoded character from phy 

      `L_Hold:
      begin
        data_out_p_int      <= `HOLD;
        cntrl_char_int      <= 1'b 1;  
        data_unscr_in   <= data_in_p_int;
        
        data_in_rd_en_t <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        tx_crc_en       <= 0;
        crc_en_tx       <= 0;
        scrmb_en        <= 0;
        scrmb_rst       <= 1;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (PHYRDY) begin
          if (EscapeCF_T) begin
            state           <= `L_SyncEscape ;
            unscrmb_en_fsm  <= 0;
            unscrmb_rst     <= 1;
            data_out_vld_t_int  <= 0;
            rx_fail_T       <= 0;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `SYNC)) begin
            illegal_state_t <= 1;
            state           <= `L_IDLE;
            unscrmb_en_fsm  <= 0;
            unscrmb_rst     <= 1;
            data_out_vld_t_int  <= 0; 
            rx_fail_T       <= 1;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `EOF)) begin
            state           <= `L_RcvEOF;
            eof_t_int           <= 1;
            unscrmb_en_fsm  <= 0;
            unscrmb_rst     <= 1;
            data_out_vld_t_int  <= 0;
            rx_fail_T       <= 0;
          end
          else if (rx_FIFO_rdy) begin
            if (rx_charisk_in_int && (data_in_p_int == `HOLD)) begin
              state           <= `L_RcvHold ;
              unscrmb_en_fsm  <= 0;
              unscrmb_rst     <= 0;
              data_out_vld_t_int  <= 0;
              rx_fail_T       <= 0;
            end
            else if (rx_charisk_in_int && (data_in_p_int == `ALIGN)) begin
              state           <= `L_RcvData;
              unscrmb_en_fsm  <= 0;
              unscrmb_rst     <= 0;
              data_out_vld_t_int  <= 0;
              rx_fail_T       <= 0;
            end
            else if (!(rx_charisk_in_int && (data_in_p_int == `HOLD)) && 
                     !(rx_charisk_in_int && (data_in_p_int == `EOF))  && 
                     !(rx_charisk_in_int && (data_in_p_int == `ALIGN))  ) begin
              state           <= `L_RcvData;
              unscrmb_en_fsm  <= 1;
              unscrmb_rst     <= 0;
              data_out_vld_t_int  <= 0;
              rx_fail_T       <= 0;
            end
          end
          else if (!rx_FIFO_rdy && !(rx_charisk_in_int && (data_in_p_int == `EOF)) && 
                   !(rx_charisk_in_int && (data_in_p_int == `SYNC))) begin
            state           <= `L_Hold ;
            unscrmb_en_fsm  <= 1'b 0;
            unscrmb_rst     <= 1'b 0;
            data_out_vld_t_int  <= 1'b 0;
            rx_fail_T       <= 0;
          end
        end
        else begin
          state           <= `L_NoCommErr;
          unscrmb_en_fsm  <= 0;
          unscrmb_rst     <= 1;
          data_out_vld_t_int  <= 0;
          rx_fail_T       <= 0;
        end
      end                   // state : L_Hold
      
      /********************************* end L_Hold *************************/

      /****************************** start L_RcvHold ***********************/
      `L_RcvHold:
      begin
      
        data_in_rd_en_t <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        tx_crc_en       <= 0;
        crc_en_tx       <= 0;
        scrmb_en        <= 0;
        scrmb_rst       <= 1;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (tx_termn_T_i) begin
          data_out_p_int <= `DMAT ;  // to signal the transmitter to terminate the transmission.
          cntrl_char_int <= 1;  
        end
        else begin
          data_out_p_int <= `HOLDA ;
          cntrl_char_int <= 1;
        end      
        
        if (PHYRDY) begin
          if (rx_charisk_in_int && (data_in_p_int == `HOLD || data_in_p_int == `ALIGN)) begin
            state           <= `L_RcvHold ;
            unscrmb_en_fsm  <= 1;
            unscrmb_rst     <= 0;
            data_out_vld_t_int  <= 0;
            rx_fail_T       <= 0;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `EOF)) begin
            state           <= `L_RcvEOF ;
            eof_t_int           <= 1;
            unscrmb_en_fsm  <= 0;
            unscrmb_rst     <= 1;
            data_out_vld_t_int  <= 0;
            rx_fail_T       <= 0;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `SYNC)) begin
            state           <= `L_IDLE ;
            unscrmb_en_fsm  <= 0;
            unscrmb_rst     <= 1;
            data_out_vld_t_int  <= 0;
            rx_fail_T       <= 1;
            illegal_state_t <= 1;
          end
          else if (!(rx_charisk_in_int && (data_in_p_int == `HOLD)) && 
                   !(rx_charisk_in_int && (data_in_p_int == `EOF))  && 
                   !(rx_charisk_in_int && (data_in_p_int == `SYNC)) &&
                   !(rx_charisk_in_int && (data_in_p_int == `ALIGN))  ) begin
            state           <= `L_RcvData ;
            unscrmb_en_fsm  <= 1;
            unscrmb_rst     <= 0;
            data_out_vld_t_int  <= 1;
            rx_fail_T       <= 0;
          end
          else if (EscapeCF_T) begin
            state           <= `L_SyncEscape ;
            unscrmb_en_fsm  <= 0;
            unscrmb_rst     <= 1;
            data_out_vld_t_int  <= 0;
            rx_fail_T       <= 1;
          end
        end
        else if (!PHYRDY) begin
          state           <= `L_NoCommErr ;
          unscrmb_en_fsm  <= 0;
          unscrmb_rst     <= 1;
          data_out_vld_t_int  <= 0;
          rx_fail_T       <= 0;
        end
      end                  // state : L_RcvHold 

      /******************************** end L_RcvHold ***********************/

      /******************************* start L_RcvEOF ***********************/

      `L_RcvEOF:
      begin
        data_out_p_int      <= `R_IP ;
        cntrl_char_int      <= 1'b 1 ;  
        eof_t_int           <= 1'b 0 ;
        
        data_in_rd_en_t <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        tx_crc_en       <= 0;
        crc_en_tx       <= 0;
        scrmb_en        <= 0;
        scrmb_rst       <= 1;
        illegal_state_t <= 0;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
                
        if (PHYRDY) begin
          if (data_crc_out_rx == 32'h 00000000) begin
            valid_CRC_T <= 1;
            crc_err_T   <= 0;
            rx_fail_T   <= 0;
            state       <= `L_GoodCRC;
          end
          else begin
            valid_CRC_T <= 0;
            crc_err_T   <= 1;
            rx_fail_T   <= 0;
            state       <= `L_BadEnd ;
          end
        end
        else begin
          valid_CRC_T <= 0;
          crc_err_T   <= 0;          
          rx_fail_T   <= 1;
          state       <= `L_NoCommErr ;
        end
      end                   // state : L_RcvEOF 

      /********************************* end L_RcvEOF ***********************/

      /******************************* start L_GoodCRC **********************/

      `L_GoodCRC:
      begin
        data_out_p_int  <= `R_IP ;
        cntrl_char_int  <= 1;  
        crc_err_T   <= 0;
        valid_CRC_T <= valid_CRC_T;
        
        data_in_rd_en_t <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        tx_crc_en       <= 0;
        crc_en_tx       <= 0;
        scrmb_en        <= 0;
        scrmb_rst       <= 1;
        
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (PHYRDY) begin
          if (Good_status_T) begin
            state     <= `L_GoodEnd ;
            rx_fail_T <= 0;
          end
          else if (Unrecgnzd_FIS_T || FIS_err) begin
            state     <= `L_BadEnd;
            rx_fail_T <= 0;
          end
          else if (rx_charisk_in_int && (data_in_p_int == `SYNC)) begin
            state     <= `L_IDLE ;
            rx_fail_T <= 0;
            illegal_state_t <= 1;
          end
          else begin          // Transport layer has yet to respond.
            rx_fail_T <= 0;
            state     <= `L_GoodCRC ;
          end
        end
        else begin
          rx_fail_T <= 1;  
          state <= `L_NoCommErr ;
        end
      end                   // state : L_GoodCRC  

      /********************************* end L_GoodCRC **********************/

      /******************************* start L_GoodEnd **********************/

      `L_GoodEnd:
      begin
        data_out_p_int      <= `R_OK;
        cntrl_char_int      <= 1'b 1;
        R_OK_SENT_T     <= 1'b 1;
        crc_err_T       <= 0;
        valid_CRC_T     <= valid_CRC_T;
        
        data_in_rd_en_t <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 0;
        tx_crc_en       <= 0;
        crc_en_tx       <= 0;
        scrmb_en        <= 0;
        scrmb_rst       <= 1;
        illegal_state_t <= 0;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (PHYRDY) begin
          if (rx_charisk_in_int && (data_in_p_int == `SYNC)) begin
            state     <= `L_IDLE ;
            rx_fail_T <= 0;
          end
          else if (!(rx_charisk_in_int && (data_in_p_int == `SYNC))) begin
            state     <= `L_GoodEnd ;
            rx_fail_T <= 0;
          end
        end
        else begin
          state     <= `L_NoCommErr ;
          rx_fail_T <= 1;
        end
      end                   // state : L_GoodEnd

      /********************************* end L_GoodEnd **********************/

      /******************************* start L_BadEnd ***********************/

      `L_BadEnd:
      begin
        data_out_p_int  <= `R_ERR ;
        cntrl_char_int  <= 1'b 1 ;
        crc_err_T   <= crc_err_T;
        valid_CRC_T <= valid_CRC_T;

        data_in_rd_en_t <= 0;
        R_OK_T          <= 0;
        R_ERR_T         <= 1'b 0;
        tx_crc_en       <= 0;
        crc_en_tx       <= 0;
        scrmb_en        <= 0;
        scrmb_rst       <= 1;
        illegal_state_t <= 0;
        crc_tx_rst      <= 0;
        X_RDY_SENT_T    <= 0;
        
        if (PHYRDY) begin
          if (rx_charisk_in_int && (data_in_p_int == `SYNC))
          begin
            rx_fail_T <= 0;
            state     <= `L_IDLE;
          end
          else if (!(rx_charisk_in_int && (data_in_p_int == `SYNC)))
          begin
            rx_fail_T <= 0;
            state     <= `L_BadEnd;
          end
        end
        else begin
          rx_fail_T <= 1;  
          state     <= `L_NoCommErr;
        end
      end                   // state : L_BadEnd
      endcase
       
  /********************************* end L_BadEnd ***********************/

  /**********************************************************************/
  /****************************** END RECIEVE ***************************/
  /**************************** BEGIN POWER MODE ************************/
  /**********************************************************************/

  /*************************                      ***********************/
    end      // !rst
  end       // always


  assign data_scrmb_in  = (tx_crc_en == 1) ? data_crc_out_tx : data_in_t;
  assign align_detected = (rx_charisk_in_int && (data_in_p_int == `ALIGN)) ? 1 : 0;
  assign hold_detected  = (rx_charisk_in_int && (data_in_p_int == `HOLD)) ? 1 : 0;
  assign unscrmb_en     = unscrmb_en_fsm && (!align_detected) && (!hold_detected);
  
  
  crc crc_tx ( 
            .data_in   (data_in_t       ),            
            .crc_en    (crc_en_tx       ),            
            .rst       (crc_tx_rst      ),            
            .clk       (clk             ),            
            .crc_out   (data_crc_out_tx ),             
            .CRC_cal_ip(CRC_cal_ip_tx   )             
                                        );
                     
                     
  scrambler scrambler_i (
                     .data_in   (data_scrmb_in ),
                     .scram_en  (scrmb_en      ),
                     .scram_rst (scrmb_rst     ),
                     .rst       (rst           ),
                     .clk       (clk           ),
                     .data_c    (data_scrmb_out) 
                                               );
                                           
  scrambler unscrambler_i (
                     .data_in   (data_in_p_int ), //data_unscr_in
                     .scram_en  (unscrmb_en    ),
                     .scram_rst (unscrmb_rst   ),
                     .rst       (rst           ),
                     .clk       (clk           ),                          
                     .data_out  (data_out_t_int)                     
                                               );                          
                                                                       
  crc crc_rx (                                                          
            .data_in   (data_out_t_int ),                                 
            .crc_en    (crc_en_rx      ),    
            .rst       (crc_rx_rst     ),                      
            .clk       (clk            ),                                   
            .crc_out   (data_crc_out_rx),                           
            .CRC_cal_ip(               )                                 
                                       );   
                                  
  always @(posedge clk, posedge rst)                                                      
  begin                                                                                   
    if (rst) begin       
      crc_en_rx <= 1'b 0;
    end
    else begin                                       
      crc_en_rx <= unscrmb_en;
    end
  end
  
  always @(posedge clk, posedge rst)                                                      
  begin                                                                                   
    if (rst) begin       
      data_out_t_int1 <= 32'b 0;
    end
    else begin      
      if (data_out_vld_t_int) begin
        data_out_t_int1 <= data_out_t_int;
      end
      else begin
        data_out_t_int1 <= data_out_t_int1;
      end
    end
  end
  
  always @(posedge clk, posedge rst)                                                      
  begin                                                                                   
    if (rst) begin       
      data_out_t <= 32'b 0;
    end
    else begin      
      data_out_t <= data_out_t_int1;
    end
  end     
  
  always @(posedge clk, posedge rst)                                                      
  begin                                                                                   
    if (rst) begin       
      EOF_T <= 1'b 0;
    end
    else begin      
      EOF_T <= eof_t_int;
    end
  end   
  
  //delaying data_out_vld_t_int
  always @(posedge clk, posedge rst)                                                      
  begin                                                                                   
    if (rst) begin       
      data_out_vld_t_int_d1 <= 1'b 0;
    end
    else begin      
      data_out_vld_t_int_d1 <= data_out_vld_t_int;
    end
  end   
  
  assign data_vld_temp = data_out_vld_t_int_d1 & data_out_vld_t_int;
  
  always @(posedge clk, posedge rst)                                                      
  begin                                                                                   
    if (rst) begin       
      data_out_vld_T   <= 1'b 0;
      data_valid_state <= FIRST_STATE;
    end
    else begin      
      case (data_valid_state)
      
        FIRST_STATE:
        begin
          if (data_out_vld_t_int) begin
            data_out_vld_T   <= 0;
            data_valid_state <= SECOND_STATE;
          end
          else begin
            data_out_vld_T   <= 0;
            data_valid_state <= FIRST_STATE;
          end
        end       
        SECOND_STATE: 
        begin
          if (data_vld_temp) begin
            data_out_vld_T <= 1;
            data_valid_state <= SECOND_STATE;
          end
          else begin
            data_out_vld_T <= 0;
            data_valid_state <= THIRD_STATE;
          end
        end
        
        THIRD_STATE: 
        begin
          if (data_out_vld_t_int) begin
            data_out_vld_T   <= 1;
            data_valid_state <= SECOND_STATE;
          end
          else if (EOF_T) begin
            data_out_vld_T   <= 0;
            data_valid_state <= FIRST_STATE;
          end
          else begin
            data_out_vld_T   <= 0;
            data_valid_state <= THIRD_STATE;
          end
        end
      endcase
    end
  end 
  
  //assign crc_mask_for_data_out_vld_t = ((data_crc_out_rx == data_out_t) && ((rx_charisk_in_int && (data_in_p_int == `EOF))  || 
  //                                                                          (rx_charisk_in_int && (data_in_p_int == `ALIGN))  )) ? 1 : 0;
  //assign crc_mask_for_data_out_vld_t = ((data_crc_out_rx == data_out_t)) ? 1 : 0;
  //assign data_out_vld_T = (crc_mask_for_data_out_vld_t == 1) ? 0: data_out_vld_t_int;
                                                                         
endmodule                                                                            