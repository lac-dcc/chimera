// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// tuser と tlast を付与
module jelly_axi4s_add_control_signal
        #(
            parameter   X_WIDTH     = 10,
            parameter   Y_WIDTH     = 10,
            parameter   TUSER_WIDTH = 1,
            parameter   TDATA_WIDTH = 24
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            input   wire    [X_WIDTH-1:0]       param_width,
            input   wire    [Y_WIDTH-1:0]       param_height,
            
            input   wire    [TDATA_WIDTH-1:0]   s_axi4s_tdata,
            input   wire                        s_axi4s_tvalid,
            output  wire                        s_axi4s_tready,
            
            output  wire    [TUSER_WIDTH-1:0]   m_axi4s_tuser,
            output  wire                        m_axi4s_tlast,
            output  wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready
        );
    
    wire                        cke;
    
    reg                         reg_first;
    reg     [X_WIDTH-1:0]       reg_x;
    reg                         reg_x_last;
    reg     [Y_WIDTH-1:0]       reg_y;
    reg                         reg_y_last;
    
    reg     [1:0]               reg_tuser;
    reg                         reg_tlast;
    reg     [TDATA_WIDTH-1:0]   reg_tdata;
    reg                         reg_tvalid;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            reg_first  <= 1'b1;
            reg_tvalid <= 1'b0;
        end
        else if ( aclken ) begin
            if ( s_axi4s_tvalid && s_axi4s_tready ) begin
                reg_first <= 1'b0;
                if ( reg_x_last && reg_y_last ) begin
                    reg_first <= 1'b1;
                end
            end
            
            if ( !m_axi4s_tvalid || m_axi4s_tready ) begin
                reg_tvalid <= s_axi4s_tvalid;
            end
        end
    end
    
    always @(posedge aclk) begin
        if ( aclken ) begin
            // slave port stage
            if ( s_axi4s_tvalid && s_axi4s_tready ) begin
                reg_x       <= reg_x + 1'b1;
                reg_x_last  <= ((reg_x + 1'b1) == (param_width - 1'b1));
                if ( reg_x_last ) begin
                    reg_x       <= {X_WIDTH{1'b0}};
                    reg_x_last  <= (param_width == 1);
                    reg_y       <= reg_y + 1'b1;
                    reg_y_last  <= ((reg_y + 1'b1) == (param_height - 1'b1));
                    if ( reg_y_last ) begin
                        reg_y      <= {Y_WIDTH{1'b0}};
                        reg_y_last <= (param_height == 1);
                    end
                end
            end
            else begin
                if ( reg_first ) begin
                    reg_x      <= {X_WIDTH{1'b0}};
                    reg_x_last <= (param_width == 1);
                    reg_y      <= {Y_WIDTH{1'b0}};
                    reg_y_last <= (param_height == 1);
                end
            end
            
            // master port stage
            if ( !m_axi4s_tvalid || m_axi4s_tready ) begin
                reg_tuser[1] <= reg_x_last & reg_y_last;
                reg_tuser[0] <= reg_first;
                reg_tlast    <= reg_x_last;
                reg_tdata    <= s_axi4s_tdata;
            end
        end
    end
    
    assign s_axi4s_tready = !m_axi4s_tvalid || m_axi4s_tready;
    
    assign m_axi4s_tuser  = reg_tuser;
    assign m_axi4s_tlast  = reg_tlast;
    assign m_axi4s_tdata  = reg_tdata;
    assign m_axi4s_tvalid = reg_tvalid;
    
endmodule


`default_nettype wire


// end of file
