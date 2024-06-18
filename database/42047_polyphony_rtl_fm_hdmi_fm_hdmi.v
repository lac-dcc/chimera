// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

`define PP_HDMI_NEG_OUT

module fm_hdmi (
  clk_v,
  rst_x,
  // video in
  i_vsync,
  i_hsync,
  i_de,
  i_cr,
  i_cg,
  i_cb,
  // video out
  o_hd_vsync,
  o_hd_hsync,
  o_hd_de,
  o_hd_d
);
  input  clk_v;
  input  rst_x;

  // video in
  input i_vsync;
  input i_hsync;
  input i_de;
  input [7:0] i_cr;
  input [7:0] i_cg;
  input [7:0] i_cb;
  // video out
  output o_hd_vsync;
  output o_hd_hsync;
  output o_hd_de;
  output [15:0] o_hd_d;

//////////////////////////////////
// wire
//////////////////////////////////
  wire [7:0]   w_y;
  wire [7:0]   w_cb;
  wire [7:0]   w_cr;
  wire         w_de;

  wire [7:0]   w_y_422;
  wire [7:0]   w_cb_422;
  wire [7:0]   w_cr_422;
  wire         w_de_422;

  wire [15:0]  w_d;
  wire         w_hsync_rise;
//////////////////////////////////
// reg
//////////////////////////////////
  reg [7:0]   r_cr_1z;
  reg         r_state;
  reg [15:0]  r_d;
  reg         r_de;
  reg         r_hsync_1z;
`ifdef PP_HDMI_NEG_OUT
  wire w_hd_vsync;
  wire w_hd_hsync;
  wire w_hd_de;
  wire [15:0] w_hd_d;
  // video out
  reg r_hd_vsync_neg;
  reg r_hd_hsync_neg;
  reg r_hd_de_neg;
  reg [15:0] r_hd_d_neg;
`endif
//////////////////////////////////
// assign
//////////////////////////////////

assign w_hsync_rise = (!r_hsync_1z) & i_hsync;
assign w_d = (r_state) ? {w_y_422,r_cr_1z} :  // 2nd
                         {w_y_422,w_cb_422};      // 1st
`ifdef PP_HDMI_NEG_OUT
assign o_hd_vsync = r_hd_vsync_neg;
assign o_hd_hsync = r_hd_hsync_neg;
assign o_hd_d = r_hd_d_neg;
assign o_hd_de = r_hd_de_neg;
`else
assign o_hd_d = r_d;
assign o_hd_de = r_de;
`endif
//////////////////////////////////
// module instantiation
//////////////////////////////////
fm_vout_delay #(1,5) u_delay_de (
    .i_in(i_de),
    .o_out(w_de),
    .clk_sys(clk_v),
    .rst_x(rst_x)
);
fm_vout_delay #(1,2) u_delay_de_422 (
    .i_in(w_de),
    .o_out(w_de_422),
    .clk_sys(clk_v),
    .rst_x(rst_x)
);
// RGB-> YCrCb conversion
fm_ycbcr u_ycbcr (  // 5 clock
    .clk_v(clk_v),
    .rst_x(rst_x),
    .i_r(i_cr),
    .i_g(i_cg),
    .i_b(i_cb),
    .o_y(w_y),
    .o_cb(w_cb),
    .o_cr(w_cr)
);

// 4:4:4 -> 4:2:2
fm_444_422 u_444_422 (
  .clk_v(clk_v),
  .rst_x(rst_x),
  // video in
  .i_state(r_state),
  .i_y(w_y),
  .i_cr(w_cr),
  .i_cb(w_cb),
  // video out
  .o_y(w_y_422),
  .o_cr(w_cr_422),
  .o_cb(w_cb_422)
);

fm_vout_delay #(1,8) u_delay_vs (
    .i_in(i_vsync),
`ifdef PP_HDMI_NEG_OUT
    .o_out(w_hd_vsync),
`else
    .o_out(o_hd_vsync),
`endif
    .clk_sys(clk_v),
    .rst_x(rst_x)
);

fm_vout_delay #(1,8) u_delay_hs (
    .i_in(i_hsync),
`ifdef PP_HDMI_NEG_OUT
    .o_out(w_hd_hsync),
`else
    .o_out(o_hd_hsync),
`endif
    .clk_sys(clk_v),
    .rst_x(rst_x)
);


always @(posedge clk_v or negedge rst_x) begin
  if (~rst_x) begin
   r_state <= 1'b0;
   r_hsync_1z <= 1'b0;
  end else begin
   r_hsync_1z <= i_hsync;
   if (w_hsync_rise) r_state <= 1'b0;
   else if (w_de) r_state <= ~r_state;
  end
end

always @(posedge clk_v or negedge rst_x) begin
  if (~rst_x) begin
   r_de <= 1'b0;
  end else begin
   r_de <= w_de_422;
  end
end
always @(posedge clk_v) begin
  r_cr_1z <= w_cr_422;
  r_d <= w_d;
end
`ifdef PP_HDMI_NEG_OUT
always @(posedge clk_v or negedge rst_x) begin
  if (~rst_x) begin
   r_hd_vsync_neg <= 1'b1;
   r_hd_hsync_neg <= 1'b1;
   r_hd_de_neg <= 1'b0;
  end else begin
   r_hd_vsync_neg <= w_hd_vsync;
   r_hd_hsync_neg <= w_hd_hsync;
   r_hd_de_neg <= r_de;
  end
end
always @(negedge clk_v) begin
  r_hd_d_neg <= r_d;
end
`endif
endmodule
