// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`default_nettype none

//    This file is part of the ZXUNO Spectrum core. 
//    Creation date is 09:00:25 2018-07-20 by Miguel Angel Rodriguez Jodar
//    (c)2014-2020 ZXUNO association.
//    ZXUNO official repository: http://svn.zxuno.com/svn/zxuno
//    Username: guest   Password: zxuno
//    Github repository for this core: https://github.com/mcleod-ideafix/zxuno_spectrum_core
//
//    ZXUNO Spectrum core is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    ZXUNO Spectrum core is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with the ZXUNO Spectrum core.  If not, see <https://www.gnu.org/licenses/>.
//
//    Any distributed copy of this file must keep this notice intact.

module joydecoder (
  input wire clk,
  input wire joy_data,
  input wire joy_latch_megadrive,
  output wire joy_clk,
  output wire joy_load_n,
  output wire joy1up,
  output wire joy1down,
  output wire joy1left,
  output wire joy1right,
  output wire joy1fire1,
  output wire joy1fire2,
  output wire joy1fire3,
  output wire joy1start,
  output wire joy2up,
  output wire joy2down,
  output wire joy2left,
  output wire joy2right,
  output wire joy2fire1,
  output wire joy2fire2,
  output wire joy2fire3,
  output wire joy2start  
  );
  
  reg [3:0] clkdivider = 4'h0;
  assign joy_clk = clkdivider[3];
  
  always @(posedge clk) begin
    clkdivider <= clkdivider + 4'h1;    
  end
  wire clkenable = (clkdivider == 4'd15);

  reg [15:0] joyswitches = 16'hFFFF;
  assign joy1up    = joyswitches[7];
  assign joy1down  = joyswitches[6];
  assign joy1left  = joyswitches[5];
  assign joy1right = joyswitches[4];
  assign joy1fire1 = joyswitches[3];
  assign joy1fire2 = joyswitches[2];
  assign joy1fire3 = joyswitches[1];
  assign joy1start = joyswitches[0];
  assign joy2up    = joyswitches[15];
  assign joy2down  = joyswitches[14];
  assign joy2left  = joyswitches[13];
  assign joy2right = joyswitches[12];
  assign joy2fire1 = joyswitches[11];
  assign joy2fire2 = joyswitches[10];
  assign joy2fire3 = joyswitches[9];
  assign joy2start = joyswitches[8];
  
  reg [3:0] state = 4'd0;
  assign joy_load_n = ~(state == 4'd0 && joy_latch_megadrive == 1'b1);
  
  always @(posedge clk) begin
    if (clkenable == 1'b1) begin
      if (state != 4'd0 || joy_load_n == 1'b0)
        state <= state + 4'd1;
      case (state)
        4'd0:  joyswitches[0]  <= joy_data;
        4'd1:  joyswitches[1]  <= joy_data;
        4'd2:  joyswitches[2]  <= joy_data;
        4'd3:  joyswitches[3]  <= joy_data;
        4'd4:  joyswitches[4]  <= joy_data;
        4'd5:  joyswitches[5]  <= joy_data;
        4'd6:  joyswitches[6]  <= joy_data;
        4'd7:  joyswitches[7]  <= joy_data;
        4'd8:  joyswitches[8]  <= joy_data;
        4'd9:  joyswitches[9]  <= joy_data;
        4'd10: joyswitches[10] <= joy_data;
        4'd11: joyswitches[11] <= joy_data;
        4'd12: joyswitches[12] <= joy_data;
        4'd13: joyswitches[13] <= joy_data;
        4'd14: joyswitches[14] <= joy_data;
        4'd15: joyswitches[15] <= joy_data;
      endcase
    end    
  end
endmodule


// En pruebas. No funciona muy fina
module joydecoder6b (
  input wire clk,
  input wire joy_data,
  input wire joy_latch_megadrive,
  output wire joy_clk,
  output wire joy_load_n,
  output wire joy1up,
  output wire joy1down,
  output wire joy1left,
  output wire joy1right,
  output wire joy1fire1,
  output wire joy1fire2,
  output wire joy1fire3,
  output wire joy1start,
  output wire joy2up,
  output wire joy2down,
  output wire joy2left,
  output wire joy2right,
  output wire joy2fire1,
  output wire joy2fire2,
  output wire joy2fire3,
  output wire joy2start  
  );
  
  reg [3:0] clkdivider = 4'h0;
  reg [7:0] sr_joy_latch_megadrive = 8'h00;
  wire sel_low = (sr_joy_latch_megadrive == 8'b10000000);
  wire sel_high = (sr_joy_latch_megadrive == 8'b01111111);
  reg [1:0] state_update_joy1 = 2'b11;
  reg [1:0] state_update_joy2 = 2'b11;
  reg joy_latch_md_start = 1'b0;
  
  assign joy_clk = clkdivider[3];
  
  always @(posedge clk) begin
    clkdivider <= clkdivider + 4'h1;    
  end
  wire clkenable = (clkdivider == 4'd15);

  reg [15:0] joyswitches = 16'hFFFF;
  reg [15:0] joyswintern = 16'hFFFF;
  assign joy1up    = joyswitches[7];
  assign joy1down  = joyswitches[6];
  assign joy1left  = joyswitches[5];
  assign joy1right = joyswitches[4];
  assign joy1fire1 = joyswitches[3];
  assign joy1fire2 = joyswitches[2];
  assign joy1fire3 = joyswitches[1];
  assign joy1start = joyswitches[0];
  assign joy2up    = joyswitches[15];
  assign joy2down  = joyswitches[14];
  assign joy2left  = joyswitches[13];
  assign joy2right = joyswitches[12];
  assign joy2fire1 = joyswitches[11];
  assign joy2fire2 = joyswitches[10];
  assign joy2fire3 = joyswitches[9];
  assign joy2start = joyswitches[8];
  
  reg [3:0] state = 4'd0;
  assign joy_load_n = ~(sel_high == 1'b1 || sel_low == 1'b1);
  
  always @(posedge clk) begin
    if (clkenable == 1'b1) begin
      sr_joy_latch_megadrive <= {sr_joy_latch_megadrive[6:0], joy_latch_megadrive};
      if (state != 4'd0 || (state == 4'd0 && joy_load_n == 1'b0))
        state <= state + 4'd1;
      case (state)
        4'd0:  begin
                 if (joy_latch_md_start == 1'b1 && state_update_joy1 == 2'b11)
                   joyswitches[7:0] <= joyswintern[7:0];
                 if (joy_latch_md_start == 1'b1 && state_update_joy2 == 2'b11)
                   joyswitches[15:8] <= joyswintern[15:8];

                 joyswintern[0]  <= joy_data;
                 joy_latch_md_start <= sel_high;
               end
        4'd1:  joyswintern[1]  <= joy_data;
        4'd2:  joyswintern[2]  <= joy_data;
        4'd3:  joyswintern[3]  <= joy_data;
        4'd4:  joyswintern[4]  <= joy_data;
        4'd5:  joyswintern[5]  <= joy_data;
        4'd6:  joyswintern[6]  <= joy_data;
        4'd7:  joyswintern[7]  <= joy_data;
        4'd8:  joyswintern[8]  <= joy_data;
        4'd9:  joyswintern[9]  <= joy_data;
        4'd10: joyswintern[10] <= joy_data;
        4'd11: joyswintern[11] <= joy_data;
        4'd12: joyswintern[12] <= joy_data;
        4'd13: joyswintern[13] <= joy_data;
        4'd14: joyswintern[14] <= joy_data;
        4'd15: joyswintern[15] <= joy_data;
      endcase
      
      if (state == 4'd15) begin
        if (joy_latch_md_start == 1'b0) begin   // SEL = 0
          if (state_update_joy1 == 2'b11 && joyswintern[7:4] == 4'b0000)
            state_update_joy1 <= 2'b00;
          if (state_update_joy1 == 2'b01)
            state_update_joy1 <= 2'b11;
        end
        else begin                              // SEL = 1
          if (state_update_joy1 == 2'b00)
            state_update_joy1 <= 2'b01;
        end
        
        if (joy_latch_md_start == 1'b0) begin   // SEL = 0
          if (state_update_joy2 == 2'b11 && {joy_data,joyswintern[14:12]} == 4'b0000)   //joyswintern[15] está siendo escrito en este momento, por eso no puedo usarlo
            state_update_joy2 <= 2'b00;
          if (state_update_joy2 == 2'b01)
            state_update_joy2 <= 2'b11;
        end
        else begin                              // SEL = 1
          if (state_update_joy2 == 2'b00)
            state_update_joy2 <= 2'b01;
        end
      end
      
    end    
  end
endmodule
