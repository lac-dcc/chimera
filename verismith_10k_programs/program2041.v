module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire signed [(3'h5):(1'h0)] wire99;
  wire [(4'ha):(1'h0)] wire98;
  wire [(4'hd):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire96;
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire4,
                 wire5,
                 wire10,
                 wire11,
                 wire96,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire4 = (&($signed(((wire3 ? wire0 : wire0) && (wire1 != wire2))) ?
                     wire1[(4'hb):(1'h0)] : {$signed($unsigned((8'hbf)))}));
  assign wire5 = (!((^$unsigned((wire0 && wire0))) ~^ (8'ha3)));
  always
    @(posedge clk) begin
      reg6 <= wire4;
      reg7 <= wire5[(4'hc):(3'h6)];
      reg8 <= ($unsigned(wire1[(4'hc):(4'h9)]) ^~ {$unsigned($unsigned(wire0)),
          ({(~|wire1)} ?
              ((wire0 << wire1) > wire5[(3'h7):(3'h5)]) : $signed($signed(wire3)))});
      reg9 <= reg8[(3'h6):(3'h4)];
    end
  assign wire10 = $signed(($unsigned($unsigned($unsigned(wire2))) >= $unsigned(((8'hbf) ?
                      $signed(reg8) : reg8))));
  assign wire11 = $unsigned({reg9});
  module12 #() modinst97 (.wire16(wire1), .y(wire96), .clk(clk), .wire15(wire5), .wire13(wire4), .wire14(reg8));
  assign wire98 = wire96;
  assign wire99 = $unsigned($unsigned(($unsigned($signed(wire0)) ?
                      (reg6 ? wire3 : reg7) : (~&$unsigned(wire1)))));
endmodule

module module12
#(parameter param95 = {(((((8'hb3) ? (8'hb1) : (8'ha5)) <= (~^(8'haa))) ? (~&{(8'hb7), (8'ha7)}) : {(&(8'ha2)), (-(8'hbf))}) ? (|{((8'hb7) ? (8'h9f) : (8'haf))}) : (-({(8'hb4)} < (^(8'ha5))))), (((-((8'h9d) ? (8'hac) : (8'hae))) ? (&((7'h40) ? (7'h40) : (8'ha6))) : (((8'hb7) || (7'h41)) ? ((8'ha1) ? (8'hac) : (8'hb8)) : (-(8'ha1)))) - ({((8'hb4) + (8'ha1)), ((8'hb5) || (8'hb0))} ? (|((8'h9f) || (8'hac))) : {(~|(8'hb4))}))})
(y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire13;
  input wire signed [(2'h2):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire15;
  input wire signed [(5'h12):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire89;
  wire [(4'hc):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire87;
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  assign y = {wire89,
                 wire17,
                 wire33,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire87,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg36,
                 reg35,
                 reg34,
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
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire17 = $signed($signed(wire14));
  always
    @(posedge clk) begin
      reg18 <= (8'h9c);
      if (wire15[(4'h9):(3'h7)])
        begin
          reg19 <= ($signed(wire14[(1'h1):(1'h1)]) ~^ ((^wire16) & $signed(wire17[(1'h1):(1'h0)])));
          reg20 <= $unsigned((8'hb1));
          reg21 <= $unsigned(({wire17, $unsigned(reg19[(1'h1):(1'h0)])} ?
              wire13[(4'ha):(4'h9)] : $signed($signed(wire13[(4'ha):(3'h5)]))));
          reg22 <= (wire15[(1'h0):(1'h0)] ?
              wire17[(4'ha):(1'h1)] : reg19[(2'h2):(1'h0)]);
        end
      else
        begin
          reg19 <= (-wire15[(3'h4):(1'h1)]);
          if (((^($signed($unsigned(reg21)) >>> ((wire13 ^~ reg20) < wire13[(4'h8):(2'h3)]))) * (wire14[(1'h0):(1'h0)] ?
              $signed(reg20) : wire16)))
            begin
              reg20 <= $unsigned(wire15[(4'hb):(3'h5)]);
              reg21 <= reg21;
              reg22 <= ((^{({reg18, wire17} ~^ reg20[(5'h11):(4'hb)]),
                  $signed({wire14,
                      wire17})}) * $signed((-(reg22 ~^ reg20[(4'he):(4'hc)]))));
            end
          else
            begin
              reg20 <= $unsigned($signed(($unsigned($signed(wire14)) ?
                  (+(wire15 ?
                      wire16 : reg20)) : $unsigned(reg22[(2'h2):(1'h1)]))));
            end
        end
      if (wire17)
        begin
          reg23 <= (reg22[(3'h4):(2'h2)] ?
              reg19 : (wire17[(4'h8):(1'h0)] ?
                  ($unsigned(((8'hb8) <= reg19)) >> ($unsigned(wire15) && (~^wire15))) : $signed(((wire17 <= wire15) - $signed(wire15)))));
        end
      else
        begin
          reg23 <= ({(|wire13)} ?
              ($signed((^{reg23})) >>> ((wire17[(4'ha):(3'h6)] >= $signed((8'ha0))) < (8'ha1))) : $signed(wire17[(4'hc):(3'h4)]));
          if (($signed(($signed($signed(reg19)) >= ({wire14,
              (8'ha4)} << (wire13 ? wire15 : reg19)))) << (-{reg20})))
            begin
              reg24 <= ((($signed((wire17 * reg22)) ^ $signed($unsigned(wire13))) >> reg19) | (($unsigned($unsigned(reg20)) ?
                  ($unsigned(wire13) == (wire14 ?
                      reg19 : reg20)) : (^~(~|reg21))) == (~&reg21)));
            end
          else
            begin
              reg24 <= $signed($signed(wire16[(4'hd):(4'h8)]));
            end
          reg25 <= ($signed({((reg20 * reg22) ? reg18 : wire15)}) ?
              ($signed($unsigned(wire17)) ?
                  ((wire14[(1'h1):(1'h1)] ?
                      (reg22 >>> (8'ha1)) : (reg23 ?
                          reg23 : wire13)) ^ reg20) : wire17) : (^reg21[(5'h10):(4'hd)]));
          if ((reg18 & wire14))
            begin
              reg26 <= (reg20 * (~^$unsigned((^reg22))));
              reg27 <= $unsigned((!($signed(reg19[(1'h0):(1'h0)]) ^ wire14)));
              reg28 <= wire17[(4'h8):(2'h3)];
            end
          else
            begin
              reg26 <= $signed(reg25[(5'h11):(4'h9)]);
              reg27 <= $unsigned($unsigned((reg23[(4'h9):(1'h0)] ?
                  reg18 : ((8'h9d) + reg28[(5'h10):(2'h2)]))));
              reg28 <= $unsigned((~|$unsigned(reg20[(5'h10):(4'ha)])));
              reg29 <= reg24;
            end
          reg30 <= reg22;
        end
      reg31 <= reg26[(5'h10):(4'h9)];
      reg32 <= $signed($unsigned(reg20[(4'he):(1'h0)]));
    end
  assign wire33 = reg27[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg34 <= (reg20[(5'h12):(3'h6)] << $signed(reg25));
      reg35 <= (~&(reg31[(1'h0):(1'h0)] * {wire33[(3'h6):(2'h2)],
          $unsigned({reg31})}));
      reg36 <= (~&((wire33 <<< ((reg27 ? reg27 : wire33) ?
              $unsigned(wire33) : (^~reg20))) ?
          (reg21 ?
              {(reg21 ? reg24 : (8'h9f)),
                  reg34[(4'he):(3'h6)]} : reg32) : (~|reg19)));
    end
  assign wire37 = {wire33[(4'hb):(4'hb)]};
  assign wire38 = (reg24[(5'h12):(5'h10)] - wire33[(4'he):(3'h7)]);
  assign wire39 = wire16;
  assign wire40 = ((8'haf) ?
                      ($signed(reg29) - (($signed(wire39) ?
                          (^~wire37) : {(8'hb7)}) ^ $unsigned(reg35[(4'h9):(1'h1)]))) : ((wire13 ?
                              ((8'ha3) >= {wire16}) : (&wire16[(3'h6):(1'h0)])) ?
                          {reg25[(5'h12):(2'h2)]} : reg31));
  module41 #() modinst88 (wire87, clk, wire33, reg25, reg26, reg18, reg22);
  assign wire89 = $signed(wire37);
  always
    @(posedge clk) begin
      reg90 <= {(((^~(reg23 << reg22)) <<< wire14) <<< $unsigned($signed(reg31[(2'h2):(1'h1)])))};
      reg91 <= ((-(-$unsigned({wire38,
          (8'hbb)}))) <= (~^(reg34[(4'h8):(2'h2)] > {$unsigned(reg21),
          wire89[(3'h5):(1'h1)]})));
      reg92 <= reg21;
      reg93 <= (reg26 ?
          $signed($signed((^$signed((7'h42))))) : $signed(reg24[(4'hd):(2'h3)]));
      reg94 <= reg23;
    end
endmodule

module module41  (y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire46;
  input wire [(4'h9):(1'h0)] wire45;
  input wire [(4'h9):(1'h0)] wire44;
  input wire [(4'hc):(1'h0)] wire43;
  input wire [(5'h10):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire63;
  wire [(3'h4):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire [(3'h7):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire47;
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  assign y = {wire73,
                 wire70,
                 wire69,
                 wire68,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire49,
                 wire48,
                 wire47,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg72,
                 reg71,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire47 = wire45;
  assign wire48 = ($unsigned((wire46[(2'h2):(2'h2)] && (wire42[(4'hb):(1'h1)] && wire43))) ?
                      (~(wire44 ?
                          $signed((wire45 ?
                              wire45 : wire44)) : ((+wire43) > ((8'ha0) << (8'ha1))))) : wire47);
  assign wire49 = $unsigned(($unsigned(wire44[(3'h7):(3'h4)]) <= {(wire48[(1'h0):(1'h0)] ~^ (8'hb8)),
                      wire42[(4'h8):(4'h8)]}));
  always
    @(posedge clk) begin
      reg50 <= (+(wire45 ? $signed(wire47) : $unsigned(wire43[(2'h3):(1'h1)])));
      reg51 <= $unsigned((8'ha7));
    end
  assign wire52 = $unsigned($unsigned($signed($signed(reg51))));
  assign wire53 = $signed(({wire45[(3'h7):(3'h7)],
                          ((-reg50) ? {wire44, wire45} : $unsigned(wire42))} ?
                      wire52 : (8'ha0)));
  assign wire54 = (reg50[(2'h3):(2'h2)] ?
                      ($signed($signed((^wire46))) ?
                          wire46[(1'h1):(1'h0)] : (~|($unsigned(reg51) ?
                              (wire46 ? (8'ha5) : (8'ha5)) : (wire52 ?
                                  wire47 : wire46)))) : $unsigned(wire47[(4'h9):(1'h1)]));
  assign wire55 = (($unsigned(((7'h42) <= $signed(reg51))) ~^ wire52[(3'h6):(3'h5)]) ?
                      wire52[(4'he):(3'h7)] : (wire42 - (wire54[(3'h7):(1'h0)] | wire45)));
  assign wire56 = wire52[(3'h6):(3'h4)];
  assign wire57 = $unsigned(($signed((8'hb0)) >= ($signed(wire53) & $unsigned((wire45 ?
                      wire53 : wire47)))));
  assign wire58 = wire55;
  assign wire59 = wire53;
  assign wire60 = (~&wire53[(3'h7):(2'h2)]);
  assign wire61 = $unsigned((~&((wire42 & {wire49, wire48}) ?
                      $unsigned($signed(wire58)) : wire59[(3'h4):(3'h4)])));
  assign wire62 = ($signed(($signed(wire57) ?
                      {(wire43 ? (8'h9f) : wire60),
                          reg50[(3'h5):(3'h5)]} : $unsigned((wire57 ?
                          wire55 : wire55)))) == wire52[(4'ha):(4'h8)]);
  assign wire63 = wire52;
  always
    @(posedge clk) begin
      if ((wire52[(1'h0):(1'h0)] ?
          (!$signed((~|wire53[(2'h3):(2'h2)]))) : wire47))
        begin
          if ($signed($signed((wire46[(2'h3):(2'h2)] ^ ({wire60} ?
              wire61[(1'h0):(1'h0)] : wire57)))))
            begin
              reg64 <= (wire49[(2'h2):(2'h2)] != (~(((|wire57) - $unsigned(wire63)) ?
                  $unsigned({wire59, wire55}) : wire55)));
              reg65 <= wire43;
            end
          else
            begin
              reg64 <= wire47;
            end
        end
      else
        begin
          reg64 <= reg64[(1'h0):(1'h0)];
        end
      reg66 <= (^wire46);
      reg67 <= (-wire52[(1'h1):(1'h0)]);
    end
  assign wire68 = ($unsigned($signed(wire57[(2'h3):(2'h2)])) ?
                      $signed((wire54[(3'h5):(1'h0)] ?
                          $unsigned((wire55 ?
                              wire56 : wire49)) : ($signed(wire58) ?
                              $signed(wire56) : (~wire60)))) : wire61[(1'h0):(1'h0)]);
  assign wire69 = wire45;
  assign wire70 = (~&(+$unsigned($unsigned($signed(wire45)))));
  always
    @(posedge clk) begin
      reg71 <= wire63[(1'h0):(1'h0)];
      reg72 <= $unsigned((&wire53[(1'h1):(1'h1)]));
    end
  assign wire73 = (wire59 || {reg67[(4'hc):(4'h9)]});
  always
    @(posedge clk) begin
      if ({$unsigned(reg71[(2'h3):(2'h3)])})
        begin
          reg74 <= $unsigned(({((wire57 ? reg51 : wire55) ?
                  wire52[(4'he):(3'h5)] : wire57[(1'h1):(1'h0)]),
              $unsigned((wire44 & reg64))} != (^~$signed((~|(8'hb5))))));
          if ($unsigned((~&(8'haa))))
            begin
              reg75 <= $unsigned(($signed($unsigned((wire73 && wire62))) << (&(~^(|wire48)))));
              reg76 <= wire68;
              reg77 <= (|$unsigned($unsigned($signed(reg66))));
            end
          else
            begin
              reg75 <= $signed((((wire52[(1'h1):(1'h0)] ?
                  $unsigned(wire42) : (8'hbb)) ~^ (^(~|wire46))) != (-wire53[(5'h10):(1'h0)])));
            end
          reg78 <= wire70[(4'h8):(3'h6)];
          if ($signed(reg72[(3'h4):(3'h4)]))
            begin
              reg79 <= {wire58[(2'h3):(2'h3)], wire60};
              reg80 <= reg51[(1'h0):(1'h0)];
            end
          else
            begin
              reg79 <= wire45;
              reg80 <= {reg77, $signed((&reg50))};
              reg81 <= (wire54 ?
                  (&($unsigned(wire52[(3'h7):(3'h6)]) + $unsigned($signed((8'ha2))))) : $signed((!$signed(wire55))));
              reg82 <= {wire68[(1'h0):(1'h0)]};
              reg83 <= wire70[(2'h2):(1'h0)];
            end
          reg84 <= (8'ha0);
        end
      else
        begin
          reg74 <= (wire62[(3'h4):(1'h1)] ?
              $unsigned(($signed($unsigned((8'ha7))) ?
                  (~(reg65 || reg83)) : wire53)) : $unsigned((&$signed($signed(reg77)))));
          reg75 <= {(~|{{(reg72 ? (8'hb6) : reg81)}}),
              (~&(reg51 | wire69[(3'h7):(2'h2)]))};
          reg76 <= (($unsigned($unsigned(reg80[(1'h1):(1'h1)])) ?
              $signed({(!wire61),
                  (^reg50)}) : wire54) | $unsigned(reg80[(2'h3):(2'h3)]));
          reg77 <= $signed(((~&(reg80[(5'h11):(2'h3)] ?
              ((8'ha9) ^ wire57) : (^(8'ha6)))) || reg84[(4'hd):(3'h6)]));
        end
      reg85 <= wire68;
      reg86 <= $signed(((~|(8'hb2)) ?
          $unsigned($signed($unsigned(wire42))) : $signed($unsigned($unsigned((8'ha8))))));
    end
endmodule
