// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_mean_grad_to_angle
        #(
            parameter   X_WIDTH       = 8,
            parameter   Y_WIDTH       = 8,
            parameter   WEIGHT_WIDTH  = 8,
            parameter   ANGLE_WIDTH   = 32,
            parameter   X_SUM_WIDTH   = X_WIDTH + WEIGHT_WIDTH + (X_WIDTH + Y_WIDTH),
            parameter   Y_SUM_WIDTH   = Y_WIDTH + WEIGHT_WIDTH + (X_WIDTH + Y_WIDTH),
            parameter   ATAN2_X_WIDTH = X_SUM_WIDTH,
            parameter   ATAN2_Y_WIDTH = Y_SUM_WIDTH,
            parameter   OUT_ASYNC     = 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            input   wire                                s_img_line_first,
            input   wire                                s_img_line_last,
            input   wire                                s_img_pixel_first,
            input   wire                                s_img_pixel_last,
            input   wire                                s_img_de,
            input   wire    signed  [X_WIDTH-1:0]       s_img_x,
            input   wire    signed  [Y_WIDTH-1:0]       s_img_y,
            input   wire            [WEIGHT_WIDTH-1:0]  s_img_weight,
            input   wire                                s_img_valid,
            
            input   wire                                out_reset,
            input   wire                                out_clk,
            output  wire    [ANGLE_WIDTH-1:0]           out_angle,
            output  wire                                out_valid
        );
    
    reg                                     st0_first;
    reg                                     st0_last;
    reg                                     st0_de;
    reg     signed  [X_WIDTH-1:0]           st0_x;
    reg     signed  [Y_WIDTH-1:0]           st0_y;
    reg     signed  [1+WEIGHT_WIDTH-1:0]    st0_weight;
    
    reg                                     st1_first;
    reg                                     st1_last;
    reg                                     st1_de;
    reg     signed  [X_SUM_WIDTH-1:0]       st1_x;
    reg     signed  [Y_SUM_WIDTH-1:0]       st1_y;
    
    reg                                     st2_de;
    reg     signed  [X_SUM_WIDTH-1:0]       st2_x;
    reg     signed  [Y_SUM_WIDTH-1:0]       st2_y;
    reg                                     st2_valid;
    
    reg     signed  [X_SUM_WIDTH-1:0]       st3_x;
    reg     signed  [Y_SUM_WIDTH-1:0]       st3_y;
    reg                                     st3_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_first  <= 1'b0;
            st0_last   <= 1'b0;
            st0_de     <= 1'b0;
            st0_x      <= {X_WIDTH{1'bx}};
            st0_y      <= {Y_WIDTH{1'bx}};
            st0_weight <= {(1+WEIGHT_WIDTH){1'bx}};
            
            st1_first  <= 1'b0;
            st1_last   <= 1'b0;
            st1_de     <= 1'b0;
            st1_x      <= {X_SUM_WIDTH{1'bx}};
            st1_y      <= {Y_SUM_WIDTH{1'bx}};
            
            st2_de     <= 1'b0;
            st2_x      <= {X_SUM_WIDTH{1'bx}};
            st2_y      <= {Y_SUM_WIDTH{1'bx}};
            st2_valid  <= 1'b0;
            
            st3_x      <= {X_SUM_WIDTH{1'bx}};
            st3_y      <= {Y_SUM_WIDTH{1'bx}};
            st3_valid  <= 1'b0;
        end
        else if ( cke ) begin
            // stage 0
            st0_first  <= (s_img_valid & s_img_line_first & s_img_pixel_first);
            st0_last   <= (s_img_valid & s_img_line_last  & s_img_pixel_last);
            st0_de     <= (s_img_valid & s_img_de);
            st0_x      <= (s_img_valid & s_img_de) ? s_img_x              : 0;
            st0_y      <= (s_img_valid & s_img_de) ? s_img_y              : 0;
            st0_weight <= (s_img_valid & s_img_de) ? {1'b0, s_img_weight} : 0;
            
            // stage 1
            st1_first <= st0_first;
            st1_last  <= st0_last;
            st1_x     <= st0_weight * st0_x;
            st1_y     <= st0_weight * st0_y;
            
            // stage 2
            if ( st1_first ) begin
                st2_x <= st1_x;
                st2_y <= st1_y;
            end
            else begin
                st2_x <= st2_x + st1_x;
                st2_y <= st2_y + st1_y;
            end
            st2_valid <= st1_last;
            
            // stage 3
            st3_x     <= st2_x;
            st3_y     <= st2_y;
            st3_valid <= st2_valid;
            
        end
    end
    
    
    wire    signed  [ATAN2_X_WIDTH-1:0] st3_x_tmp;
    wire    signed  [ATAN2_Y_WIDTH-1:0] st3_y_tmp;
    assign st3_x_tmp = (st3_x >>> (X_SUM_WIDTH - ATAN2_X_WIDTH));
    assign st3_y_tmp = (st3_y >>> (Y_SUM_WIDTH - ATAN2_Y_WIDTH));
    
    wire    signed  [ATAN2_X_WIDTH-1:0] async_x;
    wire    signed  [ATAN2_Y_WIDTH-1:0] async_y;
    wire                                async_valid;
    
    jelly_data_async
            #(
                .ASYNC          (1),
                .DATA_WIDTH     (ATAN2_Y_WIDTH + ATAN2_X_WIDTH)
            )
        i_data_async
            (
                .s_reset        (reset),
                .s_clk          (clk),
                .s_data         ({st3_y_tmp, st3_x_tmp}),
                .s_valid        (st3_valid & cke),
                .s_ready        (),
                
                .m_reset        (out_reset),
                .m_clk          (out_clk),
                .m_data         ({async_y, async_x}),
                .m_valid        (async_valid),
                .m_ready        (1'b1)
            );
    
    
    wire            [ANGLE_WIDTH-1:0]   atan2_angle;
    wire                                atan2_valid;
    
    jelly_fixed_atan2_multicycle
            #(
                .SCALED_RADIAN  (1),
                .X_WIDTH        (ATAN2_X_WIDTH),
                .Y_WIDTH        (ATAN2_Y_WIDTH),
                .ANGLE_WIDTH    (ANGLE_WIDTH)
            )
        i_fixed_atan2_multicycle
            (
                 .reset         (out_reset),
                 .clk           (out_clk),
                 .cke           (1'b1),
                
                 .s_x           (async_x),
                 .s_y           (async_y),
                 .s_valid       (async_valid),
                 .s_ready       (),
                
                 .m_angle       (atan2_angle),
                 .m_valid       (atan2_valid),
                 .m_ready       (1'b1)
            );
    
    reg     [ANGLE_WIDTH-1:0]   reg_out_angle;
    reg                         reg_out_valid;
    always @(posedge out_clk) begin
        if ( out_reset ) begin
            reg_out_angle <= 0;
            reg_out_valid <= 1'b0;
        end
        else begin
            reg_out_valid <= atan2_valid & cke;
            if ( atan2_valid ) begin
                reg_out_angle <= atan2_angle;
            end
        end
    end
    
    assign out_angle = reg_out_angle;
    assign out_valid = reg_out_valid;
    
endmodule


`default_nettype wire


// end of file
