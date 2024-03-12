module ide_video
(
  // input from IDE
  input wire m_sel,

  // ZX-Evo video input
  input wire o_clk,
  inout wire [4:0] o_r, // [0] used as bi-directional bus
  input wire [4:0] o_g,
  input wire [4:0] o_b,
  input wire pal_sel,
  input wire o_hs,
  input wire o_vs,

  // FT812 video input
  input wire f_clk,
  input wire [7:0] f_r,
  input wire [7:0] f_g,
  input wire [7:0] f_b,
  input wire f_hs,
  input wire f_vs,

  // FT812 SPI input
  input wire ft_int_n,
  
  // output to VDAC
  output wire v_clk,
  output wire [7:0] v_r,
  output wire [7:0] v_g,
  output wire [7:0] v_b,
  output wire v_hs,
  output wire v_vs
);

  // control bus mux
  assign o_r[0] = m_sel ? ft_int_n : 1'bZ;
  assign o_r[4:1] = 4'bZZZ;

  // video output selector
  assign v_clk = m_sel ? f_clk : o_clk;
  assign v_r = m_sel ? f_r : l_r;
  assign v_g = m_sel ? f_g : l_g;
  assign v_b = m_sel ? f_b : l_b;
  assign v_hs = m_sel ? f_hs : o_hs;
  assign v_vs = m_sel ? f_vs : o_vs;
  
  // LUT converter
  wire [7:0] l_r;
  wire [7:0] l_g;
  wire [7:0] l_b;

  lut lut_r (.mode(pal_sel), .in(o_r), .out(l_r));
  lut lut_g (.mode(pal_sel), .in(o_g), .out(l_g));
  lut lut_b (.mode(pal_sel), .in(o_b), .out(l_b));

endmodule

module lut
(
  input wire mode,
  input wire [4:0] in,
  output wire [7:0] out
);

  wire [7:0] lut;
  assign out = mode ? {in, 3'b0} : lut;

  always_comb
    case (in)
      5'd0:    lut = 8'd0;
      5'd1:    lut = 8'd10;
      5'd2:    lut = 8'd21;
      5'd3:    lut = 8'd31;
      5'd4:    lut = 8'd42;
      5'd5:    lut = 8'd53;
      5'd6:    lut = 8'd63;
      5'd7:    lut = 8'd74;
      5'd8:    lut = 8'd85;
      5'd9:    lut = 8'd95;
      5'd10:   lut = 8'd106;
      5'd11:   lut = 8'd117;
      5'd12:   lut = 8'd127;
      5'd13:   lut = 8'd138;
      5'd14:   lut = 8'd149;
      5'd15:   lut = 8'd159;
      5'd16:   lut = 8'd170;
      5'd17:   lut = 8'd181;
      5'd18:   lut = 8'd191;
      5'd19:   lut = 8'd202;
      5'd20:   lut = 8'd213;
      5'd21:   lut = 8'd223;
      5'd22:   lut = 8'd234;
      5'd23:   lut = 8'd245;
      5'd24:   lut = 8'd255;
      default: lut = 8'd255;
    endcase

endmodule
