
`timescale 1ns / 1ps
`default_nettype none


module tb_minmax();
    localparam RATE = 10.0;
    
    initial begin
        $dumpfile("tb_minmax.vcd");
        $dumpvars(0, tb_minmax);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*20)   reset = 1'b0;
    
    
    parameter   NUM               = 5;
    parameter   INDEX_WIDTH       = NUM <=     2 ?  1 :
                                    NUM <=     4 ?  2 :
                                    NUM <=     8 ?  3 :
                                    NUM <=    16 ?  4 :
                                    NUM <=    32 ?  5 :
                                    NUM <=    64 ?  6 :
                                    NUM <=   128 ?  7 :
                                    NUM <=   256 ?  8 :
                                    NUM <=   512 ?  9 :
                                    NUM <=  1024 ? 10 :
                                    NUM <=  2048 ? 11 :
                                    NUM <=  4096 ? 12 :
                                    NUM <=  8192 ? 13 :
                                    NUM <= 16384 ? 14 :
                                    NUM <= 32768 ? 15 : 16;
    parameter   COMMON_USER_WIDTH = 4+8;
    parameter   USER_WIDTH        = 4;
    parameter   DATA_WIDTH        = 8;
    parameter   DATA_SIGNED       = 0;
    parameter   CMP_MIN           = 0;      // minかmaxか
    parameter   CMP_EQ            = 0;      // 同値のとき data0 と data1 どちらを優先するか
    
    parameter   COMMON_USER_BITS  = COMMON_USER_WIDTH > 0 ? COMMON_USER_WIDTH : 1;
    parameter   USER_BITS         = USER_WIDTH        > 0 ? USER_WIDTH        : 1;
    
    
    localparam  STAGES = NUM <=     2 ?  1 :
                         NUM <=     4 ?  2 :
                         NUM <=     8 ?  3 :
                         NUM <=    16 ?  4 :
                         NUM <=    32 ?  5 :
                         NUM <=    64 ?  6 :
                         NUM <=   128 ?  7 :
                         NUM <=   256 ?  8 :
                         NUM <=   512 ?  9 :
                         NUM <=  1024 ? 10 :
                         NUM <=  2048 ? 11 :
                         NUM <=  4096 ? 12 :
                         NUM <=  8192 ? 13 :
                         NUM <= 16384 ? 14 :
                         NUM <= 32768 ? 15 : 16;
    
    localparam  N      = (1 << (STAGES-1));
    
    
    
    reg                                 cke = 1'b1;
    
    reg     [COMMON_USER_BITS-1:0]      s_common_user;
    reg     [NUM*USER_BITS-1:0]         s_user;
    reg     [NUM*DATA_WIDTH-1:0]        s_data;
    reg     [NUM-1:0]                   s_en;
    reg                                 s_valid = 0;
    
    wire    [COMMON_USER_BITS-1:0]      m_common_user;
    wire    [USER_BITS-1:0]             m_user;
    wire    [DATA_WIDTH-1:0]            m_data;
    wire    [INDEX_WIDTH-1:0]           m_index;
    wire                                m_en;
    wire                                m_valid;
    
    wire    [COMMON_USER_BITS-1:0]      exp_common_user;
    wire    [USER_BITS-1:0]             exp_user;
    wire    [DATA_WIDTH-1:0]            exp_data;
    wire    [INDEX_WIDTH-1:0]           exp_index;
    wire                                exp_en;
    wire                                exp_valid;
    
    jelly_minmax
            #(
                .NUM               (NUM),
                .COMMON_USER_WIDTH (COMMON_USER_WIDTH),
                .USER_WIDTH        (USER_WIDTH),
                .DATA_WIDTH        (DATA_WIDTH),
                .DATA_SIGNED       (DATA_SIGNED),
                .CMP_MIN           (CMP_MIN),
                .CMP_EQ            (CMP_EQ)
            )
        i_minmax
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_common_user      (s_common_user),
                .s_user             (s_user),
                .s_data             (s_data),
                .s_en               (s_en),
                .s_valid            (s_valid),
                
                .m_common_user      (m_common_user),
                .m_user             (m_user),
                .m_data             (m_data),
                .m_index            (m_index),
                .m_en               (m_en),
                .m_valid            (m_valid)
            );
    
    jelly_minmax_exp
            #(
                .NUM               (NUM),
                .COMMON_USER_WIDTH (COMMON_USER_WIDTH),
                .USER_WIDTH        (USER_WIDTH),
                .DATA_WIDTH        (DATA_WIDTH),
                .DATA_SIGNED       (DATA_SIGNED),
                .CMP_MIN           (CMP_MIN),
                .CMP_EQ            (CMP_EQ)
            )
        i_minmax_exp
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_common_user      (s_common_user),
                .s_user             (s_user),
                .s_data             (s_data),
                .s_en               (s_en),
                .s_valid            (s_valid),
                
                .m_common_user      (exp_common_user),
                .m_user             (exp_user),
                .m_data             (exp_data),
                .m_index            (exp_index),
                .m_en               (exp_en),
                .m_valid            (exp_valid)
            );
    
    always @(posedge clk) begin
        if ( !reset ) begin
            if ( m_valid != exp_valid ) begin
                $display("error : m_valid");
                $stop;
            end
            
            if ( m_valid ) begin
                if ( m_en != exp_en ) begin
                    $display("error : m_en");
                    $stop;
                end
                
                if ( m_en ) begin
                    if ( m_index  != exp_index )            begin   $display("error : m_index");        $stop; end
                    if ( m_data != exp_data )               begin   $display("error : m_data");         $stop; end
                    if ( m_user != exp_user )               begin   $display("error : m_user");         $stop; end
                    if ( m_common_user != exp_common_user ) begin   $display("error : m_common_user");  $stop; end
                end
            end
        end
    end
    
    
    wire    [COMMON_USER_BITS-1:0]  st0_common_user = i_minmax_exp.reg_common_user[0*COMMON_USER_BITS +: COMMON_USER_BITS];
    wire    [N*USER_BITS-1:0]       st0_user        = i_minmax_exp.reg_user       [0*N*USER_BITS      +: N*USER_BITS];
    wire    [N*DATA_WIDTH-1:0]      st0_data        = i_minmax_exp.reg_data       [0*N*DATA_WIDTH     +: N*DATA_WIDTH];
    wire    [N-1:0]                 st0_en          = i_minmax_exp.reg_en         [0*N                +: N];
    wire                            st0_valid       = i_minmax_exp.reg_valid      [0                  +: 1];
    
    wire    [COMMON_USER_BITS-1:0]  st1_common_user = i_minmax_exp.reg_common_user[1*COMMON_USER_BITS +: COMMON_USER_BITS];
    wire    [N*USER_BITS-1:0]       st1_user        = i_minmax_exp.reg_user       [1*N*USER_BITS      +: N*USER_BITS];
    wire    [N*DATA_WIDTH-1:0]      st1_data        = i_minmax_exp.reg_data       [1*N*DATA_WIDTH     +: N*DATA_WIDTH];
    wire    [N-1:0]                 st1_en          = i_minmax_exp.reg_en         [1*N                +: N];
    wire                            st1_valid       = i_minmax_exp.reg_valid      [1                  +: 1];
    
    wire    [COMMON_USER_BITS-1:0]  st2_common_user = i_minmax_exp.reg_common_user[2*COMMON_USER_BITS +: COMMON_USER_BITS];
    wire    [N*USER_BITS-1:0]       st2_user        = i_minmax_exp.reg_user       [2*N*USER_BITS      +: N*USER_BITS];
    wire    [N*DATA_WIDTH-1:0]      st2_data        = i_minmax_exp.reg_data       [2*N*DATA_WIDTH     +: N*DATA_WIDTH];
    wire    [N-1:0]                 st2_en          = i_minmax_exp.reg_en         [2*N                +: N];
    wire                            st2_valid       = i_minmax_exp.reg_valid      [2                  +: 1];
    
    integer     i, j ;
    
    initial begin
        #500
        @(posedge clk)
            s_common_user <= 1;
            s_user        <= {4'h4,  4'h3,  4'h2 , 4'h1,  4'h0 };
            s_data        <= {8'h15, 8'h14, 8'h13, 8'h12, 8'h11};
            s_en          <= {1'b1,  1'b1,  1'b1,  1'b1,  1'b1 };
            s_valid       <= 1'b1;
            
        @(posedge clk);
            s_common_user <= 2;
            s_user        <= {4'h4,  4'h3,  4'h2 , 4'h1,  4'h0 };
            s_data        <= {8'h15, 8'h44, 8'h10, 8'h12, 8'h33};
            s_en          <= {1'b1,  1'b1,  1'b1,  1'b1,  1'b1 };
            s_valid       <= 1'b1;
        @(posedge clk);
            s_valid       <= 1'b0;
            
        @(posedge clk);
            s_common_user <= 3;
            s_user        <= {4'h4,  4'h3,  4'h2 , 4'h1,  4'h0 };
            s_data        <= {8'h15, 8'h14, 8'h12, 8'h12, 8'h33};
            s_en          <= {1'b1,  1'b1,  1'b1,  1'b1,  1'b1 };
            s_valid       <= 1'b1;
            
        @(posedge clk);
            s_common_user <= 4;
            s_user        <= {4'h4,  4'h3,  4'h2 , 4'h1,  4'h0 };
            s_data        <= {8'h00, 8'h00, 8'h00, 8'h00, 8'h00};
            s_en          <= {1'b1,  1'b1,  1'b1,  1'b1,  1'b1 };
            s_valid       <= 1'b1;
            
        @(posedge clk);
            s_common_user <= 5;
            s_user        <= {4'h4,  4'h3,  4'h2 , 4'h1,  4'h0 };
            s_data        <= {8'hff, 8'hff, 8'hff, 8'hff, 8'hff};
            s_en          <= {1'b1,  1'b1,  1'b1,  1'b1,  1'b1 };
            s_valid       <= 1'b1;
            
        @(posedge clk);
            s_common_user <= 6;
            s_user        <= {4'h4,  4'h3,  4'h2 , 4'h1,  4'h0 };
            s_data        <= {8'h15, 8'h55, 8'h12, 8'h55, 8'h33};
            s_en          <= {1'b1,  1'b1,  1'b1,  1'b1,  1'b1 };
            s_valid       <= 1'b1;
            
            for ( i = 0; i < 10000; i = i+1 ) begin
            @(posedge clk);
                cke           <= {$random()};
                s_common_user <= {$random()};
                s_valid       <= {$random()};
                for ( j = 0; j < NUM; j = j+1 ) begin
                    s_user[j*USER_BITS  +: USER_BITS]  <= {$random()};
                    s_data[j*DATA_WIDTH +: DATA_WIDTH] <= {$random()};
                    s_en  [j]                          <= {$random()};
                end
            end
        @(posedge clk);
            cke     <= 1'b1;
            s_valid <= 1'b0;
            
            
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
            $finish();
    end
    
    
endmodule




// 古い合成イマイチバージョンを期待値比較に使う
module jelly_minmax_exp
        #(
            parameter   NUM               = 12,
            parameter   INDEX_WIDTH       = NUM <=     2 ?  1 :
                                            NUM <=     4 ?  2 :
                                            NUM <=     8 ?  3 :
                                            NUM <=    16 ?  4 :
                                            NUM <=    32 ?  5 :
                                            NUM <=    64 ?  6 :
                                            NUM <=   128 ?  7 :
                                            NUM <=   256 ?  8 :
                                            NUM <=   512 ?  9 :
                                            NUM <=  1024 ? 10 :
                                            NUM <=  2048 ? 11 :
                                            NUM <=  4096 ? 12 :
                                            NUM <=  8192 ? 13 :
                                            NUM <= 16384 ? 14 :
                                            NUM <= 32768 ? 15 : 16,
            parameter   COMMON_USER_WIDTH = 32,
            parameter   USER_WIDTH        = 32,
            parameter   DATA_WIDTH        = 32,
            parameter   DATA_SIGNED       = 1,
            parameter   CMP_MIN           = 0,      // minかmaxか
            parameter   CMP_EQ            = 0,      // 同値のとき data0 と data1 どちらを優先するか
            
            parameter   COMMON_USER_BITS  = COMMON_USER_WIDTH > 0 ? COMMON_USER_WIDTH : 1,
            parameter   USER_BITS         = USER_WIDTH        > 0 ? USER_WIDTH        : 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            input   wire    [COMMON_USER_BITS-1:0]      s_common_user,
            input   wire    [NUM*USER_BITS-1:0]         s_user,
            input   wire    [NUM*DATA_WIDTH-1:0]        s_data,
            input   wire    [NUM-1:0]                   s_en,
            input   wire                                s_valid,
            
            output  wire    [COMMON_USER_BITS-1:0]      m_common_user,
            output  wire    [USER_BITS-1:0]             m_user,
            output  wire    [DATA_WIDTH-1:0]            m_data,
            output  wire    [INDEX_WIDTH-1:0]           m_index,
            output  wire                                m_en,
            output  wire                                m_valid
        );
    
    
    // 一部処理系で $clog2 が正しく動かないので
    localparam  STAGES = NUM <=     2 ?  1 :
                         NUM <=     4 ?  2 :
                         NUM <=     8 ?  3 :
                         NUM <=    16 ?  4 :
                         NUM <=    32 ?  5 :
                         NUM <=    64 ?  6 :
                         NUM <=   128 ?  7 :
                         NUM <=   256 ?  8 :
                         NUM <=   512 ?  9 :
                         NUM <=  1024 ? 10 :
                         NUM <=  2048 ? 11 :
                         NUM <=  4096 ? 12 :
                         NUM <=  8192 ? 13 :
                         NUM <= 16384 ? 14 :
                         NUM <= 32768 ? 15 : 16;
    
    localparam  N      = (1 << (STAGES-1));
    
    
    // 比較
    function cmp_data(
                    input   [DATA_WIDTH-1:0]    in_data0,
                    input                       in_en0,
                    input   [DATA_WIDTH-1:0]    in_data1,
                    input                       in_en1
                );
        reg     signed  [DATA_WIDTH:0]  data0;
        reg     signed  [DATA_WIDTH:0]  data1;
        begin
            if ( DATA_SIGNED ) begin
                data0 = {in_data0[DATA_WIDTH-1], in_data0};
                data1 = {in_data1[DATA_WIDTH-1], in_data1};
            end
            else begin
                data0 = {1'b0, in_data0};
                data1 = {1'b0, in_data1};
            end
            
            if ( in_en0 && in_en1 ) begin
                if ( CMP_EQ ) begin
                    cmp_data = CMP_MIN ? (data1 <= data0) : (data1 >= data0);
                end
                else begin
                    cmp_data = CMP_MIN ? (data1 <  data0) : (data1 > data0);
                end
            end
            else if ( in_en0 && !in_en1 ) begin
                cmp_data = 1'b0;
            end
            else if ( !in_en0 && in_en1 ) begin
                cmp_data = 1'b1;
            end
            else if ( !in_en0 && !in_en1 ) begin
                cmp_data = CMP_EQ;
            end
        end
    endfunction
    
    
    integer                                 i, j;
    
    reg     [STAGES*COMMON_USER_BITS-1:0]   reg_common_user;
    reg     [STAGES*N*USER_BITS-1:0]        reg_user;
    reg     [STAGES*N*DATA_WIDTH-1:0]       reg_data;
    reg     [STAGES*N*INDEX_WIDTH-1:0]      reg_index;
    reg     [STAGES*N-1:0]                  reg_en;
    reg     [STAGES-1:0]                    reg_valid;
    
    reg     [COMMON_USER_BITS-1:0]          tmp_common_user;
    reg     [(1 << STAGES)*USER_BITS-1:0]   tmp_user;
    reg     [(1 << STAGES)*DATA_WIDTH-1:0]  tmp_data;
    reg     [(1 << STAGES)*INDEX_WIDTH-1:0] tmp_index;
    reg     [(1 << STAGES)-1:0]             tmp_en;
    reg                                     sel;
    
    always @(posedge clk) begin
        if ( cke ) begin
            for ( i = 0; i < STAGES; i = i+1 ) begin
                if ( i < STAGES - 1 ) begin
                    tmp_common_user = reg_common_user[(i+1)*COMMON_USER_BITS +: COMMON_USER_BITS];
                    tmp_user        = reg_user       [(i+1)*N*USER_BITS      +: N*USER_BITS];
                    tmp_data        = reg_data       [(i+1)*N*DATA_WIDTH     +: N*DATA_WIDTH];
                    tmp_index       = reg_index      [(i+1)*N*INDEX_WIDTH    +: N*INDEX_WIDTH];
                    tmp_en          = reg_en         [(i+1)*N                +: N];
                end
                else begin
                    tmp_common_user = s_common_user;
                    tmp_user        = s_user;
                    tmp_data        = s_data;
                    tmp_en          = s_en;
                    for ( j = 0; j < (1 << STAGES); j = j+1 ) begin
                        tmp_index[j*INDEX_WIDTH +: INDEX_WIDTH] = j;
                    end
                end
                
                reg_common_user[i*COMMON_USER_BITS +: COMMON_USER_BITS] <= tmp_common_user;
                for ( j = 0; j < N; j = j+1 ) begin
                    sel = cmp_data(tmp_data[(2*j+0)*DATA_WIDTH +: DATA_WIDTH], tmp_en[2*j+0],
                                   tmp_data[(2*j+1)*DATA_WIDTH +: DATA_WIDTH], tmp_en[2*j+1]);
                    
                    reg_user [(i*N+j)*USER_BITS   +: USER_BITS]   <= tmp_user [(2*j+sel)*USER_BITS   +: USER_BITS];
                    reg_data [(i*N+j)*DATA_WIDTH  +: DATA_WIDTH]  <= tmp_data [(2*j+sel)*DATA_WIDTH  +: DATA_WIDTH];
                    reg_index[(i*N+j)*INDEX_WIDTH +: INDEX_WIDTH] <= tmp_index[(2*j+sel)*INDEX_WIDTH +: INDEX_WIDTH];
                    reg_en   [i*N+j]                              <= (tmp_en[2*j+0] || tmp_en[2*j+1]);
                end
            end
        end
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_valid <= {STAGES{1'b0}};
        end
        else if ( cke ) begin
            reg_valid <= ({s_valid, reg_valid} >> 1);
        end
    end
    
    
    assign m_common_user = reg_common_user[0 +: COMMON_USER_BITS];
    assign m_user        = reg_user       [0 +: USER_BITS];
    assign m_data        = reg_data       [0 +: DATA_WIDTH];
    assign m_index       = reg_index      [0 +: INDEX_WIDTH];
    assign m_en          = reg_en         [0];
    assign m_valid       = reg_valid      [0];
    
    
endmodule




`default_nettype wire


// end of file
