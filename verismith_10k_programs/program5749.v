module top
#(parameter param18 = (~&({(((8'hb7) > (8'ha4)) ? (~|(8'hac)) : (~^(8'hbb))), ((+(8'hbb)) >>> ((8'hbe) != (8'h9c)))} ? ({((8'hb2) ? (8'hb9) : (8'hb9))} ? (-((8'h9d) ? (8'hb5) : (8'hb3))) : ({(8'hb0), (8'hb4)} > {(8'hb4), (7'h41)})) : {(^~((8'hae) ? (8'ha0) : (8'ha7)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire7,
                 wire6,
                 wire5,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = $signed((~^(({wire3} == (wire3 | wire0)) && wire3)));
  assign wire7 = (wire3 ^~ ({wire0[(4'he):(2'h3)]} >>> ((~^(~&wire1)) ?
                     ($signed(wire5) ^~ wire5[(1'h1):(1'h0)]) : (^wire2[(4'hd):(3'h6)]))));
  always
    @(posedge clk) begin
      reg8 <= (7'h41);
      reg9 <= (~^wire3[(3'h6):(2'h2)]);
      reg10 <= (-wire0);
      reg11 <= (~&($signed({wire4[(1'h0):(1'h0)]}) ?
          (wire2[(1'h1):(1'h0)] ?
              $signed((wire4 >>> reg9)) : reg10[(1'h0):(1'h0)]) : $signed(wire6)));
    end
  assign wire12 = $signed($unsigned(reg9));
  assign wire13 = $signed((~&reg11));
  assign wire14 = (&((~|reg8) | (8'h9f)));
  assign wire15 = {(((~reg11[(2'h3):(1'h0)]) - (~wire4)) ?
                          wire5[(4'ha):(4'h8)] : $signed(((wire13 <<< reg11) != wire2[(4'hf):(4'he)]))),
                      $signed($signed(wire5[(4'ha):(1'h0)]))};
  assign wire16 = wire1;
  assign wire17 = {($signed((-$signed(wire5))) ^~ ((!{wire15}) ?
                          $unsigned({reg9, reg8}) : wire7))};
endmodule
