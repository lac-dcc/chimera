// ===============================================================================
//
//  Amstrad CPC Gate Array for Xilinx X95288XL
//
//  Copyright (C) 2021 Darren Johnstone <darren@darrenjohnstone.scot>
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
//  Acknowledgements:
//
//  Based on 40010-simplified_V03.pdf by Gerald 
//  (https://www.cpcwiki.eu/forum/amstrad-cpc-hardware/gate-array-decapped!) 
//  
//  Partially based on the Amstrad MiSTer core by Gyorgy Szombathelyi
//  https://github.com/MiSTer-devel/Amstrad_MiSTer/tree/master/rtl/GA40010
// ===============================================================================
module VSync(input CLK_n,
             input CCLK,
             input HSYNC,
             input RESET,
             input VSYNC,
             input IORQ_n,
             input M1_n,
             input IRQ_RESET,
             output NSYNC,
             output MODE_SYNC,
             output HCNTLT28,
             output reg INT_n);
  reg[5 : 0] intcnt;
  reg[4 : 0] hcnt;
  reg[3 : 0] hdelay;
  reg vsync_d; // u803
  reg vsync_o_d; // u812

  reg irqack_rst;
  wire VSYNC_O;
  wire HSYNC_O;
  always
    @(negedge CCLK)
      begin
        vsync_d <= VSYNC;
        vsync_o_d <= VSYNC_O;
      end
  assign VSYNC_O = hcnt[2] & ~hcnt[3] & ~hcnt[4]; // u806
  wire HSYNC_n = ~HSYNC;

  reg intcntclr_52_r;
  wire intcntclr_52 = HSYNC_n & ((intcnt[2] & intcnt[4] & intcnt[5]) | intcntclr_52_r); // u816

  always
    @(posedge HSYNC_n)
      intcntclr_52_r <= intcntclr_52;

  wire intcntclr_4 = VSYNC_O & ~vsync_o_d; // u817
  wire intcnt_res0 = intcntclr_52 | intcntclr_4 | IRQ_RESET; // u831
  wire intcnt_res1 = intcnt_res0 | irqack_rst; // u833

  always
    @(posedge HSYNC_n,
      posedge intcnt_res0)
      if (intcnt_res0)
        intcnt[0] <= 0;
      else
        intcnt[0] <= ~intcnt[0];

  always
    @(negedge intcnt[0],
      posedge intcnt_res0)
      if (intcnt_res0)
        intcnt[1] <= 0;
      else
        intcnt[1] <= ~intcnt[1];

  always
    @(negedge intcnt[1],
      posedge intcnt_res0)
      if (intcnt_res0)
        intcnt[2] <= 0;
      else
        intcnt[2] <= ~intcnt[2];

  always
    @(negedge intcnt[2],
      posedge intcnt_res0)
      if (intcnt_res0)
        intcnt[3] <= 0;
      else
        intcnt[3] <= ~intcnt[3];

  always
    @(negedge intcnt[3],
      posedge intcnt_res0)
      if (intcnt_res0)
        intcnt[4] <= 0;
      else
        intcnt[4] <= ~intcnt[4];

  always
    @(negedge intcnt[4],
      posedge intcnt_res1)
      if (intcnt_res1)
        intcnt[5] <= 0;
      else
        intcnt[5] <= ~intcnt[5];

  assign HCNTLT28 = ~(hcnt[2] & hcnt[3] & hcnt[4]); // u802
  wire hcnt_res0 = RESET | ~HCNTLT28; // u805
  always
    @(posedge HSYNC_n,
      posedge hcnt_res0)
      if (hcnt_res0)
        hcnt[0] <= 0;
      else
        hcnt[0] <= ~hcnt[0];

  wire hcnt_res1 = VSYNC & ~vsync_d; // u810
  always
    @(negedge hcnt[0],
      posedge hcnt_res1)
      if (hcnt_res1)
        hcnt[1] <= 0;
      else
        hcnt[1] <= ~hcnt[1];

  always
    @(posedge hcnt[1],
      posedge hcnt_res1)
      if (hcnt_res1)
        hcnt[2] <= 0;
      else
        hcnt[2] <= ~hcnt[2];

  always
    @(negedge hcnt[2],
      posedge hcnt_res1)
      if (hcnt_res1)
        hcnt[3] <= 0;
      else
        hcnt[3] <= ~hcnt[3];

  always
    @(negedge hcnt[3],
      posedge hcnt_res1)
      if (hcnt_res1)
        hcnt[4] <= 0;
      else
        hcnt[4] <= ~hcnt[4];

  wire hdelay_res0 = HSYNC_n | hdelay[3]; // u804
  wire hdelay_res1 = HSYNC_n; // u822

  always
    @(negedge CCLK,
      posedge hdelay_res0)
      if (hdelay_res0)
        hdelay[0] <= 0;
      else
        hdelay[0] <= ~hdelay[0];

  always
    @(negedge hdelay[0],
      posedge hdelay_res0)
      if (hdelay_res0)
        hdelay[1] <= 0;
      else
        hdelay[1] <= ~hdelay[1];

  always
    @(posedge hdelay[1],
      posedge hdelay_res0)
      if (hdelay_res0)
        hdelay[2] <= 0;
      else
        hdelay[2] <= ~hdelay[2];

  always
    @(negedge hdelay[2],
      posedge hdelay_res1)
      if (hdelay_res1)
        hdelay[3] <= 0;
      else
        hdelay[3] <= ~hdelay[3];
        
  assign HSYNC_O = hdelay[2];
  assign NSYNC = ~(VSYNC_O ^ HSYNC_O);
  assign MODE_SYNC = ~hdelay[2];

  wire int_reset = IRQ_RESET | irqack_rst;
  always
    @(negedge intcnt[5],
      posedge int_reset)
      begin
        if (int_reset)
          INT_n <= 1;
        else
          INT_n <= 0;
      end

  always
    @(posedge CLK_n)
      irqack_rst = ~M1_n & (irqack_rst | ~(INT_n | IORQ_n | M1_n));
endmodule
