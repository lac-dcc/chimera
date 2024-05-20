// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module SOUND(
  input CLKSYS,
  input CLK1_2,
  input RESETBn,
  input [7:0] MDATABUS_in,
  output [7:0] MDATABUS_out,
  input RFD0En,
  input WFD0En,
  input WFD0Dn,
  output [13:0] mix_audio_o
);

wire reset = ~RESETBn;

// clock is supposed to come from CLK1_2 (CLKCTL module) but audio module needs
// a clock enable so we regenerate it here.
wire EN_CLK_1_2;
clk_en #(CORE_CLK_1_2) u_ck_en(.ref_clk(CLKSYS), .cen(EN_CLK_1_2));

reg bci, bdir;
always @(posedge WFD0Dn, posedge reset)
  if (reset) { bdir, bci } <= 2'b0;
  else { bdir, bci } <= MDATABUS_in[1:0];

wire data_in_oe = ~(~bci | bdir);

wire clk_i = CLKSYS;
wire en_clk_psg_i = EN_CLK_1_2;
wire reset_n_i = RESETBn;
wire sel_n_i;
wire bc_i = bci;
wire bdir_i = bdir;
wire [7:0] data_i = ~data_in_oe ? MDATABUS_in : 8'd0;
wire [7:0] data_r_o;
assign MDATABUS_out = data_r_o;

ym2149_audio u_ym2149_audio(
  .clk_i        ( clk_i        ),
  .en_clk_psg_i ( en_clk_psg_i ),
  .sel_n_i      ( sel_n_i      ),
  .reset_n_i    ( reset_n_i    ),
  .bc_i         ( bc_i         ),
  .bdir_i       ( bdir_i       ),
  .data_i       ( data_i       ),
  .data_r_o     ( data_r_o     ),
  .ch_a_o       ( ch_a_o       ),
  .ch_b_o       ( ch_b_o       ),
  .ch_c_o       ( ch_c_o       ),
  .mix_audio_o  ( mix_audio_o  ),
  .pcm14s_o     ( pcm14s_o     )
);

endmodule

