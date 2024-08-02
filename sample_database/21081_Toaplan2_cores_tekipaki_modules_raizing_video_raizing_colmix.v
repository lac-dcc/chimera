// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*
* <-- pr4m0d -->
* https://pram0d.com
* https://twitter.com/pr4m0d
* https://github.com/psomashekar
*
* Copyright (c) 2022 Pramod Somashekar
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
module raizing_colmix (
    input CLK,
    input CLK96,
    input RESET,
    input RESET96,
    input PIXEL_CEN,
    input [10:0] EXTRATEXT_PIXEL,
    input [14:0] SCROLL0_PIXEL,
    input [14:0] SCROLL1_PIXEL,
    input [14:0] SCROLL2_PIXEL,
    input [14:0] OBJ_PIXEL,
    output reg [10:0] FINAL_PIXEL,
    input ACTIVE
);

wire [10:0] blank_pixel = 11'd0;
wire [4:0] prio = {EXTRATEXT_PIXEL>0, OBJ_PIXEL[10:0]>0, SCROLL2_PIXEL[10:0]>0, SCROLL1_PIXEL[10:0]>0, SCROLL0_PIXEL[10:0]>0};

integer i;
function [10:0] pixel_priority_mux;
    input [4:0] pri;
    input [10:0] et;
    input [14:0] obj,scr2,scr1,scr0;
    begin
        pixel_priority_mux = blank_pixel;
        for(i=0;i<16;i=i+1) begin
            if(pri[0] && scr0[14:11] == i[3:0]) pixel_priority_mux = scr0[10:0]; 
            if(pri[1] && scr1[14:11] == i[3:0]) pixel_priority_mux = scr1[10:0];
            if(pri[2] && scr2[14:11] == i[3:0]) pixel_priority_mux = scr2[10:0];
            if(pri[3] && obj[14:11] == i[3:0]) pixel_priority_mux = obj[10:0];
        end
        // if(pri[0]) pixel_priority_mux = scr0[10:0]; 
        // if(pri[1]) pixel_priority_mux = scr1[10:0];
        // if(pri[2]) pixel_priority_mux = scr2[10:0];
        // if(pri[3]) pixel_priority_mux = obj[10:0];

        //remux
        // if(pri[3] && obj[14:11] >= scr0[14:11] && obj[14:11] >= scr1[14:11] && obj[14:11] >= scr2[14:11]) pixel_priority_mux = obj[10:0];
        // else begin
        //     if(pri[0] && scr0[14:11] > scr1[14:11] && scr0[14:11] > scr2[14:11] && scr0 > obj[14:11]) pixel_priority_mux = scr0[10:0]; 
        //     if(pri[1] && scr1[14:11] > scr0[14:11] && scr1[14:11] > scr2[14:11] && scr1 > obj[14:11]) pixel_priority_mux = scr1[10:0];
        //     if(pri[2] && scr2[14:11] > scr0[14:11] && scr2[14:11] > scr1[14:11] && scr2 > obj[14:11]) pixel_priority_mux = scr2[10:0];
        // end
        

        // if(pri[3]) pixel_priority_mux = obj[10:0];
        
        if(pri[4]) pixel_priority_mux = et;
        // $display("%h", pixel_priority_mux);
    end
endfunction

always @(posedge CLK96) begin
    if(PIXEL_CEN) begin
        if(prio==5'b00000) begin //no layer has pixels in this dot, it will be set to clear frame in palette
            FINAL_PIXEL<=blank_pixel;
        end else begin
            FINAL_PIXEL<=pixel_priority_mux(prio, EXTRATEXT_PIXEL, OBJ_PIXEL, SCROLL2_PIXEL, SCROLL1_PIXEL, SCROLL0_PIXEL);
        end
    end
end

endmodule