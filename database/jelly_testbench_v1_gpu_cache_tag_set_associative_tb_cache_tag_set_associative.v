
`timescale 1ns / 1ps
`default_nettype none


module tb_cache_tag_set_associative();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_cache_tag_set_associative.vcd");
        $dumpvars(0, tb_cache_tag_set_associative);
        
        #100000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    reg     cke = 1;
    always @(posedge clk)   cke <= {$random()};
    
    
    parameter   USER_WIDTH  = 0;
    parameter   WAY         = 2;
    parameter   WAY_WIDTH   = WAY <=   2 ? 1 :
                              WAY <=   4 ? 2 :
                              WAY <=   8 ? 3 :
                              WAY <=  16 ? 4 :
                              WAY <=  32 ? 5 :
                              WAY <=  64 ? 6 :
                              WAY <= 128 ? 7 : 8;
    parameter   INDEX_WIDTH = 3;
    parameter   TAG_WIDTH   = 1;
    parameter   RAM_TYPE    = "distributed";
    parameter   USER_BITS   = USER_WIDTH > 0 ? USER_WIDTH : 1;
    
    
    reg                             clear_start = 0;
    wire                            clear_busy;
    
    reg     [USER_BITS-1:0]         s_user;
    reg     [INDEX_WIDTH-1:0]       s_index;
    reg     [TAG_WIDTH-1:0]         s_tag;
    reg                             s_strb;
    reg                             s_valid = 0;
    
    wire    [USER_BITS-1:0]         m_user;
    wire    [INDEX_WIDTH-1:0]       m_index;
    wire    [WAY_WIDTH-1:0]         m_way;
    wire    [TAG_WIDTH-1:0]         m_tag;
    wire                            m_hit;
    wire                            m_strb;
    wire                            m_valid;
    
    jelly_cache_tag_set_associative
            #(
                .USER_WIDTH         (USER_WIDTH),
                .WAY_NUM            (WAY),
                .WAY_WIDTH          (WAY_WIDTH),
                .INDEX_WIDTH        (INDEX_WIDTH),
                .TAG_WIDTH          (TAG_WIDTH),
                .RAM_TYPE           (RAM_TYPE)
            )
        i_cache_tag_set_associative
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .clear_start        (clear_start),
                .clear_busy         (clear_busy),
                
                .s_user             (s_user),
                .s_index            (s_index),
                .s_tag              (s_tag),
                .s_strb             (s_strb),
                .s_valid            (s_valid),
                
                .m_user             (m_user),
                .m_index            (m_index),
                .m_way              (m_way),
                .m_tag              (m_tag),
                .m_hit              (m_hit),
                .m_strb             (m_strb),
                .m_valid            (m_valid)
            );
    
    integer     tb_count = 0;
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_user  <= {USER_BITS{1'b0}};
            s_index <= {INDEX_WIDTH{1'b0}};
            s_tag   <= {TAG_WIDTH{1'b0}};
            s_strb  <= 1'b0;
            s_valid <= 1'b0;
            tb_count <= 0;
        end
        else if ( cke ) begin
            tb_count <= tb_count + 1;
            
            if ( tb_count >= 1000 && tb_count < 1200 ) begin
                clear_start <= (tb_count == 1010);
                s_valid     <= 1'b0;
            end
            else begin
                if ( s_valid ) begin
                    s_user  <= s_user + 1;
                end
                s_index <= {$random()};
                s_tag   <= {$random()};
                s_strb  <= {$random()};
                s_valid <= {$random()};
            end
        end
    end
    
    
    localparam  MEM_SIZE = (1 << TAG_WIDTH);
    
    integer                         i;
    
    reg     [WAY-1:0]               mem_valid   [0:MEM_SIZE-1];
    reg     [WAY*INDEX_WIDTH-1:0]   mem_index   [0:MEM_SIZE-1];
    
    wire    out_miss  = m_valid && m_strb && !m_hit;
    wire    out_hit   = m_valid && m_strb && m_hit;
    wire    error     = out_hit && (!mem_valid[m_tag][m_way] || mem_index[m_tag][m_way*INDEX_WIDTH +: INDEX_WIDTH] != m_index);
    
    initial begin
        for ( i = 0; i < MEM_SIZE; i = i+1 ) begin
            mem_valid[i] = 0;
        end
    end
    
    
    wire    [INDEX_WIDTH-1:0]   exp_index = mem_index[m_tag][m_way*INDEX_WIDTH +: INDEX_WIDTH];
    wire                        exp_valid = mem_valid[m_tag][m_way];
    
    
    always @(posedge clk) begin
        if ( cke && !reset ) begin
            if ( m_valid && m_strb && m_hit ) begin
                if ( !mem_valid[m_tag][m_way] || mem_index[m_tag][m_way*INDEX_WIDTH +: INDEX_WIDTH] != m_index ) begin
                    $display("error");
                end
            end
            
            if ( m_valid && m_strb ) begin
                mem_valid[m_tag][m_way]                            = 1'b1;
                mem_index[m_tag][m_way*INDEX_WIDTH +: INDEX_WIDTH] = m_index;
            end
            
            if ( clear_start ) begin
                for ( i = 0; i < MEM_SIZE; i = i+1 ) begin
                    mem_valid[i] = 0;
                end
            end
        end
    end
    
    
//  wire    hit = m_valid && m_strb && m_hit && mem_valid[m_tag][m_way] && (mem_index[m_tag][m_way*INDEX_WIDTH +: INDEX_WIDTH] != m_index);
    
    
endmodule


`default_nettype wire


// end of file
