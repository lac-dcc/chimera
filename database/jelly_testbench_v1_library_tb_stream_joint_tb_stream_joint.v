
`timescale 1ns / 1ps
`default_nettype none


module tb_stream_joint();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_stream_joint.vcd");
        $dumpvars(0, tb_stream_joint);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    parameter   NUM         = 4;
    parameter   ID_WIDTH    = 4;
    parameter   DATA_WIDTH  = 32;
    parameter   S_REGS      = 1;
    parameter   M_REGS      = 1;
    parameter   ALGORITHM   = "TOKEN_RING";
    parameter   USE_M_READY = 1;
    
    reg                             cke = 1;
    
    reg     [NUM-1:0]               s_last;
    reg     [NUM*DATA_WIDTH-1:0]    s_data;
    reg     [NUM-1:0]               s_valid = 0;
    wire    [NUM-1:0]               s_ready;
    
    wire    [ID_WIDTH-1:0]          m_id;
    wire                            m_last;
    wire    [DATA_WIDTH-1:0]        m_data;
    wire                            m_valid;
    reg                             m_ready = 1;
    
    
    integer     i;
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_last  <= {NUM{1'b0}};
            s_data  <= {(NUM*DATA_WIDTH){1'b0}};
            s_valid <= {NUM{1'b0}};
        end
        else if ( cke ) begin
            for ( i = 0; i < NUM; i = i+1 ) begin
                if ( s_valid[i] && s_ready[i] ) begin
                    s_data[i*DATA_WIDTH +: DATA_WIDTH] <= s_data[i*DATA_WIDTH +: DATA_WIDTH] + 1;
                    s_last[i] <= (s_data[i*DATA_WIDTH +: 4] == 15-1);
                end
                
                if ( !s_valid[i] || s_ready[i] ) begin
                    s_valid[i] <= {$random()};
                end
            end
            
            if ( m_valid && m_ready ) begin
                $display("%d %h %b", m_id, m_data, m_last);
            end
        end
    end
    
    
    
    jelly_stream_joint
            #(
                .NUM            (NUM),
                .ID_WIDTH       (ID_WIDTH),
                .DATA_WIDTH     (DATA_WIDTH),
                .S_REGS         (S_REGS),
                .M_REGS         (M_REGS),
                .ALGORITHM      (ALGORITHM),
                .USE_M_READY    (USE_M_READY)
            )
        i_stream_joint
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_last         (s_last),
                .s_data         (s_data),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_id           (m_id),
                .m_last         (m_last),
                .m_data         (m_data),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
endmodule


`default_nettype wire


// end of file
