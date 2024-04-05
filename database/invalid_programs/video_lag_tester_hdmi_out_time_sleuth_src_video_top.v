`include "video_timing.vh"

module video_top(
  input wire         I_clk, //27Mhz
  input wire         I_rst_n,
  output wire        O_led,
  output wire        O_tmds_clk_p,
  output wire        O_tmds_clk_n,
  output wire [2:0]  O_tmds_data_p,
  output wire [2:0]  O_tmds_data_n
);

wire        testpattern_vs;
wire        testpattern_hs;
wire        testpattern_de;
wire [7:0]  testpattern_data_r/*synthesis syn_keep=1*/;
wire [7:0]  testpattern_data_g/*synthesis syn_keep=1*/;
wire [7:0]  testpattern_data_b/*synthesis syn_keep=1*/;

reg         vs_r;
reg  [9:0]  cnt_vs;

wire clk_serial;
wire clk_pixel;
wire hdmi_rstn;

always@(posedge clk_pixel) begin
  vs_r <= testpattern_vs;
end

always@(posedge clk_pixel or negedge hdmi_rstn) begin
  if(!hdmi_rstn)
    cnt_vs <= 10'd0;
  else if(vs_r && !testpattern_vs) //vs falling edge
    cnt_vs <= cnt_vs + 10'd1;
end

assign O_led = cnt_vs[6];

testpattern testpattern_inst
(
  .I_pxl_clk   (clk_pixel         ),
  .I_rst_n     (hdmi_rstn         ),
  .I_mode      ({1'b0,cnt_vs[8:7]}),
// .I_mode      ({3'd2}),
  .I_single_r  (8'd0              ),
  .I_single_g  (8'd255            ),
  .I_single_b  (8'd0              ),
  .I_h_total   (`H_TOTAL          ),
  .I_h_sync    (`H_SYNC           ),
  .I_h_bporch  (`H_BPORCH         ),
  .I_h_res     (`H_RES            ),
  .I_v_total   (`V_TOTAL          ),
  .I_v_sync    (`V_SYNC           ),
  .I_v_bporch  (`V_BPORCH         ),
  .I_v_res     (`V_RES            ),
  .I_hs_pol    (`H_SYNC_POLARITY  ),
  .I_vs_pol    (`V_SYNC_POLARITY  ),
  .O_de        (testpattern_de    ),
  .O_hs        (testpattern_hs    ),
  .O_vs        (testpattern_vs    ),
  .O_data_r    (testpattern_data_r),
  .O_data_g    (testpattern_data_g),
  .O_data_b    (testpattern_data_b)
);

video_clock video_clock_inst (
  .clk27       (I_clk), 
  .clock_config(`PIXEL_CLOCK),
  .rstn        (I_rst_n),
  .hdmi_rstn_o (hdmi_rstn),
  .clk_serial  (clk_serial),
  .clk_pixel   (clk_pixel)
);

//DVI_TX_Top DVI_TX_Top_inst (
hdmi_device hdmi_device (
    .I_rst_n       (hdmi_rstn         ),
    .I_serial_clk  (clk_serial        ),
    .I_rgb_clk     (clk_pixel         ),
    .I_rgb_vs      (testpattern_vs    ),
    .I_rgb_hs      (testpattern_hs    ),
    .I_rgb_de      (testpattern_de    ),

   .I_rgb_r       ({testpattern_data_r[7] ? 8'hff : 8'h11}),
   .I_rgb_g       ({testpattern_data_g[7] ? 8'hff : 8'h11}),
   .I_rgb_b       ({testpattern_data_b[7] ? 8'hff : 8'h11}),

   //   .I_rgb_r       (testpattern_data_r),
   //   .I_rgb_g       (testpattern_data_g),
   //   .I_rgb_b       (testpattern_data_b),
    .O_tmds_clk_p  (O_tmds_clk_p      ),
    .O_tmds_clk_n  (O_tmds_clk_n      ),
    .O_tmds_data_p (O_tmds_data_p     ),
    .O_tmds_data_n (O_tmds_data_n     )
);
endmodule
