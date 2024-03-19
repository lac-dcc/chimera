// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//
//  stepping motor control
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module stepper_motor_control
        #(
            parameter   CORE_ID          = 32'h5a5a_5a5a,
            
            parameter   WB_ADR_WIDTH     = 6,
            parameter   WB_DAT_SIZE      = 3,
            parameter   WB_DAT_WIDTH     = (8 << WB_DAT_SIZE),
            parameter   WB_SEL_WIDTH     = (1 << WB_DAT_SIZE),
            
            parameter   MICROSTEP_WIDTH  = 12,
            parameter   Q_WIDTH          = 24,
            parameter   X_WIDTH          = 24 + Q_WIDTH,
            parameter   X_SHIFT          = Q_WIDTH - 8,
            parameter   V_WIDTH          = Q_WIDTH,
            parameter   A_WIDTH          = Q_WIDTH,
            
            parameter   INIT_CTL_ENABLE  = 1'b0,
            parameter   INIT_CTL_TARGET  = 1'b0,
            parameter   INIT_CTL_PWM     = 2'b11,
            parameter   INIT_TARGET_X    = 0,
            parameter   INIT_TARGET_V    = 0,
            parameter   INIT_TARGET_A    = 0,
            parameter   INIT_MAX_V       = 1000,
            parameter   INIT_MAX_A       = 100,
            parameter   INIT_MAX_A_NEAR  = 120
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o,
            
            output  wire                        motor_en,
            output  wire                        motor_a,
            output  wire                        motor_b
        );
    
    
    localparam  ADR_CORE_ID     = 8'h00;
    localparam  ADR_CTL_ENABLE  = 8'h01;
    localparam  ADR_CTL_TARGET  = 8'h02;
    localparam  ADR_CTL_PWM     = 8'h03;
    localparam  ADR_TARGET_X    = 8'h04;
    localparam  ADR_TARGET_V    = 8'h06;
    localparam  ADR_TARGET_A    = 8'h07;
    localparam  ADR_MAX_V       = 8'h09;
    localparam  ADR_MAX_A       = 8'h0a;
    localparam  ADR_MAX_A_NEAR  = 8'h0f;
    localparam  ADR_CUR_X       = 8'h10;
    localparam  ADR_CUR_V       = 8'h12;
    localparam  ADR_CUR_A       = 8'h13;
    localparam  ADR_TIME        = 8'h20;
    
    
    wire                                update;
    
    reg             [0:0]               reg_ctl_enable;
    reg             [2:0]               reg_ctl_target;
    reg             [1:0]               reg_ctl_pwm;
    reg     signed  [X_WIDTH-1:0]       reg_target_x;
    reg     signed  [V_WIDTH:0]         reg_target_v;
    reg     signed  [A_WIDTH:0]         reg_target_a;
    reg             [V_WIDTH-1:0]       reg_max_v;
    reg             [A_WIDTH-1:0]       reg_max_a;
    reg             [A_WIDTH-1:0]       reg_max_a_near;
    reg     signed  [X_WIDTH-1:0]       reg_cur_x;
    reg     signed  [V_WIDTH:0]         reg_cur_v;
    reg     signed  [A_WIDTH:0]         reg_cur_a;
    reg             [31:0]              reg_time;
    
    wire    signed  [V_WIDTH:0]         max_v = {1'b0, reg_max_v};
    wire    signed  [A_WIDTH:0]         max_a = {1'b0, reg_max_a};
    wire    signed  [V_WIDTH:0]         min_v = -max_v;
    wire    signed  [A_WIDTH:0]         min_a = -max_a;
    
    reg                                 reg_start;
    reg     signed  [A_WIDTH:0]         reg_a_tmp;
    reg     signed  [A_WIDTH:0]         reg_a;
    reg     signed  [V_WIDTH:0]         reg_v_tmp;
    reg     signed  [V_WIDTH:0]         reg_v;
    
    wire    signed  [A_WIDTH:0]         calc_a;
    wire                                calc_valid;
    
    function [WB_DAT_WIDTH-1:0] reg_mask(
                                        input [WB_DAT_WIDTH-1:0] org,
                                        input [WB_DAT_WIDTH-1:0] wdat,
                                        input [WB_SEL_WIDTH-1:0] msk
                                    );
    integer i;
    begin
        for ( i = 0; i < WB_DAT_WIDTH; i = i+1 ) begin
            reg_mask[i] = msk[i/8] ? wdat[i] : org[i];
        end
    end
    endfunction
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_ctl_enable  <= INIT_CTL_ENABLE;
            reg_ctl_target  <= INIT_CTL_TARGET;
            reg_ctl_pwm     <= INIT_CTL_PWM;
            reg_target_x    <= INIT_TARGET_X;
            reg_target_v    <= INIT_TARGET_V;
            reg_target_a    <= INIT_TARGET_A;
            reg_max_v       <= INIT_MAX_V;
            reg_max_a       <= INIT_MAX_A;
            reg_max_a_near  <= INIT_MAX_A_NEAR;
            reg_cur_x       <= 0;
            reg_cur_v       <= 0;
            reg_cur_a       <= 0;
            reg_time        <= 0;
            
            reg_start       <= 1'b0;
            reg_a_tmp       <= 0;
            reg_a           <= 0;
            reg_v_tmp       <= 0;
            reg_v           <= 0;
        end
        else begin
            // start
            reg_start <= update;
            
            // acceleration
            reg_a_tmp <= 0;
            if ( reg_ctl_target[2] ) begin
                reg_a_tmp <= reg_target_a;
            end
            else if ( reg_ctl_target[1] ) begin
                reg_a_tmp <= reg_target_v - reg_cur_v;
            end
            if ( reg_ctl_target[0] ) begin
                reg_a <= calc_a;
            end
            else begin
                reg_a <= reg_a_tmp;
                if ( reg_a_tmp > +max_a ) begin reg_a <= +max_a; end
                if ( reg_a_tmp < -max_a ) begin reg_a <= -max_a; end
            end
            
            // speed
            reg_v_tmp <= reg_cur_v + reg_a;
            reg_v <= reg_v_tmp;
            if ( reg_v_tmp > +max_v ) begin reg_v <= +max_v; end
            if ( reg_v_tmp < -max_v ) begin reg_v <= -max_v; end
            
            // update
            if ( update && reg_ctl_enable ) begin
                reg_cur_x <= reg_cur_x + reg_v;
                reg_cur_v <= reg_v;
                reg_cur_a <= reg_a;
                reg_time  <= reg_time + 1;
            end
            
            
            // write
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_CTL_ENABLE:  reg_ctl_enable  <= reg_mask(reg_ctl_enable,  s_wb_dat_i, s_wb_sel_i);
                ADR_CTL_TARGET:  reg_ctl_target  <= reg_mask(reg_ctl_target,  s_wb_dat_i, s_wb_sel_i);
                ADR_CTL_PWM:     reg_ctl_pwm     <= reg_mask(reg_ctl_pwm,     s_wb_dat_i, s_wb_sel_i);
                ADR_TARGET_X:    reg_target_x    <= reg_mask(reg_target_x,    s_wb_dat_i, s_wb_sel_i);
                ADR_TARGET_V:    reg_target_v    <= reg_mask(reg_target_v,    s_wb_dat_i, s_wb_sel_i);
                ADR_TARGET_A:    reg_target_a    <= reg_mask(reg_target_a,    s_wb_dat_i, s_wb_sel_i);
                ADR_MAX_V:       reg_max_v       <= reg_mask(reg_max_v,       s_wb_dat_i, s_wb_sel_i);
                ADR_MAX_A:       reg_max_a       <= reg_mask(reg_max_a,       s_wb_dat_i, s_wb_sel_i);
                ADR_MAX_A_NEAR:  reg_max_a_near  <= reg_mask(reg_max_a_near,  s_wb_dat_i, s_wb_sel_i);
                endcase
            end
        end
    end
    
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)     ? CORE_ID                 :
                        (s_wb_adr_i == ADR_CTL_ENABLE)  ? reg_ctl_enable          :
                        (s_wb_adr_i == ADR_CTL_TARGET)  ? reg_ctl_target          :
                        (s_wb_adr_i == ADR_CTL_PWM)     ? reg_ctl_pwm             :
                        (s_wb_adr_i == ADR_TARGET_X)    ? reg_target_x            :
                        (s_wb_adr_i == ADR_TARGET_V)    ? reg_target_v            :
                        (s_wb_adr_i == ADR_TARGET_A)    ? reg_target_a            :
                        (s_wb_adr_i == ADR_MAX_V)       ? reg_max_v               :
                        (s_wb_adr_i == ADR_MAX_A)       ? reg_max_a               :
                        (s_wb_adr_i == ADR_MAX_A_NEAR)  ? reg_max_a_near          :
                        (s_wb_adr_i == ADR_CUR_X)       ? (reg_cur_x >>> X_SHIFT) :
                        (s_wb_adr_i == ADR_CUR_V)       ? reg_cur_v               :
                        (s_wb_adr_i == ADR_CUR_A)       ? reg_cur_a               :
                        (s_wb_adr_i == ADR_TIME)        ? reg_time                :
                        0;
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    // calc
    stepper_motor_control_calc
            #(
                .X_WIDTH            (X_WIDTH),
                .V_WIDTH            (V_WIDTH),
                .A_WIDTH            (A_WIDTH)
            )
        i_stepper_motor_control_calc
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1'b1),
                
                .start              (reg_start),
                
                .target_x           (reg_target_x <<< X_SHIFT),
                .cur_x              (reg_cur_x),
                .cur_v              (reg_cur_v),
                .max_a              (reg_max_a),
                .max_a_near         (reg_max_a_near),
                
                .out_a              (calc_a),
                .out_valid          (calc_valid)
            );
    
    // drive
    bipolar_stepper_motor_drive
            #(
                .Q_WIDTH            (Q_WIDTH),
                .MICROSTEP_WIDTH    (MICROSTEP_WIDTH)
            )
        i_bipolar_stepper_motor_drive
            (
                .reset              (reset),
                .clk                (clk),
                
                .microstep_en       (reg_ctl_pwm[0]),
                .nanostep_en        (reg_ctl_pwm[1]),
                .asyc_update_en     (1'b0),
                
                .phase              (reg_cur_x[Q_WIDTH+1:0]),
                .update             (update),
                
                .out_a              (motor_a),
                .out_b              (motor_b)
            );
    
    assign motor_en = reg_ctl_enable;
    
endmodule


`default_nettype wire


// end of file
