
`timescale 1ns / 1ps
`default_nettype none


module tb_data_combine_pack();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_data_combine_pack.vcd");
        $dumpvars(0, tb_data_combine_pack);
        
    #10000
        $finish();
    end
    
    parameter RAND_BUSY = 1;
    
    reg     reset = 1'b1;
    always #(RATE*100)      reset = 1'b0;
    
    reg     clk = 1'b1;
    always #(RATE/2.0)      clk = ~clk;
    
    reg     cke = 1'b1;
    always @(posedge clk)   cke <= RAND_BUSY ? {$random} : 1'b1;
    
    
    
    parameter NUM         = 3;
    parameter DATA0_WIDTH = 8;
    parameter DATA1_WIDTH = 16;
    parameter DATA2_WIDTH = 24;
    parameter S_REGS      = 1;
    parameter M_REGS      = 1;
    
    reg     [DATA0_WIDTH-1:0]   s0_data;
    reg                         s0_valid;
    wire                        s0_ready;
    
    reg     [DATA1_WIDTH-1:0]   s1_data;
    reg                         s1_valid;
    wire                        s1_ready;
    
    reg     [DATA2_WIDTH-1:0]   s2_data;
    reg                         s2_valid;
    wire                        s2_ready;
    
    wire    [DATA0_WIDTH-1:0]   m_data0;
    wire    [DATA1_WIDTH-1:0]   m_data1;
    wire    [DATA2_WIDTH-1:0]   m_data2;
    wire                        m_valid;
    reg                         m_ready;
    
    integer     i;
    always @(posedge clk) begin
        if ( reset ) begin
            s0_data  <= 1;
            s1_data  <= 2;
            s2_data  <= 3;
            s0_valid <= 1'b0;
            s1_valid <= 1'b0;
            s2_valid <= 1'b0;
        end
        else if ( cke ) begin
            if ( !s0_valid || s0_ready )    s0_valid <= RAND_BUSY ? {$random()} : 1'b1;
            if ( !s1_valid || s1_ready )    s1_valid <= RAND_BUSY ? {$random()} : 1'b1;
            if ( !s2_valid || s2_ready )    s2_valid <= RAND_BUSY ? {$random()} : 1'b1;
            
            if ( s0_valid && s0_ready )     s0_data  <= s0_data + 1;
            if ( s1_valid && s1_ready )     s1_data  <= s1_data + 1;
            if ( s2_valid && s2_ready )     s2_data  <= s2_data + 1;
        end
        
        m_ready <= RAND_BUSY ? {$random()} : 1'b1;
    end
    
    integer     fp;
    initial begin
        fp = $fopen("out.txt", "w");
    end
    
    always @(posedge clk) begin
        if ( cke ) begin
            if ( m_valid && m_ready ) begin
                $fdisplay(fp, "%h %h %h", m_data0, m_data1, m_data2);
            end
        end
    end
    
    jelly_data_combine_pack
            #(
                .NUM            (NUM),
                .DATA0_WIDTH    (DATA0_WIDTH),
                .DATA1_WIDTH    (DATA1_WIDTH),
                .DATA2_WIDTH    (DATA2_WIDTH),
                .S_REGS         (S_REGS),
                .M_REGS         (M_REGS)
            )
        i_data_combine_pack
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s0_data        (s0_data),
                .s0_valid       (s0_valid),
                .s0_ready       (s0_ready),
                
                .s1_data        (s1_data),
                .s1_valid       (s1_valid),
                .s1_ready       (s1_ready),
                
                .s2_data        (s2_data),
                .s2_valid       (s2_valid),
                .s2_ready       (s2_ready),
                
                .m_data0        (m_data0),
                .m_data1        (m_data1),
                .m_data2        (m_data2),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    
endmodule


`default_nettype wire


// end of file
