//
//------------------------------------------------------------------------------
//     Copyright (c) 2017 Huawei Technologies Co., Ltd. All Rights Reserved.
//
//     This program is free software; you can redistribute it and/or modify
//     it under the terms of the Huawei Software License (the "License").
//     A copy of the License is located in the "LICENSE" file accompanying 
//     this file.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//     Huawei Software License for more details. 
//------------------------------------------------------------------------------

`resetall

`resetall
`timescale    1ns / 1ns

module rr8
   #(
        parameter       REQ_W                   = 8       ,      
        parameter       RR_NUM_W                = 3                                       
    )  
    (
        input                                   reset      ,
        input                                   clks       ,
        
        input          [REQ_W-1:0]              req        ,
        input                                   req_vld    ,
        output  reg    [RR_NUM_W-1:0]           rr_bit     

    );
    
//======================================================================================================================
//signal
//======================================================================================================================

reg     [REQ_W-1:0]                             shift_req  ;
reg     [RR_NUM_W-1:0]                          bit_offset ;
    
//======================================================================================================================
//process
//======================================================================================================================

always @ ( * ) 
begin
    case ( rr_bit )
        3'd0  : shift_req = {req[0   ],req[7:1 ]};
        3'd1  : shift_req = {req[1 :0],req[7:2 ]};
        3'd2  : shift_req = {req[2 :0],req[7:3 ]};
        3'd3  : shift_req = {req[3 :0],req[7:4 ]};
        3'd4  : shift_req = {req[4 :0],req[7:5 ]};
        3'd5  : shift_req = {req[5 :0],req[7:6 ]};
        3'd6  : shift_req = {req[6 :0],req[7:7 ]};
        default : shift_req = req ;
    endcase
end

always @ ( * ) 
begin
    casex ( shift_req )
        8'b????_???1 : bit_offset = 3'd1 ;
        8'b????_??10 : bit_offset = 3'd2 ;
        8'b????_?100 : bit_offset = 3'd3 ;
        8'b????_1000 : bit_offset = 3'd4 ;
        8'b???1_0000 : bit_offset = 3'd5 ;
        8'b??10_0000 : bit_offset = 3'd6 ;
        8'b?100_0000 : bit_offset = 3'd7 ;
        default      : bit_offset = 3'd0 ;
    endcase
end

always @(posedge clks or posedge reset)
begin
    if (reset == 1'b1) begin
        rr_bit <= {RR_NUM_W{1'b0}};
    end
    else if ( req_vld == 1'b1 )begin
        rr_bit <= bit_offset + rr_bit;
    end
    else ;
end


endmodule
