// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// USE_VALID で valid 信号を使うと、信号は増えるが初期化が減る

module jelly_axi4s_to_img
        #(
            parameter   TUSER_WIDTH  = 1,
            parameter   TDATA_WIDTH  = 8,
            parameter   IMG_Y_WIDTH  = 9,
            parameter   IMG_Y_NUM    = 480,
            parameter   IMG_CKE_BUFG = 0,
            parameter   USE_VALID    = 0,
            
            parameter   USER_WIDTH   = (TUSER_WIDTH > 1) ? (TUSER_WIDTH - 1) : 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            input   wire    [IMG_Y_WIDTH-1:0]           param_y_num,
            
            input   wire    [TUSER_WIDTH-1:0]           s_axi4s_tuser,
            input   wire                                s_axi4s_tlast,
            input   wire    [TDATA_WIDTH-1:0]           s_axi4s_tdata,
            input   wire                                s_axi4s_tvalid,
            output  wire                                s_axi4s_tready,
            
            output  wire                                m_img_cke,
            output  wire                                m_img_line_first,
            output  wire                                m_img_line_last,
            output  wire                                m_img_pixel_first,
            output  wire                                m_img_pixel_last,
            output  wire                                m_img_de,
            output  wire    [USER_WIDTH-1:0]            m_img_user,
            output  wire    [TDATA_WIDTH-1:0]           m_img_data,
            output  wire                                m_img_valid
        );
    
    
    reg                         reg_cke;
    reg                         reg_line_first;
    reg                         reg_line_last;
    reg                         reg_pixel_first;
    reg                         reg_pixel_last;
    reg                         reg_de;
    reg     [USER_WIDTH-1:0]    reg_user;
    reg     [TDATA_WIDTH-1:0]   reg_data;
    reg                         reg_valid;
    reg     [IMG_Y_WIDTH-1:0]   reg_y_count;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_cke         <= 1'b0;
            reg_line_first  <= 1'b0;
            reg_line_last   <= 1'b0;
            reg_pixel_first <= 1'b0;
            reg_pixel_last  <= 1'b0;
            reg_de          <= 1'b0;
            reg_user        <= {USER_WIDTH{1'bx}};
            reg_data        <= {TDATA_WIDTH{1'bx}};
            reg_valid       <= 1'b0;
            reg_y_count     <= {IMG_Y_WIDTH{1'bx}};
        end
        else begin
            reg_cke <= (cke && (s_axi4s_tvalid && s_axi4s_tready));
            
            if ( s_axi4s_tvalid && s_axi4s_tready ) begin
                reg_pixel_first <= 1'b0;
                if ( reg_pixel_last ) begin
                    reg_line_first  <= 1'b0;
                    reg_line_last   <= 1'b0;
                    reg_pixel_first <= 1'b1;
                    reg_y_count     <= reg_y_count + 1;
                    if ( (reg_y_count + 1'b1) == (param_y_num - 1'b1) ) begin
                        reg_line_last <= 1'b1;
                    end
                    
                    if ( reg_line_last ) begin
                        reg_de <= 1'b0;
                    end
                end
                
                if ( s_axi4s_tuser[0] ) begin
                    reg_line_first  <= 1'b1;
                    reg_pixel_first <= 1'b1;
                    reg_y_count     <= {IMG_Y_WIDTH{1'b0}};
                    reg_de          <= 1'b1;
                end
                
                reg_pixel_last <= s_axi4s_tlast;
                reg_user       <= (s_axi4s_tuser >> 1);
                reg_data       <= s_axi4s_tdata;
            end
            
            reg_valid <= 1'b1;
        end
    end
    
    // 仕組み上 cke の fanout が大きくなるのでBUFGを使えるようにしておく
`ifndef VERILATOR
    generate
    if ( IMG_CKE_BUFG ) begin
        BUFG
            i_bufg
                (
                    .I  (reg_cke),
                    .O  (m_img_cke)
                );
    end
    else begin
        assign m_img_cke = reg_cke;
    end
    endgenerate
`else
    assign m_img_cke = reg_cke;
`endif

    assign s_axi4s_tready    = cke;
    
    assign m_img_line_first  = reg_line_first;
    assign m_img_line_last   = reg_line_last;
    assign m_img_pixel_first = reg_pixel_first;
    assign m_img_pixel_last  = reg_pixel_last;
    assign m_img_de          = reg_de;
    assign m_img_user        = reg_user;
    assign m_img_data        = reg_data;
    assign m_img_valid       = reg_valid;
    
endmodule


`default_nettype wire


// end of file
