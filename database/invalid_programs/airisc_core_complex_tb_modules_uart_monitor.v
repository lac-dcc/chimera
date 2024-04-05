//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//
//
// File              : uart_monitor.v
// Author            : A. Stanitzki
// Date              : 
// Version           : 1.0         
// Abstract          : echo UART traffic to simulator log
// History           :
// Notes             :
//
`timescale 1ns/100ps

`include "airi5c_hasti_constants.vh"

module uart_monitor(
  input                          clk_i,
  input                          rst_ni,
  input                          uart_tx_i
);

localparam BAUD = 1798;
reg uart_tx_r;
wire uart_tx_edge = uart_tx_r ^ uart_tx_i;
reg [31:0] bcnt;
reg bcnt_en;
wire bcnt_done = bcnt_en & (bcnt < BAUD/2); 
reg bcnt_res;

reg [4:0] state, state_next;
reg [7:0] rbyte, byte_next;


localparam IDLE = 0;
localparam STARTBIT = 1;
localparam BIT0 = 2;
localparam BIT1 = 3;
localparam BIT2 = 4;
localparam BIT3 = 5;
localparam BIT4 = 6;
localparam BIT5 = 7;
localparam BIT6 = 8;
localparam BIT7 = 9;


always @(posedge clk_i or negedge rst_ni) begin
  if(~rst_ni) begin
    uart_tx_r <= 1'b1;
    bcnt <= BAUD;
    state <= IDLE;
    rbyte <= 0;
  end else begin
    rbyte <= byte_next;
    uart_tx_r <= uart_tx_i;
    if(bcnt_en & ~bcnt_res) 
      bcnt <= (bcnt == 0) ? 0 : bcnt - 1;
    else 
      bcnt <= BAUD;
    state <= state_next;

/*    if((state == BIT7) & (state_next == IDLE))
      $display("byte complete : %c\r\n",rbyte);*/

  end
end

always @(*) begin
  bcnt_res = 0;
  bcnt_en = 0;
  state_next = IDLE;

case (state)
  IDLE: 
  begin
    state_next = uart_tx_edge ? STARTBIT : IDLE;
  end
  STARTBIT:
  begin
    bcnt_en = 1'b1;
    state_next = (bcnt_done | uart_tx_edge) ? BIT0 : STARTBIT; 
    bcnt_res = (bcnt_done | uart_tx_edge);
  end
  BIT0:
  begin
    bcnt_en = 1'b1;
    state_next = (bcnt_done | uart_tx_edge) ? BIT1 : state; 
    bcnt_res = (bcnt_done | uart_tx_edge);
    byte_next = (bcnt_done) ? {uart_tx_i,rbyte[7:1]} : rbyte;
  end

  BIT1:
  begin
    bcnt_en = 1'b1;
    state_next = (bcnt_done | uart_tx_edge) ? BIT2 : state; 
    bcnt_res = (bcnt_done | uart_tx_edge);
    byte_next = (bcnt_done) ? {uart_tx_i,rbyte[7:1]} : rbyte;


  end

  BIT2:
  begin
    bcnt_en = 1'b1;
    state_next = (bcnt_done | uart_tx_edge) ? BIT3 : state; 
    bcnt_res = (bcnt_done | uart_tx_edge);
    byte_next = (bcnt_done) ? {uart_tx_i,rbyte[7:1]} : rbyte;


  end

  BIT3:
  begin
    bcnt_en = 1'b1;
    state_next = (bcnt_done | uart_tx_edge) ? BIT4 : state; 
    bcnt_res = (bcnt_done | uart_tx_edge);
    byte_next = (bcnt_done) ? {uart_tx_i,rbyte[7:1]} : rbyte;


  end

  BIT4:
  begin
    bcnt_en = 1'b1;
    state_next = (bcnt_done | uart_tx_edge) ? BIT5 : state; 
    bcnt_res = (bcnt_done | uart_tx_edge);
    byte_next = (bcnt_done) ? {uart_tx_i,rbyte[7:1]} : rbyte;


  end

  BIT5:
  begin
    bcnt_en = 1'b1;
    state_next = (bcnt_done | uart_tx_edge) ? BIT6 : state; 
    bcnt_res = (bcnt_done | uart_tx_edge);
    byte_next = (bcnt_done) ? {uart_tx_i,rbyte[7:1]} : rbyte;


  end

  BIT6:
  begin
    bcnt_en = 1'b1;
    state_next = (bcnt_done | uart_tx_edge) ? BIT7 : state; 
    bcnt_res = (bcnt_done | uart_tx_edge);
    byte_next = (bcnt_done) ? {uart_tx_i,rbyte[7:1]} : rbyte;


  end

  BIT7:
  begin
    bcnt_en = 1'b1;
    state_next = (bcnt_done | uart_tx_edge) ? IDLE : state; 
    bcnt_res = (bcnt_done | uart_tx_edge);
    byte_next = (bcnt_done) ? {uart_tx_i,rbyte[7:1]} : rbyte;


  end

endcase

end


/*reg [7:0] state, next_state;

reg tx_r;
wire posedge_tx = uart_tx_i & ~tx_r;
wire negedge_tx = ~uart_tx_i & tx_r;
reg bcnt_en;
reg [31:0] bcnt;

`define BAUD_CNT 50000

always @(posedge clk_i or negedge rst_ni) begin
  if(~rst_ni) begin
    tx_r <= 1'b1;
    state <= 8'h0;
    bcnt <= BAUD_CNT;
  end else begin
    tx_r <= uart_tx_i;
    state <= next_state;
    if(bcnt_en) bcnt <= (bcnt == 0) ? 0 : bcnt-1;
  end
end

wire bit_done = (bcnt << `BAUD_CNT/2);

always @* begin
  next_state = state;
  bcnt_en = 1'b0;
  case state
    8'h0 : next_state = 8'h1;
    8'h1 : begin 
             next_state = negedge_tx ? 8'h2 : 8'h1;                         
           end
    8'h2 : begin
             bcnt_en = 1'b1;
             next_state = bit_done ? 8'h3 : 8'h2;
           end
    8'h3 : begin
             bcnt_en = 1'b0;
             next_state = (negedge_tx | posedge_tx) ? 8'h4 : 8'h3;
           end
  endcase
end
*/
endmodule
