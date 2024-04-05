//*****************************************************************************
// Copyright (c) 2008 Xilinx, Inc.
// This design is confidential and proprietary of Xilinx, Inc.
// All Rights Reserved
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: $Name: OOB_control_v1_0 $
//  \   \         Application: XAPP870
//  /   /         Filename: OOB_control.v
// /___/   /\     Date Last Modified: $Date: 2008/12/4 00:00:00 $
// \   \  /  \    Date Created: Wed Jan 2 2008
//  \___\/\___\
//
//Design Name: OOB_control
//Purpose:
// This module handles the Out-Of-Band (OOB) handshake requirements
//    
//Reference:
//Revision History: rev1.1
//*****************************************************************************

 

`timescale 1 ns / 1 ps
//`include "sim.inc" 
`include "../sata_link/defines.h"

module OOB_control (

  clk,                  // Clock
  reset,                // reset
  link_reset,          
  rx_locked,            // GTX PLL is locked
        
  tx_datain,            // Incoming TX data
  tx_chariskin,         // Incoming tx is k char
  tx_dataout,           // Outgoing TX data 
  tx_charisk_out,       // TX byted is K character
                           
  rx_charisk,                             
  rx_datain,                
  rx_dataout, 
  rx_charisk_out,              

  linkup,               // SATA link is established
  rxreset,              // GTP PCS reset
  gen,                  // Generation speed 00 for sata1, 01 for sata2, 10 for sata3
  txcominit,            // TX OOB COMRESET
  txcomwake,            // TX OOB COMWAKE
  cominitdet,           // RX OOB COMINIT
  comwakedet,           // RX OOB COMWAKE
  rxelecidle,           // RX electrical idle
  txelecidle,           // TX electircal idel
  rxbyteisaligned,      // RX byte alignment completed
  CurrentState_out,     // Current state for Chipscope
  align_det_out,        // ALIGN primitive detected
  sync_det_out,         // SYNC primitive detected
  rx_sof_det_out,       // Start Of Frame primitive detected
  rx_eof_det_out,       // End Of Frame primitive detected
  gt0_rxresetdone_i,    // rx fsm reaet done
  gt0_txresetdone_i,    // tx fsm reset done
  gtx_rx_reset_out      // rx reset out
);

  input             clk;
  input             reset;
  input             link_reset;
  input             rx_locked;
  input             cominitdet;
  input             comwakedet;
  input             rxelecidle;
  input      [31:0] tx_datain;
  input             tx_chariskin;
  input      [3:0]  rx_charisk;
  input      [31:0] rx_datain;
  input             rxbyteisaligned;
  input      [1:0]  gen;
  input             gt0_rxresetdone_i;
  input             gt0_txresetdone_i;

  output            txcominit;
  output            txcomwake;
  output            txelecidle;
  output     [31:0] tx_dataout;
  output            tx_charisk_out;
  output     [31:0] rx_dataout;
  output     [3:0]  rx_charisk_out;
  output reg        linkup;
  output            rxreset;
  output     [3:0]  CurrentState_out;
  output            align_det_out;
  output            sync_det_out;
  output            rx_sof_det_out;
  output            rx_eof_det_out;
  output reg        gtx_rx_reset_out;
  
 
  parameter [3:0]  
  host_comreset         = 4'h 1,                                                        
  wait_dev_cominit      = 4'h 2,
  host_comwake          = 4'h 3,
  wait_dev_comwake      = 4'h 4,
  wait_after_comwake    = 4'h 5,
  wait_after_comwake1   = 4'h 6,
  host_d10_2            = 4'h 7,
  host_send_align       = 4'h 8,
  check_rx_man_rst      = 4'h 9,
  check_rx_man_rst_rel  = 4'h A,
  link_ready            = 4'h B;



  
  reg [3:0]   CurrentState, NextState;                               
  reg [7:0]   count160;                                               
  reg [17:0]  count;                                                  
  reg [4:0]   count160_round;                                         
  reg [3:0]   align_char_cnt_reg;                                     
  reg         align_char_cnt_rst, align_char_cnt_inc;                 
  reg         count_en;                                               
  reg         send_d10_2_r, send_align_r;                             
  reg         tx_charisk_out;                                         
  reg         txelecidle_r;                                           
  reg         count160_done, count160_go;                             
  reg [1:0]   align_count;                                            
  reg         linkup_r;                                               
  reg         rxreset;                                                
  reg [31:0]  rx_datain_r1;
  reg [31:0]  tx_datain_r1, tx_datain_r2, tx_datain_r3, tx_datain_r4; // TX data registers
  reg [31:0]  tx_dataout;
  reg [31:0]  rx_dataout;
  reg [1:0]   rx_charisk_out;
  reg         txcominit_r,txcomwake_r;
  reg [7:0]   count_sync;       
  reg         sync_stable;
  reg [31:0]  rx_datain_r1_int;
  reg         cont_flag;
  reg         rx_charisk_r1_int;
  reg         rx_charisk_r1;
  reg [11:0]  rxreset_cnt;
  reg [11:0]  gtxreset_cnt; 
  reg         gtxreset_cnt_400;
  
  wire        align_det, sync_det;
  wire        comreset_done, dev_cominit_done, host_comwake_done, dev_comwake_done;
  wire        sof_det, eof_det;
  wire        align_cnt_en;
        
        

  always@(posedge clk or posedge reset)
  begin : Linkup_synchronisation
    if (reset) begin
      linkup <= 0;
    end
    else begin 
      linkup <= linkup_r;
    end
  end

always @ (CurrentState or count or cominitdet or comwakedet or rxelecidle or rx_locked or align_det or sync_det or gen 
          or gt0_txresetdone_i or gt0_rxresetdone_i or gtxreset_cnt_400)
begin : SM_mux
  count_en          = 1'b0;
  NextState         = host_comreset;//gtx_reset;
  linkup_r          = 1'b0;
  txcominit_r       = 1'b0;
  txcomwake_r       = 1'b0;
  txelecidle_r      = 1'b1;
  send_d10_2_r      = 1'b0;
  send_align_r      = 1'b0;
  rxreset           = 1'b0; 
  gtx_rx_reset_out  = 1'b0;  
  
  case (CurrentState)
    
    
    host_comreset : begin
      if (rx_locked && gt0_txresetdone_i && gt0_rxresetdone_i) begin 
        if ((gen == 2'b10 && count == 18'h00144) || (gen == 2'b01 && count == 18'h000A2) || (gen == 2'b00 && count == 18'h00051)) begin
          txcominit_r = 1'b0; 
          NextState   = wait_dev_cominit;
        end
        else begin
          txcominit_r = 1'b1; 
          count_en    = 1'b1;
          NextState   = host_comreset;            
        end
      end
      else begin
        txcominit_r = 1'b0; 
        NextState   = host_comreset;
      end                         
    end     
    
    wait_dev_cominit : //1
      begin
        if (cominitdet) //device cominit detected       
        begin
          NextState = host_comwake;
        end
        else
        begin
          `ifdef SIM
          if(count == 18'h001ff) 
          `else
          if(count == 18'h203AD) //restart comreset after no cominit for at least 880us
          `endif
          begin
            count_en  = 1'b0;
            NextState = host_comreset;
          end
          else
          begin
            count_en  = 1'b1;
            NextState = wait_dev_cominit;
          end
        end
      end
      
    host_comwake : //2
      begin
        if ((gen == 2'b10 && count == 18'h00136) || (gen == 2'b01 && count == 18'h0009B) || (gen == 2'b00 && count == 18'h0004E))
        begin
          txcomwake_r = 1'b0; 
          NextState   = wait_dev_comwake;
        end
        else
        begin
          txcomwake_r = 1'b1; 
          count_en    = 1'b1;
          NextState   = host_comwake;           
        end
      end
      
    wait_dev_comwake : //3 
      begin
        if (comwakedet) //device comwake detected       
        begin
          NextState = wait_after_comwake;
        end
        else
        begin
          if(count == 18'h203AD) //restart comreset after no cominit for 880us
          begin
            count_en  = 1'b0;
            NextState = host_comreset;
          end
          else
          begin
            count_en  = 1'b1;
            NextState = wait_dev_comwake;
          end
        end
      end
      
    wait_after_comwake : // 4
      begin
        if (count == 6'h3F)
        begin
          NextState = wait_after_comwake1;
        end
        else
        begin
          count_en = 1'b1;
          
          NextState = wait_after_comwake;
        end
      end   
      
    wait_after_comwake1 : //5
      begin
        if (~rxelecidle)
        begin
          rxreset   = 1'b1;
          NextState = host_d10_2; //gtx_resetdone_check_0  
        end
        else
          NextState = wait_after_comwake1;  
      end

    host_d10_2 : //6
    begin
      send_d10_2_r = 1'b1;
      txelecidle_r = 1'b0;
      if (align_det)
      begin
        send_d10_2_r = 1'b0;
        NextState    = host_send_align;
      end
      else
      begin
        if(count == 18'h203AD) // restart comreset after 880us
        begin
          count_en  = 1'b0;
          NextState = host_comreset;            
        end
        else
        begin
          count_en  = 1'b1;
          NextState = host_d10_2;
        end
      end       
    end
    
    host_send_align : //7
    begin
      send_align_r = 1'b1;
      txelecidle_r = 1'b0;
      if (sync_det) // SYNC detected
      begin
        send_align_r = 1'b0;
        gtx_rx_reset_out = 1'b1;
        NextState    = link_ready; //check_rx_man_rst; 
      end
      else
        NextState = host_send_align;
    end
   
    link_ready : // 8
    begin
      txelecidle_r = 1'b0;
      gtx_rx_reset_out = 1'b0;
      if (sync_stable) //rxelecidle
      begin
        NextState = link_ready;
        linkup_r  = 1'b1;
      end
      else
      begin
        NextState        = link_ready; //link_ready2;
        linkup_r         = 1'b0;
      end
    end
   
    default : NextState = host_comreset;  
    
  endcase
end 


always@(posedge clk or posedge reset)
begin : GTX_RESET_CNT
  if (reset) begin
    gtxreset_cnt      = 12'b0;
    gtxreset_cnt_400  = 1'b0;
  end  
  else if(gtxreset_cnt > 12'h 400) begin
    gtxreset_cnt_400  = 1'b1;
  end  
  else if(gtx_rx_reset_out) begin
    gtxreset_cnt      = gtxreset_cnt + 1'b1;
    gtxreset_cnt_400  = 1'b0;
  end
  else begin
    gtxreset_cnt      = gtxreset_cnt;
    gtxreset_cnt_400  = gtxreset_cnt_400;
  end
end

always@(posedge clk or posedge reset)
begin : SEQ
  if (reset)
    CurrentState = host_comreset;
  else
    CurrentState = NextState;
end



always@(posedge clk or posedge reset)
begin : count_sync_primitve
  if (reset) begin
    count_sync  <= 8'b0;
    sync_stable <= 1'b0;
  end 
  else if(count_sync > 8'h32) begin  //8'd50
    sync_stable <= 1'b1;
  end
  else if ((rx_datain_r1_int == `SYNC) && rx_charisk_r1_int) begin //|| rx_datain_r1_int == `ALIGN || rx_datain_r1_int == `X_RDY
    count_sync  <= count_sync + 1'b1;
    sync_stable <= sync_stable;
  end 
  else begin
    count_sync  <= 8'b0;
    sync_stable <= 1'b0;
  end
end


  //Shameer: to handle CONTp Primitive 
  always @(posedge clk, posedge reset)                                                      
  begin                                                                                   
    if (reset) begin       
      rx_datain_r1_int     <= 32'b0;
      cont_flag            <= 1'b0; 
      rx_charisk_r1_int    <= 1'b0;      
    end
    else begin 
      if ((rx_datain_r1 == `CONT) && rx_charisk_r1) begin
        rx_datain_r1_int  <= rx_datain_r1_int;
        cont_flag         <= 1'b1;
        rx_charisk_r1_int <= rx_charisk_r1_int;
      end
      else begin
        if (cont_flag == 1'b1) begin
          if (rx_charisk_r1 && (
               (rx_datain_r1 == `HOLD)    || (rx_datain_r1 == `HOLDA) || (rx_datain_r1 == `PMREQ_P) ||
               (rx_datain_r1 == `PMREQ_S) || (rx_datain_r1 == `R_ERR) || (rx_datain_r1 == `R_IP)    ||
               (rx_datain_r1 == `R_OK)    || (rx_datain_r1 == `R_RDY) || (rx_datain_r1 == `SYNC)    ||
               (rx_datain_r1 == `WTRM)    || (rx_datain_r1 == `X_RDY) || (rx_datain_r1 == `SOF))      ) begin
            rx_datain_r1_int  <= rx_datain_r1;
            cont_flag         <= 1'b0;
            rx_charisk_r1_int <= rx_charisk_r1;
          end
          else begin              
            rx_datain_r1_int  <= rx_datain_r1_int;
            cont_flag         <= 1'b1;
            rx_charisk_r1_int <= rx_charisk_r1_int;
          end  
        end
        else begin
          rx_datain_r1_int  <= rx_datain_r1;
          cont_flag         <= 1'b0;
          rx_charisk_r1_int <= rx_charisk_r1;
        end
      end
    end
  end


always@(posedge clk or posedge reset)
begin : data_mux
  if (reset) begin
    tx_dataout     <= 32'b0;
    rx_dataout     <= 32'b0;
    rx_charisk_out <= 4'b0;
    tx_charisk_out <= 1'b0;    
  end
  else begin
    if (linkup) begin
      rx_charisk_out <= rx_charisk_r1_int; //rx_charisk;
      rx_dataout     <= rx_datain_r1_int; //rx_datain;      
      tx_dataout     <= tx_datain;
      tx_charisk_out <= tx_chariskin;
    end
    else if (send_align_r) begin
      // Send Align primitives. Align is 
      // K28.5, D10.2, D10.2, D27.3
      rx_charisk_out <= rx_charisk;
      rx_dataout     <= rx_datain;
      tx_dataout     <= 32'h7B4A4ABC; 
      tx_charisk_out <= 1'b1;
    end
    else if ( send_d10_2_r ) begin
      // D10.2-D10.2 "dial tone"
      rx_charisk_out <= rx_charisk;
      rx_dataout     <= rx_datain;
      tx_dataout     <= 32'h4A4A4A4A; 
      tx_charisk_out <= 1'b0;
    end     
    else begin
      rx_charisk_out <= rx_charisk;
      rx_dataout     <= rx_datain;
      tx_dataout     <= 32'h7B4A4ABC; 
      tx_charisk_out <= 1'b1;
    end 
  end
end




always@(posedge clk or posedge reset)
begin : comreset_OOB_count
  if (reset)
  begin
    count160 = 8'b0;
    count160_round = 5'b0;
  end 
  else if (count160_go)
    begin  
    if (count160 == 8'h10 )
      begin
        count160 = 8'b0;
        count160_round = count160_round + 1;
      end
         else
              count160 = count160 + 1;
    end
    else
    begin
      count160 = 8'b0;
      count160_round = 5'b0;
    end     
end

always@(posedge clk or posedge reset)
begin : freecount
  if (reset) begin
    count = 18'b0;
  end 
  else if (count_en) begin  
    count = count + 1;
  end 
  else begin
    count = 18'b0;
  end
end

always@(posedge clk or posedge reset)
begin : rxdata_shift
  if (reset)
  begin
    rx_datain_r1  <= 32'b0;
    rx_charisk_r1 <= 1'b0;  
  end 
  else 
  begin 
    rx_datain_r1  <= rx_datain;
    rx_charisk_r1 <= rx_charisk;
  end
end

always@(posedge clk or posedge reset)
begin : txdata_shift
  if (reset)
  begin
    tx_datain_r1 <= 8'b0;
    tx_datain_r2 <= 8'b0;
    tx_datain_r3 <= 8'b0;
    tx_datain_r4 <= 8'b0;           
  end 
  else 
  begin  
    tx_datain_r1 <= tx_dataout;
    tx_datain_r2 <= tx_datain_r1;
    tx_datain_r3 <= tx_datain_r2;
    tx_datain_r4 <= tx_datain_r3;
  end
end

always@(posedge clk or posedge reset)
begin : send_align_cnt
  if (reset)
    align_count = 2'b0;
  else if (align_cnt_en)
    align_count = align_count + 1;
      else
    align_count = 2'b0;
end
assign comreset_done = (CurrentState == host_comreset && count160_round == 5'h15) ? 1'b1 : 1'b0;
assign host_comwake_done = (CurrentState == host_comwake && count160_round == 5'h0b) ? 1'b1 : 1'b0;

//Primitive detection
assign  align_det             = (rx_datain_r1 == 32'h7B4A4ABC) && (rxbyteisaligned == 1'b1); 
assign  sync_det              = (rx_datain_r1 == 32'hB5B5957C);
assign  cont_det              = (rx_datain_r1 == 32'h9999AA7C);
assign  sof_det               = (rx_datain_r1 == 32'h3737B57C);
assign  eof_det               = (rx_datain_r1 == 32'hD5D5B57C);
assign  x_rdy_det             = (rx_datain_r1 == 32'h5757B57C);
assign  r_err_det             = (rx_datain_r1 == 32'h5656B57C);
assign  r_ok_det              = (rx_datain_r1 == 32'h3535B57C);


assign  txcominit             = txcominit_r;
assign  txcomwake             = txcomwake_r;
assign  txelecidle            = txelecidle_r;
assign  align_cnt_en          = ~send_d10_2_r;
//assign linkup               = linkup_r; 
assign  CurrentState_out      = CurrentState;
assign  align_det_out         = align_det;
assign  sync_det_out          = sync_det;
assign  rx_sof_det_out        = sof_det;
assign  rx_eof_det_out        = eof_det;

endmodule
