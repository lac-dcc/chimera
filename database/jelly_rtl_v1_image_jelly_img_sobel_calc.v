// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_sobel_calc
        #(
            parameter   USER_WIDTH   = 0,
            parameter   DATA_WIDTH   = 8,
            parameter   GRAD_X_WIDTH = DATA_WIDTH,
            parameter   GRAD_Y_WIDTH = DATA_WIDTH,
            
            // local
            parameter   USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                    reset,
            input   wire                                    clk,
            input   wire                                    cke,
            
            input   wire            [3*3*DATA_WIDTH-1:0]    in_data,
            
            output  wire            [DATA_WIDTH-1:0]        out_data,
            output  wire    signed  [GRAD_X_WIDTH-1:0]      out_grad_x,
            output  wire    signed  [GRAD_Y_WIDTH-1:0]      out_grad_y
        );
    
    wire    signed  [GRAD_X_WIDTH-1:0]  grad_x_min = {1'b1, {(GRAD_X_WIDTH-1){1'b0}}};
    wire    signed  [GRAD_X_WIDTH-1:0]  grad_x_max = {1'b0, {(GRAD_X_WIDTH-1){1'b1}}};
    wire    signed  [GRAD_Y_WIDTH-1:0]  grad_y_min = {1'b1, {(GRAD_Y_WIDTH-1){1'b0}}};
    wire    signed  [GRAD_Y_WIDTH-1:0]  grad_y_max = {1'b0, {(GRAD_Y_WIDTH-1){1'b1}}};
    
    wire    signed  [DATA_WIDTH+1:0]    in_data00 = in_data[(3*0+0)*DATA_WIDTH +: DATA_WIDTH];
    wire    signed  [DATA_WIDTH+1:0]    in_data01 = in_data[(3*0+1)*DATA_WIDTH +: DATA_WIDTH];
    wire    signed  [DATA_WIDTH+1:0]    in_data02 = in_data[(3*0+2)*DATA_WIDTH +: DATA_WIDTH];
    wire    signed  [DATA_WIDTH+1:0]    in_data10 = in_data[(3*1+0)*DATA_WIDTH +: DATA_WIDTH];
    wire    signed  [DATA_WIDTH+1:0]    in_data11 = in_data[(3*1+1)*DATA_WIDTH +: DATA_WIDTH];
    wire    signed  [DATA_WIDTH+1:0]    in_data12 = in_data[(3*1+2)*DATA_WIDTH +: DATA_WIDTH];
    wire    signed  [DATA_WIDTH+1:0]    in_data20 = in_data[(3*2+0)*DATA_WIDTH +: DATA_WIDTH];
    wire    signed  [DATA_WIDTH+1:0]    in_data21 = in_data[(3*2+1)*DATA_WIDTH +: DATA_WIDTH];
    wire    signed  [DATA_WIDTH+1:0]    in_data22 = in_data[(3*2+2)*DATA_WIDTH +: DATA_WIDTH];
    
    
    reg             [DATA_WIDTH-1:0]    st0_data;
    reg     signed  [DATA_WIDTH+3:0]    st0_grad_x0;
    reg     signed  [DATA_WIDTH+3:0]    st0_grad_x1;
    reg     signed  [DATA_WIDTH+3:0]    st0_grad_x2;
    reg     signed  [DATA_WIDTH+3:0]    st0_grad_y0;
    reg     signed  [DATA_WIDTH+3:0]    st0_grad_y1;
    reg     signed  [DATA_WIDTH+3:0]    st0_grad_y2;
    
    reg             [DATA_WIDTH-1:0]    st1_data;
    reg     signed  [DATA_WIDTH+3:0]    st1_grad_x0;
    reg     signed  [DATA_WIDTH+3:0]    st1_grad_x1;
    reg     signed  [DATA_WIDTH+3:0]    st1_grad_y0;
    reg     signed  [DATA_WIDTH+3:0]    st1_grad_y1;
    
    reg             [DATA_WIDTH-1:0]    st2_data;
    reg     signed  [DATA_WIDTH+3:0]    st2_grad_x;
    reg     signed  [DATA_WIDTH+3:0]    st2_grad_y;
    
    reg             [DATA_WIDTH-1:0]    st3_data;
    reg     signed  [GRAD_X_WIDTH+3:0]  st3_grad_x;
    reg     signed  [GRAD_Y_WIDTH+3:0]  st3_grad_y;
    reg                                 st3_min_x;
    reg                                 st3_max_x;
    reg                                 st3_min_y;
    reg                                 st3_max_y;
    
    reg             [DATA_WIDTH-1:0]    st4_data;
    reg     signed  [GRAD_X_WIDTH+3:0]  st4_grad_x;
    reg     signed  [GRAD_Y_WIDTH+3:0]  st4_grad_y;
    
    always @(posedge clk) begin
        if ( cke ) begin
            // stage0
            st0_data    <= in_data11;
            st0_grad_x0 <= in_data00 - in_data02;
            st0_grad_x1 <= in_data10 - in_data12;
            st0_grad_x2 <= in_data20 - in_data22;
            st0_grad_y0 <= in_data00 - in_data20;
            st0_grad_y1 <= in_data01 - in_data21;
            st0_grad_y2 <= in_data02 - in_data22;
            
            
            // stage1
            st1_data    <= st0_data;
            st1_grad_x0 <= st0_grad_x0 + st0_grad_x2;
            st1_grad_x1 <= (st0_grad_x1 <<< 1);
            st1_grad_y0 <= st0_grad_y0 + st0_grad_y2;
            st1_grad_y1 <= (st0_grad_y1 <<< 1);
            
            
            // stage2
            st2_data    <= st1_data;
            st2_grad_x  <= st1_grad_x0 + st1_grad_x1;
            st2_grad_y  <= st1_grad_y0 + st1_grad_y1;
            
            
            // stage3
            st3_data    <= st2_data;
            st3_grad_x  <= st2_grad_x;
            st3_grad_y  <= st2_grad_y;
            st3_min_x   <= (st2_grad_x < grad_x_min);
            st3_max_x   <= (st2_grad_x > grad_x_max);
            st3_min_y   <= (st2_grad_y < grad_y_min);
            st3_max_y   <= (st2_grad_y > grad_y_max);
            
            // stage4
            st4_data    <= st3_data;
            st4_grad_x  <= st3_grad_x;
            st4_grad_y  <= st3_grad_y;
            if ( st3_min_x ) begin st4_grad_x <= grad_x_min; end
            if ( st3_max_x ) begin st4_grad_x <= grad_x_max; end
            if ( st3_min_y ) begin st4_grad_y <= grad_y_min; end
            if ( st3_max_y ) begin st4_grad_y <= grad_y_max; end
        end
    end
    
    assign out_data   = st4_data;
    assign out_grad_x = st4_grad_x;
    assign out_grad_y = st4_grad_y;
    
endmodule


`default_nettype wire


// end of file
