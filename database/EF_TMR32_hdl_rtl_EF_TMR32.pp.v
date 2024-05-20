// This program was cloned from: https://github.com/efabless/EF_TMR32
// License: Apache License 2.0

`timescale          1ns/1ps
`default_nettype    none




                                                    

module EF_TMR32 #(parameter PRW = 16,
                                PWM_FAULT_CLR_C0 = 16'hA539,
                                PWM_FAULT_CLR_C1 = 16'hA953 
)
(
    input   wire            clk,
    input   wire            rst_n,

    input   wire            tmr_en,
    input   wire            tmr_start,
    input   wire            pwm0_en,
    input   wire            pwm1_en,
    input   wire [31:0]     tmr_reload,
    input   wire [31:0]     cmpx,
    input   wire [31:0]     cmpy,
    input   wire [PRW-1:0]  prescaler,
    input   wire [ 2:0]     tmr_cfg,     // [2]: Periodic/OneShot; [1:0]: 10: Up, 01: Down, 11: Up/Down
    input   wire [11:0]     pwm0_cfg,
    input   wire [11:0]     pwm1_cfg,
    input   wire            pwm0_inv,
    input   wire            pwm1_inv,
    input   wire [ 7:0]     pwm_dt,
    input   wire [15:0]     pwm_fault_clr,
    input   wire            pwm_dt_en,

    output  wire [31:0]     tmr,
    output  wire            matchx_flag,
    output  wire            matchy_flag,
    output  wire            timeout_flag,
    
    input   wire            pwm_fault,
    output  wire            pwm0,
    output  wire            pwm1
);

    wire [1:0]      tmr_mode        = tmr_cfg[1:0];
    wire            tmr_periodic    = tmr_cfg[2];

    reg [31:0]      tmr_reg;
    reg [PRW-1:0]   pr_reg;

    wire            tmr_clr;

    wire            tmr_en_pulse = tmr_clr;
    reg             tmr_run;

    reg             fault_reg;

    aucohl_ped TMREN_PE (
        .clk(clk),
        .in(tmr_en),
        .out(tmr_clr)
    );

    wire tick = (pr_reg == 0);
    always @(posedge clk, negedge rst_n)
                                                    if(!rst_n) pr_reg <= 1;
                                                    else
        if(tmr_en)
            if(tick) pr_reg <= prescaler; 
            else pr_reg <= pr_reg - 1; 
        else
            pr_reg <= prescaler ;

    reg         tmr_dir;        // 1: Up, 0: Down
    wire        tmr_eq_reload       =   (tmr == tmr_reload);
    wire        tmr_eq_zero         =   (tmr == 0);
    wire        tmr_eq_reload_m_1   =   (tmr == (tmr_reload - 1));
    wire        tmr_eq_one          =   (tmr == 1);
    wire        tmr_eq_cmpx         =   (tmr == cmpx);
    wire        tmr_eq_cmpy         =   (tmr == cmpy);

    always @(posedge clk, negedge rst_n)
                                                    if(!rst_n) tmr_run <= 0;
                                                    else
        if(tmr_en_pulse)
            tmr_run <= 1;
        else if(~tmr_periodic & tick)
            if((tmr_mode[0] == 1'b1) & tmr_eq_one & ~tmr_dir)
                tmr_run <= 0;
            else if((tmr_mode == 2'b10) & tmr_eq_reload_m_1 & tmr_dir)
                tmr_run <= 1;


    // The timer
    reg [31:0]  tmr_reg_next;

    always@* begin
        tmr_reg_next = tmr_reg;
        if(~tmr_run)
            tmr_reg_next = tmr_reg;    
        else if(tmr_start & (tmr_mode == 2'b01))
            tmr_reg_next = tmr_reload;
        else if(tmr_start & (tmr_mode == 2'b10))
            tmr_reg_next = 0;
        else if(tmr_start & (tmr_mode == 2'b11))
            tmr_reg_next = 0;
        else if(tmr_mode == 2'b11) begin
            if(tmr_dir)
                tmr_reg_next = tmr_reg + 1;
            else
                tmr_reg_next = tmr_reg - 1; 
        end
        else if((tmr_mode == 2'b01))
            if(tmr_eq_zero)
                tmr_reg_next = tmr_periodic ? tmr_reload : tmr_reg;
            else
                tmr_reg_next = tmr_reg_next - 1;    
        else if((tmr_mode == 2'b10))
            if(tmr_eq_reload)
                tmr_reg_next = tmr_periodic ? 0 : tmr_reg;
            else
                tmr_reg_next = tmr_reg_next + 1;
    end

    always @(posedge clk, negedge rst_n)
                                                    if(!rst_n) tmr_reg <= 0;
                                                    else
    if(tmr_en)
        if(tmr_clr)
            if(tmr_mode == 2'b01)
                tmr_reg <= tmr_reload;
            else
                tmr_reg <= 0;
        else 
            if(tick)
                tmr_reg <=  tmr_reg_next;

    // The counting direction flag
    always @(posedge clk, negedge rst_n)
                                                    if(!rst_n) tmr_dir <= 1;
                                                    else
        if(tmr_clr)
            if(tmr_mode == 2'b01)
                tmr_dir <= 0;
            else
                tmr_dir <= 1;
        else if(tick)
            if(tmr_mode == 2'b11) begin
                if(tmr_eq_one & ~tmr_dir) 
                    tmr_dir <= 1;
                else if(tmr_eq_reload_m_1 & tmr_dir)
                    tmr_dir <= 0;
            end
            else if(tmr_mode == 2'b10)
                tmr_dir <= 1'b1;
            else if(tmr_mode == 2'b01)
                tmr_dir <= 1'b0;
            else
                tmr_dir <= 1'b1;

    // PWM Generator
    function pwm_action(input [1:0] action, input sig);
        case (action)
            2'b00: pwm_action = sig;
            2'b01: pwm_action = 0;
            2'b10: pwm_action = 1;
            2'b11: pwm_action = ~sig; 
        endcase
    endfunction 

    reg     pwm0_reg, pwm0_reg_next;
    reg     pwm1_reg, pwm1_reg_next;

    always @* begin
        casez({tmr_dir, tmr_eq_zero, tmr_eq_cmpx, tmr_eq_cmpy, tmr_eq_reload})
            5'b?_1_00_0 : pwm0_reg_next = pwm_action(pwm0_cfg[ 1: 0], pwm0_reg);    // U/D, 0
            5'b1_0_10_0 : pwm0_reg_next = pwm_action(pwm0_cfg[ 3: 2], pwm0_reg);    // U, CMPX
            5'b1_0_01_0 : pwm0_reg_next = pwm_action(pwm0_cfg[ 5: 4], pwm0_reg);    // U, CMPY
            5'b?_0_00_1 : pwm0_reg_next = pwm_action(pwm0_cfg[ 7: 6], pwm0_reg);    // U/D, RELOAD
            5'b0_0_01_0 : pwm0_reg_next = pwm_action(pwm0_cfg[ 9: 8], pwm0_reg);    // D, CMPY
            5'b0_0_10_0 : pwm0_reg_next = pwm_action(pwm0_cfg[11:10], pwm0_reg);    // D, CMPX
            default     : pwm0_reg_next = pwm0_reg;
        endcase        
    end

    always @* begin
        casez({tmr_dir, tmr_eq_zero, tmr_eq_cmpx, tmr_eq_cmpy, tmr_eq_reload})
            5'b?_1_00_0 : pwm1_reg_next = pwm_action(pwm1_cfg[ 1: 0], pwm1_reg);    // U/D, 0
            5'b1_0_10_0 : pwm1_reg_next = pwm_action(pwm1_cfg[ 3: 2], pwm1_reg);    // U, CMPX
            5'b1_0_01_0 : pwm1_reg_next = pwm_action(pwm1_cfg[ 5: 4], pwm1_reg);    // U, CMPY
            5'b?_0_00_1 : pwm1_reg_next = pwm_action(pwm1_cfg[ 7: 6], pwm1_reg);    // U/D, RELOAD
            5'b0_0_01_0 : pwm1_reg_next = pwm_action(pwm1_cfg[ 9: 8], pwm1_reg);    // D, CMPY
            5'b0_0_10_0 : pwm1_reg_next = pwm_action(pwm1_cfg[11:10], pwm1_reg);    // D, CMPX
            default     : pwm1_reg_next = pwm1_reg;
        endcase        
    end

    always @(posedge clk, negedge rst_n)
                                                    if(!rst_n) pwm0_reg <= 0;
                                                    else
        if(pwm0_en & tick)
            if(pwm_fault)
                pwm0_reg <= 0;
            else
                pwm0_reg <= pwm0_reg_next;

    always @(posedge clk, negedge rst_n)
                                                    if(!rst_n) pwm1_reg <= 0;
                                                    else
        if(pwm1_en & tick)
            if(pwm_fault)
                pwm1_reg <= 0;
            else
                pwm1_reg <= pwm1_reg_next;


    // Dead time insertion
    reg pwm0_delayed;
    reg [7:0] dly_cntr;
    always @(posedge clk, negedge rst_n)
                                                    if(!rst_n) dly_cntr <= 0;
                                                    else
        if(tick)
            if(dly_cntr == 0)
                dly_cntr <= pwm_dt;
            else 
                dly_cntr <= dly_cntr - 1;
                
    always @(posedge clk, negedge rst_n)
                                                    if(!rst_n) pwm0_delayed <= 0;
                                                    else
        if(tick)
            if(dly_cntr == 0)
                pwm0_delayed <= pwm0_reg;

    reg pwm0_w_dt, pwm1_w_dt;
    always @(posedge clk, negedge rst_n)
                                                    if(!rst_n) pwm0_w_dt <= 0;
                                                    else
        pwm0_w_dt <= pwm_dt_en ? (pwm0_delayed & pwm0_reg) : pwm0_reg;

    always @(posedge clk, negedge rst_n)
                                                    if(!rst_n) pwm1_w_dt <= 0;
                                                    else
        pwm1_w_dt <= pwm_dt_en ? (~pwm0_delayed & ~pwm0_reg) : pwm1_reg;
    
    // PWM Fault Handeling
    reg fault_clr_reg;
    always @(posedge clk, negedge rst_n)
                                                    if(!rst_n) fault_clr_reg <= 0;
                                                    else
        if(pwm_fault_clr == PWM_FAULT_CLR_C0)
            fault_clr_reg <= 1;
        else if(pwm_fault_clr == PWM_FAULT_CLR_C1)
            fault_clr_reg <= 0;
    always @(posedge clk, negedge rst_n)
                                                    if(!rst_n) fault_reg <= 0;
                                                    else
        if(pwm_fault)
            fault_reg <= 1;
        else if( fault_clr_reg & (pwm_fault_clr == PWM_FAULT_CLR_C1) )
            fault_reg <= 0;
            
    // Connect the outputs
    assign  tmr             =   tmr_reg;
    assign  pwm0            =   pwm0_w_dt ^ pwm0_inv && ~fault_reg && pwm0_en;
    assign  pwm1            =   pwm1_w_dt ^ pwm1_inv && ~fault_reg && pwm1_en;
    assign  matchx_flag     =   tmr_eq_cmpx;
    assign  matchy_flag     =   tmr_eq_cmpy;
    assign  timeout_flag    =   tmr_dir ? tmr_eq_reload : tmr_eq_zero;
    
endmodule
