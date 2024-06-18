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

module mac_veneer (
   // PHY signals
   col,
   crs,
   tx_er,
   txd,
   tx_en,
   tx_clk,
   rxd,
   rx_er,
   rx_clk,
   rx_dv,
   
   // MII signals
   mdc,
   mdio_in,
   mdio_out,
   mdio_en,
   
   // APB interface signals
   pclk,
   n_preset,
   paddr,
   prdata,
   pwdata,
   pwrite,
   penable,
   psel,
   pready,

   // AHB interface signals
   hclk,             
   n_hreset,
   hlock,
   haddr,
   htrans,
   hwrite,
   hsize,
   hburst,
   hprot,
   hwdata,
   hready,
   hresp,
   hrdata,
   
   // Interrupts
   intr,
   macb_wakeup
);

// PHY signals
input         col;            // collision detect signal from the PHY
input         crs;            // carrier sense signal from the PHY
output        tx_er;          // transmit error signal to the PHY
output  [3:0] txd;            // transmit data to the PHY
output        tx_en;          // transmit enable signal to the PHY
input         tx_clk;         // transmit clock from the PHY
input   [3:0] rxd;            // receive data from the PHY
input         rx_er;          // receive error signal from the PHY
input         rx_clk;         // receive clock from the PHY
input         rx_dv;          // receive data valid signal from the PHY

// MII signals
output        mdc;            // management data clock
input         mdio_in;        // management data input 
output        mdio_out;       // management data output
output        mdio_en;        // management data output enable

// APB interface signals
input         pclk;           
input         n_preset;       
input  [31:0] paddr;           
output [31:0] prdata;         
reg    [31:0] prdata;         
input  [31:0] pwdata;         
input         pwrite;         
input         penable;        
input         psel;           
output        pready;

// AHB interface signals
input         hclk;           
input         n_hreset;       
output        hlock;          
output [31:0] haddr;          
output  [1:0] htrans;         
output        hwrite;         
output  [2:0] hsize;          
                              
output  [2:0] hburst;         
output  [3:0] hprot;          
output [31:0] hwdata;         
input         hready;         
input   [1:0] hresp;          
input  [31:0] hrdata;         

output        intr;          // MAC interrupt signal
output        macb_wakeup;   // MAC wakeup

wire  [31:0]  m_wb_adr_o;
wire  [3:0]   m_wb_sel_o;
wire          m_wb_we_o;
wire  [31:0]  m_wb_dat_i;
wire  [31:0]  m_wb_dat_o;
wire          m_wb_cyc_o;
wire          m_wb_stb_o;
wire          m_wb_ack_i;

wire [31:0] macb_idle_cnt;
wire        macb_idle_int;
wire tie_lo_1bit;

wire [31:0] mac_prdata;
wire        mac_psel;
wire        mac_pready;
wire        mac_intr;

assign tie_lo_1bit = 1'b0;
assign hlock = 1'b0;
assign hprot = 'b0;

wb2ahb i_wb2ahb (
  // Wishbone ports from WB master
  .clk_i(hclk),
  .rst_i(~n_hreset),
  .cyc_i(m_wb_cyc_o),
  .stb_i(m_wb_stb_o),
  .sel_i(m_wb_sel_o),
  .we_i(m_wb_we_o),
  .addr_i(m_wb_adr_o),
  .data_i(m_wb_dat_o),
  .data_o(m_wb_dat_i),
  .ack_o(m_wb_ack_i),

  // AHB ports to AHB slave
  .hclk(hclk),
  .hreset_n(n_hreset),
  .htrans(htrans),
  .hsize(hsize),
  .hburst(hburst),
  .hwrite(hwrite),
  .haddr(haddr),
  .hwdata(hwdata),
  .hrdata(hrdata),
  .hready(hready),
  .hresp(hresp)
);

/******************************************************************************
* Start of Power control registers block
******************************************************************************/
wire pwr_reg_psel;
wire pwr_reg_write;
wire pwr_reg_read;
wire pwr_intr_src_access;
wire pwr_intr_mask_access;
wire pwr_idle_timeout_access;

reg [31:0] pwr_intr_src_reg;
reg [31:0] pwr_intr_mask_reg;
reg [31:0] pwr_idle_timeout_reg;

wire pwr_intr;
wire set_idle_int;
reg macb_idle_int_reg;

// Register offsets 0x100 to 0x200 are reserved for MAC power control
// registers
assign pwr_reg_psel = psel && ((paddr[15:0] >= 'h100) && (paddr[15:0] < 'h200));
assign mac_psel     = psel && !pwr_reg_psel;

assign pwr_reg_write =  (pwr_reg_psel && pwrite && penable);
assign pwr_reg_read  =  (pwr_reg_psel && (!pwrite) && penable);

