// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JT51.

    JT51 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT51 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT51.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 27-10-2016
    */


module jt51_pm(
    input      [ 6:0] kc_I,
    input      [ 5:0] kf_I,
    input      [ 8:0] mod_I,
    input             add,
    output reg [12:0] kcex
);

reg [ 9:0] lim;
reg [13:0] kcex0, kcex1;
reg [ 1:0] extra;

reg [ 6:0] kcin;
reg        carry;

always @(*) begin: kc_input_cleaner
    { carry, kcin } = kc_I[1:0]==2'd3 ? { 1'b0, kc_I } + 8'd1 : {1'b0,kc_I};
end

always @(*) begin : addition
    lim = { 1'd0, mod_I } +  { 4'd0, kf_I };
    case( kcin[3:0] )
        default:
            if( lim>=10'd448 ) extra = 2'd2;
            else if( lim>=10'd256 ) extra = 2'd1;
            else extra = 2'd0;
         4'd1,4'd5,4'd9,4'd13:
            if( lim>=10'd384 ) extra = 2'd2;
            else if( lim>=10'd192 ) extra = 2'd1;
            else extra = 2'd0;
         4'd2,4'd6,4'd10,4'd14:
            if( lim>=10'd512 ) extra = 2'd3;
            else if( lim>=10'd320 ) extra = 2'd2;
            else if( lim>=10'd128 ) extra = 2'd1;
            else extra = 2'd0;
    endcase
    kcex0 = {1'b0,kcin,kf_I} + { 6'd0, extra, 6'd0 } + { 5'd0, mod_I };
    kcex1 = kcex0[7:6]==2'd3 ? kcex0 + 14'd64 : kcex0;
end

reg signed [ 9:0] slim;
reg        [ 1:0] sextra;
reg        [13:0] skcex0, skcex1;

always @(*) begin : subtraction
    slim = { 1'd0, mod_I } - { 4'd0, kf_I };
    case( kcin[3:0] )
        default:
            if( slim>=10'sd449 ) sextra = 2'd3;
            else if( slim>=10'sd257 ) sextra = 2'd2;
            else if( slim>=10'sd65 ) sextra = 2'd1;
            else sextra = 2'd0;
         4'd1,4'd5,4'd9,4'd13:
            if( slim>=10'sd321 ) sextra = 2'd2;
            else if( slim>=10'sd129 ) sextra = 2'd1;
            else sextra = 2'd0;
         4'd2,4'd6,4'd10,4'd14:
            if( slim>=10'sd385 ) sextra = 2'd2;
            else if( slim>=10'sd193 ) sextra = 2'd1;
            else sextra = 2'd0;
    endcase
    skcex0 = {1'b0,kcin,kf_I} - { 6'd0, sextra, 6'd0 } - { 5'd0, mod_I };
    skcex1 = skcex0[7:6]==2'd3 ? skcex0 - 14'd64 : skcex0;
end

always @(*) begin : mux
    if ( add )
        kcex = kcex1[13] | carry ? {3'd7, 4'd14, 6'd63} : kcex1[12:0];
    else
        kcex = carry ? {3'd7, 4'd14, 6'd63} : (skcex1[13] ? 13'd0 : skcex1[12:0]);
end

endmodule
