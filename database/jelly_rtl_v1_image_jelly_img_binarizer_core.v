// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_binarizer_core
        #(
            parameter   INDEX_WIDTH   = 1,
            
            parameter   USER_WIDTH    = 0,
            parameter   DATA_WIDTH    = 8,
            parameter   BINARY_WIDTH  = 1,
            
            parameter   USER_BITS     = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            ctl_update,
            output  wire    [INDEX_WIDTH-1:0]       ctl_index,
            
            input   wire                            param_enable,
            input   wire    [DATA_WIDTH-1:0]        param_th,
            input   wire    [BINARY_WIDTH-1:0]      param_val0,
            input   wire    [BINARY_WIDTH-1:0]      param_val1,
            input   wire                            param_inv,
            
            output  wire                            current_enable,
            output  wire    [DATA_WIDTH-1:0]        current_th,
            output  wire    [BINARY_WIDTH-1:0]      current_val0,
            output  wire    [BINARY_WIDTH-1:0]      current_val1,
            output  wire                            current_inv,
            
            
            input   wire                            s_img_line_first,
            input   wire                            s_img_line_last,
            input   wire                            s_img_pixel_first,
            input   wire                            s_img_pixel_last,
            input   wire                            s_img_de,
            input   wire    [USER_BITS-1:0]         s_img_user,
            input   wire    [DATA_WIDTH-1:0]        s_img_data,
            input   wire                            s_img_valid,
            
            output  wire                            m_img_line_first,
            output  wire                            m_img_line_last,
            output  wire                            m_img_pixel_first,
            output  wire                            m_img_pixel_last,
            output  wire                            m_img_de,
            output  wire    [USER_BITS-1:0]         m_img_user,
            output  wire    [DATA_WIDTH-1:0]        m_img_data,
            output  wire    [BINARY_WIDTH-1:0]      m_img_binary,
            output  wire                            m_img_valid
        );
    
    // parameter latch
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
                .in_update      (ctl_update),
                
                .out_update     (update_en),
                .out_index      (ctl_index)
            );
    
    
    reg                             reg_param_enable;
    reg    [DATA_WIDTH-1:0]         reg_param_th;
    reg    [BINARY_WIDTH-1:0]       reg_param_val0;
    reg    [BINARY_WIDTH-1:0]       reg_param_val1;
    reg                             reg_param_inv;
    always @(posedge clk) begin
        if ( cke ) begin
            if ( update_trig & update_en ) begin
                reg_param_enable <= param_enable;
                reg_param_th     <= param_th;
                reg_param_val0   <= param_val0;
                reg_param_val1   <= param_val1;
                reg_param_inv    <= param_inv;
            end
        end
    end
    
    assign current_enable = reg_param_enable;
    assign current_th     = reg_param_th;
    assign current_val0   = reg_param_val0;
    assign current_val1   = reg_param_val1;
    assign current_inv    = reg_param_inv;
    
    
    
    // process
    reg                             st0_line_first;
    reg                             st0_line_last;
    reg                             st0_pixel_first;
    reg                             st0_pixel_last;
    reg                             st0_de;
    reg     [USER_BITS-1:0]         st0_user;
    reg     [DATA_WIDTH-1:0]        st0_data;
    reg                             st0_valid;
    
    reg                             st1_line_first;
    reg                             st1_line_last;
    reg                             st1_pixel_first;
    reg                             st1_pixel_last;
    reg                             st1_de;
    reg     [USER_BITS-1:0]         st1_user;
    reg     [DATA_WIDTH-1:0]        st1_data;
    reg                             st1_cmp;
    reg                             st1_valid;
    
    reg                             st2_line_first;
    reg                             st2_line_last;
    reg                             st2_pixel_first;
    reg                             st2_pixel_last;
    reg                             st2_de;
    reg     [USER_BITS-1:0]         st2_user;
    reg     [DATA_WIDTH-1:0]        st2_data;
    reg     [BINARY_WIDTH-1:0]      st2_binary;
    reg                             st2_valid;
    
    reg                             st3_line_first;
    reg                             st3_line_last;
    reg                             st3_pixel_first;
    reg                             st3_pixel_last;
    reg                             st3_de;
    reg     [USER_BITS-1:0]         st3_user;
    reg     [DATA_WIDTH-1:0]        st3_data;
    reg     [BINARY_WIDTH-1:0]      st3_binary;
    reg                             st3_valid;
    
    always @(posedge clk) begin
        if ( cke ) begin
            // stage0
            st0_line_first  <= s_img_line_first;
            st0_line_last   <= s_img_line_last;
            st0_pixel_first <= s_img_pixel_first;
            st0_pixel_last  <= s_img_pixel_last;
            st0_de          <= s_img_de;
            st0_user        <= s_img_user;
            st0_data        <= s_img_data;
            
            // stage1
            st1_line_first  <= st0_line_first;
            st1_line_last   <= st0_line_last;
            st1_pixel_first <= st0_pixel_first;
            st1_pixel_last  <= st0_pixel_last;
            st1_de          <= st0_de;
            st1_user        <= st0_user;
            st1_data        <= st0_data;
            st1_cmp         <= (st0_data > reg_param_th);
            
            // stage2
            st2_line_first  <= st1_line_first;
            st2_line_last   <= st1_line_last;
            st2_pixel_first <= st1_pixel_first;
            st2_pixel_last  <= st1_pixel_last;
            st2_de          <= st1_de;
            st2_user        <= st1_user;
            st2_data        <= st1_data;
            st2_binary      <= (st1_data >> (DATA_WIDTH - BINARY_WIDTH));
            if ( reg_param_enable ) begin
                st2_binary <= st1_cmp ? reg_param_val1 : reg_param_val0;
            end
            
            // stage3
            st3_line_first  <= st2_line_first;
            st3_line_last   <= st2_line_last;
            st3_pixel_first <= st2_pixel_first;
            st3_pixel_last  <= st2_pixel_last;
            st3_de          <= st2_de;
            st3_user        <= st2_user;
            st3_data        <= st2_data;
            st3_binary      <= reg_param_inv ? ~st2_binary : st2_binary;
        end
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_valid <= 1'b0;
            st1_valid <= 1'b0;
            st2_valid <= 1'b0;
            st3_valid <= 1'b0;
        end
        else if ( cke ) begin
            st0_valid <= s_img_valid;
            st1_valid <= st0_valid;
            st2_valid <= st1_valid;
            st3_valid <= st2_valid;
        end
    end
    
    
    assign m_img_line_first  = st3_line_first;
    assign m_img_line_last   = st3_line_last;
    assign m_img_pixel_first = st3_pixel_first;
    assign m_img_pixel_last  = st3_pixel_last;
    assign m_img_de          = st3_de;
    assign m_img_user        = st3_user;
    assign m_img_data        = st3_data;
    assign m_img_binary      = st3_binary;
    assign m_img_valid       = st3_valid;
    
endmodule


`default_nettype wire


// end of file