assign pwr_intr_src_access     = (paddr[15:0] == 'h100); 
assign pwr_intr_mask_access    = (paddr[15:0] == 'h104);
assign pwr_idle_timeout_access = (paddr[15:0] == 'h108);

// Register read accesses
always @(*)
begin
  if (pwr_reg_read && pwr_intr_src_access)
    prdata = pwr_intr_src_reg;
  else if (pwr_reg_read && pwr_intr_mask_access)
    prdata = pwr_intr_mask_reg;
  else if (pwr_reg_read && pwr_idle_timeout_access)
    prdata = pwr_idle_timeout_reg;
  else
    prdata = mac_prdata;
end

// Register write accesses
always @(posedge pclk or negedge n_preset)
begin
  if (!n_preset) begin
    pwr_intr_mask_reg <= 0;
    pwr_idle_timeout_reg <= 'hFFFFF;
  end
  else begin
    if (pwr_reg_write && pwr_intr_mask_access)
      pwr_intr_mask_reg <= pwdata;
    if (pwr_reg_write && pwr_idle_timeout_access)
      pwr_idle_timeout_reg <= pwdata;
  end
end

// Make a pulse from the idle signal
always @(posedge pclk or negedge n_preset)
begin
  if (!n_preset)
    macb_idle_int_reg <= 1'b0;
  else
    macb_idle_int_reg <= macb_idle_int;
end

assign set_idle_int = macb_idle_int & !macb_idle_int_reg;

// power interrupt status register
always @(posedge pclk or negedge n_preset)
begin
  if (!n_preset)
    pwr_intr_src_reg <= 'b0;
  else begin
    // Idle interrupt
    if (set_idle_int)
      pwr_intr_src_reg[0] <= 1'b1;
    else if (pwr_reg_read && pwr_intr_src_access) // reset on read
      pwr_intr_src_reg[0] <= 1'b0;
  end
end

// power interrupt signal
assign pwr_intr = |pwr_intr_src_reg;

assign macb_idle_cnt = pwr_idle_timeout_reg;

assign intr = pwr_intr | mac_intr;
assign pready = pwr_reg_psel | (mac_psel & mac_pready);

/******************************************************************************
* End of Power control registers block
******************************************************************************/

eth_top i_mac (
   // PHY signals
   .mcoll_pad_i(col),
   .mcrs_pad_i(crs),
   .mtxerr_pad_o(tx_er),
   .mtxd_pad_o(txd),
   .mtxen_pad_o(tx_en),
   .mtx_clk_pad_i(tx_clk),
   .mrxd_pad_i(rxd),
   .mrxerr_pad_i(rx_er),
   .mrx_clk_pad_i(rx_clk),
   .mrxdv_pad_i(rx_dv),
   
   // MII signals
   .mdc_pad_o(mdc),
   .md_pad_i(mdio_in),
   .md_pad_o(mdio_out),
   .md_padoe_o(mdio_en),
   
   // WB common signals
   .wb_clk_i(hclk), 
   .wb_rst_i(~n_hreset), 
   
   // WB slave signals
   .wb_dat_i(pwdata), 
   .wb_dat_o(mac_prdata), 
   .wb_adr_i(paddr[11:2]), 
   .wb_sel_i(4'b1111), // All accesses to the MAC registers must be 32-bit wide
   .wb_we_i(pwrite), 
   .wb_cyc_i(mac_psel), 
   .wb_stb_i(mac_psel), 
   .wb_ack_o(mac_pready), 
   .wb_err_o(),
   
   // WB master signals
   .m_wb_adr_o(m_wb_adr_o), 
   .m_wb_sel_o(m_wb_sel_o), 
   .m_wb_we_o(m_wb_we_o), 
   .m_wb_dat_o(m_wb_dat_o), 
   .m_wb_dat_i(m_wb_dat_i), 
   .m_wb_cyc_o(m_wb_cyc_o), 
   .m_wb_stb_o(m_wb_stb_o), 
   .m_wb_ack_i(m_wb_ack_i), 
   .m_wb_err_i(tie_lo_1bit),

   // Interrupt 
   .int_o(mac_intr)
); 

// pcm to check mac idle activity
mac_pcm i_mac_pcm (
   .col(col),
   .crs(crs),
   .tx_er(tx_er),
   .tx_en(tx_en),
   .tx_clk(tx_clk),
   .rx_er(rx_er),
   .rx_clk(rx_clk),
   .rx_dv(rx_dv),

   .hclk(hclk),             
   .n_hreset(n_hreset),
   .macb_idle_cnt(macb_idle_cnt),
   .macb_idle_int(macb_idle_int),
   .macb_wakeup(macb_wakeup)

);

endmodule
