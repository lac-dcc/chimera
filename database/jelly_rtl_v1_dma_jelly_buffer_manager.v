// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// バッファ管理
module jelly_buffer_manager
        #(
            parameter BUFFER_NUM   = 3,
            parameter READER_NUM   = 1,
            parameter ADDR_WIDTH   = 32,
            parameter REFCNT_WIDTH = 4,
            parameter INDEX_WIDTH  = BUFFER_NUM < 2 ? 1 :
                                     BUFFER_NUM < 4 ? 2 :
                                     BUFFER_NUM < 8 ? 3 : 4,
            
            parameter WB_ADR_WIDTH = 8,
            parameter WB_DAT_WIDTH = 32,
            parameter WB_SEL_WIDTH = (WB_DAT_WIDTH / 8),
            
            parameter CORE_ID      = 32'h527a_0004,
            parameter CORE_VERSION = 32'h0000_0000,
            
            parameter INIT_ADDR0   = 0,
            parameter INIT_ADDR1   = 0,
            parameter INIT_ADDR2   = 0,
            parameter INIT_ADDR3   = 0,
            parameter INIT_ADDR4   = 0,
            parameter INIT_ADDR5   = 0,
            parameter INIT_ADDR6   = 0,
            parameter INIT_ADDR7   = 0,
            parameter INIT_ADDR8   = 0,
            parameter INIT_ADDR9   = 0
        )
        (
            input   wire                                    s_wb_rst_i,
            input   wire                                    s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]              s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]              s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]              s_wb_dat_o,
            input   wire                                    s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]              s_wb_sel_i,
            input   wire                                    s_wb_stb_i,
            output  wire                                    s_wb_ack_o,
            
            input   wire                                    writer_request,
            input   wire                                    writer_release,
            output  wire    [ADDR_WIDTH-1:0]                writer_addr,
            output  wire    [INDEX_WIDTH-1:0]               writer_index,
            
            input   wire    [READER_NUM-1:0]                reader_request,
            input   wire    [READER_NUM-1:0]                reader_release,
            output  wire    [READER_NUM*ADDR_WIDTH-1:0]     reader_addr,
            output  wire    [READER_NUM*INDEX_WIDTH-1:0]    reader_index,
            
            output  wire    [ADDR_WIDTH-1:0]                newest_addr,
            output  wire    [INDEX_WIDTH-1:0]               newest_index,
            
            output  wire    [BUFFER_NUM*REFCNT_WIDTH-1:0]   status_refcnt
        );
    
    
    
    // ---------------------------------
    //  Register
    // ---------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID          = 8'h00;
    localparam  ADR_CORE_VERSION     = 8'h01;
    localparam  ADR_CORE_CONFIG      = 8'h03;
    localparam  ADR_NEWEST_INDEX     = 8'h20;
    localparam  ADR_WRITER_INDEX     = 8'h21;
    localparam  ADR_BUFFER0_ADDR     = 8'h40;
    localparam  ADR_BUFFER0_REFCNT   = 8'h80;
    
    // registers
    integer                                 i;
    reg     [BUFFER_NUM*ADDR_WIDTH-1:0]     reg_addr;
    
    function [WB_DAT_WIDTH-1:0] write_mask(
                                        input [WB_DAT_WIDTH-1:0] org,
                                        input [WB_DAT_WIDTH-1:0] dat,
                                        input [WB_SEL_WIDTH-1:0] sel
                                    );
    integer i;
    begin
        for ( i = 0; i < WB_DAT_WIDTH; i = i+1 ) begin
            write_mask[i] = sel[i/8] ? dat[i] : org[i];
        end
    end
    endfunction
    
    
    always @(posedge s_wb_clk_i ) begin
        if ( s_wb_rst_i ) begin
            if ( BUFFER_NUM > 0 ) reg_addr[0*ADDR_WIDTH +: ADDR_WIDTH] <= INIT_ADDR0;
            if ( BUFFER_NUM > 1 ) reg_addr[1*ADDR_WIDTH +: ADDR_WIDTH] <= INIT_ADDR1;
            if ( BUFFER_NUM > 2 ) reg_addr[2*ADDR_WIDTH +: ADDR_WIDTH] <= INIT_ADDR2;
            if ( BUFFER_NUM > 3 ) reg_addr[3*ADDR_WIDTH +: ADDR_WIDTH] <= INIT_ADDR3;
            if ( BUFFER_NUM > 4 ) reg_addr[4*ADDR_WIDTH +: ADDR_WIDTH] <= INIT_ADDR4;
            if ( BUFFER_NUM > 5 ) reg_addr[5*ADDR_WIDTH +: ADDR_WIDTH] <= INIT_ADDR5;
            if ( BUFFER_NUM > 6 ) reg_addr[6*ADDR_WIDTH +: ADDR_WIDTH] <= INIT_ADDR6;
            if ( BUFFER_NUM > 7 ) reg_addr[7*ADDR_WIDTH +: ADDR_WIDTH] <= INIT_ADDR7;
            if ( BUFFER_NUM > 8 ) reg_addr[8*ADDR_WIDTH +: ADDR_WIDTH] <= INIT_ADDR8;
            if ( BUFFER_NUM > 9 ) reg_addr[9*ADDR_WIDTH +: ADDR_WIDTH] <= INIT_ADDR9;
        end
        else begin
            // register write
            if ( s_wb_stb_i && s_wb_we_i ) begin
                for ( i = 0; i < BUFFER_NUM; i = i+1 ) begin
                    if ( s_wb_adr_i == ADR_BUFFER0_ADDR + i ) begin
                        reg_addr[i*ADDR_WIDTH +: ADDR_WIDTH] <= write_mask(reg_addr[i*ADDR_WIDTH +: ADDR_WIDTH], s_wb_dat_i, s_wb_sel_i);
                    end
                end
            end
        end
    end
    
    reg     [WB_DAT_WIDTH-1:0]  wb_dat_o;
    always @* begin
        wb_dat_o = {WB_DAT_WIDTH{1'b0}};
        
        case ( s_wb_adr_i )
        ADR_CORE_ID:        wb_dat_o = CORE_ID;
        ADR_CORE_VERSION:   wb_dat_o = CORE_VERSION;
        ADR_CORE_CONFIG:    wb_dat_o = BUFFER_NUM;
        ADR_NEWEST_INDEX:   wb_dat_o = newest_index;
        ADR_WRITER_INDEX:   wb_dat_o = writer_index;
        endcase
        
        for ( i = 0; i < BUFFER_NUM; i = i+1 ) begin
            if ( s_wb_adr_i == ADR_BUFFER0_ADDR + i ) begin
                wb_dat_o = reg_addr[i*ADDR_WIDTH +: ADDR_WIDTH];
            end
            if ( s_wb_adr_i == ADR_BUFFER0_REFCNT + i ) begin
                wb_dat_o = status_refcnt[i*REFCNT_WIDTH +: REFCNT_WIDTH];
            end
        end
    end
    
    assign s_wb_dat_o = wb_dat_o;
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    // バッファ割り当てコア
    jelly_buffer_arbiter
            #(
                .BUFFER_NUM     (BUFFER_NUM),
                .READER_NUM     (READER_NUM),
                .ADDR_WIDTH     (ADDR_WIDTH),
                .REFCNT_WIDTH   (REFCNT_WIDTH),
                .INDEX_WIDTH    (INDEX_WIDTH)
            )
        i_buffer_arbiter
            (
                .reset          (s_wb_rst_i),
                .clk            (s_wb_clk_i),
                .cke            (1'b1),
                
                .param_buf_addr (reg_addr),
                
                .writer_request (writer_request),
                .writer_release (writer_release),
                .writer_addr    (writer_addr),
                .writer_index   (writer_index),
                
                .reader_request (reader_request),
                .reader_release (reader_release),
                .reader_addr    (reader_addr),
                .reader_index   (reader_index),
                
                .newest_addr    (newest_addr),
                .newest_index   (newest_index),
                
                .status_refcnt  (status_refcnt)
            );
    
    
endmodule


`default_nettype wire


// end of file
