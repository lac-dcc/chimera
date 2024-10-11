// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//----------------------------------------------------------------------
//   Copyright 1999-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

module mac_pcm (
   col,
   crs,
   tx_er,
   tx_en,
   tx_clk,
   rx_er,
   rx_clk,
   rx_dv,

   hclk,             
   n_hreset,
   macb_idle_cnt,
   macb_idle_int,
   macb_wakeup
);

input         col;            // collision detect signal from the PHY
input         crs;            // carrier sense signal from the PHY
input         tx_er;          // transmit error signal to the PHY
input         tx_en;          // transmit enable signal to the PHY
input         tx_clk;         // transmit clock from the PHY
input         rx_er;          // receive error signal from the PHY
input         rx_clk;          // receive error signal from the PHY
input         rx_dv;          // receive data valid signal from the PHY

input         hclk;           // AHB clock
input         n_hreset;       // AHB reset

input [31:0] macb_idle_cnt;  // macb idle count value from macb register i/f

output       macb_idle_int;  // idle  interrupt to macb register i/f
output       macb_wakeup;

reg  col_reg, crs_reg,  tx_en_reg, tx_er_reg, rx_dv_reg, rx_er_reg;

reg [31:0] idle_cnt;

reg [31:0] macb_idle_cnt_reg;

wire macb_cnt_update;

// Latch rx i/f signals
always @(posedge rx_clk or negedge n_hreset) begin
  if(!n_hreset)begin
     col_reg <= 0;
     crs_reg <= 0;
     rx_er_reg <= 0;
     rx_dv_reg <= 0;
  end else begin
     col_reg <= col;
     crs_reg <= crs;
     rx_er_reg <= rx_er;
     rx_dv_reg <= rx_dv;
  end
end 

// Latch tx i/f signals
always @(posedge tx_clk or negedge n_hreset) begin
  if(!n_hreset)begin
    tx_er_reg <= 0;
    tx_en_reg <= 0;
  end else begin
    tx_er_reg <= tx_er;
    tx_en_reg <= tx_en;
  end
end

// pulse generation
wire col_p = col & (!col_reg);
wire crs_p = crs & (!crs_reg);
wire rx_er_p = rx_er & (!rx_er_reg);
wire rx_dv_p = rx_dv & (!rx_dv_reg);
wire tx_en_p = tx_en & (!tx_en_reg);
wire tx_er_p = tx_er & (!tx_er_reg);


// latch the macb counter
always @(posedge hclk or negedge n_hreset) begin
  if(!n_hreset)
      macb_idle_cnt_reg <= 32'h7fff_ffff;
  else 
      macb_idle_cnt_reg <= macb_idle_cnt;
end

assign macb_cnt_update = | (macb_idle_cnt^macb_idle_cnt_reg); // sense change

assign macb_wakeup = (rx_er_p || rx_dv_p || tx_en_p || tx_er_p || col_p || crs_p );

// idle activity checks
// if any activity on line interface, reset idle count to 0
// if no activity and idle time reaches the preset time, raise and interrupt
always @(posedge hclk or negedge n_hreset) begin
  if(!n_hreset) 
    idle_cnt <= 0;
  else if (macb_wakeup || macb_cnt_update)
    idle_cnt <= 0;
  else if (idle_cnt == macb_idle_cnt)
    idle_cnt <= idle_cnt;
  else 
    idle_cnt <= idle_cnt + 1;
end

// pulse on timeout
assign macb_idle_int = (idle_cnt == macb_idle_cnt) ? 1'b1 : 1'b0;

endmodule
