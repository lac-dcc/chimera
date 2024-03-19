
`timescale 1ns / 1ps
`default_nettype none


module tb_data_unit_converter();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_data_unit_converter.vcd");
        $dumpvars(0, tb_data_unit_converter);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    parameter   BUSY = 1;
    
    
    parameter   USER_WIDTH = 2;
    parameter   UNIT_WIDTH = 8;
    parameter   S_NUM      = 4; // 4
    parameter   M_NUM      = 3; // 3
    parameter   S_REGS     = 1;
    parameter   M_REGS     = 1;
    
    // local
    parameter   USER_BITS    = USER_WIDTH > 0 ? USER_WIDTH : 1;
    parameter   S_DATA_WIDTH = S_NUM * UNIT_WIDTH;
    parameter   M_DATA_WIDTH = M_NUM * UNIT_WIDTH;
    
    reg                             cke = 1;
    
    reg                             endian = 0;
    
    reg     [31:0]                  count;
    
    wire    [USER_BITS-1:0]         s_user = {(count[2:0] == 3'b111), (count[2:0] == 3'b000)};
    wire                            s_last = (count[2:0] == 3'b111);
    wire                            s_first = (count[2:0] == 3'b000);
    reg     [S_DATA_WIDTH-1:0]      s_data;
    reg                             s_valid;
    wire                            s_ready;
    
    wire    [USER_BITS-1:0]         m_user_first;
    wire    [USER_BITS-1:0]         m_user_last;
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
                s_data[i*UNIT_WIDTH +: UNIT_WIDTH] <= i;
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
        cke <= BUSY ? {$random()} : 1'b1;
    end
    
    always @(posedge clk) begin
        m_ready <= BUSY ? {$random()} : 1'b1;
    end
    
    
    jelly_data_unit_converter
            #(
                .USER_WIDTH         (USER_WIDTH),
                .UNIT_WIDTH         (UNIT_WIDTH),
                .S_NUM              (S_NUM),
                .M_NUM              (M_NUM),
                .S_REGS             (S_REGS),
                .M_REGS             (M_REGS)
            )
        i_data_unit_converter
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .endian             (endian),
                
                .s_user             (s_user),
                .s_first            (s_first),
                .s_last             (s_last),
                .s_data             (s_data),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_user_first       (m_user_first),
                .m_user_last        (m_user_last),
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
                $fdisplay(fp, "%h %b %b %b", m_data, m_last, m_user_first[0], m_user_last[1]);
            end
        end
    end
    
    
    
endmodule


`default_nettype wire


// end of file
