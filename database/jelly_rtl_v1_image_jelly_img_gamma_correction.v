// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_gamma_correction
        #(
            parameter   COMPONENTS        = 3,
            parameter   USER_WIDTH        = 0,
            parameter   S_DATA_WIDTH      = 8,
            parameter   M_DATA_WIDTH      = 8,
            parameter   USE_VALID         = 0,
            parameter   RAM_TYPE          = "block",
            
            parameter   CORE_ID           = 32'h527a_2120,
            parameter   CORE_VERSION      = 32'h0001_0000,
            parameter   INDEX_WIDTH       = 1,
            
            parameter   WB_ADR_WIDTH      = 8,
            parameter   WB_DAT_WIDTH      = 32,
            parameter   WB_SEL_WIDTH      = (WB_DAT_WIDTH / 8),
            parameter   TABLE_ADR_WIDTH   = S_DATA_WIDTH,
            
            parameter   INIT_CTL_CONTROL  = 3'b000,
            parameter   INIT_PARAM_ENABLE = 0,
            
            parameter   USER_BITS         = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                    reset,
            input   wire                                    clk,
            input   wire                                    cke,
            
            input   wire                                    in_update_req,
            
            input   wire                                    s_wb_rst_i,
            input   wire                                    s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]              s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]              s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]              s_wb_dat_o,
            input   wire                                    s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]              s_wb_sel_i,
            input   wire                                    s_wb_stb_i,
            output  wire                                    s_wb_ack_o,
            
            input   wire                                    s_img_line_first,
            input   wire                                    s_img_line_last,
            input   wire                                    s_img_pixel_first,
            input   wire                                    s_img_pixel_last,
            input   wire                                    s_img_de,
            input   wire    [USER_BITS-1:0]                 s_img_user,
            input   wire    [COMPONENTS*S_DATA_WIDTH-1:0]   s_img_data,
            input   wire                                    s_img_valid,
            
            output  wire                                    m_img_line_first,
            output  wire                                    m_img_line_last,
            output  wire                                    m_img_pixel_first,
            output  wire                                    m_img_pixel_last,
            output  wire                                    m_img_de,
            output  wire    [USER_BITS-1:0]                 m_img_user,
            output  wire    [COMPONENTS*M_DATA_WIDTH-1:0]   m_img_data,
            output  wire                                    m_img_valid
        );
    
    
    // -------------------------------------
    //  registers domain
    // -------------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID        = 8'h00;
    localparam  ADR_CORE_VERSION   = 8'h01;
    localparam  ADR_CTL_CONTROL    = 8'h04;
    localparam  ADR_CTL_STATUS     = 8'h05;
    localparam  ADR_CTL_INDEX      = 8'h07;
    localparam  ADR_PARAM_ENABLE   = 8'h08;
    localparam  ADR_CURRENT_ENABLE = 8'h18;
    localparam  ADR_CFG_TBL_ADDR   = 8'h80;
    localparam  ADR_CFG_TBL_SIZE   = 8'h81;
    localparam  ADR_CFG_TBL_WIDTH  = 8'h82;
    
    // registers
    reg     [2:0]               reg_ctl_control;
    reg     [COMPONENTS:0]      reg_param_enable;
    
    // shadow registers(core domain)
    reg     [0:0]               reg_current_control;
    reg     [COMPONENTS-1:0]    reg_current_enable;
    
    
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
                endcase
            end
        end
    end
    
    // read
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)        ? CORE_ID                :
                        (s_wb_adr_i == ADR_CORE_VERSION)   ? CORE_VERSION           :
                        (s_wb_adr_i == ADR_CTL_CONTROL)    ? reg_ctl_control        :
                        (s_wb_adr_i == ADR_CTL_STATUS)     ? reg_current_control    :
                        (s_wb_adr_i == ADR_CTL_INDEX)      ? ctl_index              :
                        (s_wb_adr_i == ADR_PARAM_ENABLE)   ? reg_param_enable       :
                        (s_wb_adr_i == ADR_CURRENT_ENABLE) ? reg_current_enable     :
                        (s_wb_adr_i == ADR_CFG_TBL_ADDR)   ? (1 << TABLE_ADR_WIDTH) :
                        (s_wb_adr_i == ADR_CFG_TBL_SIZE)   ? (1 << S_DATA_WIDTH)    :
                        (s_wb_adr_i == ADR_CFG_TBL_WIDTH)  ? M_DATA_WIDTH           :
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
    genvar  i;
    generate
    for ( i = 0; i < COMPONENTS; i = i+1 ) begin : loop_cores
        jelly_img_gamma_correction_core
                #(
                    .S_DATA_WIDTH       (S_DATA_WIDTH),
                    .M_DATA_WIDTH       (M_DATA_WIDTH),
                    .RAM_TYPE           (RAM_TYPE)
                )
            i_img_gamma_correction_core
                (
                    .reset              (reset),
                    .clk                (clk),
                    .cke                (cke),
                    
                    .enable             (reg_current_enable[i]),
                    
                    .mem_clk            (s_wb_clk_i),
                    .mem_en             (s_wb_stb_i & s_wb_we_i & (s_wb_adr_i[WB_ADR_WIDTH-1:TABLE_ADR_WIDTH] == (i+1))),
                    .mem_addr           (s_wb_adr_i[S_DATA_WIDTH-1:0]),
                    .mem_din            (s_wb_dat_i[M_DATA_WIDTH-1:0]),
                    
                    .s_data             (s_img_data[i*S_DATA_WIDTH +: S_DATA_WIDTH]),
                    
                    .m_data             (m_img_data[i*M_DATA_WIDTH +: M_DATA_WIDTH])
                );
    end
    endgenerate
    
    
    jelly_img_delay
            #(
                .USER_WIDTH         (USER_BITS),
                .LATENCY            (3),
                .USE_VALID          (USE_VALID)
            )
        i_img_delay
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_img_line_first   (s_img_line_first),
                .s_img_line_last    (s_img_line_last),
                .s_img_pixel_first  (s_img_pixel_first),
                .s_img_pixel_last   (s_img_pixel_last),
                .s_img_de           (s_img_de),
                .s_img_user         (s_img_user),
                .s_img_valid        (s_img_valid),
                
                .m_img_line_first   (m_img_line_first),
                .m_img_line_last    (m_img_line_last),
                .m_img_pixel_first  (m_img_pixel_first),
                .m_img_pixel_last   (m_img_pixel_last),
                .m_img_de           (m_img_de),
                .m_img_user         (m_img_user),
                .m_img_valid        (m_img_valid)
            );
    
endmodule


`default_nettype wire


// end of file
