module top
#(parameter param13 = (((8'hb8) ? (~(((8'had) ? (8'hbc) : (8'ha2)) ? ((8'haf) ? (8'ha5) : (8'ha5)) : ((7'h42) ? (8'hb0) : (8'hac)))) : ({((8'hac) && (7'h41))} ? (8'hbd) : (((8'hb1) ? (8'haa) : (8'hb2)) ^ ((8'ha6) ? (8'h9f) : (7'h44))))) ? (((~|((7'h40) - (7'h40))) ~^ (((8'h9d) >>> (8'hbb)) ? ((8'h9c) >= (7'h42)) : (^(8'hab)))) ? (({(8'had), (8'ha5)} ? (~|(8'haa)) : ((8'hbe) ~^ (8'hac))) ? (((8'hbc) ? (8'hb8) : (8'hba)) ? {(8'hb9)} : (+(8'ha5))) : (((8'h9d) == (8'hb8)) & (~|(8'hbc)))) : (~|{((8'haf) << (8'hb4))})) : {(~^(((8'ha0) ? (8'ha1) : (7'h44)) == ((8'h9c) ? (8'ha4) : (8'ha5))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire4,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $signed($signed(wire3));
  always
    @(posedge clk) begin
      reg5 <= $signed(wire1[(1'h0):(1'h0)]);
      reg6 <= $unsigned($unsigned((!((-wire4) >> {wire4}))));
      reg7 <= $signed(wire4[(2'h2):(1'h0)]);
    end
  assign wire8 = ($unsigned({$signed(wire1[(4'h8):(3'h5)])}) <= $unsigned((~|(8'hb0))));
  assign wire9 = wire1[(4'h8):(2'h3)];
  assign wire10 = wire9;
  assign wire11 = (reg7 ?
                      (~|$unsigned(wire0[(2'h2):(1'h0)])) : wire10[(3'h5):(2'h3)]);
  assign wire12 = ($signed($unsigned(wire11[(1'h0):(1'h0)])) ?
                      ((8'h9f) ?
                          ($unsigned(((8'ha4) == wire2)) ?
                              $signed($signed(wire10)) : wire10) : (&$unsigned(reg5[(1'h0):(1'h0)]))) : wire3[(1'h1):(1'h1)]);
endmodule
