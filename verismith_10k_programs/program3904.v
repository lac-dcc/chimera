module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire19,
                 wire18,
                 wire17,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire5,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg16,
                 reg15,
                 reg6,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned($signed($signed(wire1))));
  always
    @(posedge clk) begin
      reg6 <= wire4;
    end
  assign wire7 = reg6[(2'h3):(1'h1)];
  assign wire8 = (wire3 ^ wire5[(3'h7):(1'h1)]);
  assign wire9 = wire3;
  assign wire10 = (($unsigned($unsigned($signed(wire2))) <<< wire1[(2'h3):(1'h1)]) ?
                      (wire3 ?
                          $signed(((wire3 == wire4) ?
                              {wire7,
                                  (8'hbe)} : wire3)) : ($signed((-wire7)) ^~ $unsigned({reg6,
                              wire7}))) : $signed(wire5));
  assign wire11 = {$unsigned((&{wire0, wire1[(1'h0):(1'h0)]})),
                      $signed({$signed(wire10)})};
  assign wire12 = wire9;
  assign wire13 = {((^{(wire2 ?
                              wire4 : wire5)}) < $signed(wire10[(1'h0):(1'h0)]))};
  assign wire14 = $unsigned(wire13);
  always
    @(posedge clk) begin
      reg15 <= $unsigned((-(($unsigned((8'ha0)) ?
              $signed(wire14) : $signed(wire13)) ?
          wire2 : wire9)));
      reg16 <= wire1;
    end
  assign wire17 = wire8[(4'ha):(3'h4)];
  assign wire18 = $signed({wire5[(3'h7):(1'h1)]});
  assign wire19 = ((!wire2[(4'hb):(3'h7)]) ?
                      $unsigned((7'h40)) : ($unsigned(((wire11 - wire7) * $unsigned(wire14))) || (^~(~|reg15))));
  always
    @(posedge clk) begin
      if ((8'hab))
        begin
          reg20 <= wire1;
        end
      else
        begin
          reg20 <= (~(&$signed($unsigned(((8'hb2) + (8'ha5))))));
          reg21 <= wire11[(3'h5):(3'h5)];
          reg22 <= wire19[(4'h9):(3'h6)];
          reg23 <= ((8'ha4) + (8'hbb));
          reg24 <= $signed(reg20);
        end
      reg25 <= wire13[(2'h2):(2'h2)];
    end
  assign wire26 = (!{(&((reg21 >= reg16) * ((8'ha7) + wire9))),
                      $unsigned($unsigned(((8'hbd) ? reg22 : reg24)))});
  assign wire27 = ($unsigned((!{(wire5 ? wire1 : reg21)})) >> $unsigned(wire5));
  assign wire28 = (~&$signed({{reg21[(2'h2):(1'h1)], (-(8'h9c))}}));
  assign wire29 = $unsigned($signed(({$signed(wire3),
                      $signed(reg21)} <<< {wire27, reg16})));
  assign wire30 = (!($unsigned(($unsigned(wire27) <<< wire19)) ?
                      wire1[(3'h4):(2'h3)] : (^(((8'ha5) << wire0) ?
                          (reg23 ? wire2 : wire13) : wire28[(4'h9):(3'h7)]))));
  assign wire31 = reg24[(1'h1):(1'h1)];
  assign wire32 = $unsigned({((wire8[(4'h9):(4'h9)] ?
                          $signed((8'hac)) : reg24) - wire19),
                      $signed($signed(((8'hab) ? wire28 : wire26)))});
endmodule
