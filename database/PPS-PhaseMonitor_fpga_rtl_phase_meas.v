// This program was cloned from: https://github.com/kingyoPiyo/PPS-PhaseMonitor
// License: MIT License

module phase_meas (
    input   wire            i_res_n,
    input   wire            i_fclk,     // 500MHz
    input   wire            i_pclk,     // 250MHz
    input   wire            i_lclk,     // 50MHz
    input   wire            i_pps1,
    input   wire            i_pps2,
    input   wire            i_pps3,
    input   wire            i_pps4,
    input   wire            i_pps5,

    // 位相結果(50MHzドメイン)
    output  reg             o_ph_en,
    output  reg     [29:0]  o_ph1,
    output  reg     [29:0]  o_ph2,
    output  reg     [29:0]  o_ph3,
    output  reg     [29:0]  o_ph4,
    output  reg     [29:0]  o_ph5
    );


    // Signal Sampling
    // Sampling rate = 500MHz * 2(DDR) = 1GHz
    // Output rate = 1GHz / 4 = 250MHz
    wire [19:0] w_dt20b;
    lvds lvds_inst (
		.rx_inclock ( i_fclk ),
		.rx_in ( {i_pps5, i_pps4, i_pps3, i_pps2, i_pps1} ),
		.rx_out ( w_dt20b[19:0] )
	);


    // Phase counter
    reg     [27:0]  r_cnt;
    always @(posedge i_pclk or negedge i_res_n) begin
        if (~i_res_n) begin
            r_cnt[27:0] <= 28'd0;
        end else begin
            r_cnt[27:0] <= r_cnt[27:0] + 28'd1;
        end
    end

    // パラレル信号の立ち上がり検出
    reg     [19:0]  r_dt20b_ff1;
    reg             r_pd_pps1_a;
    reg             r_pd_pps1_b;
    reg             r_pd_pps1_c;
    reg             r_pd_pps1_d;
    reg             r_pd_pps2_a;
    reg             r_pd_pps2_b;
    reg             r_pd_pps2_c;
    reg             r_pd_pps2_d;
    reg             r_pd_pps3_a;
    reg             r_pd_pps3_b;
    reg             r_pd_pps3_c;
    reg             r_pd_pps3_d;
    reg             r_pd_pps4_a;
    reg             r_pd_pps4_b;
    reg             r_pd_pps4_c;
    reg             r_pd_pps4_d;
    reg             r_pd_pps5_a;
    reg             r_pd_pps5_b;
    reg             r_pd_pps5_c;
    reg             r_pd_pps5_d;
    always @(posedge i_pclk or negedge i_res_n) begin
        if (~i_res_n) begin
            r_dt20b_ff1[19:0] <= 20'd0;
            r_pd_pps1_a <= 1'b0;
            r_pd_pps1_b <= 1'b0;
            r_pd_pps1_c <= 1'b0;
            r_pd_pps1_d <= 1'b0;
            r_pd_pps2_a <= 1'b0;
            r_pd_pps2_b <= 1'b0;
            r_pd_pps2_c <= 1'b0;
            r_pd_pps2_d <= 1'b0;
            r_pd_pps3_a <= 1'b0;
            r_pd_pps3_b <= 1'b0;
            r_pd_pps3_c <= 1'b0;
            r_pd_pps3_d <= 1'b0;
            r_pd_pps4_a <= 1'b0;
            r_pd_pps4_b <= 1'b0;
            r_pd_pps4_c <= 1'b0;
            r_pd_pps4_d <= 1'b0;
            r_pd_pps5_a <= 1'b0;
            r_pd_pps5_b <= 1'b0;
            r_pd_pps5_c <= 1'b0;
            r_pd_pps5_d <= 1'b0;
        end else begin
            r_dt20b_ff1[19:0] <= w_dt20b[19:0];

            r_pd_pps1_a <= ({r_dt20b_ff1[0], w_dt20b[0]} == 2'b01);
            r_pd_pps1_b <= ({r_dt20b_ff1[1], w_dt20b[1]} == 2'b01);
            r_pd_pps1_c <= ({r_dt20b_ff1[2], w_dt20b[2]} == 2'b01);
            r_pd_pps1_d <= ({r_dt20b_ff1[3], w_dt20b[3]} == 2'b01);

            r_pd_pps2_a <= ({r_dt20b_ff1[4], w_dt20b[4]} == 2'b01);
            r_pd_pps2_b <= ({r_dt20b_ff1[5], w_dt20b[5]} == 2'b01);
            r_pd_pps2_c <= ({r_dt20b_ff1[6], w_dt20b[6]} == 2'b01);
            r_pd_pps2_d <= ({r_dt20b_ff1[7], w_dt20b[7]} == 2'b01);

            r_pd_pps3_a <= ({r_dt20b_ff1[8], w_dt20b[8]} == 2'b01);
            r_pd_pps3_b <= ({r_dt20b_ff1[9], w_dt20b[9]} == 2'b01);
            r_pd_pps3_c <= ({r_dt20b_ff1[10], w_dt20b[10]} == 2'b01);
            r_pd_pps3_d <= ({r_dt20b_ff1[11], w_dt20b[11]} == 2'b01);

            r_pd_pps4_a <= ({r_dt20b_ff1[12], w_dt20b[12]} == 2'b01);
            r_pd_pps4_b <= ({r_dt20b_ff1[13], w_dt20b[13]} == 2'b01);
            r_pd_pps4_c <= ({r_dt20b_ff1[14], w_dt20b[14]} == 2'b01);
            r_pd_pps4_d <= ({r_dt20b_ff1[15], w_dt20b[15]} == 2'b01);

            r_pd_pps5_a <= ({r_dt20b_ff1[16], w_dt20b[16]} == 2'b01);
            r_pd_pps5_b <= ({r_dt20b_ff1[17], w_dt20b[17]} == 2'b01);
            r_pd_pps5_c <= ({r_dt20b_ff1[18], w_dt20b[18]} == 2'b01);
            r_pd_pps5_d <= ({r_dt20b_ff1[19], w_dt20b[19]} == 2'b01);
        end
    end


    // Capture counter
    reg     [27:0]  r_cap_pps1_a;
    reg     [27:0]  r_cap_pps1_b;
    reg     [27:0]  r_cap_pps1_c;
    reg     [27:0]  r_cap_pps1_d;
    reg     [27:0]  r_cap_pps2_a;
    reg     [27:0]  r_cap_pps2_b;
    reg     [27:0]  r_cap_pps2_c;
    reg     [27:0]  r_cap_pps2_d;
    reg     [27:0]  r_cap_pps3_a;
    reg     [27:0]  r_cap_pps3_b;
    reg     [27:0]  r_cap_pps3_c;
    reg     [27:0]  r_cap_pps3_d;
    reg     [27:0]  r_cap_pps4_a;
    reg     [27:0]  r_cap_pps4_b;
    reg     [27:0]  r_cap_pps4_c;
    reg     [27:0]  r_cap_pps4_d;
    reg     [27:0]  r_cap_pps5_a;
    reg     [27:0]  r_cap_pps5_b;
    reg     [27:0]  r_cap_pps5_c;
    reg     [27:0]  r_cap_pps5_d;
    always @(posedge i_pclk or negedge i_res_n) begin
        if (~i_res_n) begin
            r_cap_pps1_a[27:0] <= 28'd0;
            r_cap_pps1_b[27:0] <= 28'd0;
            r_cap_pps1_c[27:0] <= 28'd0;
            r_cap_pps1_d[27:0] <= 28'd0;
            r_cap_pps2_a[27:0] <= 28'd0;
            r_cap_pps2_b[27:0] <= 28'd0;
            r_cap_pps2_c[27:0] <= 28'd0;
            r_cap_pps2_d[27:0] <= 28'd0;
            r_cap_pps3_a[27:0] <= 28'd0;
            r_cap_pps3_b[27:0] <= 28'd0;
            r_cap_pps3_c[27:0] <= 28'd0;
            r_cap_pps3_d[27:0] <= 28'd0;
            r_cap_pps4_a[27:0] <= 28'd0;
            r_cap_pps4_b[27:0] <= 28'd0;
            r_cap_pps4_c[27:0] <= 28'd0;
            r_cap_pps4_d[27:0] <= 28'd0;
            r_cap_pps5_a[27:0] <= 28'd0;
            r_cap_pps5_b[27:0] <= 28'd0;
            r_cap_pps5_c[27:0] <= 28'd0;
            r_cap_pps5_d[27:0] <= 28'd0;
        end else begin
            r_cap_pps1_a[27:0] <= r_pd_pps1_a ? r_cnt[27:0] : r_cap_pps1_a[27:0];
            r_cap_pps1_b[27:0] <= r_pd_pps1_b ? r_cnt[27:0] : r_cap_pps1_b[27:0];
            r_cap_pps1_c[27:0] <= r_pd_pps1_c ? r_cnt[27:0] : r_cap_pps1_c[27:0];
            r_cap_pps1_d[27:0] <= r_pd_pps1_d ? r_cnt[27:0] : r_cap_pps1_d[27:0];

            r_cap_pps2_a[27:0] <= r_pd_pps2_a ? r_cnt[27:0] : r_cap_pps2_a[27:0];
            r_cap_pps2_b[27:0] <= r_pd_pps2_b ? r_cnt[27:0] : r_cap_pps2_b[27:0];
            r_cap_pps2_c[27:0] <= r_pd_pps2_c ? r_cnt[27:0] : r_cap_pps2_c[27:0];
            r_cap_pps2_d[27:0] <= r_pd_pps2_d ? r_cnt[27:0] : r_cap_pps2_d[27:0];

            r_cap_pps3_a[27:0] <= r_pd_pps3_a ? r_cnt[27:0] : r_cap_pps3_a[27:0];
            r_cap_pps3_b[27:0] <= r_pd_pps3_b ? r_cnt[27:0] : r_cap_pps3_b[27:0];
            r_cap_pps3_c[27:0] <= r_pd_pps3_c ? r_cnt[27:0] : r_cap_pps3_c[27:0];
            r_cap_pps3_d[27:0] <= r_pd_pps3_d ? r_cnt[27:0] : r_cap_pps3_d[27:0];

            r_cap_pps4_a[27:0] <= r_pd_pps4_a ? r_cnt[27:0] : r_cap_pps4_a[27:0];
            r_cap_pps4_b[27:0] <= r_pd_pps4_b ? r_cnt[27:0] : r_cap_pps4_b[27:0];
            r_cap_pps4_c[27:0] <= r_pd_pps4_c ? r_cnt[27:0] : r_cap_pps4_c[27:0];
            r_cap_pps4_d[27:0] <= r_pd_pps4_d ? r_cnt[27:0] : r_cap_pps4_d[27:0];

            r_cap_pps5_a[27:0] <= r_pd_pps5_a ? r_cnt[27:0] : r_cap_pps5_a[27:0];
            r_cap_pps5_b[27:0] <= r_pd_pps5_b ? r_cnt[27:0] : r_cap_pps5_b[27:0];
            r_cap_pps5_c[27:0] <= r_pd_pps5_c ? r_cnt[27:0] : r_cap_pps5_c[27:0];
            r_cap_pps5_d[27:0] <= r_pd_pps5_d ? r_cnt[27:0] : r_cap_pps5_d[27:0];
        end
    end


    //////////////////////////////////////////////////////////
    // 250MHz -> 50MHz 載せ替え
    // PPS1~4の位相差が十分小さいことを前提に、
    // PPS1の立ち上がりエッジから遅延させて結果を取り込む
    //////////////////////////////////////////////////////////

    // PPS1立ち上がりエッジ検出
    reg     [2:0]   r_pps1_ff_50m;
    wire            w_pps1_posedge_50m = (r_pps1_ff_50m[2:1] == 2'b01);    
    always @(posedge i_lclk or negedge i_res_n) begin
        if (~i_res_n) begin
            r_pps1_ff_50m[2:0] <= 3'd0;
        end else begin
            //r_pps1_ff_50m[2:0] <= {r_pps1_ff_50m[1:0], i_pps1};
            r_pps1_ff_50m[2:0] <= {r_pps1_ff_50m[1:0], w_dt20b[0]};
        end
    end

    // ディレイ追加
    reg     [25:0]  r_dly_cnt_50m;
    reg             r_dly_st1_50m;
    always @(posedge i_lclk or negedge i_res_n) begin
        if (~i_res_n) begin
            r_dly_cnt_50m[25:0] <= 26'h3FFFFFF;
            r_dly_st1_50m <= 1'b0;
        end else if (w_pps1_posedge_50m) begin
            r_dly_cnt_50m[25:0] <= 26'h0;
            r_dly_st1_50m <= 1'b0;
        end else if (r_dly_cnt_50m[25:0] != 26'h3FFFFFF) begin
            r_dly_cnt_50m[25:0] <= r_dly_cnt_50m[25:0] + 26'd1;
            r_dly_st1_50m <= (r_dly_cnt_50m[25:0] == 26'd5000000);   // 遅延量を設定,約100ms
        end
    end

    // 結果算出
    reg     [29:0]  r_cnt_sum_pps1;
    reg     [29:0]  r_cnt_sum_pps2;
    reg     [29:0]  r_cnt_sum_pps3;
    reg     [29:0]  r_cnt_sum_pps4;
    reg     [29:0]  r_cnt_sum_pps5;
    always @(posedge i_lclk or negedge i_res_n) begin
        if (~i_res_n) begin
            r_cnt_sum_pps1[29:0] <= 30'd0;
            r_cnt_sum_pps2[29:0] <= 30'd0;
            r_cnt_sum_pps3[29:0] <= 30'd0;
            r_cnt_sum_pps4[29:0] <= 30'd0;
            r_cnt_sum_pps5[29:0] <= 30'd0;
        end else if (r_dly_st1_50m) begin
            r_cnt_sum_pps1[29:0] <= {2'b0, r_cap_pps1_a[27:0]} + {2'b0, r_cap_pps1_b[27:0]} + {2'b0, r_cap_pps1_c[27:0]} + {2'b0, r_cap_pps1_d[27:0]};
            r_cnt_sum_pps2[29:0] <= {2'b0, r_cap_pps2_a[27:0]} + {2'b0, r_cap_pps2_b[27:0]} + {2'b0, r_cap_pps2_c[27:0]} + {2'b0, r_cap_pps2_d[27:0]};
            r_cnt_sum_pps3[29:0] <= {2'b0, r_cap_pps3_a[27:0]} + {2'b0, r_cap_pps3_b[27:0]} + {2'b0, r_cap_pps3_c[27:0]} + {2'b0, r_cap_pps3_d[27:0]};
            r_cnt_sum_pps4[29:0] <= {2'b0, r_cap_pps4_a[27:0]} + {2'b0, r_cap_pps4_b[27:0]} + {2'b0, r_cap_pps4_c[27:0]} + {2'b0, r_cap_pps4_d[27:0]};
            r_cnt_sum_pps5[29:0] <= {2'b0, r_cap_pps5_a[27:0]} + {2'b0, r_cap_pps5_b[27:0]} + {2'b0, r_cap_pps5_c[27:0]} + {2'b0, r_cap_pps5_d[27:0]};
        end
    end

    // 1CLK遅延信号生成
    reg             r_dly_st2_50m;
    always @(posedge i_lclk or negedge i_res_n) begin
        if (~i_res_n) begin
            r_dly_st2_50m <= 1'b0;
        end else begin
            r_dly_st2_50m <= r_dly_st1_50m;
        end
    end

    // 載せ替え
    always @(posedge i_lclk or negedge i_res_n) begin
        if (~i_res_n) begin
            o_ph_en <= 1'b0;
            o_ph1[29:0] <= 30'd0;
            o_ph2[29:0] <= 30'd0;
            o_ph3[29:0] <= 30'd0;
            o_ph4[29:0] <= 30'd0;
            o_ph5[29:0] <= 30'd0;
        end else if (r_dly_st2_50m) begin
            o_ph_en <= 1'b1;
            o_ph1[29:0] <= r_cnt_sum_pps1[29:0];
            o_ph2[29:0] <= r_cnt_sum_pps2[29:0];
            o_ph3[29:0] <= r_cnt_sum_pps3[29:0];
            o_ph4[29:0] <= r_cnt_sum_pps4[29:0];
            o_ph5[29:0] <= r_cnt_sum_pps5[29:0]; 
        end else begin
            o_ph_en <= 1'b0;
        end
    end

endmodule