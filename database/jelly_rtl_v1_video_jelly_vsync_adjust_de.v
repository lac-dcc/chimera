// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_vsync_adjust_de
        #(
            parameter   USER_WIDTH        = 0,
            parameter   H_COUNT_WIDTH     = 14,
            parameter   V_COUNT_WIDTH     = 14,
            
            parameter   CORE_ID           = 32'h527a_1152,
            parameter   CORE_VERSION      = 32'h0001_0000,
            parameter   INDEX_WIDTH       = 1,
            
            parameter   WB_ADR_WIDTH      = 8,
            parameter   WB_DAT_WIDTH      = 32,
            parameter   WB_SEL_WIDTH      = (WB_DAT_WIDTH / 8),
            
            parameter   INIT_CTL_CONTROL  = 2'b00,
            parameter   INIT_PARAM_HSIZE  = 1920-1,
            parameter   INIT_PARAM_VSIZE  = 1080-1,
            parameter   INIT_PARAM_HSTART = 0,
            parameter   INIT_PARAM_VSTART = 0,
            parameter   INIT_PARAM_HPOL   = 1,
            parameter   INIT_PARAM_VPOL   = 1,
            
            parameter   USER_BITS         = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            
            input   wire                                in_update_req,
            
            input   wire                                s_wb_rst_i,
            input   wire                                s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]          s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_o,
            input   wire                                s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]          s_wb_sel_i,
            input   wire                                s_wb_stb_i,
            output  wire                                s_wb_ack_o,
            
            input   wire                                in_hsync,
            input   wire                                in_vsync,
            input   wire    [USER_BITS-1:0]             in_user,
            
            output  wire                                out_hsync,
            output  wire                                out_vsync,
            output  wire                                out_de,
            output  wire    [USER_BITS-1:0]             out_user
        );
    
    
    // -------------------------------------
    //  registers domain
    // -------------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID              = 8'h00;
    localparam  ADR_CORE_VERSION         = 8'h01;
    localparam  ADR_CTL_CONTROL          = 8'h04;
    localparam  ADR_CTL_STATUS           = 8'h05;
    localparam  ADR_CTL_INDEX            = 8'h07;
    localparam  ADR_PARAM_HSIZE          = 8'h08;
    localparam  ADR_PARAM_VSIZE          = 8'h09;
    localparam  ADR_PARAM_HSTART         = 8'h0a;
    localparam  ADR_PARAM_VSTART         = 8'h0b;
    localparam  ADR_PARAM_HPOL           = 8'h0c;
    localparam  ADR_PARAM_VPOL           = 8'h0d;
    localparam  ADR_CURRENT_HSIZE        = 8'h18;
    localparam  ADR_CURRENT_VSIZE        = 8'h19;
    localparam  ADR_CURRENT_HSTART       = 8'h1a;
    localparam  ADR_CURRENT_VSTART       = 8'h1b;
    
    // registers
    reg     [1:0]               reg_ctl_control;
    reg     [H_COUNT_WIDTH-1:0] reg_param_hsize;
    reg     [V_COUNT_WIDTH-1:0] reg_param_vsize;
    reg     [H_COUNT_WIDTH-1:0] reg_param_hstart;
    reg     [V_COUNT_WIDTH-1:0] reg_param_vstart;
    reg                         reg_param_vpol;
    reg                         reg_param_hpol;
    
    // shadow registers(core domain)
    reg     [0:0]               reg_current_control;
    reg     [H_COUNT_WIDTH-1:0] reg_current_hsize;
    reg     [V_COUNT_WIDTH-1:0] reg_current_vsize;
    reg     [H_COUNT_WIDTH-1:0] reg_current_hstart;
    reg     [V_COUNT_WIDTH-1:0] reg_current_vstart;
    reg                         reg_current_vpol;
    reg                         reg_current_hpol;
    
    
    // handshake with core domain
    wire    [INDEX_WIDTH-1:0]   update_index;
    wire                        update_ack;
    wire    [INDEX_WIDTH-1:0]   ctl_index;
    
    jelly_param_update_master
            #(
                .INDEX_WIDTH    (INDEX_WIDTH)
            )
        i_param_update_master
            (
                .reset          (s_wb_rst_i),
                .clk            (s_wb_clk_i),
                .cke            (1'b1),
                .in_index       (update_index),
                .out_ack        (update_ack),
                .out_index      (ctl_index)
            );
    
    // write mask
    function [WB_DAT_WIDTH-1:0] write_mask(
                                        input [WB_DAT_WIDTH-1:0] org,
                                        input [WB_DAT_WIDTH-1:0] wdat,
                                        input [WB_SEL_WIDTH-1:0] msk
                                    );
    integer i;
    begin
        for ( i = 0; i < WB_DAT_WIDTH; i = i+1 ) begin
            write_mask[i] = msk[i/8] ? wdat[i] : org[i];
        end
    end
    endfunction
    
    // registers control
    always @(posedge s_wb_clk_i) begin
        if ( s_wb_rst_i ) begin
            reg_ctl_control  <= INIT_CTL_CONTROL;
            reg_param_hsize  <= INIT_PARAM_HSIZE;
            reg_param_vsize  <= INIT_PARAM_VSIZE;
            reg_param_hstart <= INIT_PARAM_HSTART;
            reg_param_vstart <= INIT_PARAM_VSTART;
            reg_param_hpol   <= INIT_PARAM_HPOL;
            reg_param_vpol   <= INIT_PARAM_VPOL;
        end
        else begin
            if ( update_ack ) begin
                reg_ctl_control[1] <= 1'b0;     // auto clear
            end
            
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_CTL_CONTROL:  reg_ctl_control  <= write_mask(reg_ctl_control,  s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_HSIZE:  reg_param_hsize  <= write_mask(reg_param_hsize,  s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_VSIZE:  reg_param_vsize  <= write_mask(reg_param_vsize,  s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_HSTART: reg_param_hstart <= write_mask(reg_param_hstart, s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_VSTART: reg_param_vstart <= write_mask(reg_param_vstart, s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_HPOL:   reg_param_hpol   <= write_mask(reg_param_hpol,   s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_VPOL:   reg_param_vpol   <= write_mask(reg_param_vpol,   s_wb_dat_i, s_wb_sel_i);
                endcase
            end
        end
    end
    
    // read
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)        ? CORE_ID             :
                        (s_wb_adr_i == ADR_CORE_VERSION)   ? CORE_VERSION        :
                        (s_wb_adr_i == ADR_CTL_CONTROL)    ? reg_ctl_control     :
                        (s_wb_adr_i == ADR_CTL_STATUS)     ? reg_current_control :
                        (s_wb_adr_i == ADR_CTL_INDEX)      ? ctl_index           :
                        (s_wb_adr_i == ADR_PARAM_HSIZE)    ? reg_param_hsize     :
                        (s_wb_adr_i == ADR_PARAM_VSIZE)    ? reg_param_vsize     :
                        (s_wb_adr_i == ADR_PARAM_HSTART)   ? reg_param_hstart    :
                        (s_wb_adr_i == ADR_PARAM_VSTART)   ? reg_param_vstart    :
                        (s_wb_adr_i == ADR_PARAM_HPOL)     ? reg_param_vpol      :
                        (s_wb_adr_i == ADR_PARAM_VPOL)     ? reg_param_hpol      :
                        (s_wb_adr_i == ADR_CURRENT_HSIZE)  ? reg_current_hsize   :
                        (s_wb_adr_i == ADR_CURRENT_VSIZE)  ? reg_current_vsize   :
                        (s_wb_adr_i == ADR_CURRENT_HSTART) ? reg_current_hstart  :
                        (s_wb_adr_i == ADR_CURRENT_VSTART) ? reg_current_vstart  :
                        {WB_DAT_WIDTH{1'b0}};
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    // -------------------------------------
    //  core domain
    // -------------------------------------
    
    // handshake with registers domain
    wire    update_trig;
    wire    update_en;
    
    jelly_param_update_slave
            #(
                .INDEX_WIDTH    (INDEX_WIDTH)
            )
        i_param_update_slave
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1'b1),
                
                .in_trigger     (update_trig),
                .in_update      (reg_ctl_control[1]),
                
                .out_update     (update_en),
                .out_index      (update_index)
            );
    
    // wait for frame start to update parameters
    reg                 reg_update_req;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_update_req      <= 1'b0;
            reg_current_control <= INIT_CTL_CONTROL;
            reg_current_hsize   <= INIT_PARAM_HSIZE;
            reg_current_vsize   <= INIT_PARAM_VSIZE;
            reg_current_hstart  <= INIT_PARAM_HSTART;
            reg_current_vstart  <= INIT_PARAM_VSTART;
            reg_current_hpol    <= INIT_PARAM_HPOL;
            reg_current_vpol    <= INIT_PARAM_VPOL;
        end
        else begin
            reg_current_hpol    <= reg_param_hpol;
            reg_current_vpol    <= reg_param_vpol;
            
            if ( in_update_req ) begin
                reg_update_req <= 1'b1;
            end
            
            if ( update_trig ) begin
                reg_current_control[0] <= reg_ctl_control[0];
            end
            
            if ( reg_update_req & update_trig & update_en ) begin
                reg_update_req      <= 1'b0;
                
                reg_current_hsize   <= reg_param_hsize;
                reg_current_vsize   <= reg_param_vsize;
                reg_current_hstart  <= reg_param_hstart;
                reg_current_vstart  <= reg_param_vstart;
                reg_current_hpol    <= reg_param_hpol;
                reg_current_vpol    <= reg_param_vpol;
            end
        end
    end
    
    
    // core
    jelly_vsync_adjust_de_core
            #(
                .USER_WIDTH         (USER_WIDTH   ),
                .H_COUNT_WIDTH      (H_COUNT_WIDTH),
                .V_COUNT_WIDTH      (V_COUNT_WIDTH)
            )
        i_vsync_adjust_de_core
            (
                .reset              (reset),
                .clk                (clk),
                
                .update_trig        (update_trig),
                
                .enable             (reg_current_control),
                .busy               (),
                
                .param_hsize        (reg_current_hsize),
                .param_vsize        (reg_current_vsize),
                .param_hstart       (reg_current_hstart),
                .param_vstart       (reg_current_vstart),
                .param_vpol         (reg_current_vpol),
                .param_hpol         (reg_current_hpol),
                
                .in_vsync           (in_vsync),
                .in_hsync           (in_hsync),
                .in_user            (in_user),
                
                .out_vsync          (out_vsync),
                .out_hsync          (out_hsync),
                .out_de             (out_de),
                .out_user           (out_user)
            );
    
    
    
endmodule


`default_nettype wire


// end of file
