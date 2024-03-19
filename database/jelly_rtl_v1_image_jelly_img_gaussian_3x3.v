// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_gaussian_3x3
        #(
            parameter   NUM               = 1,
            parameter   USER_WIDTH        = 0,
            parameter   COMPONENTS        = 1,
            parameter   DATA_WIDTH        = 8,
            parameter   MAX_X_NUM         = 4096,
            parameter   RAM_TYPE          = "block",
            parameter   USE_VALID         = 0,
            
            parameter   CORE_ID           = 32'h527a_2310,
            parameter   CORE_VERSION      = 32'h0001_0000,
            parameter   INDEX_WIDTH       = 1,
            
            parameter   WB_ADR_WIDTH      = 8,
            parameter   WB_DAT_WIDTH      = 32,
            parameter   WB_SEL_WIDTH      = (WB_DAT_WIDTH / 8),
            
            parameter   INIT_CTL_CONTROL  = 3'b000,
            parameter   INIT_PARAM_ENABLE = 0,
            
            parameter   USER_BITS         = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
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
            
            input   wire                                s_img_line_first,
            input   wire                                s_img_line_last,
            input   wire                                s_img_pixel_first,
            input   wire                                s_img_pixel_last,
            input   wire                                s_img_de,
            input   wire    [USER_BITS-1:0]             s_img_user,
            input   wire    [COMPONENTS*DATA_WIDTH-1:0] s_img_data,
            input   wire                                s_img_valid,
            
            output  wire                                m_img_line_first,
            output  wire                                m_img_line_last,
            output  wire                                m_img_pixel_first,
            output  wire                                m_img_pixel_last,
            output  wire                                m_img_de,
            output  wire    [USER_BITS-1:0]             m_img_user,
            output  wire    [COMPONENTS*DATA_WIDTH-1:0] m_img_data,
            output  wire                                m_img_valid
        );
    
    genvar      i;
    
    
    // -------------------------------------
    //  registers domain
    // -------------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID              = 8'h00;
    localparam  ADR_CORE_VERSION         = 8'h01;
    localparam  ADR_CTL_CONTROL          = 8'h04;
    localparam  ADR_CTL_STATUS           = 8'h05;
    localparam  ADR_CTL_INDEX            = 8'h07;
    localparam  ADR_PARAM_ENABLE         = 8'h08;
    localparam  ADR_CURRENT_ENABLE       = 8'h18;
    
    // registers
    reg     [2:0]               reg_ctl_control;
    reg     [NUM-1:0]           reg_param_enable;
    
    // shadow registers(core domain)
    reg     [0:0]               reg_current_control;
    reg     [NUM-1:0]           reg_current_enable;
    
    
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
            reg_param_enable <= INIT_PARAM_ENABLE;
        end
        else begin
            if ( update_ack && !reg_ctl_control[2] ) begin
                reg_ctl_control[1] <= 1'b0;     // auto clear
            end
            
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_CTL_CONTROL:  reg_ctl_control  <= write_mask(reg_ctl_control,  s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_ENABLE: reg_param_enable <= write_mask(reg_param_enable, s_wb_dat_i, s_wb_sel_i);
                default: ;
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
                        (s_wb_adr_i == ADR_PARAM_ENABLE)   ? reg_param_enable    :
                        (s_wb_adr_i == ADR_CURRENT_ENABLE) ? reg_current_enable  :
                        {WB_DAT_WIDTH{1'b0}};
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    
    
    // -------------------------------------
    //  core domain
    // -------------------------------------
    
    // handshake with registers domain
    wire    update_trig = (s_img_valid & s_img_line_first & s_img_pixel_first);
    wire    update_en;
    
    jelly_param_update_slave
            #(
                .INDEX_WIDTH    (INDEX_WIDTH)
            )
        i_param_update_slave
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
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
            reg_current_enable  <= INIT_PARAM_ENABLE;
        end
        else begin
            if ( in_update_req ) begin
                reg_update_req <= 1'b1;
            end
            
            if ( cke ) begin
                if ( reg_update_req & update_trig & update_en ) begin
                    reg_update_req      <= 1'b0;
                    reg_current_control <= reg_ctl_control[0];
                    reg_current_enable  <= reg_ctl_control[0] ? reg_param_enable : 0;
                end
            end
        end
    end
    
    
    // cores
    wire    [(NUM+1)-1:0]                       img_line_first;
    wire    [(NUM+1)-1:0]                       img_line_last;
    wire    [(NUM+1)-1:0]                       img_pixel_first;
    wire    [(NUM+1)-1:0]                       img_pixel_last;
    wire    [(NUM+1)-1:0]                       img_de;
    wire    [(NUM+1)*USER_BITS-1:0]             img_user;
    wire    [(NUM+1)*COMPONENTS*DATA_WIDTH-1:0] img_data;
    wire    [(NUM+1)-1:0]                       img_valid;
    
    generate
    for ( i = 0; i < NUM; i = i+1 ) begin : loop_filter
        jelly_img_gaussian_3x3_core
                #(
                    .COMPONENTS         (COMPONENTS),
                    .USER_WIDTH         (USER_WIDTH),
                    .DATA_WIDTH         (DATA_WIDTH),
                    .OUT_DATA_WIDTH     (DATA_WIDTH),
                    .MAX_X_NUM          (MAX_X_NUM),
                    .RAM_TYPE           (RAM_TYPE),
                    .USE_VALID          (USE_VALID)
                )
            i_img_gaussian_3x3_core
                (
                    .reset              (reset),
                    .clk                (clk),
                    .cke                (cke),
                    
                    .enable             (reg_current_enable[i]),
                    
                    .s_img_line_first   (img_line_first [i]),
                    .s_img_line_last    (img_line_last  [i]),
                    .s_img_pixel_first  (img_pixel_first[i]),
                    .s_img_pixel_last   (img_pixel_last [i]),
                    .s_img_de           (img_de         [i]),
                    .s_img_user         (img_user       [i*USER_BITS             +: USER_BITS]),
                    .s_img_data         (img_data       [i*COMPONENTS*DATA_WIDTH +: COMPONENTS*DATA_WIDTH]),
                    .s_img_valid        (img_valid      [i]),
                    
                    .m_img_line_first   (img_line_first [i+1]),
                    .m_img_line_last    (img_line_last  [i+1]),
                    .m_img_pixel_first  (img_pixel_first[i+1]),
                    .m_img_pixel_last   (img_pixel_last [i+1]),
                    .m_img_de           (img_de         [i+1]),
                    .m_img_user         (img_user       [(i+1)*USER_BITS             +: USER_BITS]),
                    .m_img_data         (img_data       [(i+1)*COMPONENTS*DATA_WIDTH +: COMPONENTS*DATA_WIDTH]),
                    .m_img_valid        (img_valid      [i+1])
                );
    end
    endgenerate
    
    assign img_line_first [0]                                                = s_img_line_first;
    assign img_line_last  [0]                                                = s_img_line_last;
    assign img_pixel_first[0]                                                = s_img_pixel_first;
    assign img_pixel_last [0]                                                = s_img_pixel_last;
    assign img_de         [0]                                                = s_img_de;
    assign img_user       [0*USER_BITS             +: USER_BITS]             = s_img_user;
    assign img_data       [0*COMPONENTS*DATA_WIDTH +: COMPONENTS*DATA_WIDTH] = s_img_data;
    assign img_valid      [0]                                                = s_img_valid;
    
    assign m_img_line_first  = img_line_first [NUM];
    assign m_img_line_last   = img_line_last  [NUM];
    assign m_img_pixel_first = img_pixel_first[NUM];
    assign m_img_pixel_last  = img_pixel_last [NUM];
    assign m_img_de          = img_de         [NUM];
    assign m_img_user        = img_user       [NUM*USER_BITS             +: USER_BITS];
    assign m_img_data        = img_data       [NUM*COMPONENTS*DATA_WIDTH +: COMPONENTS*DATA_WIDTH];
    assign m_img_valid       = img_valid      [NUM];
    
    
endmodule


`default_nettype wire


// end of file
