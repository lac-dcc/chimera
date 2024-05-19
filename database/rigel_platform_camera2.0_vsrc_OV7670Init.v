// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

////////////////////////////////////////////////////////////////////////////////////////////////////
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
// 02111-1307, USA.
//
// ©2013 - Roman Ovseitsev <romovs@gmail.com>
////////////////////////////////////////////////////////////////////////////////////////////////////

//##################################################################################################
//
// Register configuration for OV7670 camera module.
// Initializes RGB565 VGA, with distorted colors... I yet to find the register settings to fix this. 
//
//
// Calculating required clock frequency. 30fps RGB565 VGA:
//
//  HREF  = tLINE = 640*tP + 144*tP = 784*tP
//  VSYNC = 510 * tLINE = 510 * 784*tP
//  PCLK  = VSYNC * FPS * BYTES_PER_PIXEL = 784 * 510 * 30 * 2 = 23990400 ~= 24MHz
//
//##################################################################################################

`timescale 1ns / 1ps

module OV7670Init (index_i, data_o);

   input       [5:0] index_i;    // Register index.
   output reg  [16:0] data_o;    // {Register_address, register_value, rw_flag} :
                                 //  Where register_value is the value to write if rw_flag = 1
                                 //  otherwise it's not used when rw_flag = 0 (read).
                                 // {16'hffff, 1'b1} - denotes end of the register set.
                                 // {16'hf0f0, 1'b1} - denotes that a delay is needed at this point.
   always @* begin
      (* parallel_case *) case(index_i)
         //6'd0 : data_o = {16'h0A76, 1'b0}; 
         6'd0 : data_o = {16'h1280, 1'b1};   // COM7     Reset.
         6'd1 : data_o = {16'hf0f0, 1'b1};   // Denotes delay.
         6'd2 : data_o = {16'h1180, 1'b1};   // CLKRC     Use external clock? 
         6'd3 : data_o = {16'h1205, 1'b1};   // COM12     Set RGB 
         
         /*
         6'd2 : data_o = {16'h1204, 1'b1};   // COM7     Set RGB (06 enables color bar overlay).
         6'd3 : data_o = {16'h1100, 1'b1};   // CLKRC    Use external clock directly.
         6'd4 : data_o = {16'h0C00, 1'b1};   // COM3     Disable DCW & scalling. + RSVD bits.
         6'd5 : data_o = {16'h3E00, 1'b1};   // COM14    Normal PCLK.
         6'd6 : data_o = {16'h8C00, 1'b1};   // RGB444   Disable RGB444
         6'd7 : data_o = {16'h0400, 1'b1};   // COM1     Disable CCIR656. AEC low 2 LSB.
         6'd8 : data_o = {16'h40d0, 1'b1};   // COM15    Set RGB565 full value range
         6'd9 : data_o = {16'h3a04, 1'b1};   // TSLB     Don't set window automatically. + RSVD bits.
         6'd10: data_o = {16'h1418, 1'b1};   // COM9     Maximum AGC value x4. Freeze AGC/AEC. + RSVD bits.
         6'd11: data_o = {16'h4fb3, 1'b1};   // MTX1     Matrix Coefficient 1
         6'd12: data_o = {16'h50b3, 1'b1};   // MTX2     Matrix Coefficient 2
         6'd13: data_o = {16'h5100, 1'b1};   // MTX3     Matrix Coefficient 3
         6'd14: data_o = {16'h523d, 1'b1};   // MTX4     Matrix Coefficient 4
         6'd15: data_o = {16'h53a7, 1'b1};   // MTX5     Matrix Coefficient 5
         6'd16: data_o = {16'h54e4, 1'b1};   // MTX6     Matrix Coefficient 6
         6'd17: data_o = {16'h589e, 1'b1};   // MTXS     Enable auto contrast center. Matrix coefficient sign. + RSVD bits.
         6'd18: data_o = {16'h3dc0, 1'b1};   // COM13    Gamma enable. + RSVD bits.
         6'd19: data_o = {16'h1100, 1'b1};   // CLKRC    Use external clock directly.
         6'd20: data_o = {16'h1714, 1'b1};   // HSTART   HREF start high 8 bits.
         6'd21: data_o = {16'h1802, 1'b1};   // HSTOP    HREF stop high 8 bits.
         6'd22: data_o = {16'h3280, 1'b1};   // HREF     HREF edge offset. HSTART/HSTOP low 3 bits.
         6'd23: data_o = {16'h1903, 1'b1};   // VSTART   VSYNC start high 8 bits.
         6'd24: data_o = {16'h1A7b, 1'b1};   // VSTOP    VSYNC stop high 8 bits.
         6'd25: data_o = {16'h030a, 1'b1};   // VREF     VSYNC edge offset. VSTART/VSTOP low 3 bits.
         6'd26: data_o = {16'h0f41, 1'b1};   // COM6     Disable HREF at optical black. Reset timings. + RSVD bits.
         6'd27: data_o = {16'h1e03, 1'b1};   // MVFP     No mirror/vflip. Black sun disable. + RSVD bits.
         6'd28: data_o = {16'h330b, 1'b1};   // CHLF     Array Current Control - Reserved  
         //6'd29: data_o = {16'h373f, 1'b1};   // ADC 
         //6'd30: data_o = {16'h3871, 1'b1};   // ACOM     ADC and Analog Common Mode Control - Reserved
         //6'd31: data_o = {16'h392a, 1'b1};   // OFON     ADC Offset Control - Reserved               
         6'd29: data_o = {16'h3c78, 1'b1};   // COM12    No HREF when VSYNC is low. + RSVD bits.
         6'd30: data_o = {16'h6900, 1'b1};   // GFIX     Fix Gain Control? No.    
         6'd31: data_o = {16'h6b1a, 1'b1};   // DBLV     Bypass PLL. Enable internal regulator. + RSVD bits.
         6'd32: data_o = {16'h7400, 1'b1};   // REG74    Digital gain controlled by VREF[7:6]. + RSVD bits.
         6'd33: data_o = {16'hb084, 1'b1};   // RSVD     ?          
         6'd34: data_o = {16'hb10c, 1'b1};   // ABLC1    Enable ABLC function. + RSVD bits.
         6'd35: data_o = {16'hb20e, 1'b1};   // RSVD     ?
         6'd36: data_o = {16'hb380, 1'b1};   // THL_ST   ABLC Target.
         6'd37: data_o = {16'h7a20, 1'b1};   // SLOP     Gamma Curve Highest Segment Slope 
         6'd38: data_o = {16'h7b10, 1'b1};   // GAM1
         6'd39: data_o = {16'h7c1e, 1'b1};   // GAM2
         6'd40: data_o = {16'h7d35, 1'b1};   // GAM3
         6'd41: data_o = {16'h7e5a, 1'b1};   // GAM4
         6'd42: data_o = {16'h7f69, 1'b1};   // GAM5
         6'd43: data_o = {16'h8076, 1'b1};   // GAM6
         6'd44: data_o = {16'h8180, 1'b1};   // GAM7
         6'd45: data_o = {16'h8288, 1'b1};   // GAM8
         6'd46: data_o = {16'h838f, 1'b1};   // GAM9
         6'd47: data_o = {16'h8496, 1'b1};   // GAM10
         6'd48: data_o = {16'h85a3, 1'b1};   // GAM11
         6'd49: data_o = {16'h86af, 1'b1};   // GAM12
         6'd50: data_o = {16'h87c4, 1'b1};   // GAM13
         6'd51: data_o = {16'h88d7, 1'b1};   // GAM14
         6'd52: data_o = {16'h89e8, 1'b1};   // GAM15
        */ 
        default: data_o = {16'hffff, 1'b1};
      endcase
   end

endmodule
