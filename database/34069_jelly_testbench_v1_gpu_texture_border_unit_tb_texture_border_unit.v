// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_texture_border_unit();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_texture_border_unit.vcd");
        $dumpvars(0, tb_texture_border_unit);
        
        #30000000;
            $display("!!!!TIME OUT!!!!");
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    
    parameter   USER_WIDTH   = 0;
    parameter   ADDR_X_WIDTH = 10;
    parameter   ADDR_Y_WIDTH = 10;
    parameter   X_WIDTH      = 10+1;
    parameter   Y_WIDTH      = 9+1;
    parameter   M_REGS       = 0;
    
    reg             [ADDR_X_WIDTH-1:0]  param_width  = 64;
    reg             [ADDR_Y_WIDTH-1:0]  param_height = 48;
    reg             [2:0]               param_x_op   = 3'b000;
    reg             [2:0]               param_y_op   = 3'b000;
    
//  reg             [USER_BITS-1:0]     s_user;
    reg     signed  [X_WIDTH-1:0]       s_x;
    reg     signed  [Y_WIDTH-1:0]       s_y;
    reg                                 s_valid;
    wire                                s_ready;
    
//  wire            [USER_BITS-1:0]     m_user;
    wire    signed  [X_WIDTH-1:0]       m_x;
    wire    signed  [Y_WIDTH-1:0]       m_y;
    
    wire                                m_border;
    wire            [ADDR_X_WIDTH-1:0]  m_addrx;
    wire            [ADDR_Y_WIDTH-1:0]  m_addry;
    wire                                m_valid;
    reg                                 m_ready = 1;
    
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_x     <= -10;
            s_y     <= -10;
            s_valid <= 0;
        end
        else begin
            if ( s_valid && s_ready ) begin
                s_x <= s_x + 1;
                if ( s_x == param_width+9 ) begin
                    s_x <= -10;
                    s_y <= s_y + 1;
                end
            end
            
            s_valid <= 1;
        end
    end
    
    
    jelly_texture_border_unit
            #(
                .USER_WIDTH         (X_WIDTH+Y_WIDTH),
                .ADDR_X_WIDTH       (ADDR_X_WIDTH),
                .ADDR_Y_WIDTH       (ADDR_Y_WIDTH),
                .X_WIDTH            (X_WIDTH),
                .Y_WIDTH            (Y_WIDTH),
                .M_REGS             (M_REGS)
            )
        i_texture_border_unit
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1),
                
                .param_width        (param_width),
                .param_height       (param_height),
                .param_x_op         (param_x_op),
                .param_y_op         (param_y_op),
            
                .s_user             ({s_x, s_y}),
                .s_x                (s_x),
                .s_y                (s_y),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_user             ({m_x, m_y}),
                .m_border           (m_border),
                .m_addrx            (m_addrx),
                .m_addry            (m_addry),
                .m_valid            (m_valid),
                .m_ready            (m_ready)
            );
    
    
    
    
endmodule


`default_nettype wire


// end of file
