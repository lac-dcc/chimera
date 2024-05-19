// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_axi4s_add_control_signal();
    localparam RATE     = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_axi4s_add_control_signal.vcd");
        $dumpvars(0, tb_axi4s_add_control_signal);
        
        #10000000;
            $finish;
    end
    
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)       reset = 1'b0;
    
    reg     clk = 1'b1;
    always #(RATE/2.0)      clk = ~clk;
    
    
    
    parameter   RAND_BUSY   = 1;
    
    
    parameter   X_WIDTH     = 10;
    parameter   Y_WIDTH     = 10;
    parameter   TUSER_WIDTH = 2;
    parameter   TDATA_WIDTH = 24;
    
    
    wire                        aresetn = ~reset;
    wire                        aclk    = clk;
    reg                         aclken  = 1;
    
//  reg     [X_WIDTH-1:0]       param_width  = 640;
//  reg     [Y_WIDTH-1:0]       param_height = 480;
    reg     [X_WIDTH-1:0]       param_width  = 64;
    reg     [Y_WIDTH-1:0]       param_height = 48;
    
    reg     [TDATA_WIDTH-1:0]   s_axi4s_tdata;
    reg                         s_axi4s_tvalid;
    wire                        s_axi4s_tready;
    
    wire    [TUSER_WIDTH-1:0]   m_axi4s_tuser;
    wire                        m_axi4s_tlast;
    wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata;
    wire                        m_axi4s_tvalid;
    reg                         m_axi4s_tready = 1;
    
    
    jelly_axi4s_add_control_signal
            #(
                .X_WIDTH            (X_WIDTH),
                .Y_WIDTH            (Y_WIDTH),
                .TUSER_WIDTH        (TUSER_WIDTH),
                .TDATA_WIDTH        (TDATA_WIDTH)
            )
        i_axi4s_add_control_signal
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                .aclken             (aclken),
                
                .param_width        (param_width),
                .param_height       (param_height),
                
                .s_axi4s_tdata      (s_axi4s_tdata),
                .s_axi4s_tvalid     (s_axi4s_tvalid),
                .s_axi4s_tready     (s_axi4s_tready),
                
                .m_axi4s_tuser      (m_axi4s_tuser),
                .m_axi4s_tlast      (m_axi4s_tlast),
                .m_axi4s_tdata      (m_axi4s_tdata),
                .m_axi4s_tvalid     (m_axi4s_tvalid),
                .m_axi4s_tready     (m_axi4s_tready)
            );
    
    
    always @(posedge aclk) begin
        aclken <= RAND_BUSY ? {$random()} : 1;
    end
    
    
    integer     fp;
    initial fp = $fopen("out.txt", "w");
    
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            s_axi4s_tdata  <= 0;
            s_axi4s_tvalid <= 0;
        end
        else if ( aclken ) begin
            if ( s_axi4s_tvalid && s_axi4s_tready ) begin
                s_axi4s_tdata  <= s_axi4s_tdata + 1;
            end
            
            if ( !s_axi4s_tvalid || s_axi4s_tready ) begin
                s_axi4s_tvalid <= RAND_BUSY ? {$random()} : 1;
            end
            
            
            if ( m_axi4s_tvalid && m_axi4s_tready ) begin
                $display("%h %b %b", m_axi4s_tdata, m_axi4s_tuser, m_axi4s_tlast);
                $fdisplay(fp, "%h %b %b", m_axi4s_tdata, m_axi4s_tuser, m_axi4s_tlast);
                if ( m_axi4s_tdata == param_width*param_height*3 ) begin
                    $finish;
                end
            end
            
            m_axi4s_tready <= RAND_BUSY ? {$random()} : 1;
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
