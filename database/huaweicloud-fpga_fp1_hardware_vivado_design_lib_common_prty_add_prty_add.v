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

module prty_add
    #(
    parameter    DATA_WTH     = 279   ,
    parameter    CELL_WTH     = 32
    )
    (
    data_in    ,    
    data_out        
    );

/******************************************************************************\
   parameter 
\******************************************************************************/
parameter PRTY_WTH = prty_wth_cal(DATA_WTH,CELL_WTH)  ;
parameter DATA_OUT_WTH = (DATA_WTH+PRTY_WTH) ;

/******************************************************************************\
   port signal 
\******************************************************************************/

input   [DATA_WTH-1    :0]      data_in    ;    
output  [DATA_OUT_WTH-1:0]      data_out   ;    
wire    [DATA_WTH-1    :0]      data_in    ;    
wire    [DATA_OUT_WTH-1:0]      data_out   ;    
/******************************************************************************\
    function
\******************************************************************************/
function integer prty_wth_cal;
input integer data_wth;
input integer cell_wth;
begin
    if((data_wth % cell_wth) != 0) begin
        prty_wth_cal = (data_wth / cell_wth) + 1;
    end
    else begin
        prty_wth_cal = (data_wth / cell_wth);
    end
end
endfunction

/******************************************************************************\
    inter signal
\******************************************************************************/
reg  [(PRTY_WTH-1) :0]   prty_rsult   ;

/******************************************************************************\
    process
\******************************************************************************/

generate
genvar idex   ; 
for (idex=0; idex<PRTY_WTH; idex=idex+1)
    always @ (*)
    begin
        if(idex < (PRTY_WTH-1)) begin
            prty_rsult[idex] = ^data_in[((idex*CELL_WTH)+CELL_WTH-1):(idex*CELL_WTH)];
        end
        else begin
            prty_rsult[PRTY_WTH-1] = ^data_in[(DATA_WTH-1):(idex*CELL_WTH)];
        end
    end
endgenerate

assign data_out = {prty_rsult,data_in};

endmodule
