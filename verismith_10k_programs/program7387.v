module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire36;
  assign y = {wire5, wire6, wire7, wire8, wire36, (1'h0)};
  assign wire5 = wire3[(5'h14):(4'hd)];
  assign wire6 = wire1;
  assign wire7 = $signed(wire3[(4'he):(2'h3)]);
  assign wire8 = (wire1 ?
                     $unsigned($unsigned($unsigned(wire3[(5'h14):(5'h10)]))) : (^~((-(wire3 < wire0)) ^~ wire5[(3'h6):(2'h3)])));
  module9 #() modinst37 (wire36, clk, wire4, wire6, wire0, wire3, wire5);
endmodule

module module9  (y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire signed [(4'h8):(1'h0)] wire13;
  input wire [(3'h4):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire15;
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire15,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire15 = (wire13 << (((!$unsigned(wire11)) == wire14[(4'hb):(2'h3)]) & (8'hb5)));
  always
    @(posedge clk) begin
      reg16 <= wire12[(1'h0):(1'h0)];
      reg17 <= (wire13 ? (~^(!(-wire14))) : reg16[(2'h2):(1'h1)]);
    end
  assign wire18 = ((8'hbd) ?
                      $signed(({$unsigned(wire14)} ~^ wire12[(1'h0):(1'h0)])) : ((&(-(+wire11))) ?
                          wire10[(3'h4):(1'h0)] : wire14));
  assign wire19 = wire15[(1'h0):(1'h0)];
  assign wire20 = ($unsigned(((((8'ha7) ? wire14 : reg17) ?
                      (^wire12) : wire12[(3'h4):(2'h2)]) && {$unsigned(reg17),
                      $unsigned(wire19)})) & $unsigned(($signed(wire19[(3'h7):(2'h3)]) ?
                      $unsigned((wire18 ?
                          wire11 : wire12)) : wire13[(3'h4):(3'h4)])));
  assign wire21 = (+(wire11[(4'he):(3'h6)] > (wire15 < wire10[(4'hc):(4'ha)])));
  always
    @(posedge clk) begin
      reg22 <= ((^{wire12}) >= (&wire19));
      if ((~(($unsigned((wire13 || wire13)) > ({reg17,
          reg16} ~^ (|reg17))) <= $signed(wire11))))
        begin
          if (($unsigned((wire21 + {(reg22 ^~ reg17),
              wire14[(4'hc):(1'h1)]})) & $unsigned($signed($signed((wire18 & wire14))))))
            begin
              reg23 <= $unsigned((-{{$unsigned(wire12)}}));
            end
          else
            begin
              reg23 <= ((wire13 ?
                      $signed(((~|reg17) & (wire20 <<< wire12))) : $signed(((~reg17) ?
                          (-wire14) : (wire13 ? wire19 : (8'ha8))))) ?
                  (~&({wire10[(5'h11):(1'h1)], wire11} || ($signed(wire14) ?
                      $signed((8'hbd)) : (~^wire21)))) : (reg17 ?
                      (~&$unsigned($unsigned(wire14))) : wire13[(4'h8):(3'h4)]));
            end
          reg24 <= (~^{wire11});
        end
      else
        begin
          reg23 <= $unsigned((wire19 || $signed(wire12[(1'h0):(1'h0)])));
          if (reg17)
            begin
              reg24 <= (wire19 <<< wire21[(1'h1):(1'h1)]);
              reg25 <= (wire20[(2'h2):(1'h1)] ?
                  $unsigned({(wire10 << $unsigned(wire15)),
                      ($signed(wire15) & reg16[(3'h4):(3'h4)])}) : $signed($signed(($signed(reg16) ^~ $signed(reg16)))));
            end
          else
            begin
              reg24 <= $unsigned(reg24[(2'h2):(1'h1)]);
              reg25 <= wire15[(4'h9):(3'h5)];
              reg26 <= wire10;
              reg27 <= {wire18[(1'h1):(1'h0)]};
            end
          if ($signed($signed((~|((wire18 ? wire11 : reg17) + (&reg23))))))
            begin
              reg28 <= wire10[(4'hd):(4'h9)];
              reg29 <= {((wire19 > ((wire12 >= reg25) ?
                      (reg17 ?
                          wire10 : reg23) : reg17)) ^~ wire18[(3'h4):(2'h2)])};
            end
          else
            begin
              reg28 <= (~|$signed(wire11));
              reg29 <= $signed((!{{(reg29 <<< (8'hb9)), $unsigned(reg16)},
                  $signed(wire12[(3'h4):(2'h2)])}));
              reg30 <= wire15;
              reg31 <= {reg25, wire21};
              reg32 <= ((((reg16 ? reg25 : reg16) ?
                          wire11 : $unsigned($signed((7'h41)))) ?
                      $unsigned(($signed(wire13) << (wire14 ?
                          reg26 : wire21))) : (-{wire21, {reg25, wire18}})) ?
                  {(((~|wire19) ?
                              ((8'hbd) - wire14) : (wire12 ? wire12 : wire13)) ?
                          (^(wire12 ?
                              (8'ha1) : (8'hb4))) : ($unsigned((8'had)) != (reg17 < reg29))),
                      (wire11[(5'h10):(2'h3)] ?
                          (wire12[(3'h4):(2'h2)] ?
                              (reg23 ?
                                  (8'hb1) : wire12) : $unsigned(wire10)) : ($unsigned(wire10) >> reg31[(3'h5):(3'h5)]))} : $signed($unsigned((8'had))));
            end
          reg33 <= $signed((wire15[(4'hb):(4'h8)] == $signed(reg27)));
        end
      reg34 <= $signed($unsigned(wire10));
      reg35 <= (((|(((8'hbb) ~^ wire14) ? reg32 : reg31)) != ({wire10,
              reg17} | $unsigned((~&wire19)))) ?
          wire18[(2'h2):(1'h0)] : (~|reg34));
    end
endmodule
