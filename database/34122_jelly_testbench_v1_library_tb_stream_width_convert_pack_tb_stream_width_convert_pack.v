// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_stream_width_convert_pack();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_stream_width_convert_pack.vcd");
        $dumpvars(0, tb_stream_width_convert_pack);
        #100000
        $finish();
    end
    
    parameter   BUSY = 1;
    
    reg     reset = 1'b1;
    always #(RATE*100)      reset = 1'b0;
    
    reg     clk = 1'b1;
    always #(RATE/2.0)      clk = ~clk;
    
    reg     cke = 1;
    always @(posedge clk)   cke <= BUSY ? {$random} : 1'b1;
    
    
    parameter S_NUM               = 3;
    parameter M_NUM               = 4;
    parameter UNIT0_WIDTH         = 32;
    parameter UNIT1_WIDTH         = 16;
    parameter UNIT2_WIDTH         = 8;
    parameter UNIT3_WIDTH         = 0;
    parameter UNIT4_WIDTH         = 0;
    parameter UNIT5_WIDTH         = 0;
    parameter UNIT6_WIDTH         = 0;
    parameter UNIT7_WIDTH         = 0;
    parameter UNIT8_WIDTH         = 0;
    parameter UNIT9_WIDTH         = 0;
    parameter S_DATA0_WIDTH       = S_NUM * UNIT0_WIDTH;
    parameter S_DATA1_WIDTH       = S_NUM * UNIT1_WIDTH;
    parameter S_DATA2_WIDTH       = S_NUM * UNIT2_WIDTH;
    parameter S_DATA3_WIDTH       = S_NUM * UNIT3_WIDTH;
    parameter S_DATA4_WIDTH       = S_NUM * UNIT4_WIDTH;
    parameter S_DATA5_WIDTH       = S_NUM * UNIT5_WIDTH;
    parameter S_DATA6_WIDTH       = S_NUM * UNIT6_WIDTH;
    parameter S_DATA7_WIDTH       = S_NUM * UNIT7_WIDTH;
    parameter S_DATA8_WIDTH       = S_NUM * UNIT8_WIDTH;
    parameter S_DATA9_WIDTH       = S_NUM * UNIT9_WIDTH;
    parameter M_DATA0_WIDTH       = M_NUM * UNIT0_WIDTH;
    parameter M_DATA1_WIDTH       = M_NUM * UNIT1_WIDTH;
    parameter M_DATA2_WIDTH       = M_NUM * UNIT2_WIDTH;
    parameter M_DATA3_WIDTH       = M_NUM * UNIT3_WIDTH;
    parameter M_DATA4_WIDTH       = M_NUM * UNIT4_WIDTH;
    parameter M_DATA5_WIDTH       = M_NUM * UNIT5_WIDTH;
    parameter M_DATA6_WIDTH       = M_NUM * UNIT6_WIDTH;
    parameter M_DATA7_WIDTH       = M_NUM * UNIT7_WIDTH;
    parameter M_DATA8_WIDTH       = M_NUM * UNIT8_WIDTH;
    parameter M_DATA9_WIDTH       = M_NUM * UNIT9_WIDTH;
    parameter HAS_FIRST           = 0;                          // first を備える
    parameter HAS_LAST            = 1;                          // last を備える
    parameter AUTO_FIRST          = (HAS_LAST & !HAS_FIRST);    // last の次を自動的に first とする
    parameter HAS_ALIGN_S         = 1;                          // slave 側のアライメントを指定する
    parameter HAS_ALIGN_M         = 1;                          // master 側のアライメントを指定する
    parameter FIRST_OVERWRITE     = 0;  // first時前方に残変換があれば吐き出さずに上書き
    parameter FIRST_FORCE_LAST    = 0;  // first時前方に残変換があれば強制的にlastを付与(残が無い場合はlastはつかない)
    parameter ALIGN_S_WIDTH       = S_NUM <=   2 ? 1 :
                                    S_NUM <=   4 ? 2 :
                                    S_NUM <=   8 ? 3 :
                                    S_NUM <=  16 ? 4 :
                                    S_NUM <=  32 ? 5 :
                                    S_NUM <=  64 ? 6 :
                                    S_NUM <= 128 ? 7 :
                                    S_NUM <= 256 ? 8 :
                                    S_NUM <= 512 ? 9 : 10;
    parameter ALIGN_M_WIDTH       = M_NUM <=   2 ? 1 :
                                    M_NUM <=   4 ? 2 :
                                    M_NUM <=   8 ? 3 :
                                    M_NUM <=  16 ? 4 :
                                    M_NUM <=  32 ? 5 :
                                    M_NUM <=  64 ? 6 :
                                    M_NUM <= 128 ? 7 :
                                    M_NUM <= 256 ? 8 :
                                    M_NUM <= 512 ? 9 : 10;
    parameter USER_F_WIDTH        = 0;
    parameter USER_L_WIDTH        = 0;
    parameter S_REGS              = (S_NUM != M_NUM);
    
    
    // local
    parameter UNIT0_BITS          = UNIT0_WIDTH   > 0 ? UNIT0_WIDTH   : 1;
    parameter UNIT1_BITS          = UNIT1_WIDTH   > 0 ? UNIT1_WIDTH   : 1;
    parameter UNIT2_BITS          = UNIT2_WIDTH   > 0 ? UNIT2_WIDTH   : 1;
    parameter UNIT3_BITS          = UNIT3_WIDTH   > 0 ? UNIT3_WIDTH   : 1;
    parameter UNIT4_BITS          = UNIT4_WIDTH   > 0 ? UNIT4_WIDTH   : 1;
    parameter UNIT5_BITS          = UNIT5_WIDTH   > 0 ? UNIT5_WIDTH   : 1;
    parameter UNIT6_BITS          = UNIT6_WIDTH   > 0 ? UNIT6_WIDTH   : 1;
    parameter UNIT7_BITS          = UNIT7_WIDTH   > 0 ? UNIT7_WIDTH   : 1;
    parameter UNIT8_BITS          = UNIT8_WIDTH   > 0 ? UNIT8_WIDTH   : 1;
    parameter UNIT9_BITS          = UNIT9_WIDTH   > 0 ? UNIT9_WIDTH   : 1;
    parameter S_DATA0_BITS        = S_DATA0_WIDTH > 0 ? S_DATA0_WIDTH : 1;
    parameter S_DATA1_BITS        = S_DATA1_WIDTH > 0 ? S_DATA1_WIDTH : 1;
    parameter S_DATA2_BITS        = S_DATA2_WIDTH > 0 ? S_DATA2_WIDTH : 1;
    parameter S_DATA3_BITS        = S_DATA3_WIDTH > 0 ? S_DATA3_WIDTH : 1;
    parameter S_DATA4_BITS        = S_DATA4_WIDTH > 0 ? S_DATA4_WIDTH : 1;
    parameter S_DATA5_BITS        = S_DATA5_WIDTH > 0 ? S_DATA5_WIDTH : 1;
    parameter S_DATA6_BITS        = S_DATA6_WIDTH > 0 ? S_DATA6_WIDTH : 1;
    parameter S_DATA7_BITS        = S_DATA7_WIDTH > 0 ? S_DATA7_WIDTH : 1;
    parameter S_DATA8_BITS        = S_DATA8_WIDTH > 0 ? S_DATA8_WIDTH : 1;
    parameter S_DATA9_BITS        = S_DATA9_WIDTH > 0 ? S_DATA9_WIDTH : 1;
    parameter M_DATA0_BITS        = M_DATA0_WIDTH > 0 ? M_DATA0_WIDTH : 1;
    parameter M_DATA1_BITS        = M_DATA1_WIDTH > 0 ? M_DATA1_WIDTH : 1;
    parameter M_DATA2_BITS        = M_DATA2_WIDTH > 0 ? M_DATA2_WIDTH : 1;
    parameter M_DATA3_BITS        = M_DATA3_WIDTH > 0 ? M_DATA3_WIDTH : 1;
    parameter M_DATA4_BITS        = M_DATA4_WIDTH > 0 ? M_DATA4_WIDTH : 1;
    parameter M_DATA5_BITS        = M_DATA5_WIDTH > 0 ? M_DATA5_WIDTH : 1;
    parameter M_DATA6_BITS        = M_DATA6_WIDTH > 0 ? M_DATA6_WIDTH : 1;
    parameter M_DATA7_BITS        = M_DATA7_WIDTH > 0 ? M_DATA7_WIDTH : 1;
    parameter M_DATA8_BITS        = M_DATA8_WIDTH > 0 ? M_DATA8_WIDTH : 1;
    parameter M_DATA9_BITS        = M_DATA9_WIDTH > 0 ? M_DATA9_WIDTH : 1;
    
    
    wire                        endian   = 0;
    wire    [UNIT0_BITS-1:0]    padding0 = 32'hffffffff;
    wire    [UNIT1_BITS-1:0]    padding1 = 16'haaaa;
    wire    [UNIT2_BITS-1:0]    padding2 = 8'hbb;
    wire    [UNIT3_BITS-1:0]    padding3;
    wire    [UNIT4_BITS-1:0]    padding4;
    wire    [UNIT5_BITS-1:0]    padding5;
    wire    [UNIT6_BITS-1:0]    padding6;
    wire    [UNIT7_BITS-1:0]    padding7;
    wire    [UNIT8_BITS-1:0]    padding8;
    wire    [UNIT9_BITS-1:0]    padding9;
    
    wire    [ALIGN_S_WIDTH-1:0] s_align_s = 2;
    wire    [ALIGN_M_WIDTH-1:0] s_align_m = 1;
    wire                        s_first = HAS_FIRST ? (count[2:0] == 3'b000) : 1'b0;
    wire                        s_last  = HAS_LAST  ? (count[2:0] == 3'b111) : 1'b0;
    reg     [S_DATA0_BITS-1:0]  s_data0;
    reg     [S_DATA1_BITS-1:0]  s_data1;
    reg     [S_DATA2_BITS-1:0]  s_data2;
    reg     [S_DATA3_BITS-1:0]  s_data3;
    reg     [S_DATA4_BITS-1:0]  s_data4;
    reg     [S_DATA5_BITS-1:0]  s_data5;
    reg     [S_DATA6_BITS-1:0]  s_data6;
    reg     [S_DATA7_BITS-1:0]  s_data7;
    reg     [S_DATA8_BITS-1:0]  s_data8;
    reg     [S_DATA9_BITS-1:0]  s_data9;
    reg                         s_valid;
    wire                        s_ready;
    
    wire                        m_first;
    wire                        m_last;
    wire    [M_DATA0_BITS-1:0]  m_data0;
    wire    [M_DATA1_BITS-1:0]  m_data1;
    wire    [M_DATA2_BITS-1:0]  m_data2;
    wire    [M_DATA3_BITS-1:0]  m_data3;
    wire    [M_DATA4_BITS-1:0]  m_data4;
    wire    [M_DATA5_BITS-1:0]  m_data5;
    wire    [M_DATA6_BITS-1:0]  m_data6;
    wire    [M_DATA7_BITS-1:0]  m_data7;
    wire    [M_DATA8_BITS-1:0]  m_data8;
    wire    [M_DATA9_BITS-1:0]  m_data9;
    wire                        m_valid;
    reg                         m_ready;
    
    
    jelly_stream_width_convert_pack
            #(
                .S_NUM              (S_NUM),
                .M_NUM              (M_NUM),
                .UNIT0_WIDTH        (UNIT0_WIDTH),
                .UNIT1_WIDTH        (UNIT1_WIDTH),
                .UNIT2_WIDTH        (UNIT2_WIDTH),
                .UNIT3_WIDTH        (UNIT3_WIDTH),
                .UNIT4_WIDTH        (UNIT4_WIDTH),
                .UNIT5_WIDTH        (UNIT5_WIDTH),
                .UNIT6_WIDTH        (UNIT6_WIDTH),
                .UNIT7_WIDTH        (UNIT7_WIDTH),
                .UNIT8_WIDTH        (UNIT8_WIDTH),
                .UNIT9_WIDTH        (UNIT9_WIDTH),
                .S_DATA0_WIDTH      (S_DATA0_WIDTH),
                .S_DATA1_WIDTH      (S_DATA1_WIDTH),
                .S_DATA2_WIDTH      (S_DATA2_WIDTH),
                .S_DATA3_WIDTH      (S_DATA3_WIDTH),
                .S_DATA4_WIDTH      (S_DATA4_WIDTH),
                .S_DATA5_WIDTH      (S_DATA5_WIDTH),
                .S_DATA6_WIDTH      (S_DATA6_WIDTH),
                .S_DATA7_WIDTH      (S_DATA7_WIDTH),
                .S_DATA8_WIDTH      (S_DATA8_WIDTH),
                .S_DATA9_WIDTH      (S_DATA9_WIDTH),
                .M_DATA0_WIDTH      (M_DATA0_WIDTH),
                .M_DATA1_WIDTH      (M_DATA1_WIDTH),
                .M_DATA2_WIDTH      (M_DATA2_WIDTH),
                .M_DATA3_WIDTH      (M_DATA3_WIDTH),
                .M_DATA4_WIDTH      (M_DATA4_WIDTH),
                .M_DATA5_WIDTH      (M_DATA5_WIDTH),
                .M_DATA6_WIDTH      (M_DATA6_WIDTH),
                .M_DATA7_WIDTH      (M_DATA7_WIDTH),
                .M_DATA8_WIDTH      (M_DATA8_WIDTH),
                .M_DATA9_WIDTH      (M_DATA9_WIDTH),
                .HAS_FIRST          (HAS_FIRST),
                .HAS_LAST           (HAS_LAST),
                .AUTO_FIRST         (AUTO_FIRST),
                .HAS_ALIGN_S        (HAS_ALIGN_S),
                .HAS_ALIGN_M        (HAS_ALIGN_M),
                .FIRST_OVERWRITE    (FIRST_OVERWRITE),
                .FIRST_FORCE_LAST   (FIRST_FORCE_LAST),
                .ALIGN_S_WIDTH      (ALIGN_S_WIDTH),
                .ALIGN_M_WIDTH      (ALIGN_M_WIDTH),
                .USER_F_WIDTH       (USER_F_WIDTH),
                .USER_L_WIDTH       (USER_L_WIDTH),
                .S_REGS             (S_REGS)
            )
        i_stream_width_convert_pack
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                .endian             (endian),
                .padding0           (padding0),
                .padding1           (padding1),
                .padding2           (padding2),
                .padding3           (padding3),
                .padding4           (padding4),
                .padding5           (padding5),
                .padding6           (padding6),
                .padding7           (padding7),
                .padding8           (padding8),
                .padding9           (padding9),
                .s_align_s          (s_align_s),
                .s_align_m          (s_align_m),
                .s_first            (s_first),
                .s_last             (s_last),
                .s_data0            (s_data0),
                .s_data1            (s_data1),
                .s_data2            (s_data2),
                .s_data3            (s_data3),
                .s_data4            (s_data4),
                .s_data5            (s_data5),
                .s_data6            (s_data6),
                .s_data7            (s_data7),
                .s_data8            (s_data8),
                .s_data9            (s_data9),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                .m_first            (m_first),
                .m_last             (m_last),
                .m_data0            (m_data0),
                .m_data1            (m_data1),
                .m_data2            (m_data2),
                .m_data3            (m_data3),
                .m_data4            (m_data4),
                .m_data5            (m_data5),
                .m_data6            (m_data6),
                .m_data7            (m_data7),
                .m_data8            (m_data8),
                .m_data9            (m_data9),
                .m_valid            (m_valid),
                .m_ready            (m_ready)
            );
    
    
    
    
    integer     i;
    integer     count;
    
    always @(posedge clk) begin
        if ( reset ) begin
            count   <= 0;
            for ( i = 0; i < S_NUM; i = i+1 ) begin
                s_data0[i*UNIT0_WIDTH +: UNIT0_WIDTH] <= endian ? S_NUM - 1 - (i+0) : (i+0);
                s_data1[i*UNIT1_WIDTH +: UNIT1_WIDTH] <= endian ? S_NUM - 1 - (i+1) : (i+1);
                s_data2[i*UNIT2_WIDTH +: UNIT2_WIDTH] <= endian ? S_NUM - 1 - (i+2) : (i+2);
            end
            s_valid <= 0;
        end
        else if ( cke ) begin
            if ( s_valid && s_ready ) begin
                for ( i = 0; i < S_NUM; i = i+1 ) begin
                    s_data0[i*UNIT0_WIDTH +: UNIT0_WIDTH] <= s_data0[i*UNIT0_WIDTH +: UNIT0_WIDTH] + S_NUM;
                    s_data1[i*UNIT1_WIDTH +: UNIT1_WIDTH] <= s_data1[i*UNIT1_WIDTH +: UNIT1_WIDTH] + S_NUM;
                    s_data2[i*UNIT2_WIDTH +: UNIT2_WIDTH] <= s_data2[i*UNIT2_WIDTH +: UNIT2_WIDTH] + S_NUM;
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
    
    
    integer fp;
    initial begin
        fp = $fopen("out.txt", "w");
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
        end
        else if ( cke ) begin
            if ( m_valid && m_ready ) begin
                $fdisplay(fp, "%h %h %h %b %b", m_data0, m_data1, m_data2, m_first, m_last);
            end
        end
    end
    
    
    
endmodule


`default_nettype wire


// end of file
