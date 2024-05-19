// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_data_crossbar();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_data_crossbar.vcd");
        $dumpvars(0, tb_data_crossbar);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    parameter   S_NUM       = 4;
    parameter   S_ID_WIDTH  = 2;
    parameter   M_NUM       = 8;
    parameter   M_ID_WIDTH  = 3;
    parameter   DATA_WIDTH  = 32;
    
    reg                                 cke = 1;
    
    reg     [S_NUM-1:0]                 s_last;
    reg     [S_NUM*M_ID_WIDTH-1:0]      s_id_to;
    reg     [S_NUM*DATA_WIDTH-1:0]      s_data;
    reg     [S_NUM-1:0]                 s_valid = {S_NUM{1'b0}};
    wire    [S_NUM-1:0]                 s_ready;
    
    wire    [M_NUM*S_ID_WIDTH-1:0]      m_id_from;
    wire    [M_NUM-1:0]                 m_last;
    wire    [M_NUM*DATA_WIDTH-1:0]      m_data;
    wire    [M_NUM-1:0]                 m_valid;
    reg     [M_NUM-1:0]                 m_ready = {M_NUM{1'b1}};
    
    
    integer     i;
    
    always @(posedge clk) begin
        for ( i = 0; i < S_NUM; i = i+1 ) begin
            if ( reset ) begin
                s_last [i]                          <= 1'b0;
                s_id_to[i*M_ID_WIDTH +: M_ID_WIDTH] <= i;
                s_data [i*DATA_WIDTH +: DATA_WIDTH] <= {DATA_WIDTH{1'b0}} + (i << 16);
                s_valid[i]                          <= 1'b0;
            end
            else if ( cke ) begin
                if ( s_valid[i] && s_ready[i] ) begin
                    s_last[i]                          <= (s_data[i*DATA_WIDTH +: 4] == 15-1);
                    s_data[i*DATA_WIDTH +: DATA_WIDTH] <= s_data[i*DATA_WIDTH +: DATA_WIDTH] + 1;
                end
                
                if ( !s_valid[i] || s_ready[i] ) begin
                    s_valid[i] <= {$random()};
                end
                
            end
        end
    end
    
    
    integer             fp  [M_NUM-1:0];
    reg     [9*8-1:0]   filename = "log00.txt";
    
    initial begin
        for ( i = 0; i < M_NUM; i = i+1 ) begin
            filename[4*8 +: 8] = "0" + (i%10);
            filename[5*8 +: 8] = "0" + (i/10%10);
            fp[i] = $fopen(filename, "w");
        end
    end
    
    always @(posedge clk) begin
        for ( i = 0; i < M_NUM; i = i+1 ) begin
            if ( m_valid[i] && m_ready[i] ) begin
                $fdisplay(fp[i], "%d %h %b", m_id_from[i*S_ID_WIDTH +: S_ID_WIDTH], m_data[i*DATA_WIDTH +: DATA_WIDTH]);
            end
        end
    end
    
    
    jelly_data_crossbar_simple
            #(
                .S_NUM          (S_NUM),
                .S_ID_WIDTH     (S_ID_WIDTH),
                .M_NUM          (M_NUM),
                .M_ID_WIDTH     (M_ID_WIDTH),
                .DATA_WIDTH     (DATA_WIDTH)
            )
        i_data_crossbar
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_id_to        (s_id_to),
        //      .s_last         (s_last),
                .s_data         (s_data),
                .s_valid        (s_valid),
        //      .s_ready        (s_ready),
                
                .m_id_from      (m_id_from),
        //      .m_last         (m_last),
                .m_data         (m_data),
                .m_valid        (m_valid)
        //      .m_ready        (m_ready)
            );
    
    assign s_ready = {S_NUM{1'b1}};
    
endmodule


`default_nettype wire


// end of file
