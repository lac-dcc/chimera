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
`timescale    1ns / 1ns

module bp_ctrl #(
     parameter       BP_TIMER_FROM_OUT      = "YES"                     ,
     parameter       BP_TIMER_CNT_WIDTH     = 8                         ,
     parameter       BP_PULSE_CNT_WIDTH     = 8                      
    )
    ( 
     input                                  clks                        ,   
     input                                  reset                       ,   

     input                                  timer_pulse_flg             ,
     input                                  reg_bp_en_cfg               ,                                                                 
     input         [BP_TIMER_CNT_WIDTH-1:0] reg_bp_timer_cnt_cfg        ,                                                                 
     input         [BP_PULSE_CNT_WIDTH-1:0] reg_bp_pulse_cycle_cfg      ,  
     input         [BP_PULSE_CNT_WIDTH-1:0] reg_bp_pulse_duty_cycle_cfg ,
               
     output  reg                            ctrl_bp_en           
    );

//******************************************************************************
// signal
//******************************************************************************
reg       [BP_TIMER_CNT_WIDTH-1:0]          bp_timer_cnt            ;
reg                                         pulse_bp                ;
wire                                        bp_start                ;
wire                                        bp_timeout              ;

reg       [BP_PULSE_CNT_WIDTH-1:0]          pulse_cnt               ;
reg                                         bp_en_cfg_1dly          ;

//******************************************************************************
// process
//******************************************************************************
generate 
    if (BP_TIMER_FROM_OUT == "YES") begin: GEN_TIMER_FROM_OUT
        always @( posedge clks or posedge reset )
        begin
            if( reset) begin
                pulse_bp <= 1'b0;
            end
            else begin
                pulse_bp <= (timer_pulse_flg & reg_bp_en_cfg);
            end
        end
    end
    else begin: GEN_TIMER_FROM_INNER
        always @( posedge clks or posedge reset )
        begin
            if( reset) begin
                bp_timer_cnt <= {BP_TIMER_CNT_WIDTH{1'b0}};
            end
            else if( ( reg_bp_en_cfg == 1'b1 ) && ( bp_timer_cnt >= reg_bp_timer_cnt_cfg)) begin
                bp_timer_cnt <= {BP_TIMER_CNT_WIDTH{1'b0}};
            end
            else if( reg_bp_en_cfg == 1'b1) begin 
                bp_timer_cnt <= bp_timer_cnt + {{(BP_TIMER_CNT_WIDTH-1){1'b0}},1'b1};
            end
            else ;
        end
        
        always @( posedge clks or posedge reset )
        begin
            if( reset) begin
                pulse_bp <= 1'b0;
            end
            else begin
                pulse_bp <= ( bp_timer_cnt >= reg_bp_timer_cnt_cfg ) && reg_bp_en_cfg;
            end
        end

    end
endgenerate

always @( posedge clks or posedge reset)
begin
    if( reset == 1'b1) begin
        bp_en_cfg_1dly <= 1'b0;
    end
    else begin
        bp_en_cfg_1dly <= reg_bp_en_cfg;
    end
end

assign bp_start = reg_bp_en_cfg & (~bp_en_cfg_1dly) ;

assign bp_timeout = pulse_bp && ( pulse_cnt >= reg_bp_pulse_cycle_cfg );

always @( posedge clks or posedge reset )
begin
    if( reset) begin
        pulse_cnt <= {BP_PULSE_CNT_WIDTH{1'b0}};
    end
    else if( ( bp_start ==1'b1 ) || ( bp_timeout == 1'b1 ) ) begin 
        pulse_cnt <= {BP_PULSE_CNT_WIDTH{1'b0}};
    end
    else if( pulse_bp ==1'b1 ) begin
        pulse_cnt <= pulse_cnt + {{(BP_PULSE_CNT_WIDTH-1){1'b0}},1'b1};
    end
    else ;
end

always @( posedge clks or posedge reset)
begin
    if( reset == 1'b1) begin
        ctrl_bp_en <= 1'b0;
    end
    else begin
        ctrl_bp_en <= reg_bp_en_cfg && ( pulse_cnt < reg_bp_pulse_duty_cycle_cfg);
    end
end


endmodule

