// This program was cloned from: https://github.com/iCAS-Lab/APTPU
// License: MIT License

// MIT License
// 
// Copyright (c) 2021-2024 iCAS Lab
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// Company: iCAS Lab, University of South Carolina
// Engineer: Mohammed E. Elbtity
// Create Date: 06/26/2023 12:15:48 AM
// Design Name: 
// Module Name: Antilogarithmic_Converter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module Antilogarithmic_Converter #(parameter DataIN_width = 16, 
                                   parameter truncation_width = 6, 
                                   parameter bw_lg = $clog2(DataIN_width),
                                   parameter DataK_width = 4)
(
input    wire    [bw_lg+truncation_width+1:0]    ANTI_L,
output    reg        [2*DataIN_width-1:0]                ANTI_AP
);

reg        [truncation_width-1:0]    Xt ;
reg        [bw_lg+1:0]        sub_2comp, sub; // size is K+1 because it's max is K and it's signed
reg        [bw_lg:0]            K ;


always @(*)
begin
    ANTI_AP = 'd0 ;
    Xt = {1'b1,ANTI_L[truncation_width:2]} ;                    //logic one is concatenated to hold the shifting effect
    K = ANTI_L[truncation_width+bw_lg+1:truncation_width+1] ;
    
    sub = K - truncation_width + 1 ;
    sub_2comp = ~sub + 1 ; // 2's compelement
    
    //ANTI_AP = (!sub[bw_lg+1)? {Xt,{(sub){1'b0}}} : ( Xt >> sub_2comp); 
    if(!sub[bw_lg+1]) //postive number 
    begin 
        ANTI_AP = Xt << sub;
    end
    else begin
        ANTI_AP = Xt >> sub_2comp; 
    end

end

//if(DataIN_width == 'd16)
//begin:    if_16

//if(!sub[bw_lg+1]) //postive number
//   begin
//   case(sub)
//   'd0:    ANTI_AP = Xt ;
//   'd1:    ANTI_AP = {Xt,1'b0} ;
//   'd2:    ANTI_AP = {Xt,2'b0} ;
//   'd3:    ANTI_AP = {Xt,3'b0} ;
//   'd4:    ANTI_AP = {Xt,4'b0} ;
//   'd5:    ANTI_AP = {Xt,5'b0} ;
//   'd6:    ANTI_AP = {Xt,6'b0} ;
//   'd7:    ANTI_AP = {Xt,7'b0} ;
//   'd8:    ANTI_AP = {Xt,8'b0} ;
//   'd9:    ANTI_AP = {Xt,9'b0} ;
//   'd10:    ANTI_AP = {Xt,10'b0} ;
//   'd11:    ANTI_AP = {Xt,11'b0} ;
//   'd12:    ANTI_AP = {Xt,12'b0} ;
//   'd13:    ANTI_AP = {Xt,13'b0} ;
//   'd14:    ANTI_AP = {Xt,14'b0} ;
//   'd15:    ANTI_AP = {Xt,15'b0} ;
//   'd16:    ANTI_AP = {Xt,16'b0} ;
//   'd17:    ANTI_AP = {Xt,17'b0} ;
//   'd18:    ANTI_AP = {Xt,18'b0} ;
//   'd19:    ANTI_AP = {Xt,19'b0} ;
//   'd20:    ANTI_AP = {Xt,20'b0} ;
//   'd21:    ANTI_AP = {Xt,21'b0} ;
//   'd22:    ANTI_AP = {Xt,22'b0} ;
//   'd23:    ANTI_AP = {Xt,23'b0} ;
//   'd24:    ANTI_AP = {Xt,24'b0} ;
//   'd25:    ANTI_AP = {Xt,25'b0} ;
//   'd26:    ANTI_AP = {Xt,26'b0} ;
//   'd27:    ANTI_AP = {Xt,27'b0} ;
//   'd28:    ANTI_AP = {Xt,28'b0} ;
//   'd29:    ANTI_AP = {Xt,29'b0} ;
//   'd30:    ANTI_AP = {Xt,30'b0} ;
//   'd31:    ANTI_AP = {Xt,31'b0} ;
//   default:ANTI_AP = Xt ;
//   endcase
   
//   end
//else
//   begin
//   case(sub_2comp)         //negative number
//   'd0:    ANTI_AP = Xt ;
//   'd1:    ANTI_AP = Xt>>1 ;
//   'd2:    ANTI_AP = Xt>>2 ;
//   'd3:    ANTI_AP = Xt>>3 ;
//   'd4:    ANTI_AP = Xt>>4 ;
//   'd5:    ANTI_AP = Xt>>5 ;
//   'd6:    ANTI_AP = Xt>>6 ;
//   'd7:    ANTI_AP = Xt>>7 ;
//   'd8:    ANTI_AP = Xt>>8 ;
//   'd9:    ANTI_AP = Xt>>9 ;
//   'd10:    ANTI_AP = Xt>>10 ;
//   'd11:    ANTI_AP = Xt>>10 ;
//   'd12:    ANTI_AP = Xt>>12 ;
//   'd13:    ANTI_AP = Xt>>13 ;
//   'd14:    ANTI_AP = Xt>>14 ;
//   'd15:    ANTI_AP = Xt>>15 ;
//   'd16:    ANTI_AP = Xt>>16;
//   'd17:    ANTI_AP = Xt>>17 ;
//   'd18:    ANTI_AP = Xt>>18 ;
//   'd19:    ANTI_AP = Xt>>19 ;
//   'd20:    ANTI_AP = Xt>>20 ;
//   'd21:    ANTI_AP = Xt>>21 ;
//   'd22:    ANTI_AP = Xt>>22 ;
//   'd23:    ANTI_AP = Xt>>23 ;
//   'd24:    ANTI_AP = Xt>>24 ;
//   'd25:    ANTI_AP = Xt>>25 ;
//   'd26:    ANTI_AP = Xt>>26 ;
//   'd27:    ANTI_AP = Xt>>27 ;
//   'd28:    ANTI_AP = Xt>>28 ;
//   'd29:    ANTI_AP = Xt>>29 ;
//   'd30:    ANTI_AP = Xt>>30 ;
//   'd31:    ANTI_AP = Xt>>31 ;
//   default:ANTI_AP = Xt ;
//   endcase
//   end
//end:    if_16



//if(DataIN_width == 'd8)
//begin:    if_8

//if(!sub[bw_lg+1]) //postive number
//   begin
//   case(sub)
//   'd0:    ANTI_AP = Xt ;
//   'd1:    ANTI_AP = {Xt,1'b0} ;
//   'd2:    ANTI_AP = {Xt,2'b0} ;
//   'd3:    ANTI_AP = {Xt,3'b0} ;
//   'd4:    ANTI_AP = {Xt,4'b0} ;
//   'd5:    ANTI_AP = {Xt,5'b0} ;
//   'd6:    ANTI_AP = {Xt,6'b0} ;
//   'd7:    ANTI_AP = {Xt,7'b0} ;
//   'd8:    ANTI_AP = {Xt,8'b0} ;
//   'd9:    ANTI_AP = {Xt,9'b0} ;
//   'd10:    ANTI_AP = {Xt,10'b0} ;
//   'd11:    ANTI_AP = {Xt,11'b0} ;
//   'd12:    ANTI_AP = {Xt,12'b0} ;
//   'd13:    ANTI_AP = {Xt,13'b0} ;
//   'd14:    ANTI_AP = {Xt,14'b0} ;
//   'd15:    ANTI_AP = {Xt,15'b0} ;
//   default:ANTI_AP = Xt ;
//   endcase
   
//   end
//else
//   begin
//   case(sub_2comp)         //negative number
//   'd0:    ANTI_AP = Xt ;
//   'd1:    ANTI_AP = Xt>>1 ;
//   'd2:    ANTI_AP = Xt>>2 ;
//   'd3:    ANTI_AP = Xt>>3 ;
//   'd4:    ANTI_AP = Xt>>4 ;
//   'd5:    ANTI_AP = Xt>>5 ;
//   'd6:    ANTI_AP = Xt>>6 ;
//   'd7:    ANTI_AP = Xt>>7 ;
//   'd8:    ANTI_AP = Xt>>8 ;
//   'd9:    ANTI_AP = Xt>>9 ;
//   'd10:    ANTI_AP = Xt>>10 ;
//   'd11:    ANTI_AP = Xt>>10 ;
//   'd12:    ANTI_AP = Xt>>12 ;
//   'd13:    ANTI_AP = Xt>>13 ;
//   'd14:    ANTI_AP = Xt>>14 ;
//   'd15:    ANTI_AP = Xt>>15 ;
//   default:ANTI_AP = Xt ;
//   endcase
//   end
//end:    if_8    




//if(DataIN_width == 'd4)
//begin:    if_4

//if(!sub[bw_lg+1]) //postive number
//   begin
//   case(sub)
//   'd0:    ANTI_AP = Xt ;
//   'd1:    ANTI_AP = {Xt,1'b0} ;
//   'd2:    ANTI_AP = {Xt,2'b0} ;
//   'd3:    ANTI_AP = {Xt,3'b0} ;
//   'd4:    ANTI_AP = {Xt,4'b0} ;
//   'd5:    ANTI_AP = {Xt,5'b0} ;
//   'd6:    ANTI_AP = {Xt,6'b0} ;
//   'd7:    ANTI_AP = {Xt,7'b0} ;
//   default:ANTI_AP = Xt ;
//   endcase
   
//   end
//else
//   begin
//   case(sub_2comp)         //negative number
//   'd0:    ANTI_AP = Xt ;
//   'd1:    ANTI_AP = Xt>>1 ;
//   'd2:    ANTI_AP = Xt>>2 ;
//   'd3:    ANTI_AP = Xt>>3 ;
//   'd4:    ANTI_AP = Xt>>4 ;
//   'd5:    ANTI_AP = Xt>>5 ;
//   'd6:    ANTI_AP = Xt>>6 ;
//   'd7:    ANTI_AP = Xt>>7 ;
//   default:ANTI_AP = Xt ;
//   endcase
//   end
//end:    if_4


//end:    always_block

//endgenerate

endmodule
