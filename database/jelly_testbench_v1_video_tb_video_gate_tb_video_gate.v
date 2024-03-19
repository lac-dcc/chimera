
`timescale 1ns / 1ps
`default_nettype none


module tb_video_gate();
    localparam RATE  = 10.0;
    
    initial begin
        $dumpfile("tb_video_gate.vcd");
        $dumpvars(0, tb_video_gate);
    
    #10000000
        $finish;
    end
    
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    
    
    parameter   TUSER_WIDTH   = 1;
    parameter   TDATA_WIDTH   = 4;
    
    wire                        aresetn = ~reset;
    wire                        aclk    = clk;
    wire                        aclken  = 1'b1;
    
    reg                         enable;
    wire                        busy;
    
    reg                         param_skip;
    
    wire    [TUSER_WIDTH-1:0]   s_axi4s_tuser;
    wire                        s_axi4s_tlast;
    reg     [TDATA_WIDTH-1:0]   s_axi4s_tdata;
    reg                         s_axi4s_tvalid;
    wire                        s_axi4s_tready;
    
    wire    [TUSER_WIDTH-1:0]   m_axi4s_tuser;
    wire                        m_axi4s_tlast;
    wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata;
    wire                        m_axi4s_tvalid;
    reg                         m_axi4s_tready = 1'b1;
    
    jelly_video_gate_core
            #(
                .TUSER_WIDTH        (TUSER_WIDTH),
                .TDATA_WIDTH        (TDATA_WIDTH)
            )
        i_video_gate_core
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                .aclken             (aclken),
                
                .enable             (enable),
                .busy               (busy),
                
                .param_skip         (param_skip),
                
                .s_axi4s_tuser      (s_axi4s_tuser),
                .s_axi4s_tlast      (s_axi4s_tlast),
                .s_axi4s_tdata      (s_axi4s_tdata),
                .s_axi4s_tvalid     (s_axi4s_tvalid),
                .s_axi4s_tready     (s_axi4s_tready),
                
                .m_axi4s_tuser      (m_axi4s_tuser),
                .m_axi4s_tlast      (m_axi4s_tlast),
                .m_axi4s_tdata      (m_axi4s_tdata),
                .m_axi4s_tvalid     (m_axi4s_tvalid),
                .m_axi4s_tready     (m_axi4s_tready)
            );
    
    
    always @(posedge clk) begin
        if ( reset ) begin
            enable         <= 0;
            param_skip     <= 0;
            m_axi4s_tready <= 1;
        end
        else if ( aclken ) begin
            enable         <= {$random()};
            param_skip     <= {$random()};
            m_axi4s_tready <= {$random()};
        end
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_axi4s_tdata   <= 5;
            s_axi4s_tvalid  <= 0;
        end
        else if ( aclken ) begin
            if ( s_axi4s_tvalid && s_axi4s_tready ) begin
                s_axi4s_tdata <= s_axi4s_tdata + 1;
            end
            s_axi4s_tvalid <= {$random()};
        end
    end
    
    assign s_axi4s_tuser = (s_axi4s_tdata      == 0);
    assign s_axi4s_tlast = (s_axi4s_tdata[1:0] == 2'b11);
    
    
    integer fp;
    initial fp = $fopen("out.txt", "w");
    always @(posedge clk) begin
        if (!reset && aclken && m_axi4s_tvalid && m_axi4s_tready ) begin
            $fdisplay(fp, "%b %b %h", m_axi4s_tuser, m_axi4s_tlast, m_axi4s_tdata);
        end
    end
    
    
    
endmodule


`default_nettype wire


// end of file
