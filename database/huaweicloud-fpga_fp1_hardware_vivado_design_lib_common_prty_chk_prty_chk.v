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
`timescale 1ns / 1ns

module prty_chk
    #(
    parameter    DATA_WTH     = 540  ,
    parameter    CELL_WTH     = 64   
    )
    (
    clks       ,     
    data_in    ,     
    data_out   ,       
    chk_rsult       
    );

/******************************************************************************\
    parameter
\******************************************************************************/
parameter PRTY_WTH     = prty_wth_cal(DATA_WTH,CELL_WTH) ;
parameter DATA_OUT_WTH = DATA_WTH - PRTY_WTH ;
/******************************************************************************\
    port signal
\******************************************************************************/

input    [             0:0]      clks       ;     
input    [DATA_WTH-1    :0]      data_in    ;     
output   [DATA_OUT_WTH-1:0]      data_out   ;     
output   [             0:0]      chk_rsult  ;     
wire     [             0:0]      clks       ;     
wire     [DATA_WTH-1    :0]      data_in    ;     
wire     [DATA_OUT_WTH-1:0]      data_out   ;     
wire     [             0:0]      chk_rsult  ;     
/******************************************************************************\
    function
\******************************************************************************/
function integer prty_wth_cal;
    input integer data_wdth;
    input integer cell_wdth;
    integer  quotient   ;   
    integer  quotient1  ;   
    integer  remainder  ;   
    integer  remainder1 ;   

    begin
        quotient    = data_wdth / cell_wdth ;
        remainder   = data_wdth % cell_wdth ; 
        quotient1   = (data_wdth-quotient) / cell_wdth ;
        remainder1  = (data_wdth-quotient) % cell_wdth ;
        if((remainder == 0) || (remainder1 == 0) || (quotient1 < quotient)) begin
            prty_wth_cal = quotient ;
        end
        else begin
            prty_wth_cal = quotient + 1;
        end
    end
endfunction
/******************************************************************************\
    inter signal
\******************************************************************************/
reg  [PRTY_WTH-1 :0]   prty_rsult     ;
/******************************************************************************\
    process
\******************************************************************************/
generate
genvar idex   ; 
for (idex=0; idex<PRTY_WTH; idex=idex+1)
    always @ (posedge clks)
    begin
        if(idex == (PRTY_WTH-1)) begin
            prty_rsult[idex] <= ((^data_in[(DATA_OUT_WTH-1):(idex*CELL_WTH)]) ^ data_in[DATA_OUT_WTH+idex]);
        end
        else begin
            prty_rsult[idex] <= ((^data_in[((idex*CELL_WTH)+CELL_WTH-1):(idex*CELL_WTH)]) ^ data_in[DATA_OUT_WTH+idex]);
        end
    end
endgenerate

assign  chk_rsult = (|prty_rsult);
assign  data_out  = data_in[DATA_OUT_WTH-1:0];
endmodule
