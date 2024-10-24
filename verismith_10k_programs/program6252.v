module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire72;
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg [(5'h13):(1'h0)] reg4 = (1'h0);
  assign y = {wire74,
                 wire9,
                 wire32,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire72,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire0[(3'h7):(1'h1)])
        begin
          reg4 <= $signed((8'h9c));
          reg5 <= $unsigned((~&(&{$unsigned(wire3), wire0[(4'h9):(1'h1)]})));
          reg6 <= ((^~(~wire2)) ?
              (7'h40) : $signed($signed($unsigned((wire1 & reg5)))));
          reg7 <= wire0[(2'h3):(1'h1)];
          reg8 <= (8'hb5);
        end
      else
        begin
          reg4 <= $signed(((((|reg4) <= ((8'hbf) ? reg6 : reg8)) || (reg8 ?
              reg7[(1'h1):(1'h0)] : $signed(wire3))) * $signed($unsigned($unsigned((8'ha7))))));
          if ($signed(wire2[(2'h2):(2'h2)]))
            begin
              reg5 <= (~|{$unsigned($unsigned((~(8'hb8))))});
              reg6 <= reg5[(2'h3):(2'h3)];
            end
          else
            begin
              reg5 <= (wire1 ?
                  (reg4[(4'he):(2'h3)] ?
                      (((^~(8'hb9)) ?
                          $unsigned(wire2) : $signed(reg8)) ~^ (-reg8[(1'h0):(1'h0)])) : wire3[(1'h0):(1'h0)]) : $signed(wire0));
              reg6 <= ((~|$signed($signed((wire0 >> wire0)))) ?
                  reg7 : reg7[(3'h5):(1'h1)]);
              reg7 <= reg7;
            end
          reg8 <= wire1[(4'he):(3'h6)];
        end
    end
  assign wire9 = ({wire1[(4'h8):(2'h3)],
                     $unsigned(wire0[(3'h7):(3'h6)])} ~^ (^~reg6));
  module10 #() modinst33 (wire32, clk, reg5, wire1, reg8, wire2, reg6);
  assign wire34 = wire32;
  assign wire35 = ($signed(reg4) ?
                      $unsigned($signed((|(8'ha6)))) : (reg4 ?
                          {(reg5 >>> $signed(wire9)),
                              wire2} : (($signed(wire9) | (^reg4)) ?
                              (~(^~wire0)) : ((-wire3) ?
                                  {reg4, (7'h41)} : wire0))));
  assign wire36 = (~^($signed(reg8) >> $unsigned($unsigned($signed(wire2)))));
  assign wire37 = (wire0 ?
                      ((({wire34} + (wire36 ?
                              wire2 : reg4)) > $signed(wire32)) ?
                          ($signed(wire9[(3'h6):(3'h5)]) * ((wire35 ~^ reg4) ?
                              wire1[(4'hb):(4'hb)] : wire3)) : reg4[(4'hf):(1'h0)]) : ({wire34[(1'h1):(1'h0)]} ^~ ($signed(((8'hba) | wire9)) ?
                          {(^~reg4), ((7'h43) ? reg5 : wire34)} : (&(reg8 ?
                              reg4 : reg5)))));
  assign wire38 = wire37[(3'h5):(2'h2)];
  module39 #() modinst73 (wire72, clk, wire38, wire36, wire9, reg8);
  assign wire74 = (8'hb8);
endmodule

module module39
#(parameter param71 = {((~|((7'h41) ? ((8'hb2) & (8'h9c)) : (~^(8'ha2)))) ? (((~&(8'hb7)) ? (+(8'hbf)) : {(7'h43), (8'ha6)}) ? (((8'hb3) - (8'hb4)) + (8'ha6)) : ({(8'hbf), (8'hb8)} ? (|(8'hbb)) : ((8'ha5) <= (7'h40)))) : {{{(8'h9c)}}}), (((((8'hb8) <= (8'hb4)) == ((8'h9f) != (8'had))) ? (((8'hbc) ? (8'hb0) : (8'hb7)) ? (&(7'h44)) : ((8'h9d) ? (8'ha7) : (8'hb1))) : (((8'hbd) ? (8'hae) : (8'hb2)) ? (!(8'hbf)) : (~&(8'hbb)))) ? ((~|(8'haa)) & ({(8'haf)} ? ((8'hb2) ? (8'h9c) : (7'h40)) : ((8'h9e) ^ (7'h43)))) : ((-(~^(8'hb6))) ? (~&((8'h9d) >> (8'hb6))) : {{(8'hb7)}}))})
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire43;
  input wire signed [(4'h9):(1'h0)] wire42;
  input wire signed [(4'hb):(1'h0)] wire41;
  input wire [(5'h12):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire signed [(4'ha):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire signed [(3'h4):(1'h0)] wire64;
  wire signed [(5'h13):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire [(3'h5):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire44;
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire44 = wire43;
  assign wire45 = wire40[(4'hb):(4'h8)];
  assign wire46 = wire40;
  assign wire47 = wire40;
  assign wire48 = {$signed(wire47[(3'h5):(2'h3)]), wire42};
  assign wire49 = $unsigned(((!wire44[(5'h13):(4'hd)]) * wire45));
  always
    @(posedge clk) begin
      if ({($unsigned((~wire44[(5'h13):(5'h12)])) ?
              $signed(wire45[(2'h3):(1'h1)]) : wire41[(2'h3):(2'h3)])})
        begin
          reg50 <= (7'h44);
          reg51 <= $unsigned((8'hae));
        end
      else
        begin
          reg50 <= ($unsigned($signed($signed((wire46 <<< wire46)))) <<< (wire43[(3'h7):(3'h7)] ?
              reg50[(1'h1):(1'h1)] : wire43));
          reg51 <= wire42;
          reg52 <= wire47;
          reg53 <= {(^~((~^wire49) ? (~&{wire45}) : $signed($signed(wire40)))),
              (wire48 ^~ (wire43 ?
                  (wire47[(3'h7):(2'h3)] + $unsigned(wire44)) : ((^~wire47) <<< $unsigned(wire41))))};
        end
      reg54 <= ($unsigned(wire44) ?
          (wire42 ?
              (&((~|wire41) ^ (reg50 << (8'h9e)))) : (|$signed(reg51[(4'h8):(3'h6)]))) : $signed((({reg50,
                      wire44} ?
                  $signed((8'hb5)) : reg52[(2'h2):(1'h1)]) ?
              wire44 : $unsigned(wire47))));
      reg55 <= ($unsigned(reg52[(1'h0):(1'h0)]) ?
          (|$signed((~&$signed((8'haa))))) : (^(((reg50 ? reg52 : wire40) ?
              $unsigned(wire48) : (&reg52)) >= $unsigned($unsigned(reg50)))));
      if ($signed(wire48[(3'h7):(3'h6)]))
        begin
          if ((reg54[(1'h1):(1'h0)] | (~^$signed((~|wire49[(5'h12):(3'h4)])))))
            begin
              reg56 <= $signed((wire42 ?
                  wire43[(3'h5):(2'h2)] : ($unsigned($signed(wire47)) * (wire44[(3'h6):(2'h3)] <= wire44[(5'h11):(4'hf)]))));
            end
          else
            begin
              reg56 <= ($signed($unsigned(((wire43 ?
                  wire42 : wire48) ^~ wire43))) * (reg56 ?
                  $unsigned($signed(wire43[(3'h6):(1'h0)])) : reg50));
            end
          reg57 <= (|((8'hb0) ?
              {{wire46[(4'h9):(3'h5)], wire48[(2'h2):(1'h1)]},
                  {(wire40 ? (8'ha9) : reg56)}} : ((wire43 & (wire48 ?
                  reg52 : wire47)) ~^ {reg51})));
        end
      else
        begin
          if ({$signed(wire42[(2'h3):(2'h3)]), wire47})
            begin
              reg56 <= (8'haf);
            end
          else
            begin
              reg56 <= wire46[(4'ha):(3'h5)];
              reg57 <= ($signed(reg52[(1'h1):(1'h0)]) & $unsigned($unsigned($signed({wire41,
                  reg51}))));
              reg58 <= {wire49,
                  (wire46[(1'h0):(1'h0)] ?
                      $signed($signed((~&(7'h40)))) : ($unsigned((reg54 < (8'ha9))) ?
                          ($signed(wire42) ?
                              wire47 : wire45[(1'h0):(1'h0)]) : wire46))};
              reg59 <= (8'h9c);
              reg60 <= ((reg50[(1'h0):(1'h0)] ? reg52 : wire42) ?
                  wire49 : (reg54 ?
                      $signed((wire49[(4'h9):(3'h4)] ?
                          {(8'ha9)} : $unsigned(wire42))) : wire40[(4'hc):(3'h4)]));
            end
          reg61 <= (~^$signed((~^wire47)));
          reg62 <= reg51[(5'h11):(4'hb)];
          reg63 <= (7'h40);
        end
    end
  assign wire64 = wire41[(4'h9):(3'h6)];
  assign wire65 = (~|(8'hbe));
  assign wire66 = $unsigned(reg58);
  assign wire67 = (|(^wire47));
  assign wire68 = $signed({$signed(((-reg61) ? wire45 : (wire44 > reg60)))});
  assign wire69 = reg59;
  assign wire70 = wire43;
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire [(4'hf):(1'h0)] wire14;
  input wire [(5'h11):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire16 = $signed($signed(wire13));
  assign wire17 = ((wire13[(4'he):(4'ha)] ?
                          wire14 : (({wire16} ?
                              (8'hb7) : {wire16,
                                  wire15}) != ($unsigned(wire13) ?
                              ((8'hb6) << wire11) : (8'hb6)))) ?
                      (~^(((wire11 ^ wire14) <= $signed(wire11)) ?
                          ($unsigned((8'hbb)) * (wire15 ?
                              wire13 : wire16)) : {$signed(wire13)})) : wire11[(2'h3):(1'h0)]);
  assign wire18 = $unsigned($unsigned(($signed(wire13[(2'h3):(2'h3)]) || $unsigned((8'haf)))));
  assign wire19 = $unsigned((~(((~&wire13) ? wire13 : wire12) ?
                      (wire15 ? wire12 : wire17[(3'h4):(1'h0)]) : wire12)));
  assign wire20 = (~&{$unsigned({(|(8'hb4))})});
  assign wire21 = ((+($signed($unsigned(wire12)) ?
                      ((wire18 ? (8'had) : wire17) ?
                          $signed(wire11) : (8'hbd)) : wire17[(2'h2):(1'h0)])) == wire15);
  assign wire22 = wire14[(4'ha):(4'h9)];
  assign wire23 = $unsigned({{(7'h42), wire22[(1'h0):(1'h0)]}});
  assign wire24 = wire19[(4'hb):(3'h6)];
  assign wire25 = wire22[(1'h0):(1'h0)];
  assign wire26 = (8'hb1);
  always
    @(posedge clk) begin
      if (wire13[(2'h3):(1'h1)])
        begin
          reg27 <= (!(($signed($signed(wire21)) ?
                  ($signed(wire15) <= wire11) : $unsigned($signed(wire24))) ?
              ((7'h41) ?
                  wire11[(3'h5):(1'h1)] : (wire13 + {wire14})) : ((~(^wire11)) ?
                  $unsigned($unsigned(wire14)) : {(wire21 && (8'hb4)),
                      (wire15 || wire11)})));
        end
      else
        begin
          reg27 <= $unsigned(({wire26[(4'hf):(3'h7)],
                  $unsigned($signed(wire20))} ?
              wire13[(3'h5):(3'h5)] : $signed((wire11[(3'h5):(1'h0)] <= wire23))));
          reg28 <= $unsigned((-(~|wire20)));
          reg29 <= ($signed(wire22[(3'h7):(3'h7)]) ?
              ((wire19 ? ((~&wire24) ? $unsigned(wire15) : wire11) : wire18) ?
                  {(|wire11[(3'h4):(2'h2)])} : {$unsigned($unsigned(wire11)),
                      $signed($unsigned(wire21))}) : $unsigned((((|wire17) * ((8'hbb) ?
                  wire26 : reg28)) ^ {$signed(wire13), wire15})));
        end
      reg30 <= (wire17[(1'h0):(1'h0)] & (!((wire26 ~^ ((8'hae) >> wire16)) ?
          $unsigned((wire17 ? wire12 : (8'hbd))) : wire14)));
      reg31 <= wire12;
    end
endmodule
