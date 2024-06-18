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



module jelly_axi4s_master_model
        #(
            parameter AXI4S_DATA_WIDTH = 32,
            parameter X_NUM            = 640,
            parameter Y_NUM            = 480,
            parameter X_BLANK          = 0,
            parameter Y_BLANK          = 0,
            parameter PGM_FILE         = "",
            parameter PPM_FILE         = "",
            parameter BUSY_RATE        = 0,
            parameter RANDOM_SEED      = 0,
            parameter INTERVAL         = 0,
            parameter SEQUENTIAL_FILE  = 0,
            parameter DIGIT_NUM        = 4,
            parameter DIGIT_POS        = 4,
            parameter MAX_PATH         = 64
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            
            output  wire    [0:0]                   m_axi4s_tuser,
            output  wire                            m_axi4s_tlast,
            output  wire    [AXI4S_DATA_WIDTH-1:0]  m_axi4s_tdata,
            output  wire                            m_axi4s_tvalid,
            input   wire                            m_axi4s_tready
        );
    
    localparam TOTAL_X_NUM = X_NUM + X_BLANK;
    localparam TOTAL_Y_NUM = Y_NUM + Y_BLANK;
    
    reg     reg_aresetn = 1'b0;
    always @( posedge aclk ) begin
        reg_aresetn <= aresetn;
    end
    
    reg     [31:0]      reg_rand_seed = RANDOM_SEED;
    reg     [31:0]      reg_rand;
    always @( posedge aclk ) begin
        if ( !reg_aresetn ) begin
            reg_rand_seed <= RANDOM_SEED;
            reg_rand      <= 99;
        end
        else begin
            reg_rand      <= {$random(reg_rand_seed)};
        end
    end
    
    integer interval_count = 0;
    
    wire    busy = ((reg_rand % 100) < BUSY_RATE) || (interval_count > 0);
    
    
    reg     [AXI4S_DATA_WIDTH-1:0]      mem     [0:X_NUM*Y_NUM-1];
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
`ifdef IVERILOG
                tmp0 = $fscanf(fp, "P2", tmp1); // iverilogのバグ？
`else
                tmp0 = $fscanf(fp, "P2");
`endif
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
`ifdef IVERILOG
                tmp0 = $fscanf(fp, "P3", tmp1);
`else
                tmp0 = $fscanf(fp, "P3");
`endif
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
    
    initial begin
        read_image(0);
    end
    
    
    wire        cke = (!m_axi4s_tvalid || m_axi4s_tready) && !busy;
    
    integer     frame = 0;
    integer     x     = 0;
    integer     y     = 0;
    always @(posedge aclk) begin
        if ( !reg_aresetn ) begin
            frame <= 0;
            x <= 0;
            y <= 0;
        end
        else if ( cke ) begin
            if ( x == 0 && y == 0 ) begin
            end
            
            x <= x + 1;
            if ( x == (TOTAL_X_NUM-1) ) begin
                x <= 0;
                y <= y + 1;
                if ( y == (TOTAL_Y_NUM-1) ) begin
                    y <= 0;
                    frame <= frame + 1;
                    read_image(frame + 1);
                end
            end
        end
    end
    
    always @(posedge aclk) begin
        if ( !reg_aresetn ) begin
            interval_count <= 0;
        end
        else begin
            if ( interval_count > 0 ) begin
                interval_count <= interval_count - 1;
            end
            else begin
                if ( x == (TOTAL_X_NUM-1) && y == (TOTAL_Y_NUM-1) && m_axi4s_tvalid && m_axi4s_tready ) begin
                    interval_count <= INTERVAL;
                end
            end
        end
    end
    
    
    assign m_axi4s_tuser  = m_axi4s_tvalid ? (x == 0) && (y == 0) : 1'bx;
    assign m_axi4s_tlast  = m_axi4s_tvalid ? (x == X_NUM-1)       : 1'bx;
    assign m_axi4s_tdata  = m_axi4s_tvalid ? mem[y*X_NUM + x]     : {AXI4S_DATA_WIDTH{1'bx}};
    assign m_axi4s_tvalid = reg_aresetn & !busy & (x < X_NUM && y < Y_NUM);

//  assign m_axi4s_tdata[AXI4S_DATA_WIDTH/2-1:0] = x;
//  assign m_axi4s_tdata[AXI4S_DATA_WIDTH-1:AXI4S_DATA_WIDTH/2] = y;
//  assign m_axi4s_tdata[7:0]   = (x<<4) + 1;
//  assign m_axi4s_tdata[15:8]  = (x<<4) + 2;
//  assign m_axi4s_tdata[23:16] = (x<<4) + 3;
    
endmodule


`default_nettype wire


// end of file
