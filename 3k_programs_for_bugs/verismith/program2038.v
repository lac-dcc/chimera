module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h206):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire72;
  wire signed [(4'hf):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire55;
  wire [(3'h5):(1'h0)] wire53;
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  assign y = {wire100,
                 wire89,
                 wire88,
                 wire87,
                 wire78,
                 wire77,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire56,
                 wire55,
                 wire53,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg76,
                 reg75,
                 reg74,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  module5 #() modinst54 (wire53, clk, wire3, wire0, wire2, wire1);
  assign wire55 = wire4[(2'h3):(1'h0)];
  assign wire56 = {(wire55[(4'hd):(4'h9)] || $unsigned((^~(~^wire55)))), wire4};
  always
    @(posedge clk) begin
      reg57 <= wire0;
      reg58 <= $unsigned(wire56);
      if (reg57[(1'h1):(1'h1)])
        begin
          reg59 <= wire56;
          reg60 <= ($signed($signed({reg58})) ?
              {(wire53 ?
                      ((wire4 ?
                          (8'hb6) : wire56) << (wire1 || (8'hb2))) : wire56[(3'h6):(3'h6)]),
                  ($unsigned(reg59) ?
                      reg59 : reg57[(4'h8):(3'h7)])} : {($unsigned(reg58[(3'h5):(2'h3)]) ?
                      wire1[(1'h1):(1'h1)] : $signed((!wire56))),
                  ($unsigned((wire1 & wire0)) >= {$signed(wire2),
                      (wire55 + reg58)})});
        end
      else
        begin
          reg59 <= ($unsigned(reg60) > $unsigned((7'h44)));
          reg60 <= wire3;
          reg61 <= wire4;
          if ((($unsigned($unsigned($signed(reg60))) && wire2[(4'hb):(3'h5)]) ?
              wire3[(4'h9):(3'h4)] : wire53))
            begin
              reg62 <= {$unsigned($unsigned(wire55[(1'h1):(1'h1)])),
                  {$unsigned({wire55[(3'h5):(1'h0)]}), reg59}};
              reg63 <= (-((~^$unsigned($unsigned((8'hb9)))) ?
                  (|wire3[(3'h6):(1'h1)]) : wire3[(4'h9):(3'h5)]));
              reg64 <= (($unsigned((&wire56)) ?
                      wire0[(4'ha):(2'h3)] : $unsigned(reg61)) ?
                  wire53 : $signed($signed($signed($unsigned(wire4)))));
              reg65 <= ({({(reg63 & wire1), wire3} ?
                      $signed(((8'ha6) * (8'h9d))) : (reg59[(3'h6):(2'h3)] ?
                          wire56[(3'h6):(3'h5)] : $unsigned(reg57))),
                  {$unsigned((^reg64)), (^wire53)}} ^~ reg64[(3'h6):(3'h5)]);
              reg66 <= (reg63[(1'h0):(1'h0)] - $signed($unsigned((!(wire4 - reg62)))));
            end
          else
            begin
              reg62 <= (~|wire4);
            end
          reg67 <= ((8'hba) < {reg59[(1'h0):(1'h0)], $unsigned((7'h44))});
        end
      reg68 <= reg57[(2'h2):(1'h1)];
      reg69 <= {{(reg65 ?
                  ($unsigned(reg60) ?
                      wire2 : (reg67 ?
                          (8'hb3) : (8'h9d))) : $unsigned((wire0 > wire4)))}};
    end
  assign wire70 = (+reg65[(4'he):(3'h7)]);
  assign wire71 = reg59;
  assign wire72 = {wire70};
  assign wire73 = (((wire70 ?
                          (wire0 <<< $signed(reg60)) : $unsigned(wire0)) == reg66[(1'h0):(1'h0)]) ?
                      wire71[(4'he):(4'h9)] : ($signed(wire1) ?
                          $unsigned(wire53) : $signed(wire71)));
  always
    @(posedge clk) begin
      reg74 <= $signed(wire71);
      reg75 <= wire71;
      reg76 <= ($signed(((wire73 ? (-wire56) : $unsigned(reg63)) > {(wire2 ?
              wire70 : wire1)})) >> wire56[(4'h8):(3'h6)]);
    end
  assign wire77 = wire56[(2'h2):(1'h1)];
  assign wire78 = ((+{$signed((reg75 == (8'h9f)))}) - wire4[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if (({reg59[(1'h0):(1'h0)]} ?
          wire73 : ({reg66,
              $unsigned(((8'hbf) << wire56))} >> (&reg62[(1'h0):(1'h0)]))))
        begin
          reg79 <= $unsigned(reg76);
        end
      else
        begin
          reg79 <= (wire73[(1'h1):(1'h1)] ^ $unsigned($signed(((^~reg65) ?
              (wire4 ? reg58 : reg79) : (wire3 ? reg58 : reg68)))));
          if (($unsigned(reg58[(3'h6):(2'h2)]) ^ $signed(reg76)))
            begin
              reg80 <= reg60;
              reg81 <= reg63;
              reg82 <= ($unsigned((((wire73 > reg66) >>> (&wire73)) < ((reg59 ?
                      reg59 : (8'hae)) ?
                  wire78[(2'h2):(2'h2)] : reg66[(1'h1):(1'h1)]))) | (~^reg63));
              reg83 <= wire3[(4'ha):(1'h1)];
            end
          else
            begin
              reg80 <= $unsigned(($signed({$signed(reg65),
                  (reg62 << (8'h9c))}) || $unsigned($unsigned({reg79,
                  reg58}))));
              reg81 <= reg79;
              reg82 <= $unsigned((reg69 * (!((reg62 & wire0) ?
                  reg75 : reg74[(1'h1):(1'h1)]))));
            end
          reg84 <= (~|((~&wire1[(4'h9):(2'h2)]) ?
              $unsigned((^{wire55})) : ($signed($unsigned((8'hae))) && $unsigned(((8'hb8) ^ reg81)))));
        end
      reg85 <= reg67;
      reg86 <= (~$unsigned(reg68));
    end
  assign wire87 = reg65[(2'h2):(1'h1)];
  assign wire88 = $signed(((wire55 + $unsigned(reg65)) <= ({reg81, (8'ha3)} ?
                      (8'hbf) : ((wire1 ~^ wire77) >> (reg86 + wire77)))));
  assign wire89 = (((~&(8'h9f)) >= $signed($unsigned(reg59[(3'h5):(1'h1)]))) - $signed(wire70));
  always
    @(posedge clk) begin
      reg90 <= (reg81 >> $unsigned((&($signed(wire73) << (-reg76)))));
      if (reg67[(1'h0):(1'h0)])
        begin
          reg91 <= (reg61[(3'h6):(3'h4)] ? $signed((^~(~|{reg59}))) : reg62);
          reg92 <= ($signed($unsigned((wire78[(2'h2):(1'h0)] || reg67[(1'h1):(1'h1)]))) ?
              wire71[(3'h6):(2'h3)] : (~&(-reg66)));
        end
      else
        begin
          reg91 <= $signed(wire2);
          reg92 <= reg65[(3'h7):(1'h0)];
          if ((reg90[(2'h2):(1'h0)] * ((wire89 | reg90[(3'h7):(2'h2)]) >> (((wire88 ?
                  reg66 : reg63) <<< wire0[(2'h2):(1'h1)]) ?
              ($unsigned(wire78) <= (reg65 >= (8'ha1))) : wire3[(3'h5):(3'h4)]))))
            begin
              reg93 <= (!reg65);
              reg94 <= $unsigned($unsigned(($unsigned((8'hbe)) ?
                  ((reg64 ? reg83 : reg80) ? (-reg60) : (8'h9d)) : ({reg62} ?
                      reg62[(1'h0):(1'h0)] : reg85))));
              reg95 <= reg84[(3'h5):(2'h2)];
              reg96 <= reg90[(1'h0):(1'h0)];
            end
          else
            begin
              reg93 <= ((^~({wire77[(1'h1):(1'h0)],
                      $signed((8'ha3))} >> $unsigned(reg90))) ?
                  reg95[(2'h3):(2'h2)] : ((wire88 ?
                          $unsigned((wire87 ? reg86 : reg94)) : wire77) ?
                      ($unsigned((reg66 ? wire72 : reg91)) ?
                          wire2[(4'h9):(3'h7)] : ((reg60 ? (8'hb7) : reg92) ?
                              (reg57 ^~ reg63) : (~wire55))) : $signed(wire77[(1'h1):(1'h1)])));
              reg94 <= $unsigned((reg62[(1'h0):(1'h0)] ?
                  ((^~reg86) * ({reg91, wire0} ?
                      reg92[(2'h2):(1'h0)] : $unsigned(reg86))) : {($signed(reg64) * $signed(wire72))}));
              reg95 <= (^~{(!$signed($signed(reg85))), wire77});
            end
        end
      reg97 <= $signed({{$signed($signed((8'hb8)))}});
      if ($signed(wire2[(5'h14):(5'h10)]))
        begin
          reg98 <= wire56[(4'hd):(4'h8)];
        end
      else
        begin
          reg98 <= {reg92[(3'h4):(2'h2)]};
        end
      reg99 <= ((+$signed((~|(reg80 ? reg80 : reg63)))) ?
          wire2 : $unsigned({((wire87 >> reg66) ?
                  (-reg61) : reg66[(4'hb):(2'h2)])}));
    end
  assign wire100 = (reg81 ?
                       (~|(+(~^reg75))) : ({((^~reg64) ?
                                   (~^reg63) : $unsigned((8'had))),
                               reg79[(4'h9):(1'h1)]} ?
                           reg79 : reg67));
endmodule

module module5
#(parameter param51 = (8'hab), 
parameter param52 = param51)
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire41;
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 (1'h0)};
  module10 #() modinst42 (.wire12(wire6), .wire14(wire7), .wire15(wire9), .y(wire41), .clk(clk), .wire11((8'hb3)), .wire13(wire8));
  assign wire43 = ((&{($unsigned((8'hbf)) ~^ (~^wire8))}) ?
                      ($unsigned(wire7[(4'hd):(4'hb)]) ~^ {$unsigned(wire7),
                          ($unsigned(wire8) < (+(8'haf)))}) : $unsigned(({(wire8 ?
                                  wire7 : wire7),
                              (~|wire6)} ?
                          ((~|wire7) > ((7'h43) ?
                              wire41 : (8'hb4))) : ({wire6} ?
                              (wire41 ?
                                  wire8 : wire6) : wire41[(4'hf):(4'hf)]))));
  assign wire44 = (wire6[(3'h7):(2'h3)] || wire6[(4'he):(4'h8)]);
  assign wire45 = (~^$unsigned((8'h9c)));
  assign wire46 = (wire9[(3'h5):(1'h1)] ? $signed((^~wire43)) : wire6);
  assign wire47 = $unsigned((wire46[(4'h9):(2'h2)] << (^~({wire46,
                      wire41} >>> (wire6 != wire46)))));
  assign wire48 = wire47;
  assign wire49 = $signed($signed({(~|wire7[(5'h13):(1'h0)]),
                      (!wire9[(3'h5):(3'h4)])}));
  assign wire50 = $signed({$unsigned($signed((wire45 | wire7)))});
endmodule

module module10
#(parameter param39 = ((+{(+((8'h9c) ? (7'h41) : (7'h40))), ({(8'hbb)} ? (-(7'h43)) : (~(7'h43)))}) <= (~({(^(8'ha2)), (^(8'ha2))} & (((8'ha5) <= (8'hb6)) ? (&(7'h44)) : ((8'hb5) ? (8'hba) : (8'ha8)))))), 
parameter param40 = (param39 << param39))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire signed [(3'h5):(1'h0)] wire13;
  input wire [(4'h8):(1'h0)] wire12;
  input wire signed [(4'hb):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire17,
                 wire16,
                 reg31,
                 reg18,
                 (1'h0)};
  assign wire16 = $unsigned(wire15[(4'h9):(2'h3)]);
  assign wire17 = $signed(wire13);
  always
    @(posedge clk) begin
      reg18 <= (wire14 | {wire12[(3'h5):(1'h0)], wire11[(1'h0):(1'h0)]});
    end
  assign wire19 = ({$signed(wire15[(4'h9):(3'h6)]),
                      ($signed({wire15, wire13}) ?
                          wire16 : ((wire13 ? wire11 : wire17) ?
                              wire14[(1'h0):(1'h0)] : (wire17 ?
                                  wire13 : wire12)))} || ($signed((wire12 ?
                      (+reg18) : $signed((7'h42)))) - $signed(($signed(wire14) && (~|(8'hb7))))));
  assign wire20 = (wire11[(2'h2):(1'h0)] ?
                      (-wire15) : (wire14[(4'hd):(4'hb)] ?
                          ((wire19 > reg18[(1'h0):(1'h0)]) ?
                              ($signed(wire12) >>> $unsigned(wire11)) : (~&$unsigned(wire11))) : wire14));
  assign wire21 = (wire20 < (({(reg18 ? wire13 : wire17)} ?
                          wire19[(2'h2):(1'h1)] : (~wire15[(3'h7):(3'h4)])) ?
                      ((+reg18) ?
                          ((wire19 > reg18) < $unsigned((8'ha4))) : $unsigned(((7'h43) ^~ wire11))) : wire13));
  assign wire22 = $signed($signed($unsigned($unsigned(wire13[(3'h5):(3'h4)]))));
  assign wire23 = wire17[(3'h6):(1'h0)];
  assign wire24 = ($unsigned(wire22[(4'h9):(3'h6)]) == wire13[(1'h0):(1'h0)]);
  assign wire25 = $signed((~&((-wire13[(2'h3):(1'h0)]) ?
                      ((8'hbd) ? wire17 : (8'hab)) : wire22[(1'h0):(1'h0)])));
  assign wire26 = wire13;
  assign wire27 = (~&$signed($signed((~(wire25 - wire19)))));
  assign wire28 = wire26[(1'h1):(1'h0)];
  assign wire29 = (~wire13);
  assign wire30 = $signed($unsigned((^((wire16 ?
                      (8'hbd) : wire15) & (8'ha1)))));
  always
    @(posedge clk) begin
      reg31 <= $signed($unsigned({wire30[(3'h4):(1'h1)]}));
    end
  assign wire32 = {(!($signed(((8'ha1) | wire17)) * $signed($unsigned(wire16)))),
                      $unsigned(wire14)};
  assign wire33 = (|wire28[(2'h2):(2'h2)]);
  assign wire34 = $signed($unsigned((^~$unsigned(wire11[(1'h0):(1'h0)]))));
  assign wire35 = wire24[(3'h6):(2'h3)];
  assign wire36 = {wire14, $signed({wire30[(2'h3):(2'h2)]})};
  assign wire37 = wire24;
  assign wire38 = $unsigned((&(7'h41)));
endmodule
