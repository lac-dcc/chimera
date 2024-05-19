// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_img_master_model
        #(
            parameter DATA_WIDTH       = 32,
            parameter X_NUM            = 640,
            parameter Y_NUM            = 480,
            parameter X_BLANK          = 0,     // 基本ゼロ
            parameter Y_BLANK          = 0,     // 末尾にde落ちラインを追加
            parameter X_WIDTH          = 32,
            parameter Y_WIDTH          = 32,
            parameter PGM_FILE         = "",
            parameter PPM_FILE         = "",
            parameter SEQUENTIAL_FILE  = 0,
            parameter DIGIT_NUM        = 4,
            parameter DIGIT_POS        = 4,
            parameter MAX_PATH         = 64
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            output  wire                        m_img_line_first,
            output  wire                        m_img_line_last,
            output  wire                        m_img_pixel_first,
            output  wire                        m_img_pixel_last,
            output  wire                        m_img_de,
            output  wire    [DATA_WIDTH-1:0]    m_img_data,
            output  wire    [X_WIDTH-1:0]       m_img_x,
            output  wire    [Y_WIDTH-1:0]       m_img_y,
            output  wire                        m_img_valid
        );
    
    
    // -----------------------------
    //  read image file
    // -----------------------------
    
    reg     [DATA_WIDTH-1:0]            mem     [0:X_NUM*Y_NUM-1];
    integer                             fp;
    integer                             i;
    integer                             w, h, d;
    integer                             p0, p1, p2;
    integer                             tmp0, tmp1;
    
    function [8*MAX_PATH-1:0] make_fname(input [8*MAX_PATH-1:0] fname, input [31:0] frame);
    integer i;
    integer pos;
    begin
        if ( SEQUENTIAL_FILE ) begin
            pos = DIGIT_POS * 8;
            for ( i = 0; i < DIGIT_NUM; i = i+1 ) begin
                fname[pos +: 8] = "0" + frame % 10;
                frame = frame / 10;
                pos   = pos + 8;
            end
        end
        make_fname = fname;
    end
    endfunction
    
    
    task read_image(input [31:0] frame);
    reg     [8*MAX_PATH-1:0]   fname;
    begin
        for ( i = 0; i < X_NUM*Y_NUM; i = i+1 ) begin
            mem[i] = i;
        end
        
        if ( PGM_FILE != "" ) begin
            fname = make_fname(PGM_FILE, frame);
            fp = $fopen(fname, "r");
            if ( fp != 0 ) begin
                $display("image read %s", fname);
                tmp0 = $fscanf(fp, "P2", tmp1);
                tmp0 = $fscanf(fp, "%d%d", w, h);
                tmp0 = $fscanf(fp, "%d", d);
                
                for ( i = 0; i < X_NUM*Y_NUM; i = i+1 ) begin
                    tmp0 = $fscanf(fp, "%d", p0);
                    mem[i] = p0;
                end
                
                $fclose(fp);
            end
            else begin
                $display("open error : %s", fname);
            end
        end
        
        if ( PPM_FILE != "" ) begin
            fname = make_fname(PPM_FILE, frame);
            fp = $fopen(fname, "r");
            if ( fp != 0 ) begin
                tmp0 = $fscanf(fp, "P3", tmp1);
                tmp0 = $fscanf(fp, "%d%d", w, h);
                tmp0 = $fscanf(fp, "%d", d);
                
                for ( i = 0; i < X_NUM*Y_NUM; i = i+1 ) begin
                    tmp0 = $fscanf(fp, "%d%d%d", p0, p1, p2);
                    mem[i] = ((p2<<16) | (p1 << 8) | p0);
                end
                
                $fclose(fp);
            end
            else begin
                $display("open error : %s", fname);
            end
        end
    end
    endtask
    
    
    // -----------------------------
    //  main
    // -----------------------------
    
    localparam TOTAL_X = X_NUM + X_BLANK;
    localparam TOTAL_Y = Y_NUM + Y_BLANK;
    
    
    initial begin
        read_image(0);
    end
    
    
    integer     frame = 0;
    integer     x     = 0;
    integer     y     = 0;
    always @(posedge clk) begin
        if ( reset ) begin
            frame <= 0;
            x     <= 0;
            y     <= 0;
        end
        else if ( cke ) begin
            x <= x + 1;
            if ( x >= (TOTAL_X-1) ) begin
                x <= 0;
                y <= y + 1;
                if ( y >= (TOTAL_Y-1) ) begin
                    y <= 0;
                    frame <= frame + 1;
                    read_image(frame + 1);
                end
            end
        end
    end
    
    assign m_img_line_first  = (y == 0);
    assign m_img_line_last   = (y == (Y_NUM-1));
    assign m_img_pixel_first = (x == 0);
    assign m_img_pixel_last  = (x == (X_NUM-1));
    assign m_img_de          = (x < X_NUM && y < Y_NUM);
    assign m_img_data        = mem[y*X_NUM + x];
    assign m_img_x           = x;
    assign m_img_y           = y;
    assign m_img_valid       = 1'b1;
    
endmodule


`default_nettype wire


// end of file
