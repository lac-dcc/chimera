// This program was cloned from: https://github.com/kingyoPiyo/PPS-PhaseMonitor
// License: MIT License

// PPS信号(T = 1000ms, PW = 100ms)を生成する

module pps_gen (
    input   wire    i_clk,      // 100MHz
    input   wire    i_res_n,
    input   wire    i_ph_sync,  // sync to pos edge
    output  reg     o_pps
    );

    localparam DEF_CNT_MAX      = 27'd99999999;
    localparam DEF_CNT_PW       = 27'd9999999;
    localparam DEF_CNT_SYNC_DLY = 27'd3;

    // 同期信号立ち上がりエッジ検出
    reg     [2:0]   r_sync_ff;
    wire            w_sync_en = (r_sync_ff[2:1] == 2'b01);
    always @(posedge i_clk or negedge i_res_n) begin
        if (~i_res_n) begin
            r_sync_ff[2:0] <= 3'd0;
        end else begin
            r_sync_ff[2:0] <= {r_sync_ff[1:0], i_ph_sync};
        end
    end

    // Counter
    reg     [26:0]  r_cnt;
    wire            w_cnt_max = (r_cnt == DEF_CNT_MAX);
    always @(posedge i_clk or negedge i_res_n) begin
        if (~i_res_n) begin
            r_cnt[26:0] <= 27'd0;
        end else if (w_sync_en) begin
            r_cnt[26:0] <= DEF_CNT_SYNC_DLY;
        end else if (w_cnt_max) begin
            r_cnt[26:0] <= 27'd0;
        end else begin
            r_cnt[26:0] <= r_cnt[26:0] + 27'd1;
        end
    end

    // Pulse Gen
    always @(posedge i_clk or negedge i_res_n) begin
        if (~i_res_n) begin
            o_pps <= 1'b0;
        end else begin
            if (r_cnt[26:0] == 27'd0)       o_pps <= 1'b1;
            if (r_cnt[26:0] == DEF_CNT_PW)  o_pps <= 1'b0;
        end
    end

endmodule
