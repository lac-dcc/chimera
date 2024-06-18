// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_data_packing();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_data_packing.vcd");
        $dumpvars(0, tb_data_packing);
        #100000
        $finish();
    end
    
    parameter   BUSY = 0;
    
    reg     reset = 1'b1;
    always #(RATE*100)      reset = 1'b0;
    
    reg     clk = 1'b1;
    always #(RATE/2.0)      clk = ~clk;
    
    reg     cke = 1;
    always @(posedge clk)   cke <= BUSY ? {$random} : 1'b1;
    
    
    parameter   UNIT_WIDTH = 8;
    parameter   S_NUM      = 4;
    parameter   M_NUM      = 5;
    
    
    parameter   S_DATA_WIDTH     = S_NUM * UNIT_WIDTH;
    parameter   M_DATA_WIDTH     = M_NUM * UNIT_WIDTH;
    parameter   PADDING_DATA     = 32'hxxxx_xxxx; // 32'h55aa5a5a;
    parameter   FIRST_FORCE_LAST = 1;  // firstで前方吐き出し時に残変換があればlastを付与
    parameter   FIRST_OVERWRITE  = 0;  // first時前方に残変換があれば吐き出さずに上書き

    
    reg                             endian = 0;
    
    reg     [31:0]                  count;
    
    wire                            s_first = 0;//(count[0:0] == 1'b0);
    wire                            s_last  = 0;//(count[0:0] == 1'b1);
    reg     [S_DATA_WIDTH-1:0]      s_data;
    reg                             s_valid;
    wire                            s_ready;
    
    wire                            m_first;
    wire                            m_last;
    wire    [M_DATA_WIDTH-1:0]      m_data;
    wire                            m_valid;
    reg                             m_ready = 1;
    
    integer                         i;
    
    always @(posedge clk) begin
        if ( reset ) begin
            count   <= 0;
            for ( i = 0; i < S_NUM; i = i+1 ) begin
                s_data[i*UNIT_WIDTH +: UNIT_WIDTH] <= endian ? S_NUM - 1 - i : i;
            end
            s_valid <= 0;
        end
        else if ( cke ) begin
            if ( s_valid && s_ready ) begin
                for ( i = 0; i < S_NUM; i = i+1 ) begin
                    s_data[i*UNIT_WIDTH +: UNIT_WIDTH] <= s_data[i*UNIT_WIDTH +: UNIT_WIDTH] + S_NUM;
                end
                count <= count + 1;
            end
            
            if ( !s_valid || s_ready ) begin
                s_valid <= BUSY ? {$random()} : 1'b1;
            end
        end
    end
    
    always @(posedge clk) begin
        m_ready <= BUSY ? {$random()} : 1'b1;
    end
    
    
    jelly_data_packing
            #(
                .UNIT_WIDTH         (UNIT_WIDTH),
                .S_NUM              (S_NUM),
                .M_NUM              (M_NUM),
                .S_DATA_WIDTH       (S_DATA_WIDTH),
                .M_DATA_WIDTH       (M_DATA_WIDTH),
                .FIRST_FORCE_LAST   (FIRST_FORCE_LAST),
                .FIRST_OVERWRITE    (FIRST_OVERWRITE)
            )
        i_data_unit_converter
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .endian             (endian),
                .padding_data       (PADDING_DATA),
                
                .s_first            (s_first),
                .s_last             (s_last),
                .s_data             (s_data),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_first            (m_first),
                .m_last             (m_last),
                .m_data             (m_data),
                .m_valid            (m_valid),
                .m_ready            (m_ready)
            );
    
    integer fp;
    initial begin
        fp = $fopen("out.txt", "w");
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
        end
        else if ( cke ) begin
            if ( m_valid && m_ready ) begin
                $fdisplay(fp, "%h %b %b", m_data, m_first, m_last);
            end
        end
    end
    
    
    
endmodule


`default_nettype wire


// end of file
