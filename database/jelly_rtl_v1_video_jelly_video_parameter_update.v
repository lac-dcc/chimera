// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// frame start を検出してパラメータ更新信号を出す
module jelly_video_parameter_update
        #(
            parameter   WB_ADR_WIDTH  = 8,
            parameter   WB_DAT_SIZE   = 2,    // 0:8bit, 1:16bit, 2:32bit, ...
            parameter   WB_DAT_WIDTH  = (8 << WB_DAT_SIZE),
            parameter   WB_SEL_WIDTH  = (WB_DAT_WIDTH / 8),
            
            parameter   TUSER_WIDTH   = 1,
            parameter   TDATA_WIDTH   = 32,
            
            parameter   CORE_ID       = 32'h527a_0101,
            parameter   CORE_VERSION  = 32'h0001_0000,
            parameter   INDEX_WIDTH   = 1,
            parameter   FRAME_WIDTH   = 32,
            
            parameter   INIT_CONTROL  = 2'b11,
            
            parameter   DELAY         = 1
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,

            output  wire                        out_update_req,
            
            input   wire                        s_wb_rst_i,
            input   wire                        s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o,
            
            input   wire    [TUSER_WIDTH-1:0]   s_axi4s_tuser,
            input   wire                        s_axi4s_tlast,
            input   wire    [TDATA_WIDTH-1:0]   s_axi4s_tdata,
            input   wire                        s_axi4s_tvalid,
            output  wire                        s_axi4s_tready,
            
            output  wire    [TUSER_WIDTH-1:0]   m_axi4s_tuser,
            output  wire                        m_axi4s_tlast,
            output  wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready
        );
    
    
    
    // ---------------------------------
    //  Register
    // ---------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID              = 8'h00;
    localparam  ADR_CORE_VERSION         = 8'h01;
    localparam  ADR_CONTROL              = 8'h04;
    localparam  ADR_INDEX                = 8'h05;
    localparam  ADR_FRAME_COUNT          = 8'h06;
    
    // handshake(master)
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
    
    // registers
    reg     [1:0]               reg_ctl_control;
    wire    [WB_DAT_WIDTH-1:0]  frame_count;
    
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
    
    always @(posedge s_wb_clk_i) begin
        if ( s_wb_rst_i ) begin
            reg_ctl_control <= INIT_CONTROL;
        end
        else begin
            if ( update_ack && !reg_ctl_control[1] ) begin
                reg_ctl_control[0] <= 1'b0;     // auto clear
            end
            
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_CONTROL:  reg_ctl_control <= reg_mask(reg_ctl_control, s_wb_dat_i, s_wb_sel_i);
                endcase
            end
        end
    end
    
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)      ? CORE_ID         :
                        (s_wb_adr_i == ADR_CORE_VERSION) ? CORE_VERSION    :
                        (s_wb_adr_i == ADR_CONTROL)      ? reg_ctl_control :
                        (s_wb_adr_i == ADR_INDEX)        ? ctl_index       :
                        (s_wb_adr_i == ADR_FRAME_COUNT)  ? frame_count     :
                        0;
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    
    
    // ---------------------------------
    //  Stream
    // ---------------------------------
    
    // detect frame start
    wire    update_trig = (s_axi4s_tvalid & s_axi4s_tready & s_axi4s_tuser[0]);
    
    // handshake(slave)
    wire    update_en;
    jelly_param_update_slave
            #(
                .INDEX_WIDTH    (INDEX_WIDTH)
            )
        i_param_update_slave
            (
                .reset          (~aresetn),
                .clk            (aclk),
                .cke            (aclken),
                
                .in_trigger     (update_trig),
                .in_update      (reg_ctl_control[0]),
                
                .out_update     (update_en),
                .out_index      (update_index)
            );
    
    // generate update signal
    reg                         reg_update_req;
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            reg_update_req <= 1'b0;
        end
        else if ( aclken ) begin
            reg_update_req <= (update_trig & update_en);
        end
    end
    
    assign out_update_req = reg_update_req;
    
    
    // frame counter
    generate
    if ( FRAME_WIDTH > 0 ) begin : blk_frame_count
        reg     [FRAME_WIDTH-1:0]   reg_frame_count;
        always @(posedge aclk) begin
            if ( ~aresetn ) begin
                reg_frame_count <= {FRAME_WIDTH{1'b0}};
            end
            else if ( aclken ) begin
                reg_frame_count <= reg_frame_count + update_trig;
            end
        end
        
        wire    [FRAME_WIDTH-1:0]   async_frame_count;
        jelly_data_async
                #(
                    .DATA_WIDTH     (FRAME_WIDTH)
                )
            i_data_async
                (
                    .s_reset        (~aresetn),
                    .s_clk          (aclken),
                    .s_data         (reg_frame_count),
                    .s_valid        (1'b1),
                    .s_ready        (),
                    
                    .m_reset        (s_wb_rst_i),
                    .m_clk          (s_wb_clk_i),
                    .m_data         (async_frame_count),
                    .m_valid        (),
                    .m_ready        (1'b1)
                );
        assign frame_count = async_frame_count;
    end
    else begin : blk_no_frame_count
        assign frame_count = 0;
    end
    endgenerate
    
    
    // video delay(信号が伝わるまで遅延追加を可能にしておく)
    jelly_stream_delay
            #(
                .LATENCY        (DELAY),
                .DATA_WIDTH     (TUSER_WIDTH + 1 + TDATA_WIDTH)
            )
        i_stream_delay
            (
                .reset          (~aresetn),
                .clk            (aclk),
                .cke            (aclken),
                
                .s_data         ({s_axi4s_tuser, s_axi4s_tlast, s_axi4s_tdata}),
                .s_valid        (s_axi4s_tvalid),
                .s_ready        (s_axi4s_tready),
                
                .m_data         ({m_axi4s_tuser, m_axi4s_tlast, m_axi4s_tdata}),
                .m_valid        (m_axi4s_tvalid),
                .m_ready        (m_axi4s_tready)
            );
    
endmodule


`default_nettype wire


// end of file
