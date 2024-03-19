
`timescale 1ns / 1ps
`default_nettype none


module tb_rasterizer_plane_calc();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_rasterizer_plane_calc.vcd");
        $dumpvars(0, tb_rasterizer_plane_calc);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    parameter   X_NUM            = 640;
    parameter   Y_NUM            = 480;
    parameter   REGION_WIDTH     = 20;
    parameter   COLOR_INT_WIDTH  = 10;
    parameter   COLOR_FRAC_WIDTH = 10;
    parameter   COLOR_WIDTH      = COLOR_INT_WIDTH + COLOR_FRAC_WIDTH;
    
    genvar                          i;
    
    reg     signed  [REGION_WIDTH-1:0]      region_offset       [0:2];
    reg     signed  [REGION_WIDTH-1:0]      region_dx           [0:2];
    reg     signed  [REGION_WIDTH-1:0]      region_dy           [0:2];
    reg     signed  [REGION_WIDTH-1:0]      region_dy_stride    [0:2];
    
    reg     signed  [COLOR_WIDTH-1:0]       color_offset        [0:2];
    reg     signed  [COLOR_WIDTH-1:0]       color_dx            [0:2];
    reg     signed  [COLOR_WIDTH-1:0]       color_dy            [0:2];
    reg     signed  [COLOR_WIDTH-1:0]       color_dy_stride     [0:2];
    
    
    integer             vertex_x        [0:2];
    integer             vertex_y        [0:2];
    integer             vertex_c0       [0:2];
    integer             vertex_c1       [0:2];
    integer             vertex_c2       [0:2];
    
    integer                     j, k;
    reg     signed  [63:0]      offset;
    reg     signed  [63:0]      dx;
    reg     signed  [63:0]      dy;
    
    reg     signed  [63:0]      vx0, vx1;
    reg     signed  [63:0]      vy0, vy1;
    reg     signed  [63:0]      vz0, vz1;
    reg     signed  [63:0]      cross_x;
    reg     signed  [63:0]      cross_y;
    reg     signed  [63:0]      cross_z;
    
    initial begin
        vertex_x[0] = 123;
        vertex_y[0] = 111;
        vertex_x[1] = 512;
        vertex_y[1] = 91;
        vertex_x[2] = 300;
        vertex_y[2] = 390;
        
    //  vertex_x[1] = vertex_x[0] + 10;
    //  vertex_y[1] = vertex_y[0] + 5;
    //  vertex_x[2] = vertex_x[0] + 7;
    //  vertex_y[2] = vertex_y[0] + 21;
        
        vertex_c0[0] = 255;
        vertex_c0[1] = 100;
        vertex_c0[2] = 0;
        
        vertex_c1[0] = 0;
        vertex_c1[1] = 255;
        vertex_c1[2] = 0;
        
        vertex_c2[0] = 0;
        vertex_c2[1] = 255;
        vertex_c2[2] = 255;
        
        
        // 座標範囲
        for ( j = 0; j < 3; j = j+1 ) begin
            k = (j + 1) % 3;
            dx     = vertex_y[k] - vertex_y[j];
            dy     = vertex_x[k] - vertex_x[j];
            offset = (vertex_y[j] * dy) - (vertex_x[j] * dx);
            
            region_offset[j]    = offset;
            region_dx[j]        = dx;
            region_dy[j]        = -dy;
            region_dy_stride[j] = region_dy[j] - ((X_NUM-1)*region_dx[j]);
        end
        
        // カラー
        // dx(x - X0) + dy(y - Y0) + dz(z - Z0) = 0
        // z = (-dx*x + -dy*y + (dx*X0 + dy*Y0 + dz*Z0)) / dz
        for ( j = 0; j < 3; j = j+1 ) begin
            // 外積計算
            vx0 = vertex_x[1] - vertex_x[0];
            vx1 = vertex_x[2] - vertex_x[0];
            vy0 = vertex_y[1] - vertex_y[0];
            vy1 = vertex_y[2] - vertex_y[0];
            vz0 = vertex_c1[j] - vertex_c0[j];
            vz1 = vertex_c2[j] - vertex_c0[j];
            cross_x = vy0*vz1 - vz0*vy1;
            cross_y = vz0*vx1 - vx0*vz1;
            cross_z = vx0*vy1 - vy0*vx1;
            
            dx      = (-cross_x <<< COLOR_FRAC_WIDTH) / cross_z;
            dy      = (-cross_y <<< COLOR_FRAC_WIDTH) / cross_z;
            offset  = ((cross_x*vertex_x[0] + cross_y*vertex_y[0] + cross_z*vertex_c0[j]) <<< COLOR_FRAC_WIDTH) / cross_z;
            color_dx[j]        = dx;
            color_dy[j]        = dy;
            color_offset[j]    = ((cross_x*vertex_x[0] + cross_y*vertex_y[0] + cross_z*vertex_c0[j]) / cross_z) <<< COLOR_FRAC_WIDTH;
            color_dy_stride[j] = color_dy[j] - ((X_NUM-1)*color_dx[j]);
        end
    end
    
    wire    signed  [COLOR_WIDTH-1:0]       color0_offset    = color_offset[0];
    wire    signed  [COLOR_WIDTH-1:0]       color0_dx        = color_dx[0];
    wire    signed  [COLOR_WIDTH-1:0]       color0_dy        = color_dy[0];
    wire    signed  [COLOR_WIDTH-1:0]       color0_dy_stride = color_dy_stride[0];
    wire    signed  [COLOR_WIDTH-1:0]       color1_offset    = color_offset[1];
    wire    signed  [COLOR_WIDTH-1:0]       color1_dx        = color_dx[1];
    wire    signed  [COLOR_WIDTH-1:0]       color1_dy        = color_dy[1];
    wire    signed  [COLOR_WIDTH-1:0]       color1_dy_stride = color_dy_stride[1];
    
    
    
    reg     cke = 1;
    
    integer     st0_x;
    integer     st0_y;
    reg         st0_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_x     <= 0;
            st0_y     <= 0;
            st0_valid <= 0;
        end
        else begin
            if ( !st0_valid ) begin
                st0_x     <= 0;
                st0_y     <= 0;
                st0_valid <= 1;
            end
            else begin
                st0_x <= st0_x + 1;
                if ( st0_x == X_NUM-1 ) begin
                    st0_x <= 0;
                    st0_y <= st0_y + 1;
                    if ( st0_y == Y_NUM - 1 ) begin
                        st0_x     <= 0;
                        st0_y     <= 0;
                        st0_valid <= 0;
                    end
                end
            end
        end
    end
    
    wire    [2:0]               st1_sign;
    wire    [COLOR_WIDTH-1:0]   st1_color   [0:2];
    reg                         st1_valid;
    
    generate
    for ( i = 0; i < 3; i = i+1 ) begin : loop_region
        jelly_rasterizer_plane_calc
                #(
                    .WIDTH          (REGION_WIDTH)
                )
            i_rasterizer_plane_calc
                (
                    .reset          (!st0_valid),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .x_first        (st0_x == 0),
                    .y_first        (st0_y == 0),
                    
                    .dx             (region_dx[i]),
                    .dy_stride      (region_dy_stride[i]),
                    .offset         (region_offset[i]),
                    
                    .out_value      (),
                    .out_sign       (st1_sign[i])
                );
    end
    
    for ( i = 0; i < 3; i = i+1 ) begin : loop_color
        jelly_rasterizer_plane_calc
                #(
                    .WIDTH          (COLOR_WIDTH)
                )
            i_rasterizer_plane_calc
                (
                    .reset          (!st0_valid),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .x_first        (st0_x == 0),
                    .y_first        (st0_y == 0),
                    
                    .dx             (color_dx[i]),
                    .dy_stride      (color_dy_stride[i]),
                    .offset         (color_offset[i]),
                    
                    .out_value      (st1_color[i]),
                    .out_sign       ()
                );
    end
    endgenerate
    
    
    
    initial begin
        #(RATE*X_NUM*Y_NUM + 10000) $finish;
    end
    
    
    always @(posedge clk) begin
        if ( reset ) begin
            st1_valid <= 1'b0;
        end
        else if ( cke ) begin
            st1_valid <= st0_valid;
        end
    end
    
    
    integer     fp;
    initial begin
         fp = $fopen("out_img.ppm", "w");
         $fdisplay(fp, "P3");
         $fdisplay(fp, "%d %d", X_NUM, Y_NUM);
         $fdisplay(fp, "255");
    end
    
    always @(posedge clk) begin
        if ( !reset && cke && st1_valid ) begin
            if ( &st1_sign ) begin
    //      if ( 1 ) begin
                 $fdisplay(fp, "%d %d %d",
                     st1_color[0] >>> COLOR_FRAC_WIDTH,
                     st1_color[1] >>> COLOR_FRAC_WIDTH,
                     st1_color[2] >>> COLOR_FRAC_WIDTH);
            end
            else begin
                 $fdisplay(fp, "0 0 0");
            end
        end
    end
    
    
    
    
endmodule



`default_nettype wire


// end of file
