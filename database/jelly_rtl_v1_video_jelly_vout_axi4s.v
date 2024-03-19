// ---------------------------------------------------------------------------
//  Jelly  -- The FPGA processing system
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  DVI transmitter
module jelly_vout_axi4s
        #(
            parameter   WIDTH = 24
        )
        (
            input   wire                reset,
            input   wire                clk,
            
            // slave AXI4-Stream (input)
            input   wire    [0:0]       s_axi4s_tuser,
            input   wire                s_axi4s_tlast,
            input   wire    [WIDTH-1:0] s_axi4s_tdata,
            input   wire                s_axi4s_tvalid,
            output  wire                s_axi4s_tready,
            
            // input timing
            input   wire                in_vsync,
            input   wire                in_hsync,
            input   wire                in_de,
            input   wire    [WIDTH-1:0] in_data,
            input   wire    [3:0]       in_ctl,
            
            // output
            output  wire                out_vsync,
            output  wire                out_hsync,
            output  wire                out_de,
            output  wire    [WIDTH-1:0] out_data,
            output  wire    [3:0]       out_ctl
        );
    
    // 入力をFF受け
    wire    [0:0]       axi4s_tuser;
    wire                axi4s_tlast;
    wire    [WIDTH-1:0] axi4s_tdata;
    wire                axi4s_tvalid;
    wire                axi4s_tready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (1 + 1 + WIDTH),
                .SLAVE_REGS     (1),
                .MASTER_REGS    (1)
            )
        i_pipeline_insert_ff
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1'b1),
                
                .s_data         ({
                                    s_axi4s_tuser,
                                    s_axi4s_tlast,
                                    s_axi4s_tdata
                                }),
                .s_valid        (s_axi4s_tvalid),
                .s_ready        (s_axi4s_tready),
                
                .m_data         ({
                                    axi4s_tuser,
                                    axi4s_tlast,
                                    axi4s_tdata
                                }),
                .m_valid        (axi4s_tvalid),
                .m_ready        (axi4s_tready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    // 垂直同期検地
    reg         prev_vsync;
    always @(posedge clk) begin
        prev_vsync <= in_vsync;
    end
    wire    sig_vsync = (prev_vsync != in_vsync);
    
    // フレームスタート
    wire    sig_frame_start = (axi4s_tvalid & axi4s_tuser & in_de);
    
    // ハンドシェーク(フレームスタートでaxi4sと待ち合わせ)
    reg         reg_busy;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_busy <= 1'b0;
        end
        else begin
            if ( !reg_busy ) begin
                if ( sig_frame_start  ) begin
                    reg_busy <= 1'b1;
                end
            end
            else begin
                if ( sig_vsync || sig_frame_start ) begin
                    reg_busy <= 1'b0;
                end
            end
        end
    end
    
    assign axi4s_tready = (in_de && ((!reg_busy && sig_frame_start) || (reg_busy && !sig_frame_start)))
                             || (!reg_busy && ~axi4s_tuser);
    
    
    // 出力
    reg                 reg_vsync;
    reg                 reg_hsync;
    reg                 reg_de;
    reg     [WIDTH-1:0] reg_data;
    reg     [3:0]       reg_ctl;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_vsync  <= 1'b0;
            reg_hsync  <= 1'b0;
            reg_de     <= 1'b0;
            reg_data   <= {WIDTH{1'b0}};
            reg_ctl    <= {4{1'b0}};
        end
        else begin
            reg_vsync  <= in_vsync;
            reg_hsync  <= in_hsync;
            reg_de     <= in_de;
            reg_ctl    <= in_ctl;
            reg_data   <= {WIDTH{1'b0}};
            if ( axi4s_tvalid && axi4s_tready ) begin
                reg_data <= axi4s_tdata;
            end
        end
    end
    
    assign out_vsync = reg_vsync;
    assign out_hsync = reg_hsync;
    assign out_de    = reg_de;
    assign out_data  = reg_data;
    assign out_ctl   = reg_ctl;
    
endmodule


`default_nettype wire


// end of file
