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

module  axi_time_out
    (
    input               clks                       ,
    input               reset                      ,
    
    input               vld_in                     ,
    input               ready_in                   ,
    input    [15:0]     reg_tmout_us_cfg           ,
    output   reg        time_out
    );
////////////////////////////////////////////////////////////////////////////////
//  parameter declear
////////////////////////////////////////////////////////////////////////////////
parameter       TIMER_1US_CFG  = 200;
reg             [7:0]    timer_1us_cnt;
reg             [15:0]   timer_us_cnt;
reg             [15:0]   timer_out_cfg;
////////////////////////////////////////////////////////////////////////////////
//  wire and reg declear
////////////////////////////////////////////////////////////////////////////////
reg     [23:0]             reg_1us_cnt;

always @ (posedge clks or posedge reset)
begin
    if (reset == 1'b1) begin
        timer_1us_cnt <= 8'd0;
    end
    else if ((timer_1us_cnt >= TIMER_1US_CFG) || (vld_in == 1'b0)) begin
        timer_1us_cnt <= 8'd0;
    end
    else begin
        timer_1us_cnt <= timer_1us_cnt +  8'd1;
    end
end

always @ (posedge clks or posedge reset)
begin
    if (reset == 1'b1) begin
        timer_out_cfg <= 16'hffff;
    end
    else begin
        timer_out_cfg <= reg_tmout_us_cfg[15:0] - 16'd2;
    end
end

always @ (posedge clks or posedge reset)
begin
    if (reset == 1'b1) begin
        time_out <= 1'd0;
    end
    else begin
        time_out <= (timer_us_cnt >= timer_out_cfg[15:0]);
    end
end

always @ (posedge clks or posedge reset)
begin
    if (reset == 1'b1) begin
        timer_us_cnt <= 16'd0;
    end
    else if ((time_out == 1'b1) || (ready_in == 1'b1)) begin
        timer_us_cnt <= 16'd0;
    end
    else if((timer_1us_cnt  >= TIMER_1US_CFG) && (vld_in == 1'b1)) begin
        timer_us_cnt <= timer_us_cnt + 16'd1;
    end
    else ;
end

endmodule
