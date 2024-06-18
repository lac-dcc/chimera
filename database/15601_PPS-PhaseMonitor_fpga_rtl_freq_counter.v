// This program was cloned from: https://github.com/kingyoPiyo/PPS-PhaseMonitor
// License: MIT License

module freq_counter (
    input   wire            i_clk,      // 100MHz
    input   wire            i_res_n,
    input   wire            i_pps,      // 1PPS signal from GPS
    output  wire    [27:0]  o_freq
    );


    // sync
    reg [2:0]   r_sync_ff;
    wire        w_pps_posedge = (r_sync_ff[2:1] == 2'b01);
    always @(posedge i_clk or negedge i_res_n) begin
        if (~i_res_n) begin
            r_sync_ff[2:0] <= 3'b000;
        end else begin
            r_sync_ff[2:0] <= {r_sync_ff[1:0], i_pps};
        end
    end


    reg [27:0]  r_cnt_100m;
    reg [27:0]  r_freq;
    always @(posedge i_clk or negedge i_res_n) begin
        if (~i_res_n) begin
            r_cnt_100m[27:0] <= 28'd0;
            r_freq[27:0] <= 28'd0;
        end else if (w_pps_posedge) begin
            r_cnt_100m[27:0] <= 28'd0;
            r_freq[27:0] <= r_cnt_100m[27:0] + 28'd1;
        end else begin
            r_cnt_100m[27:0] <= r_cnt_100m[27:0] + 28'd1;
        end
    end


    // phase_meas の o_ph_en を参照してラッチされるため
    // 100MHz -> 50MHz のクロック載せ替えは省略
    assign o_freq[27:0] = r_freq[27:0];

endmodule
