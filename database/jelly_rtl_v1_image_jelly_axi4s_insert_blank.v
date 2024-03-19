// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_axi4s_insert_blank
        #(
            parameter   TDATA_WIDTH    = 8,
            parameter   TUSER_WIDTH    = 1,
            parameter   FIFO_PTR_WIDTH = 0,
            parameter   IMG_X_WIDTH    = 10,
            parameter   IMG_Y_WIDTH    = 10,
            parameter   BLANK_Y_WIDTH  = 8,
            parameter   BLANK_TDATA    = {TDATA_WIDTH{1'b0}},
            parameter   BLANK_TUSER    = {TUSER_WIDTH{1'b0}},
            parameter   INIT_Y_NUM     = 0
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire    [BLANK_Y_WIDTH-1:0] param_blank_num,
            
            output  wire    [IMG_X_WIDTH-1:0]   monitor_x_num,
            output  wire    [IMG_Y_WIDTH-1:0]   monitor_y_num,
            
            input   wire    [TUSER_WIDTH-1:0]   s_axi4s_tuser,
            input   wire                        s_axi4s_tlast,
            input   wire    [TDATA_WIDTH-1:0]   s_axi4s_tdata,
            input   wire                        s_axi4s_tvalid,
            output  wire                        s_axi4s_tready,
            
            output  wire    [TUSER_WIDTH-1:0]   m_axi4s_tuser,
            output  wire                        m_axi4s_tlast,
            output  wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready
        );
    
    
    
    wire                        cke = (!m_axi4s_tvalid || m_axi4s_tready);
    
    reg     [IMG_X_WIDTH-1:0]   reg_x_counter;
    reg     [IMG_X_WIDTH-1:0]   reg_x_num;
    reg     [IMG_Y_WIDTH-1:0]   reg_y_counter;
    reg     [IMG_Y_WIDTH-1:0]   reg_y_num;
    reg     [IMG_X_WIDTH-1:0]   reg_x_blank;
    reg     [BLANK_Y_WIDTH-1:0] reg_y_blank;
    
    reg                         reg_blank;
    reg                         reg_frame_last;
    
    reg     [TDATA_WIDTH-1:0]   reg_tdata;
    reg                         reg_tlast;
    reg     [TUSER_WIDTH-1:0]   reg_tuser;
    reg                         reg_tvalid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_x_counter  <= {IMG_X_WIDTH{1'b0}};
            reg_x_num      <= {IMG_X_WIDTH{1'b0}};
            reg_y_counter  <= {IMG_Y_WIDTH{1'b0}};
            reg_y_num      <= INIT_Y_NUM;
            reg_x_blank    <= {IMG_X_WIDTH{1'bx}};
            reg_y_blank    <= {BLANK_Y_WIDTH{1'bx}};
            
            reg_blank      <= 1'b0;
            reg_frame_last <= 1'b0;
            
            reg_tlast      <= 1'bx;
            reg_tdata      <= {TDATA_WIDTH{1'bx}};
            reg_tuser      <= {TUSER_WIDTH{1'bx}};
            reg_tvalid     <= 1'b0;
        end
        else begin
            // 画像サイズ計測
            if ( s_axi4s_tvalid && s_axi4s_tready ) begin
                reg_x_counter <= reg_x_counter + 1'b1;
                if ( s_axi4s_tlast ) begin
                    reg_x_num     <= reg_x_counter;         // Xサイズ記録
                    reg_x_counter <= {IMG_X_WIDTH{1'b0}};
                    reg_y_counter <= reg_y_counter + 1;
                end
                
                if ( s_axi4s_tuser[0] ) begin
                    if ( reg_y_counter > 0 ) begin
                        reg_y_num <= reg_y_counter;     // Yサイズ記録
                    end
                    reg_y_counter <= {IMG_Y_WIDTH{1'b0}};
                end
            end
            
            if ( cke ) begin
                reg_frame_last <= 1'b0;
                if ( reg_frame_last ) begin
                    if ( s_axi4s_tvalid || (reg_y_blank == param_blank_num) ) begin
                        reg_blank <= 1'b0;
                        
                        reg_tdata      <= s_axi4s_tdata;
                        reg_tlast      <= s_axi4s_tlast;
                        reg_tuser      <= s_axi4s_tuser;
                        reg_tvalid     <= s_axi4s_tvalid;
                    end
                    else begin
                        reg_y_blank    <= reg_y_blank + 1'b1;
                        reg_x_blank    <= {IMG_X_WIDTH{1'b0}};
                        reg_blank      <= 1'b1;
                        reg_tuser      <= BLANK_TUSER;
                        reg_tlast      <= ({IMG_X_WIDTH{1'b0}} == reg_x_num);
                        reg_tdata      <= BLANK_TDATA;
                        reg_tvalid     <= 1'b1;
                        reg_frame_last <= ({IMG_X_WIDTH{1'b0}} == reg_x_num);
                    end
                end
                else begin
                    if ( reg_blank ) begin
                        if ( reg_tlast ) begin
                            reg_x_blank <= {IMG_X_WIDTH{1'b0}};
                        end
                        else begin
                            reg_x_blank <= reg_x_blank + 1'b1;
                        end
                        reg_tuser      <= BLANK_TUSER;
                        reg_tlast      <= (reg_x_blank + 1'b1 == reg_x_num);
                        reg_tdata      <= BLANK_TDATA;
                        reg_tvalid     <= 1'b1;
                        reg_frame_last <= (reg_x_blank + 1'b1 == reg_x_num);
                    end
                    else begin
                        reg_tdata      <= s_axi4s_tdata;
                        reg_tlast      <= s_axi4s_tlast;
                        reg_tuser      <= s_axi4s_tuser;
                        reg_tvalid     <= s_axi4s_tvalid;
                        
                        if ( s_axi4s_tvalid && s_axi4s_tlast ) begin
                            reg_frame_last <= (reg_y_counter+1'b1 == reg_y_num);
                        end
                        reg_y_blank    <= {BLANK_Y_WIDTH{1'b0}};
                    end
                end
            end
        end
    end
    
    assign s_axi4s_tready = (cke && (!reg_blank || reg_frame_last));
    
    assign  m_axi4s_tdata  = reg_tdata;
    assign  m_axi4s_tlast  = reg_tlast;
    assign  m_axi4s_tuser  = reg_tuser;
    assign  m_axi4s_tvalid = reg_tvalid;
    
    assign  monitor_x_num = reg_x_num;
    assign  monitor_y_num = reg_y_num;
    
endmodule


`default_nettype wire


// end of file
