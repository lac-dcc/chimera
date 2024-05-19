// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_fixed_atan2_multicycle();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_fixed_atan2_multicycle.vcd");
        $dumpvars(0, tb_fixed_atan2_multicycle);
        
        #100000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    parameter   DATA_WIDTH = 32;
    
    reg                      cke = 1'b1;
    always @(posedge clk) cke <= {$random()};
    
    
    
    parameter   SCALED_RADIAN = 1;
    parameter   X_WIDTH       = 30;
    parameter   Y_WIDTH       = 30;
    parameter   ANGLE_WIDTH   = 16;
    parameter   Q_WIDTH       = SCALED_RADIAN ? ANGLE_WIDTH : ANGLE_WIDTH - 4;
    
    
    // テストテーブル(約10度刻みで螺旋回転)
    localparam  TBL_NUM = 72;
    reg     signed  [X_WIDTH-1:0]  x_tbl   [0:TBL_NUM-1];
    reg     signed  [Y_WIDTH-1:0]  y_tbl   [0:TBL_NUM-1];
    initial begin
        x_tbl[ 0] =  100; y_tbl[ 0] =     0;
        x_tbl[ 1] =  100; y_tbl[ 1] =    17;
        x_tbl[ 2] =   97; y_tbl[ 2] =    35;
        x_tbl[ 3] =   91; y_tbl[ 3] =    52;
        x_tbl[ 4] =   82; y_tbl[ 4] =    69;
        x_tbl[ 5] =   70; y_tbl[ 5] =    84;
        x_tbl[ 6] =   56; y_tbl[ 6] =    96;
        x_tbl[ 7] =   38; y_tbl[ 7] =   107;
        x_tbl[ 8] =   20; y_tbl[ 8] =   114;
        x_tbl[ 9] =    0; y_tbl[ 9] =   118;
        x_tbl[10] =  -20; y_tbl[10] =   118;
        x_tbl[11] =  -41; y_tbl[11] =   114;
        x_tbl[12] =  -61; y_tbl[12] =   107;
        x_tbl[13] =  -80; y_tbl[13] =    96;
        x_tbl[14] =  -98; y_tbl[14] =    82;
        x_tbl[15] = -112; y_tbl[15] =    64;
        x_tbl[16] = -124; y_tbl[16] =    45;
        x_tbl[17] = -131; y_tbl[17] =    23;
        x_tbl[18] = -136; y_tbl[18] =     0;
        x_tbl[19] = -135; y_tbl[19] =   -23;
        x_tbl[20] = -131; y_tbl[20] =   -47;
        x_tbl[21] = -122; y_tbl[21] =   -71;
        x_tbl[22] = -110; y_tbl[22] =   -92;
        x_tbl[23] =  -93; y_tbl[23] =  -111;
        x_tbl[24] =  -74; y_tbl[24] =  -128;
        x_tbl[25] =  -51; y_tbl[25] =  -140;
        x_tbl[26] =  -26; y_tbl[26] =  -149;
        x_tbl[27] =    0; y_tbl[27] =  -154;
        x_tbl[28] =   27; y_tbl[28] =  -153;
        x_tbl[29] =   54; y_tbl[29] =  -148;
        x_tbl[30] =   80; y_tbl[30] =  -138;
        x_tbl[31] =  104; y_tbl[31] =  -124;
        x_tbl[32] =  125; y_tbl[32] =  -105;
        x_tbl[33] =  143; y_tbl[33] =   -83;
        x_tbl[34] =  157; y_tbl[34] =   -57;
        x_tbl[35] =  167; y_tbl[35] =   -29;
        x_tbl[36] =  172; y_tbl[36] =     0;
        x_tbl[37] =  171; y_tbl[37] =    30;
        x_tbl[38] =  165; y_tbl[38] =    60;
        x_tbl[39] =  154; y_tbl[39] =    88;
        x_tbl[40] =  137; y_tbl[40] =   115;
        x_tbl[41] =  116; y_tbl[41] =   139;
        x_tbl[42] =   91; y_tbl[42] =   159;
        x_tbl[43] =   63; y_tbl[43] =   174;
        x_tbl[44] =   32; y_tbl[44] =   185;
        x_tbl[45] =    0; y_tbl[45] =   190;
        x_tbl[46] =  -33; y_tbl[46] =   189;
        x_tbl[47] =  -66; y_tbl[47] =   182;
        x_tbl[48] =  -97; y_tbl[48] =   169;
        x_tbl[49] = -127; y_tbl[49] =   151;
        x_tbl[50] = -153; y_tbl[50] =   128;
        x_tbl[51] = -174; y_tbl[51] =   100;
        x_tbl[52] = -191; y_tbl[52] =    69;
        x_tbl[53] = -202; y_tbl[53] =    35;
        x_tbl[54] = -208; y_tbl[54] =     0;
        x_tbl[55] = -206; y_tbl[55] =   -36;
        x_tbl[56] = -199; y_tbl[56] =   -72;
        x_tbl[57] = -185; y_tbl[57] =  -106;
        x_tbl[58] = -165; y_tbl[58] =  -138;
        x_tbl[59] = -140; y_tbl[59] =  -166;
        x_tbl[60] = -109; y_tbl[60] =  -190;
        x_tbl[61] =  -75; y_tbl[61] =  -208;
        x_tbl[62] =  -38; y_tbl[62] =  -220;
        x_tbl[63] =    0; y_tbl[63] =  -226;
        x_tbl[64] =   39; y_tbl[64] =  -224;
        x_tbl[65] =   78; y_tbl[65] =  -216;
        x_tbl[66] =  115; y_tbl[66] =  -200;
        x_tbl[67] =  150; y_tbl[67] =  -179;
        x_tbl[68] =  180; y_tbl[68] =  -151;
        x_tbl[69] =  206; y_tbl[69] =  -118;
        x_tbl[70] =  225; y_tbl[70] =   -82;
        x_tbl[71] =  238; y_tbl[71] =   -42;
    end
    
    
    
    // テスト
    reg                                 s_valid = 1;
    wire                                s_ready;
    
    wire    signed  [ANGLE_WIDTH-1:0]   m_angle;
    wire            [ANGLE_WIDTH-1:0]   m_angle_unsign = m_angle;
    
    wire            [31:0]              m_user;
    wire                                m_valid;
    reg                                 m_ready = 1'b1;
    always @(posedge clk) begin
        if ( cke ) begin
            m_ready <= {$random()};
        end
    end
    
    integer index = 0;
    always @(posedge clk) begin
        if ( !reset ) begin
            if ( cke ) begin
                if ( !s_valid || s_ready ) begin
                    s_valid <= {$random()};
                end
                
                if ( s_valid & s_ready ) begin
                    if ( index < TBL_NUM ) begin
                        index <= index + 1;
                    end
                end
                
                if ( m_valid & m_ready ) begin
                    if ( SCALED_RADIAN ) begin
                        $display("%d: %10f %10f diff:%f", (m_user*10 % 360), $itor(m_angle) * 360 / (1 << Q_WIDTH), $itor(m_angle_unsign) * 360 / (1 << Q_WIDTH),
                                                     (m_user*10 % 360) - ($itor(m_angle_unsign) * 360 / (1 << Q_WIDTH)));
                    end
                    else begin
                        $display("%f: %10f", (m_user*10 % 360)*3.14159265/180, $itor(m_angle) / (1 << Q_WIDTH));
                    end
                    
                    if ( m_user >= (TBL_NUM-1) ) begin
                        $finish();
                    end
                end
            end
        end
    end
    
    jelly_fixed_atan2_multicycle
            #(
                .SCALED_RADIAN  (SCALED_RADIAN),
                .USER_WIDTH     (32),
                .X_WIDTH        (X_WIDTH),
                .Y_WIDTH        (Y_WIDTH),
                .ANGLE_WIDTH    (ANGLE_WIDTH)
            )
        i_fixed_atan2_multicycle
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (index),
                .s_x            (x_tbl[index]),
                .s_y            (y_tbl[index]),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_user         (m_user),
                .m_angle        (m_angle),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    
endmodule


`default_nettype wire


// end of file
