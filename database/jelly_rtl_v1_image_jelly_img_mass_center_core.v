// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_mass_center_core
        #(
            parameter   INDEX_WIDTH   = 1,
            parameter   DATA_WIDTH    = 8,
            parameter   Q_WIDTH       = 0,
            parameter   X_WIDTH       = 14,
            parameter   Y_WIDTH       = 14,
            parameter   OUT_X_WIDTH   = 14 + Q_WIDTH,
            parameter   OUT_Y_WIDTH   = 14 + Q_WIDTH,
            parameter   X_COUNT_WIDTH = 32,
            parameter   Y_COUNT_WIDTH = 32,
            parameter   N_COUNT_WIDTH = 32,
            parameter   INIT_X        = (640 / 2) << Q_WIDTH,
            parameter   INIT_Y        = (132 / 2) << Q_WIDTH
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            ctl_update,
            output  wire    [INDEX_WIDTH-1:0]       ctl_index,
            
            input   wire    [X_WIDTH-1:0]           param_range_left,
            input   wire    [X_WIDTH-1:0]           param_range_right,
            input   wire    [Y_WIDTH-1:0]           param_range_top,
            input   wire    [Y_WIDTH-1:0]           param_range_bottom,
            
            output  wire    [X_WIDTH-1:0]           current_range_left,
            output  wire    [X_WIDTH-1:0]           current_range_right,
            output  wire    [Y_WIDTH-1:0]           current_range_top,
            output  wire    [Y_WIDTH-1:0]           current_range_bottom,
            
            input   wire                            s_img_line_first,
            input   wire                            s_img_line_last,
            input   wire                            s_img_pixel_first,
            input   wire                            s_img_pixel_last,
            input   wire                            s_img_de,
            input   wire    [DATA_WIDTH-1:0]        s_img_data,
            input   wire                            s_img_valid,
            
            output  wire    [OUT_X_WIDTH-1:0]       out_x,
            output  wire    [OUT_Y_WIDTH-1:0]       out_y,
            output  wire                            out_valid
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
    
    reg     [X_WIDTH-1:0]   reg_param_range_left;
    reg     [X_WIDTH-1:0]   reg_param_range_right;
    reg     [Y_WIDTH-1:0]   reg_param_range_top;
    reg     [Y_WIDTH-1:0]   reg_param_range_bottom;
    always @(posedge clk) begin
        if ( cke ) begin
            if ( update_trig & update_en ) begin
                reg_param_range_left   <= param_range_left;
                reg_param_range_right  <= param_range_right;
                reg_param_range_top    <= param_range_top;
                reg_param_range_bottom <= param_range_bottom;
            end
        end
    end
    
    assign current_range_left   = reg_param_range_left;
    assign current_range_right  = reg_param_range_right;
    assign current_range_top    = reg_param_range_top;
    assign current_range_bottom = reg_param_range_bottom;
    
    
    // processing
    reg                             st0_first;
    reg                             st0_last;
    reg                             st0_de;
    reg     [DATA_WIDTH-1:0]        st0_data;
    reg     [X_WIDTH-1:0]           st0_x;
    reg     [Y_WIDTH-1:0]           st0_y;
    
    reg                             st1_first;
    reg                             st1_last;
    reg                             st1_de;
    reg     [DATA_WIDTH-1:0]        st1_data;
    reg     [X_WIDTH-1:0]           st1_x;
    reg     [Y_WIDTH-1:0]           st1_y;
    reg                             st1_range;
    
    reg                             st2_first;
    reg                             st2_last;
    reg                             st2_de;
    reg     [DATA_WIDTH-1:0]        st2_data;
    reg     [X_WIDTH-1:0]           st2_x;
    reg     [Y_WIDTH-1:0]           st2_y;
    
    reg                             st3_first;
    reg                             st3_last;
    reg                             st3_de;
    reg     [DATA_WIDTH-1:0]        st3_data;
    reg     [X_COUNT_WIDTH-1:0]     st3_x;
    reg     [Y_COUNT_WIDTH-1:0]     st3_y;
    
    reg                             st4_last;
    reg                             st4_de;
    reg     [X_COUNT_WIDTH-1:0]     st4_x;
    reg     [Y_COUNT_WIDTH-1:0]     st4_y;
    reg     [N_COUNT_WIDTH-1:0]     st4_n;
    
    reg                             st5_zero;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_first <= 1'b0;
            st0_last  <= 1'b0;
            st0_de    <= 1'b0;
            st0_data  <= {DATA_WIDTH{1'bx}};
            st0_x     <= {X_WIDTH{1'bx}};
            st0_y     <= {Y_WIDTH{1'bx}};
            
            st1_first <= 1'b0;
            st1_last  <= 1'b0;
            st1_de    <= 1'b0;
            st1_data  <= {DATA_WIDTH{1'bx}};
            st1_x     <= {X_WIDTH{1'bx}};
            st1_y     <= {Y_WIDTH{1'bx}};
            st1_range <= 1'bx;
            
            st2_first <= 1'b0;
            st2_last  <= 1'b0;
            st2_de    <= 1'b0;
            st2_data  <= {DATA_WIDTH{1'bx}};
            st2_x     <= {X_WIDTH{1'bx}};
            st2_y     <= {Y_WIDTH{1'bx}};
            
            st3_first <= 1'b0;
            st3_last  <= 1'b0;
            st3_de    <= 1'b0;
            st3_data  <= {DATA_WIDTH{1'bx}};
            st3_x     <= {X_COUNT_WIDTH{1'bx}};
            st3_y     <= {Y_COUNT_WIDTH{1'bx}};
            
            st4_last  <= 1'b0;
            st4_x     <= {X_COUNT_WIDTH{1'bx}};
            st4_y     <= {Y_COUNT_WIDTH{1'bx}};
            st4_n     <= {N_COUNT_WIDTH{1'bx}};
            
            st5_zero  <= 1'bx;
        end
        else if ( cke ) begin
            // stage 0
            st0_first <= (s_img_valid & s_img_line_first & s_img_pixel_first);
            st0_last  <= (s_img_valid & s_img_line_last  & s_img_pixel_last);
            st0_de    <= (s_img_valid & s_img_de);
            st0_data  <= (s_img_valid & s_img_de) ? s_img_data : 0;
            if ( s_img_valid ) begin
                st0_x <= st0_x + s_img_de;
                if ( s_img_pixel_first ) begin
                    st0_x <= 0;
                    st0_y <= st0_y + 1;
                    if ( s_img_line_first ) begin
                        st0_y <= 0;
                    end
                end
            end
            
            // stage 1
            st1_first <= st0_first;
            st1_last  <= st0_last;
            st1_de    <= st0_de;
            st1_data  <= st0_data;
            st1_x     <= st0_x;
            st1_y     <= st0_y;
            st1_range <= (st0_x >= param_range_left && st0_x <= param_range_right
                            && st0_y >= param_range_top && st0_y <= param_range_bottom);
            
            // stage 2
            st2_first <= st1_first;
            st2_last  <= st1_last;
            st2_de    <= st1_de;
            st2_data  <= st1_range ? st0_data : 0;
            st2_x     <= st1_x;
            st2_y     <= st1_y;
            
            // stage 3
            st3_first <= st2_first;
            st3_last  <= st2_last;
            st3_de    <= st2_de;
            st3_data  <= st2_data;
            st3_x     <= st2_x * st2_data;
            st3_y     <= st2_y * st2_data;
            
            // stage 4
            st4_last <= st3_last;
            if ( st3_de ) begin
                if ( st3_first ) begin
                    st4_x <= st3_x;
                    st4_y <= st3_y;
                    st4_n <= st3_data;
                end
                else begin
                    st4_x <= st4_x + st3_x;
                    st4_y <= st4_y + st3_y;
                    st4_n <= st4_n + st3_data;
                end
            end
            
            // stage5
            if ( st4_last ) begin
                st5_zero <= (st4_n == 0);
            end
        end
    end
    
    
    // divider
    localparam XY_MAX_WIDTH = X_COUNT_WIDTH > Y_COUNT_WIDTH ? X_COUNT_WIDTH : Y_COUNT_WIDTH;
    localparam MAX_WIDTH    = XY_MAX_WIDTH  > N_COUNT_WIDTH ? XY_MAX_WIDTH  : N_COUNT_WIDTH;
    
    localparam DIV_WIDTH    = Q_WIDTH + MAX_WIDTH;
    
    wire    [DIV_WIDTH-1:0] st4_xx = st4_x << Q_WIDTH;
    wire    [DIV_WIDTH-1:0] st4_yy = st4_y << Q_WIDTH;
    
    wire    [DIV_WIDTH-1:0] div_x;
    wire    [DIV_WIDTH-1:0] div_y;
    wire                    div_valid;
    
    jelly_unsigned_divide_multicycle
            #(
                .DATA_WIDTH     (DIV_WIDTH)
            )
        i_unsigned_divide_multicycle_x
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data0        (st4_xx),
                .s_data1        (st4_n),
                .s_valid        (st4_last),
                .s_ready        (),
                
                .m_quotient     (div_x),
                .m_remainder    (),
                .m_valid        (div_valid),
                .m_ready        (1'b1)
            );
    
    jelly_unsigned_divide_multicycle
            #(
                .DATA_WIDTH     (DIV_WIDTH)
            )
        i_unsigned_divide_multicycle_y
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data0        (st4_yy),
                .s_data1        (st4_n),
                .s_valid        (st4_last),
                .s_ready        (),
                
                .m_quotient     (div_y),
                .m_remainder    (),
                .m_valid        (),
                .m_ready        (1'b1)
            );
    
    
    // output
    reg     [X_WIDTH-1:0]   reg_out_x;
    reg     [Y_WIDTH-1:0]   reg_out_y;
    reg                     reg_out_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_out_x     <= INIT_X;
            reg_out_y     <= INIT_Y;
            reg_out_valid <= 1'b0;
        end
        else if ( cke ) begin
            reg_out_valid <= 1'b0;
            if ( div_valid && !st5_zero ) begin
                reg_out_x     <= div_x;
                reg_out_y     <= div_y;
                reg_out_valid <= 1'b1;
            end
       end
    end
    
    assign out_x     = reg_out_x;
    assign out_y     = reg_out_y;
    assign out_valid = reg_out_valid;
    
endmodule


`default_nettype wire


// end of file
