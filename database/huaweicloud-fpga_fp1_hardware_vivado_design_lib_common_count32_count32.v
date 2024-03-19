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
`timescale     1ns/100ps    // define simulation time scale

/***************************************************/

module count32 (
                a_clr,      
                s_clr,      
                clk,        
                en,         
                d           
                );

/***************************************************/
parameter               UDLY   = 1;

/***************************************************/
input          a_clr;
input          s_clr;
input          clk;
input          en;
output [31:0]  d;

/***************************************************/

reg    [15:0]  d_h;        
reg    [15:0]  d_l;        
reg            d_l_max;    

/***************************************************/

assign  d = {d_h, d_l};

always @( posedge clk or posedge a_clr )
    if (a_clr == 1'b1)
        d_l <= #UDLY 16'h0000;
    else if (s_clr)
        d_l <= #UDLY 16'h0000;
    else if (en)
        d_l <= #UDLY d_l + 16'd1;

always @( posedge clk or posedge a_clr )
    if (a_clr == 1'b1)
        d_l_max <= #UDLY 1'b0;
    else if (s_clr)
        d_l_max <= #UDLY 1'b0;
    else if (en)
        d_l_max <= #UDLY (d_l == 16'hfffe);

always @( posedge clk or posedge a_clr )
    if (a_clr == 1'b1)
        d_h <= #UDLY 16'h0000;
    else if (s_clr)
        d_h <= #UDLY 16'h0000;
    else if (en & d_l_max)
        d_h <= #UDLY d_h + 16'd1;

/***************************************************/

endmodule
