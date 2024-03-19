// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// バッファ割り当て
module jelly_buffer_allocator
        #(
            parameter NUM          = 1,
            parameter ADDR_WIDTH   = 32,
            parameter INDEX_WIDTH  = 4,
            
            parameter WB_ADR_WIDTH = 8,
            parameter WB_DAT_WIDTH = 32,
            parameter WB_SEL_WIDTH = (WB_DAT_WIDTH / 8),
            
            parameter CORE_ID      = 32'h527a_0008,
            parameter CORE_VERSION = 32'h0000_0000
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
            
            output  wire    [NUM-1:0]                       buffer_request,
            output  wire    [NUM-1:0]                       buffer_release,
            input   wire    [NUM*ADDR_WIDTH-1:0]            buffer_addr,
            input   wire    [NUM*INDEX_WIDTH-1:0]           buffer_index
        );
    
    genvar                      i;
    integer                     j;
    
    
    // ---------------------------------
    //  Register
    // ---------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID          = 8'h00;
    localparam  ADR_CORE_VERSION     = 8'h01;
    localparam  ADR_CORE_CONFIG      = 8'h03;
    localparam  ADR_BUFFER0_REQUEST  = 8'h20;
    localparam  ADR_BUFFER0_RELEASE  = 8'h21;
    localparam  ADR_BUFFER0_ADDR     = 8'h22;
    localparam  ADR_BUFFER0_INDEX    = 8'h23;
    
    reg         [NUM-1:0]       reg_request;
    reg         [NUM-1:0]       reg_release;
    
    always @(posedge s_wb_clk_i) begin
        if ( s_wb_rst_i ) begin
            reg_request <= {NUM{1'b0}};
            reg_release <= {NUM{1'b0}};
        end
        else begin
            reg_request <= {NUM{1'b0}};
            reg_release <= {NUM{1'b0}};
            if ( s_wb_stb_i && s_wb_we_i && s_wb_sel_i[0] ) begin
                for ( j = 0; j < NUM; j = j+1 ) begin
                    if ( s_wb_adr_i == ADR_BUFFER0_REQUEST + 4*j )  reg_request[j] <= 1'b1;
                    if ( s_wb_adr_i == ADR_BUFFER0_RELEASE + 4*j )  reg_release[j] <= 1'b1;
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
        ADR_CORE_CONFIG:    wb_dat_o = NUM;
        endcase
        
        for ( j = 0; j < NUM; j = j+1 ) begin
            if ( s_wb_adr_i == ADR_BUFFER0_ADDR  + 4*j )    wb_dat_o = buffer_addr [j*ADDR_WIDTH  +: ADDR_WIDTH];
            if ( s_wb_adr_i == ADR_BUFFER0_INDEX + 4*j )    wb_dat_o = buffer_index[j*INDEX_WIDTH +: INDEX_WIDTH];
        end
    end
    
    assign s_wb_dat_o = wb_dat_o;
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    assign buffer_request = reg_request;
    assign buffer_release = reg_release;
    
    
endmodule


`default_nettype wire


// end of file
