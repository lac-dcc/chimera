// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// Jelly bus to WISHBONE bus bridge
module jelly_jbus_to_wishbone
        #(
            parameter                           ADDR_WIDTH   = 30,
            parameter                           DATA_SIZE    = 2,               // 0:8bit, 1:16bit, 2:32bit ...
            parameter                           DATA_WIDTH   = (8 << DATA_SIZE),
            parameter                           SEL_WIDTH    = (DATA_WIDTH / 8)
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            
            // slave port (jelly bus)
            input   wire                        s_jbus_en,
            input   wire    [ADDR_WIDTH-1:0]    s_jbus_addr,
            input   wire    [DATA_WIDTH-1:0]    s_jbus_wdata,
            output  wire    [DATA_WIDTH-1:0]    s_jbus_rdata,
            input   wire                        s_jbus_we,
            input   wire    [SEL_WIDTH-1:0]     s_jbus_sel,
            input   wire                        s_jbus_valid,
            output  wire                        s_jbus_ready,
            
            // master port (WISHBONE bus)
            output  wire    [ADDR_WIDTH-1:0]    m_wb_adr_o,
            input   wire    [DATA_WIDTH-1:0]    m_wb_dat_i,
            output  wire    [DATA_WIDTH-1:0]    m_wb_dat_o,
            output  wire                        m_wb_we_o,
            output  wire    [SEL_WIDTH-1:0]     m_wb_sel_o,
            output  wire                        m_wb_stb_o,
            input   wire                        m_wb_ack_i
        );

    reg                         reg_buf_en;
    reg     [DATA_WIDTH-1:0]    reg_buf_rdata;
    reg     [DATA_WIDTH-1:0]    reg_rdata;
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_buf_en    <= 1'b0;
            reg_buf_rdata <= {DATA_WIDTH{1'bx}};
        end
        else begin
            if ( s_jbus_en ) begin
                reg_rdata  <= reg_buf_en ? reg_buf_rdata : m_wb_dat_i;
                reg_buf_en <= 1'b0;
            end
            else begin
                // 無効中に来たデータを保存
                if ( m_wb_stb_o & m_wb_ack_i ) begin
                    reg_buf_en <= 1'b1;
                end
            end
            
            if ( !reg_buf_en ) begin
                reg_buf_rdata <= m_wb_dat_i;
            end
        end
    end
    
    assign m_wb_adr_o   = s_jbus_addr;
    assign m_wb_dat_o   = s_jbus_wdata;
    assign m_wb_we_o    = s_jbus_we;
    assign m_wb_sel_o   = s_jbus_sel;
    assign m_wb_stb_o   = s_jbus_valid & !reg_buf_en;
    
    assign s_jbus_rdata = reg_rdata;
    assign s_jbus_ready = !m_wb_stb_o | m_wb_ack_i;
    
endmodule



`default_nettype wire


// end of file
